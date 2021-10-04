/*
Function: TFS_fnc_spawnAI

Description:
Used to populate an area with a predefined enemy faction. This function has a large list of parameters
to adjust the number of enemies spawned. It's advised to use the numbers in this function sparingly.
It's easy to spawn in huge numbers which could cause a temporary drop in frames.
This function works best when executed prior to mission start but can be executed during the mission
in the Debug Console for on the fly objectives.

Arguments:
_grpPrefix - The prefix for the group IDs <strinG>
_center - The center position of the area we want to populate <position 3D>
_radius - The radius of the area we want to populate <SCALAR>
_faction - The faction which we want to use for populating the AO <strinG>
_garrisons - Garrison parameters <ARRAY OF [group count, min radius, max radius, skill Level of Garrisoned units, max Fill in Buildling, Exclusion list]>
_inf - infantry parameters <ARRAY OF [min Amount of groups, random Upper Bound of groups]>
_infaa - AA parameters <ARRAY OF [min Amount of groups, random Upper Bound of groups]>
_infat - AT parameters <ARRAY OF [min Amount of groups, random Upper Bound of groups]>
_sniper - Sniper parameters <ARRAY OF [min Amount of groups, random Upper Bound of groups]>
_vehaa - vehicle-based AA parameters <ARRAY OF [min Amount of groups, random Upper Bound of groups]>
_vehmrap - MRAP parameters <ARRAY OF [min Amount of groups, random Upper Bound of groups]>
_vehlight - Light vehicles parameters <ARRAY OF [min Amount of groups, random Upper Bound of groups]>
_vehheavy - Heavy/Armoured vehicle parameters <ARRAY OF [min Amount of groups, random Upper Bound of groups]>
_vehran - random vehicles parameters <ARRAY OF [min Amount of groups, random Upper Bound of groups]>
_patrolMethod - Method to use for plotting the patrol paths <strinG, one of ["random", "ROADS"], default: "random">

Example:
(begin example)
[
    "Objective 1",
    [2955.43, 6010.11, 0],
    500,
    "Sahrani Liberation Army",
    [5, 100, 200],
    [3, 5]
] call TFS_fnc_spawnAI;
Example 2:
["Kavala",
    [2955.43, 6010.11, 0],
    500,
    "Chernarussian Red Star",
    [5, 200, 400],
    [5, 10],
    [2, 3],
    [3, 4],
    [2, 3],
    [4, 5],
    [2, 3],
    [2, 3],
    [5, 6],
    "random"
] call TFS_fnc_spawnAI;
(end)

Author:
MitchJC
*/

// SLACK provides us with some additional spawning positions later on, just to be safe...
#define SLACK 2

// max_SEARCH_ITS provides an upper bound for radius extensions when polling road positions,
// so we don't have to search the entire map
#define max_SEARCH_ITS 20

// if we don't find enough road positions in the radius, extend radius step-wise by this amount
#define EXT_radIUS 100

if (!isServer) exitwith {};

params [
    "_center",
    ["_grpPrefix", "Obj 1"],
    ["_faction", "OPF_T_F"],
    ["_Garrradius", 100],
    ["_garrisons", [0, 0]],
    ["_patrolMethod", "random"],
    ["_radius", 500],
    ["_inf", [0, 0]],
    ["_infaa", [0, 0]],
    ["_infat", [0, 0]],
    ["_sniper", [0, 0]],
    ["_vehaa", [0, 0]],
    ["_vehlight", [0, 0]],
    ["_vehmrap", [0, 0]],
    ["_vehheavy", [0, 0]],
    ["_vehrand", [0, 0]]
    
];

_typeNameCenter = typeName _center;

call {
    if (_typeNameCenter isEqualto "OBJECT") exitwith {
        _center = getPos _center;
    };
    if (_typeNameCenter isEqualto "strinG") exitwith {
        _center = getmarkerPos _center;
    };
    if (_typeNameCenter isEqualto [0, 0, 0]) exitwith {
        systemChat "AIspawns - position is invalid";
    };
};

_center set [2, 0];

_garrisons params ["_Garrisonedgroupsmin", ["_Garrisonedgroupsmax", 0], ["_infskill", "TFS default"]];
_inf params ["_infmin", ["_infmax", 0], ["_infskill", "TFS default"]];
_infaa params ["_infaamin", ["_infaamax", 0], ["_infaaskill", "TFS default"]];
_infat params ["_infatmin", ["_infatmax", 0], ["_infatskill", "TFS default"]];
_sniper params ["_snipermin", ["_snipermax", 0], ["_sniperskill", "TFS default"]];
_vehaa params ["_vehaamin", ["_vehaamax", 0], ["_vehaaskill", "TFS default"]];
_vehmrap params ["_vehmrapmin", ["_vehmrapmax", 0], ["_vehmrapskill", "TFS default"]];
_vehlight params ["_vehlightmin", ["_vehlightmax", 0], ["_vehlightskill", "TFS default"]];
_vehheavy params ["_vehheavymin", ["_vehheavymax", 0], ["_vehheavyskill", "TFS default"]];
_vehrand params ["_vehrandmin", ["_vehrandmax", 0], ["_vehrandskill", "TFS default"]];

_patrolMethod = toUpper _patrolMethod;

private ["_fnc_patrol_EI", "_fnc_patrol_EI_spec", "_fnc_patrol_veh", "_fnc_pos_EI", "_fnc_pos_veh"];

switch (_patrolMethod) do {
    case "ROAD": {
        _fnc_patrol_EI = compile "[(_this select 0), (_this select 3)] call TFS_fnc_RoadPatrol;
        ";
        _fnc_patrol_EI_spec = compile "[(_this select 0), (_this select 3)] call TFS_fnc_RoadPatrol;
        ";
        _fnc_patrol_veh = compile "[(_this select 0), (_this select 3)] call TFS_fnc_RoadPatrol;
        ";
        _fnc_pos_EI = compile "selectRandom (_this select 2)";
        _fnc_pos_veh = compile "selectRandom (_this select 2)";
    };
    case "random": {
        _fnc_patrol_EI = compile "[(_this select 0), (_this select 1), (_this select 2)/1.5, 3 + round (random 2), [""SAD"", ""move""] select (random 1 > 0.33), [""AWARE"", ""SAFE""] select (random 1 > 0.5), [""red"", ""white""] select (random 1 > 0.2), [""limited"", ""normal""] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
        ";
        _fnc_patrol_EI_spec = compile "[(_this select 0), (_this select 1), (_this select 2)/1.5, 3 + round (random 2), ""SAD"", [""AWARE"", ""SAFE""] select (random 1 > 0.5), [""red"", ""white""] select (random 1 > 0.2), [""limited"", ""normal""] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
        ";
        _fnc_patrol_veh = compile "[(_this select 0), (_this select 1), (_this select 2) / 2, 3 + round (random 2), ""move"", [""AWARE"", ""SAFE""] select (random 1 > 0.5), [""red"", ""white""] select (random 1 > 0.2), [""limited"", ""normal""] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;
        ";
        _fnc_pos_EI = compile "[[[(_this select 0), (_this select 1)], []], [""water""]] call TFS_fnc_SafePos;
        ";
        _fnc_pos_veh = compile "[[[(_this select 0), (_this select 1)], []], [""water""], {
            !(_this isFlatEmpty [2, -1, 0.5, 1, 0, false, objNull] isEqualto [])
        }] call TFS_fnc_SafePos;
        ";
    };
    default {
        _fnc_patrol_EI = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_spawnAI!"";
        ";
        _fnc_patrol_EI_spec = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_spawnAI!"";
        ";
        _fnc_patrol_veh = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_spawnAI!"";
        ";
        _fnc_pos_EI = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_spawnAI!"";
        ";
        _fnc_pos_veh = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_spawnAI!"";
        ";
    };
};

// UNIT typeS

private ["_inflist", "_confBase", "_infaalist", "_infatlist", "_sniperlist", "_vehAAlist", "_vehMraplist", "_vehLightlist", "_vehHeavylist", "_vehRandlist"];

// todo: UAVs ?

// set the default faction if all else fails
private _side = east;
private _factionside = "east";
private _infantrytype = "infantry";
private _infantrygroup = "OIA_infTeam";
private _vehRandlist = [];
private _AIReporting = TFS_AI_Reporting;

// Check for side from _faction
private _sideNumber = getNumber (configFile >> "CfgfactionClasses" >> _faction >> "side");

call {
    if (_sidenumber isEqualto 0) exitwith {
        _side = east;
        _factionside = "east";
    };
    if (_sidenumber isEqualto 1) exitwith {
        _side = west;
        _factionside = "west";
    };
    if (_sidenumber isEqualto 2) exitwith {
        _side = resistance;
        _factionside = "indep";
    };
};
if (isnil "_faction") exitwith {
    systemChat format ["faction missing from %1 at %2", _grpPrefix, _center]
};

_GetfactionArrays = compileFinal format ["call TFS_fnc_%1", _faction];
_factionArrays = call _GetfactionArrays;
_factionArrays params ["_infantrytype", "_infaalist", "_infatlist", "_sniperlist", "_vehAAlist", "_vehMraplist", "_vehLightlist", "_vehHeavylist"];

private ["_x", "_g", "_pos", "_flatPos", "_rpos", "_v"];

// if we want to plot patrol routes along roads, populate the waypoints
private _waypoints = [];

if (_patrolMethod isEqualto "ROAD") then {
    // Obtain as many positions as we need
    _minpositions = _Garrisonedgroupsmax + _infmax + _infaamax + _infatmax + _snipermax + _vehaamax + _vehmrapmax + _vehlightmax + _vehheavymax + _vehrandmax + SLACK;
    
    // Get list of roads around the center
    _roadlist = [];
    _roadlist = _center nearRoads _radius;
    
    // Now increase the search radius until we have found enough positions
    if (count _roadlist < _minpositions) then {
        _i = 0;
        _radExtension = 0;
        // if we exceed our max in iterations, abort and use random positions instead...
        while {(count _roadlist < _minpositions) && (_i < max_SEARCH_ITS)} do {
            _radExtension = _radExtension + EXT_radIUS;
            _roadlist = _center nearRoads (_radius + _radExtension);
            _i = _i + 1;
        };
    };
    
    // if we still don't have enough positions, fill the remaining spots up with random positions
    if (count _roadlist < _minpositions) then {
        while {count _roadlist < _minpositions} do {
            _rpos = [[[_center, _radius], []], ["water"]] call TFS_fnc_SafePos;
            _roadlist append [_rpos];
        };
    };
    
    // populate _waypoints with the positions of these roads
    _waypoints resize (count _roadlist);
    for "_n" from 0 to (count _roadlist) do {
        _waypoints set [_n, getPos (_roadlist select _n)];
    };
};

// Simple protection for broken requests
if (_center isEqualto [0, 0]) exitwith {};

_confBase = configFile >> "Cfggroups" >> _factionside >> _faction >> _infantrytype;
if (isnil "_inflist") then {
    _inflist = ("true" configClasses _confBase) apply {
        configname _x
    };
};
private _factionname = gettext (configFile >> "Cfggroups" >> _factionside >> _faction >> "name");
// Prep return values
private _units = [];
private _vehicles = [];

// GARRISONS

if !(_inflist isEqualto []) then {
    if (_Garrisonedgroupsmax > 0) then {
        private _GarDif = _Garrisonedgroupsmax - _Garrisonedgroupsmin;
        if (_GarDif <0) then {
            _GarDif = 0
        };
        
        private _GarrisonedgroupsExact = _Garrisonedgroupsmin + floor (random _GarDif);
        private _garrisonedunits = (
        [
            _center,
            [0, _Garrradius],
            _side, _factionside,
            _faction, _infantrytype,
            _inflist, _GarrisonedgroupsExact,
            nil, 2,
            4, []
        ] call TFS_fnc_infantryGarrison
        );
        _units append _garrisonedunits;
        
        private _grps = [];
        {
            _grps pushBackUnique (group _x);
            nil
        } count _units;
        
        // tag groups
        {
            _x setgroupIdGlobal [format["%1_gar%2", _grpPrefix, _forEachindex]];
        } forEach _grps;
    };
} else {
    if (_AIReporting && {
        _Garrisonedgroupsmax >0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no infantry teams to select from. step skipped.", _factionname]
    };
};

// StandARD inFANtry

if !(_inflist isEqualto []) then {
    private _infDif = _infmax - _infmin;
    if (_infDif <0) then {
        _infDif = 0
    };
    
    for "_x" from 1 to (_infmin + floor(random _infDif)) do {
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_EI;
        _g = [_rpos, _side, _confBase >> (selectRandom _inflist)] call BIS_fnc_spawngroup;
        _g setgroupIdGlobal [format["%1_inf%2", _grpPrefix, _x]];
        [_g, _center, _radius, _waypoints] call _fnc_patrol_EI;
        [_g, _infskill] call TFS_fnc_setunitskill;
        _units append (units _g);
    };
} else {
    if (_AIReporting && {
        _infmax >0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no infantry teams to select from. step skipped.", _factionname]
    };
};

// AA inFANtry

if !(_infaalist isEqualto []) then {
    private _infaaDif = _infaamax - _infaamin;
    if (_infaaDif <0) then {
        _infaaDif = 0
    };
    
    for "_x" from 1 to (_infaamin + floor(random _infaaDif)) do {
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_EI;
        _g = [_rpos, _side, _confBase >> (selectRandom _infaalist)] call BIS_fnc_spawngroup;
        _g setgroupIdGlobal [format["%1_infaa%2", _grpPrefix, _x]];
        [_g, _center, _radius, _waypoints] call _fnc_patrol_EI_spec;
        [_g, _infaaskill] call TFS_fnc_setunitskill;
        _units append (units _g);
    };
} else {
    if (_AIReporting && {
        _infaamax >0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no AA teams to select from. step skipped.", _factionname]
    };
};

// AT inFANtry

if !(_infatlist isEqualto []) then {
    private _infatDif = _infatmax - _infatmin;
    if (_infatDif <0) then {
        _infatDif = 0
    };
    
    for "_x" from 1 to (_infatmin + floor(random _infatDif)) do {
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_EI;
        _g = [_rpos, _side, _confBase >> (selectRandom _infatlist)] call BIS_fnc_spawngroup;
        _g setgroupIdGlobal [format["%1_infat%2", _grpPrefix, _x]];
        [_g, _center, _radius, _waypoints] call _fnc_patrol_EI_spec;
        [_g, _infatskill] call TFS_fnc_setunitskill;
        _units append (units _g);
    };
} else {
    if (_AIReporting && {
        _infatmax >0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no AT teams to select from. step skipped.", _factionname]
    };
};

// SNIPER teams

if !(_sniperlist isEqualto []) then {
    private _SniperDif = _Snipermax - _Snipermin;
    if (_SniperDif <0) then {
        _SniperDif = 0
    };
    
    for "_x" from 1 to (_Snipermin + floor(random _SniperDif)) do {
        _rpos = [_center, _radius, 100, 20] call BIS_fnc_findoverwatch;
        _g = [_rpos, _side, _confBase >> (selectRandom _sniperlist)] call BIS_fnc_spawngroup;
        _g setgroupIdGlobal [format["%1_sniper%2", _grpPrefix, _x]];
        _g setBehaviour "COMBAT";
        _g setCombatMode "RED";
        [_g, _sniperskill] call TFS_fnc_setunitskill;
        _units append (units _g);
    };
} else {
    if (_AIReporting && {
        _Snipermax >0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no Sniper teams to select from. step skipped.", _factionname]
    };
};

// AA

if !(_vehAAlist isEqualto []) then {
    private _VehAADif = _VehAAmax - _VehAAmin;
    if (_VehAADif <0) then {
        _VehAADif = 0
    };
    
    for "_x" from 1 to (_VehAAmin + floor(random _VehAADif)) do {
        _g = creategroup _side;
        _g setgroupIdGlobal [format ["%1_VehAA%2", _grpPrefix, _x]];
        
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;
        
        if !(_rpos isEqualto [0, 0]) then {
            _v = (selectRandom _vehAAlist) createvehicle _rpos;
            _v lock 2;
            
            [_v, _g] call BIS_fnc_spawncrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehaaskill] call TFS_fnc_setunitskill;
            if (random 1 >= 0.5) then {
                _v allowcrewinImmobile true;
            };
            
            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
} else {
    if (_AIReporting && {
        _VehAAmax >0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no AA vehicles to select from. step skipped.", _factionname]
    };
};

// MRAP

if !(_vehmraplist isEqualto []) then {
    private _VehMRAPDif = _VehMRAPmax - _VehMRAPmin;
    if (_VehMRAPDif <0) then {
        _VehMRAPDif = 0
    };
    
    for "_x" from 1 to (_VehMRAPmin + floor(random _VehMRAPDif)) do {
        _g = creategroup _side;
        _g setgroupIdGlobal [format ["%1_vehmrap%2", _grpPrefix, _x]];
        
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;
        
        if !(_rpos isEqualto [0, 0]) then {
            _v = (selectRandom _vehmraplist) createvehicle _rpos;
            _v lock 3;
            
            [_v, _g] call BIS_fnc_spawncrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehmrapskill] call TFS_fnc_setunitskill;
            if (random 1 >= 0.5) then {
                _v allowcrewinImmobile true;
            };
            
            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
} else {
    if (_AIReporting && {
        _VehMRAPmax >0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no MRAPs to select from. step skipped.", _factionname]
    };
};

// LIGHT VEHS

if !(_vehLightlist isEqualto []) then {
    private _VehLightDif = _VehLightmax - _VehLightmin;
    if (_VehLightDif <0) then {
        _VehLightDif = 0
    };
    
    for "_x" from 1 to (_VehLightmin + floor(random _VehLightDif)) do {
        _g = creategroup _side;
        _g setgroupIdGlobal [format ["%1_vehLight%2", _grpPrefix, _x]];
        
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;
        
        if !(_rpos isEqualto [0, 0]) then {
            _v = (selectRandom _vehLightlist) createvehicle _rpos;
            _v lock 3;
            
            [_v, _g] call BIS_fnc_spawncrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehLightskill] call TFS_fnc_setunitskill;
            if (random 1 >= 0.5) then {
                _v allowcrewinImmobile true;
            };
            
            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
} else {
    if (_AIReporting && {
        _VehLightmax >0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no Light vehicles to select from. step skipped.", _factionname]
    };
};

// HEAVY VEHS

if !(_vehHeavylist isEqualto []) then {
    private _VehHeavyDif = _VehHeavymax - _VehHeavymin;
    if (_VehHeavyDif <0) then {
        _VehHeavyDif = 0
    };
    
    for "_x" from 1 to (_VehHeavymin + floor(random _VehHeavyDif)) do {
        _g = creategroup _side;
        _g setgroupIdGlobal [format ["%1_vehHeavy%2", _grpPrefix, _x]];
        
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;
        
        if !(_rpos isEqualto [0, 0]) then {
            _v = (selectRandom _vehHeavylist) createvehicle _rpos;
            _v lock 3;
            
            [_v, _g] call BIS_fnc_spawncrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehHeavyskill] call TFS_fnc_setunitskill;
            if (random 1 >= 0.5) then {
                _v allowcrewinImmobile true;
            };
            
            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
} else {
    if (_AIReporting && {
        _VehHeavymax >0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no Heavy vehicles to select from. step skipped.", _factionname]
    };
};

// random VEHS

{
    _vehRandlist append _x
} forEach [_vehAAlist, _vehMraplist, _vehLightlist, _vehHeavylist];

if !(_vehRandlist isEqualto []) then {
    private _VehRandDif = _VehRandmax - _VehRandmin;
    if (_VehRandDif <0) then {
        _VehRandDif = 0
    };
    
    for "_x" from 1 to (_VehRandmin + floor(random _VehRandDif)) do {
        _g = creategroup _side;
        _g setgroupIdGlobal [format ["%1_vehrand%2", _grpPrefix, _x]];
        
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;
        
        if !(_rpos isEqualto [0, 0]) then {
            _v = (selectRandom _vehRandlist) createvehicle _rpos;
            _v lock 3;
            
            [_v, _g] call BIS_fnc_spawncrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehrandskill] call TFS_fnc_setunitskill;
            if (random 1 >= 0.5) then {
                _v allowcrewinImmobile true;
            };
            
            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

{
    if !(dynamicsimulationEnabled (group _x)) then {
        (group _x) enableDynamicSimulation true;
    };
    _x disableAI "AUtoCOMBAT";
} forEach _units;

{
    if !(dynamicsimulationEnabled (group _x)) then {
        (group _x) enableDynamicSimulation true;
    };
} forEach _vehicles;

{
    _x addcuratorEditableObjects [_units, false];
    _x addcuratorEditableObjects [_vehicles, true];
} forEach allCurators;

[_units, _vehicles]