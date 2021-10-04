/*
Function: TFS_fnc_Casualty

Description:
Used to set an AI to a triage state via hold add actions.

Arguments:
_object - Object the addAction is applied to. <OBJECT>

Examples:
(begin example)
[this] call TFS_fnc_Casualty;
(end)

Author:
MitchJC
*/

params ["_object"];

if (isServer) then {
    _object setVariable ["CasualtyHealed", true, true];
    _object disableAI "move";
    _object disableAI "FSM";
};

_randomBodyPart = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
_randominjurytype = ["bullet", "grenade", "explosive", "shell", "vehiclecrash"];

if (!hasinterface) exitwith {};
// ========================= T1

[
    _object,
    format ["t1_cas_action_%1", round (random 10000)],
    "<t color='#e74c3c'>T1 Casualty</t>",
    {
        params ["_target", "_caller", "_arguments"];
        
        for "_i" from 1 to 6 do {
            [_target, 0.5, selectRandom (_arguments select 0), selectRandom (_arguments select 1)] remoteExecCall ["ace_medical_fnc_adddamagetoUnit", 0];
        };
        
        [_target, true, 0, true] remoteExecCall ["ace_medical_fnc_setUnconscious", 2];
        [_target, true] remoteExecCall ["ace_medical_status_fnc_setCardiacArrestState", 2];
        _target setVariable ["CasualtyHealed", false, true];
    },
    [_randomBodyPart, _randominjurytype],
    '(_target getVariable "CasualtyHealed") && (_player getUnitTrait "instructor")',
    false,
    5,
    false
] call TFS_fnc_addAction;

// ========================= T2

[
    _object,
    format ["t2_cas_action_%1", round (random 10000)],
    "<t color='#f1c40f'>T2 Casualty</t>",
    {
        params ["_target", "_caller", "_arguments"];
        for "_i" from 1 to 3 do {
            [_target, 0.7, selectRandom (_arguments select 0), selectRandom (_arguments select 1)] remoteExecCall ["ace_medical_fnc_adddamagetoUnit", 0];
        };
        
        [_target, true, 10, true] remoteExecCall ["ace_medical_fnc_setUnconscious", 2];
        
        _target setVariable ["CasualtyHealed", false, true];
    },
    [_randomBodyPart, _randominjurytype],
    '(_target getVariable "CasualtyHealed") && (_player getUnitTrait "instructor")',
    false,
    5,
    false
] call TFS_fnc_addAction;

// ========================= T3

[
    _object,
    format ["t3_cas_action_%1", round (random 10000)],
    "<t color='#27ae60'>T3 Casualty</t>",
    {
        params ["_target", "_caller", "_arguments"];
        
        for "_i" from 1 to 2 do {
            [_target, 0.2, selectRandom (_arguments select 0), selectRandom (_arguments select 1)] remoteExecCall ["ace_medical_fnc_adddamagetoUnit", 0];
        };
        
        _target setVariable ["CasualtyHealed", false, true];
    },
    [_randomBodyPart, _randominjurytype],
    '(_target getVariable "CasualtyHealed") && (_player getUnitTrait "instructor")',
    false,
    5,
    false
] call TFS_fnc_addAction;

// =================== Reset

[
    _object,
    format ["reset_cas_action_%1", round (random 10000)],
    "<t color='#666666'>Reset Casualty</t>",
    {
        params ["_target", "_caller", "_arguments"];
        [_target] remoteExecCall ["ace_medical_treatment_fnc_fullHeallocal", _target];
        _target disableAI "move";
        _target disableAI "FSM";
        _target setVariable ["CasualtyHealed", true, true];
    },
    [],
    '!(_target getVariable "CasualtyHealed") && (_player getUnitTrait "instructor")',
    false,
    5,
    false
] call TFS_fnc_addAction;