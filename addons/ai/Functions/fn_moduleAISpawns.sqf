// not documented: module called
if !(isServer) exitwith {};

_logic = param [0, objNull, [objNull]];

_Objname = _logic getVariable ["Objname", "Objective 1"];
_faction = _logic getVariable ["Enemytype", "OPF_F"];
_Garrradius = _logic getVariable ["Garrradius", 100];
_Garrisonedgroupsmin = _logic getVariable ["Garrisonedgroupsmin", 0];
_Garrisonedgroupsmax = _logic getVariable ["Garrisonedgroupsmax", 0];
_PatrolMethod = _logic getVariable ["PatrolMethod", "random"];
_radius = _logic getVariable ["radius", 500];
_EIPatrolsmin = _logic getVariable ["EIPatrolsmin", 0];
_EIPatrolsmax = _logic getVariable ["EIPatrolsmax", 0];
_EIAAmin = _logic getVariable ["EIAAmin", 0];
_EIAAmax = _logic getVariable ["EIAAmax", 0];
_EIATmin = _logic getVariable ["EIATmin", 0];
_EIATmax = _logic getVariable ["EIATmax", 0];
_EISnipermin = _logic getVariable ["EISnipermin", 0];
_EISnipermax = _logic getVariable ["EISnipermax", 0];
_VehAAmin = _logic getVariable ["VehAAmin", 0];
_VehAAmax = _logic getVariable ["VehAAmax", 0];
_VehLightmin = _logic getVariable ["VehLightmin", 0];
_VehLightmax = _logic getVariable ["VehLightmax", 0];
_VehMRAPmin = _logic getVariable ["VehMRAPmin", 0];
_VehMRAPmax = _logic getVariable ["VehMRAPmax", 0];
_VehHeavymin = _logic getVariable ["VehHeavymin", 0];
_VehHeavymax = _logic getVariable ["VehHeavymax", 0];
_Vehrandommin = _logic getVariable ["Vehrandommin", 0];
_Vehrandommax = _logic getVariable ["Vehrandommax", 0];

_spawnLocation = (getPos _logic);

[
    _spawnLocation,
    _Objname,
    _faction,
    _Garrradius,
    [_Garrisonedgroupsmin, _Garrisonedgroupsmax],
    _PatrolMethod,
    _radius,
    [_EIPatrolsmin, _EIPatrolsmax],
    [_EIAAmin, _EIAAmax],
    [_EIATmin, _EIATmax],
    [_EISnipermin, _EISnipermax],
    [_VehAAmin, _VehAAmax],
    [_VehLightmin, _VehLightmax],
    [_VehMRAPmin, _VehMRAPmax],
    [_VehHeavymin, _VehHeavymax],
    [_Vehrandommin, _Vehrandommax]
] call TFS_fnc_spawnAI;