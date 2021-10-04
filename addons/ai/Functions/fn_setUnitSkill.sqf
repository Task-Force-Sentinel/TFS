/*
Function: TFS_fnc_setunitskill

Description:
set the given unit's skill level to the desired one.

Arguments:
_target - The array of units or the group whose skill level we want to adjust <UNIT / ARRAY OF units / group>
_skillLevel - The skill level which we want to set the units to <SCALAR>

Return Values:
None

Examples:
nothing to see here

Author:
Martin & MitchJC
*/

if (!isServer) exitwith {};

params ["_target", ["_skillLevel", 2]];

private _skillt = [
    "aimingAccuracy",
    "aimingShake",
    "aimingspeed",
    "commanding",
    "courage",
    "endurance",
    "general",
    "reloadspeed",
    "spotdistance",
    "spottime"
];

private _skillv = [
    (0.10 + random 0.20),
    (0.45 + random 0.30),
    (0.30 + random 0.20),
    1, 1, 1, 1,
    (0.50 + random 0.50),
    (0.40 + random 0.30),
    (0.20 + random 0.40)
];

if !(isnil "TFS_AI_AimingAccuracy") then {
    _skillv = [
        (TFS_AI_AimingAccuracy + random 0.20),
        (TFS_AI_AimingShake + random 0.20),
        (TFS_AI_Aimingspeed + random 0.20),
        (TFS_AI_Commanding),
        (TFS_AI_Courage), 1,
        (TFS_AI_General),
        (TFS_AI_reloadspeed + random 0.50),
        (TFS_AI_Spotdistance + random 0.30),
        (TFS_AI_Spottime + random 0.40)
    ];
};

{
    if (_x < 0) then {
        _x = 0
    };
    if (_x > 1) then {
        _x = 1
    };
} forEach _skillv;

private _units = call {
    if ((typeName _target) isEqualto "group") exitwith {
        units _target
    };
    if ((typeName _target) isEqualto "ARRAY") exitwith {
        _target
    };
    [_target];
};

{
    _a = _x;
    _b = _skillv select _forEachindex;
    {
        _x setskill [_a, _b];
        true
    } count _units;
} forEach _skillt;