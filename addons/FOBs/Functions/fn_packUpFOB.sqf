/*
Function: TFS_fnc_packUpFOB

Description:
    Packs up the passed FOB

Arguments:
    _object - FOB to pack up
    _caller - Unit that packed up the FOB

Return Values:
    Nothing.

Examples:
    Nothing to see here

Author:
    Mokka
*/

if (!isServer) exitWith {
    _this remoteExec ["TFS_fnc_packUpFOB", 2];
};

params ["_object", "_caller"];

// sanity checks
if !(_object getVariable ["TFS_PortableFOB_Deployed", false]) exitWith {
    systemChat "FOB has to be deployed first!";
};

// delete composition objects
{
    deleteVehicle _x;
} forEach (_object getVariable ["TFS_PortableFOB_Objects", []]);

// remove respawn position
_respawnPos = _object getVariable "TFS_PortableFOB_RespawnPos";
_respawnPos call BIS_fnc_removeRespawnPosition;

// reset variables
_object setVariable ["TFS_PortableFOB_Deployed", false, true];
_object setVariable ["TFS_PortableFOB_Pos", [0, 0, 0], true];

// unhide terrain
{
    if !(isNull _x) then {
        _x hideObjectGlobal false;
        _x allowDamage true;
    };
} forEach (_object getVariable ["TFS_PortableFOB_hiddenObjects", []]);