/*
Function: TFS_fnc_deployFOB

Description:
Deploys the FOB.

Arguments:
_object - Object whose FOB to deploy
_caller - player that's deploying the FOB

Return Values:
nothing.

Examples:
nothing to see here

Author:
Mokka
*/

if (!isServer) exitwith {
    _this remoteExec ["TFS_fnc_deployFOB", 2];
};

params ["_object", "_caller"];

// sanity checks
if (_object getVariable ["TFS_PortableFOB_Deployed", false]) exitwith {
    systemChat "FOB was already deployed!";
};

_type = _object getVariable ["TFS_PortableFOB_type", "NULL"];

if (_type isEqualto "NULL") exitwith {
    systemChat "invalid FOB type set!";
};

_name = _object getVariable ["TFS_PortableFOB_name", ""];

_size = _object getVariable ["TFS_PortableFOB_size", -1];

if (_size < 0) exitwith {
    systemChat "invalid FOB size!";
};

// don't want to have our FOB controller destroyed when everything is being spawned in...
_object allowdamage false;

_pos = getPos _object;
_dir = getDir _object;

// hide nearby terrain objects
_hiddenObjects = [_pos, 5 + _size * 5, [], ["WALLS", "VEGETATION", "MISC"]] call YAinA_F_fnc_hideTerrainObjects;

// Get composition array and spawn it using the BIS_fnc_ObjectsMapper
_compArray = call (compile format ["call TFS_fnc_%1", _type]);

_objects = [_pos, _dir, _compArray, 0, false] call TFS_fnc_objectsMapper;

// Properly align the objects with the ground etc, only works with ACE for now...
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
    {
        _x call ace_common_fnc_fixposition;
    } forEach _objects;
};

// Add the FOB as a respawn position
_respawnPos = [side _caller, _pos, _name] call BIS_fnc_addRespawnposition;

// set the runtime variables for the FOB object
_object setVariable ["TFS_PortableFOB_Objects", _objects, true];
_object setVariable ["TFS_PortableFOB_HiddenObjects", _hiddenObjects, true];
_object setVariable ["TFS_PortableFOB_Deployed", true, true];
_object setVariable ["TFS_PortableFOB_Pos", _pos, true];
_object setVariable ["TFS_PortableFOB_RespawnPos", _respawnPos, true];

// re-enable damage and hope nothing breaks
_object allowdamage true;