// not documented: module called
if !(isServer) exitwith {};

_logic = param [0, objNull, [objNull]];

_spawnLocation = (getPos _logic);
_Objname = _logic getVariable ["Objname", "Objective 1"];
_faction = _logic getVariable ["type", "CIV_F"];
_side = _logic getVariable ["side", "civilian"];
_Garrradius = _logic getVariable ["Garrradius", 200];
_Garrisonedunitsmin = _logic getVariable ["Garrisonedunitsmin", 0];
_Garrisonedunitsmax = _logic getVariable ["Garrisonedunitsmax", 0];
_radius = _logic getVariable ["radius", 500];
_civPedPatrolsmin = _logic getVariable ["CivPedPatrolsmin", 0];
_civPedPatrolsmax = _logic getVariable ["CivPedPatrolsmax", 0];
_civVehPatrolsmin = _logic getVariable ["CivVehPatrolsmin", 0];
_civVehPatrolsmax = _logic getVariable ["CivVehPatrolsmax", 0];
_civVehParkedmin = _logic getVariable ["CivVehParkedmin", 0];
_civVehParkedmax = _logic getVariable ["CivVehParkedmax", 0];

// Figure out the side stuff
_side = toLower _side;

switch (_side) do {
    case "west": {
        _side = west;
    };
    case "east": {
        _side = east;
    };
    case "independent": {
        _side = independent;
    };
    case "civilian": {
        _side = civilian;
    };
    default {
        _side = civilian;
    };
};

[
    _spawnLocation,
    _Objname,
    _faction,
    _side,
    _Garrradius,
    [_Garrisonedunitsmin, _Garrisonedunitsmax],
    _radius,
    [_civPedPatrolsmin, _civPedPatrolsmax],
    [_civVehPatrolsmin, _civVehPatrolsmax],
    [_civVehParkedmin, _civVehParkedmax]
] call TFS_fnc_spawncivilians;