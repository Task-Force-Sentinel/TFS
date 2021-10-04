/*
Function: TFS_fnc_LaptopHoldactions

Description:
Adds Hold addActions to a Laptop. Can be placed in the init field of a laptop or executed via script.

Arguments:
_object - Object the addAction is applied to. <OBJECT>
_title - The name of the addAction, visable to players. <strinG>
_time - How long the action must be held to complete. <SCALAR>
_SoundClass - Class name of sound from CfgSounds <strinG>
_distance - How far away the sound can be heard from _object. <SCALAR>
_pitch - pitch of the sound. Should usually be 1. <SCALAR>

Return Value:
None

Examples:
(begin example)
[this] call TFS_fnc_LaptopHoldactions;
[MyLaptopname] call TFS_fnc_LaptopHoldactions;
[this, "download the intel"] call TFS_fnc_LaptopHoldactions;
[this, "Trigger the Alarm", 5, "A3\Sounds_F\sfx\alarm_blufor.wss"] call TFS_fnc_LaptopHoldactions;
(end)

Author:
MitchJC
*/

if (!isServer) exitwith {};

params [
    "_object",
    ["_Title", "Close the Laptop"],
    ["_time", 10],
    ["_SoundClass", "AirRaid"],
    ["_distance", 250],
    ["_pitch", 1]
    
];

[
    _object,
    "laptop" + str (floor (random 360)),
    format ["<t color='#00FFFF'>%1</t>", _Title],
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_connect_ca.paa",
    "true",
    "true",
    {
        [format["<t color='#FFBB00' size = '.5'>Processing</t>", (_this select 2) select 1], -1, 0.8, (_this select 2) select 2, 2, 0, 789] spawn BIS_fnc_dynamictext;
    },
    {},
    {
        [format["<t color='#339900' align='center' size = '.4'>%1</t><t color='#FFBB00' align='center' size = '.4'><br/>%2 has completed this action</t>", (_this select 2) select 1, (name _caller)], 1, -0.2, 10, 0, 0, 789] remoteExec ["BIS_fnc_dynamictext", 0, false];
        
        _originalPos = getPosATL ((_this select 2) select 0);
        _originalDir = getDir ((_this select 2) select 0);
        deletevehicle ((_this select 2) select 0);
        _Newobject = createvehicle ["land_Laptop_F", [0, 0, 0], [], 0, "NONE"];
        {
            [_Newobject, false] remoteExec [_x, 2];
        } forEach ["enableSimulationGlobal", "allowdamage"];
        _Newobject setPosATL _originalPos;
        _Newobject setDir _originalDir;
        {
            _x addcuratorEditableObjects [[_Newobject], false];
        } forEach allCurators;
        // playSound3D [((_this select 2) select 3), _Newobject, false, getPosATL _Newobject, 1, 1, 200];
        [_Newobject, (_this select 2) select 3, (_this select 2) select 4, (_this select 2) select 5] call TFS_fnc_Sound3D;
        // [_Newobject, "AirRaid"] call TFS_fnc_Sound3D;
    },
    {
        [format["<t color='#cc3232' size = '.5'>Aborted</t>", (_this select 2) select 1], -1, 0.8, 5, 2, 0, 789] spawn BIS_fnc_dynamictext;
    },
    [_object, _Title, _time, _SoundClass, _distance, _pitch],
    _time,
    true,
    "Processing",
    false
] remoteExec ["TFS_fnc_AddHoldaction", 0, _object];

{
    _x addcuratorEditableObjects [[_object], false];
} forEach allCurators;

{
    [_object, false] remoteExec [_x, 2];
} forEach ["enableSimulationGlobal", "allowdamage"];