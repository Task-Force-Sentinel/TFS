/*
Function: TFS_fnc_Resettargets

Description:
Used to set pop up targets to fall when hit and then up on laptop command.

Arguments:
_object - Object the addAction is applied to. <OBJECT>
_title - The name of the addAction, visable to players. <strinG>
_center - Center of area to check for Pop up targets <ARRAY>
_distance - How far from center point to look for Pop Up targets <strinG>

Examples:
(begin example)
[this, "Reset targets", [1200, 4200, 0], 250] call TFS_fnc_Resettargets;
[MyLaptopname, "Reset 300m Range", [5500, 3522, 0], 300] call TFS_fnc_Resettargets;
(end)

Author:
MitchJC
*/

if (!isServer) exitwith {};

params [
    "_object",
    ["_Title", "Reset targets"],
    ["_center", [0, 0, 0]],
    ["_distance", 250]
];

private ["_targets", "_Swiveltargets"];

nopop = true;

TFS_fnc_settargets = {
    params [
        ["_center", [0, 0, 0]],
        ["_distance", 250]
    ];
    
    _targets = nearestobjects [_center, ["TargetBase"], _distance];
    
    if (count _targets < 1) exitwith {};
    
    {
        _x animate ["Terc", 0];
    } forEach _targets;
    
    {
        _x addEventHandler [
            "HIT", {
                (_this select 0) animate ["Terc", 1];
                (_this select 0) removeEventHandler ["HIT", 0];
            }
        ]
    } forEach _targets;
    
    _Swiveltargets = nearestobjects [_center, ["Target_Swivel_01_base_F"], _distance];
    
    if (count _Swiveltargets < 1) exitwith {};
    
    {
        _x animate ["Terc", 0];
        _x setVariable ["BIS_poppingEnabled", false];
    } forEach _Swiveltargets;
    
    {
        _x addEventHandler [
            "HitPart", {
                ((_this select 0) select 0) animate ["Terc", 1];
                ((_this select 0) select 0) removeEventHandler ["HitPart", 0];
            }
        ]
    } forEach _Swiveltargets;
};

[_center, _distance] call TFS_fnc_settargets;
// initial Reset.

[
    _object,
    format ["<t color='#00FFFF'>%1</t>", _Title],
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_connect_ca.paa",
    "_this distance _target < 3",
    "_caller distance _target < 3",
    {
        [format["<t color='#FFBB00' size = '.5'>Resetting targets</t>"], -1, 0.8, 2, 0.5, 0, 789] spawn BIS_fnc_dynamictext;
    },
    {},
    {
        [(_this select 3) select 2, (_this select 3) select 3] call TFS_fnc_settargets;
        [format["<t color='#556b2f' size = '.5'>targets Reset</t>"], -1, 0.8, 5, 0.5, 0, 789] spawn BIS_fnc_dynamictext;
    },
    {
        [format["<t color='#cc3232' size = '.5'>Aborted</t>"], -1, 0.8, 5, 0.5, 0, 789] spawn BIS_fnc_dynamictext;
    },
    [_object, _Title, _center, _distance],
    2,
    0,
    false,
    false
] remoteExec ["BIS_fnc_holdactionAdd", 0, _object];

{
    _x addcuratorEditableObjects [[_object], false];
} forEach allCurators;

{
    [_object, false] remoteExec [_x, 2];
} forEach ["enableSimulationGlobal", "allowdamage"];