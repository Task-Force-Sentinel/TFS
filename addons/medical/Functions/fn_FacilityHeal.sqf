/*
Function: TFS_fnc_FacilityHeal

Description:
 Helper function to heal players within medical facilities.
 Needs to be run locally on clients.

Arguments:
 _player - The player unit to heal

Return Values:
 Nothing.

Examples:
    Nothing to see here

Author:
 Mokka
*/

params ["_player"];

if !(local _player) exitWith {
 systemChat "TFS_fnc_FacilityHeal: player unit needs to be local";
};

if (_player getVariable ["ACE_isUnconscious", false]) then {
 [format ["%1<br />is being revived at the TFS Medical Facility.", profileName], [1,-0.2], "#ed1b2e", 0.4] call TFS_fnc_dynamicText;
};

[
 "You are being treated at the TFS Medical Facility",
 [-1, 0.8],
 "#FFA500",
 0.5,
 false
] call TFS_fnc_DynamicText;

[
    {
        [player] call ACE_medical_treatment_fnc_fullHealLocal;
        [
            "Treatment Complete",
            [-1, 0.8],
            "#228B22",
            0.5,
            false
        ] call TFS_fnc_DynamicText;
    }, [], 10
] call CBA_fnc_waitAndExecute;