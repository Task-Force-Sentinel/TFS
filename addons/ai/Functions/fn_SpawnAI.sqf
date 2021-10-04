/*
Function: TFS_fnc_SpawnAI

Description:
    Used to populate an area with a predefined enemy faction. This function has a large list of parameters
    to adjust the number of enemies spawned. It's advised to use the numbers in this function sparingly.
    It's easy to spawn in huge numbers which could cause a temporary drop in frames.
    This function works best when executed prior to mission start but can be executed during the mission
    in the Debug Console for on the fly objectives.

Arguments:
    _grpPrefix - The prefix for the group IDs <STRING>
    _center - The center position of the area we want to populate <POSITION 3D>
    _radius - The radius of the area we want to populate <SCALAR>
    _faction - The faction which we want to use for populating the AO <STRING>
    _garrisons - Garrison Parameters <ARRAY OF [Group Count, Min Radius, Max Radius, Skill Level of Garrisoned Units, Max Fill in Buildling, Exclusion List]>
    _inf - Infantry Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _infaa - AA Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _infat - AT Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _sniper - Sniper Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehaa - Vehicle-based AA Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehmrap - MRAP Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehlight - Light Vehicles Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehheavy - Heavy/Armoured Vehicle Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _vehran - Random Vehicles Parameters <ARRAY OF [Min Amount of Groups, Random Upper Bound of Groups]>
    _patrolMethod - Method to use for plotting the patrol paths <STRING, one of ["RANDOM", "ROADS"], default: "RANDOM">

Example:
    (begin example)
        [
            "Objective 1",
            [2955.43,6010.11,0],
            500,
            "Sahrani Liberation Army",
            [5, 100, 200],
            [3, 5]
            ] call TFS_fnc_SpawnAI;
            Example 2:
            ["Kavala",
            [2955.43,6010.11,0],
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
            "RANDOM"
        ] call TFS_fnc_SpawnAI;
    (end)

Author:
    MitchJC
*/

// SLACK provides us with some additional spawning positions later on, just to be safe...
#define SLACK 2

// MAX_SEARCH_ITS provides an upper bound for radius extensions when polling road positions,
// so we don't have to search the entire map
#define MAX_SEARCH_ITS 20

// If we don't find enough road positions in the radius, extend radius step-wise by this amount
#define EXT_RADIUS 100

if (!isserver) exitwith {};

params [
    "_center",
    ["_grpPrefix","Obj 1"],
    ["_faction", "OPF_T_F"],
    ["_GarrRadius",100],
    ["_garrisons", [0,0]],
    ["_patrolMethod", "RANDOM"],
    ["_radius", 500],
    ["_inf", [0,0]],
    ["_infaa", [0,0]],
    ["_infat", [0,0]],
    ["_sniper", [0,0]],
    ["_vehaa", [0,0]],
    ["_vehlight", [0,0]],
    ["_vehmrap", [0,0]],
    ["_vehheavy", [0,0]],
    ["_vehrand", [0,0]]

];

_typeNameCenter = typeName _center;

call {
    if (_typeNameCenter isEqualTo "OBJECT") exitwith { _center = getPos _center;};
    if (_typeNameCenter isEqualTo "STRING") exitwith { _center = getMarkerPos _center;};
    if (_typeNameCenter isEqualTo [0, 0, 0]) exitwith {systemchat "AISpawns - Position is invalid";};
};

_center set [2, 0];

_garrisons params ["_GarrisonedGroupsMin", ["_GarrisonedGroupsMax", 0], ["_infSkill", "TFS Default"]];
_inf params ["_infMin", ["_infMax", 0], ["_infSkill", "TFS Default"]];
_infaa params ["_infaaMin", ["_infaaMax",0], ["_infaaSkill", "TFS Default"]];
_infat params ["_infatMin", ["_infatMax",0], ["_infatSkill", "TFS Default"]];
_sniper params ["_sniperMin", ["_sniperMax",0], ["_sniperSkill", "TFS Default"]];
_vehaa params ["_vehaaMin", ["_vehaaMax",0], ["_vehaaSkill", "TFS Default"]];
_vehmrap params ["_vehmrapMin", ["_vehmrapMax",0], ["_vehmrapSkill", "TFS Default"]];
_vehlight params ["_vehlightMin", ["_vehlightMax",0], ["_vehlightSkill", "TFS Default"]];
_vehheavy params ["_vehheavyMin", ["_vehheavyMax",0], ["_vehheavySkill", "TFS Default"]];
_vehrand params ["_vehrandMin", ["_vehrandMax",0], ["_vehrandSkill", "TFS Default"]];

_patrolMethod = toUpper _patrolMethod;

private ["_fnc_patrol_EI", "_fnc_patrol_EI_spec", "_fnc_patrol_veh", "_fnc_pos_EI", "_fnc_pos_veh"];

switch (_patrolMethod) do {
    case "ROAD": {
        _fnc_patrol_EI = compile "[(_this select 0), (_this select 3)] call TFS_fnc_RoadPatrol;";
        _fnc_patrol_EI_spec = compile "[(_this select 0), (_this select 3)] call TFS_fnc_RoadPatrol;";
        _fnc_patrol_veh = compile "[(_this select 0), (_this select 3)] call TFS_fnc_RoadPatrol;";
        _fnc_pos_EI = compile "selectRandom (_this select 2)";
        _fnc_pos_veh = compile "selectRandom (_this select 2)";
    };
    case "RANDOM": {
        _fnc_patrol_EI = compile "[(_this select 0), (_this select 1), (_this select 2)/1.5, 3 + round (random 2), [""SAD"", ""MOVE""] select (random 1 > 0.33), [""AWARE"", ""SAFE""] select (random 1 > 0.5), [""red"", ""white""] select (random 1 > 0.2), [""limited"", ""normal""] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;";
        _fnc_patrol_EI_spec = compile "[(_this select 0), (_this select 1), (_this select 2)/1.5, 3 + round (random 2), ""SAD"", [""AWARE"", ""SAFE""] select (random 1 > 0.5), [""red"", ""white""] select (random 1 > 0.2), [""limited"", ""normal""] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;";
        _fnc_patrol_veh = compile "[(_this select 0), (_this select 1), (_this select 2) / 2, 3 + round (random 2), ""MOVE"", [""AWARE"", ""SAFE""] select (random 1 > 0.5), [""red"", ""white""] select (random 1 > 0.2), [""limited"", ""normal""] select (random 1 > 0.5)] call CBA_fnc_taskPatrol;";
        _fnc_pos_EI = compile "[[[(_this select 0), (_this select 1)],[]],[""water""]] call TFS_fnc_SafePos;";
        _fnc_pos_veh = compile "[[[(_this select 0), (_this select 1)], []], [""water""], { !(_this isFlatEmpty [2,-1,0.5,1,0,false,objNull] isEqualTo []) }] call TFS_fnc_SafePos;";
    };
    default {
        _fnc_patrol_EI = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_SpawnAI!"";";
        _fnc_patrol_EI_spec = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_SpawnAI!"";";
        _fnc_patrol_veh = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_SpawnAI!"";";
        _fnc_pos_EI = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_SpawnAI!"";";
        _fnc_pos_veh = compile "systemChat ""Error: Unknown patrol method supplied to TFS_fnc_SpawnAI!"";";
    };
};

///////////////////////////////////////////////////////////
// UNIT TYPES
///////////////////////////////////////////////////////////

private ["_infList", "_confBase", "_infaaList", "_infatList", "_sniperList", "_vehAAList", "_vehMrapList", "_vehLightList", "_vehHeavyList", "_vehRandList"];

// TODO: UAVs ?

// Set the Default Faction if all else fails
private _side = East;
private _FactionSide = "East";
private _InfantryType = "Infantry";
private _InfantryGroup = "OIA_InfTeam";
private _vehRandList = [];
private _AIReporting = TFS_AI_Reporting;

// Check for Side from _faction
private _SideNumber = getnumber (configfile >> "CfgFactionClasses" >> _faction >> "side");

call {
     if (_sidenumber IsEqualTo 0) exitwith {
         _side = East;
         _FactionSide = "East";
    };
     if (_sidenumber IsEqualTo 1) exitwith {
         _side = West;
         _FactionSide = "West";
    };
     if (_sidenumber IsEqualTo 2) exitwith {
         _side = Resistance;
         _FactionSide = "Indep";
    };
};
if (isnil "_Faction") exitwith {systemchat format ["Faction missing from %1 at %2",_grpPrefix, _center]};

_GetFactionArrays = compileFinal format ["call TFS_fnc_%1", _faction];
_FactionArrays = call _GetFactionArrays;
_FactionArrays params ["_InfantryType", "_infaaList", "_infatList", "_sniperList", "_vehAAList", "_vehMrapList", "_vehLightList", "_vehHeavyList"];

private ["_x","_g","_pos","_flatPos","_rpos","_v"];

// If we want to plot patrol routes along roads, populate the waypoints
private _waypoints = [];

if (_patrolMethod isEqualTo "ROAD") then {

    // Obtain as many positions as we need
    _minPositions = _GarrisonedGroupsMax + _infMax + _infaaMax + _infatMax + _sniperMax + _vehaaMax + _vehmrapMax + _vehlightMax + _vehheavyMax + _vehrandMax + SLACK;

    // Get list of roads around the center
    _roadList = [];
    _roadList = _center nearRoads _radius;

    // Now increase the search radius until we have found enough positions
    if (count _roadList < _minPositions) then {
        _i = 0;
        _radExtension = 0;
        // If we exceed our max in iterations, abort and use random positions instead...
        while {(count _roadList < _minPositions) && (_i < MAX_SEARCH_ITS)} do {
            _radExtension = _radExtension + EXT_RADIUS;
            _roadList = _center nearRoads (_radius + _radExtension);
            _i = _i + 1;
        };
    };

    // If we still don't have enough positions, fill the remaining spots up with random positions
    if (count _roadList < _minPositions) then {
        while {count _roadList < _minPositions} do {
            _rpos = [[[_center, _radius],[]],["water"]] call TFS_fnc_SafePos;
            _roadList append [_rpos];
        };
    };

    // populate _waypoints with the positions of these roads
    _waypoints resize (count _roadList);
    for "_n" from 0 to (count _roadList) do {
        _waypoints set [_n, getPos (_roadList select _n)];
    };
};

// Simple protection for broken requests
if (_center isEqualTo [0,0]) exitWith {};

_confBase = configfile >> "CfgGroups" >> _FactionSide >> _faction >> _InfantryType;
if (isnil "_infList") then {_infList = ("true" configClasses _confBase) apply { configName _x };};
private _FactionName = gettext (configfile >> "CfgGroups" >> _FactionSide >> _Faction >> "name");
// Prep return values
private _units = [];
private _vehicles = [];

///////////////////////////////////////////////////////////
// GARRISONS
///////////////////////////////////////////////////////////
if !(_infList isEqualTo []) then {
    if (_GarrisonedGroupsMax > 0) then {
       private _GarDif = _GarrisonedGroupsMax - _GarrisonedGroupsMin;
        if (_GarDif <0) then {_GarDif = 0};

        private _GarrisonedGroupsExact = _GarrisonedGroupsMin + floor (random _GarDif);
        private _garrisonedUnits = (
            [
                _center,
                [0, _GarrRadius],
                _side, _FactionSide,
                _faction, _InfantryType,
                _infList, _GarrisonedGroupsExact,
                nil, 2,
                4, []
            ] call TFS_fnc_infantryGarrison
        );
        _units append _garrisonedUnits;

        private _grps = [];
        { _grps pushBackUnique (group _x); nil } count _units;

        // tag groups
        { _x setGroupIdGlobal [format["%1_gar%2", _grpPrefix, _forEachIndex]]; } forEach _grps;
    };
} else {
    if (_AIReporting && { _GarrisonedGroupsMax >0 }) exitwith {systemchat format ["TFS Fundamentals: INFO: %1 no Infantry Teams to select from. Step skipped.",_FactionName]};
};
///////////////////////////////////////////////////////////
// STANDARD INFANTRY
///////////////////////////////////////////////////////////
if !(_infList isEqualTo []) then {
   private _InfDif = _infMax - _infMin;
    if (_InfDif <0) then {_InfDif = 0};

    for "_x" from 1 to (_infMin + floor(random _InfDif)) do {
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_EI;
        _g = [_rpos, _side, _confBase >> (selectRandom _infList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_inf%2", _grpPrefix, _x]];
        [_g, _center, _radius, _waypoints] call _fnc_patrol_EI;
        [_g, _infSkill] call TFS_fnc_SetUnitSkill;
        _units append (units _g);
    };
} else {
    if (_AIReporting && { _infMax >0 }) exitwith {systemchat format ["TFS Fundamentals: INFO: %1 no Infantry Teams to select from. Step skipped.",_FactionName]};
    };

///////////////////////////////////////////////////////////
// AA INFANTRY
///////////////////////////////////////////////////////////

if !(_infaaList isEqualTo []) then {
   private _InfaaDif = _InfaaMax - _InfaaMin;
    if (_InfaaDif <0) then {_InfaaDif = 0};

    for "_x" from 1 to (_InfaaMin + floor(random _InfaaDif)) do {
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_EI;
        _g = [_rpos, _side, _confBase >> (selectRandom _infaaList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_infaa%2", _grpPrefix, _x]];
        [_g, _center, _radius, _waypoints] call _fnc_patrol_EI_spec;
        [_g, _infaaSkill] call TFS_fnc_SetUnitSkill;
        _units append (units _g);
    };
} else {
    if (_AIReporting && { _InfaaMax >0 }) exitwith {systemchat format ["TFS Fundamentals: INFO: %1 no AA Teams to select from. Step skipped.",_FactionName]};
    };

///////////////////////////////////////////////////////////
// AT INFANTRY
///////////////////////////////////////////////////////////

if !(_infatList isEqualTo []) then {
   private _InfatDif = _InfatMax - _InfatMin;
    if (_InfatDif <0) then {_InfatDif = 0};

    for "_x" from 1 to (_InfatMin + floor(random _InfatDif)) do {
        _rpos = [_center, _radius, _waypoints] call _fnc_pos_EI;
        _g = [_rpos, _side, _confBase >> (selectRandom _infatList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_infat%2", _grpPrefix, _x]];
        [_g, _center, _radius, _waypoints] call _fnc_patrol_EI_spec;
        [_g, _infatSkill] call TFS_fnc_SetUnitSkill;
        _units append (units _g);
    };
} else {
    if (_AIReporting && { _InfatMax >0 }) exitwith {systemchat format ["TFS Fundamentals: INFO: %1 no AT Teams to select from. Step skipped.",_FactionName]};
    };

///////////////////////////////////////////////////////////
// SNIPER TEAMS
///////////////////////////////////////////////////////////
if !(_sniperList isEqualTo []) then {
   private _SniperDif = _SniperMax - _SniperMin;
    if (_SniperDif <0) then {_SniperDif = 0};

    for "_x" from 1 to (_SniperMin + floor(random _SniperDif)) do {
        _rpos = [_center, _radius, 100, 20] call BIS_fnc_findOverwatch;
        _g = [_rpos, _side, _confBase >> (selectRandom _sniperList)] call BIS_fnc_spawnGroup;
        _g setGroupIdGlobal [format["%1_sniper%2", _grpPrefix, _x]];
        _g setBehaviour "COMBAT";
        _g setCombatMode "RED";
        [_g, _sniperSkill] call TFS_fnc_SetUnitSkill;
        _units append (units _g);
    };
} else {
    if (_AIReporting && { _SniperMax >0 }) exitwith {systemchat format ["TFS Fundamentals: INFO: %1 no Sniper Teams to select from. Step skipped.",_FactionName]};
    };

///////////////////////////////////////////////////////////
// AA
///////////////////////////////////////////////////////////

if !(_vehAAList isEqualTo []) then {
   private _VehAADif = _VehAAMax - _VehAAMin;
    if (_VehAADif <0) then {_VehAADif = 0};

    for "_x" from 1 to (_VehAAMin + floor(random _VehAADif)) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_VehAA%2", _grpPrefix, _x]];

        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehAAList) createVehicle _rpos ;
            _v lock 2;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehaaSkill] call TFS_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
} else {
    if (_AIReporting && { _VehAAMax >0 }) exitwith {systemchat format ["TFS Fundamentals: INFO: %1 no AA Vehicles to select from. Step skipped.",_FactionName]};
    };

///////////////////////////////////////////////////////////
// MRAP
///////////////////////////////////////////////////////////

if !(_vehmrapList isEqualTo []) then {
   private _VehMRAPDif = _VehMRAPMax - _VehMRAPMin;
    if (_VehMRAPDif <0) then {_VehMRAPDif = 0};

    for "_x" from 1 to (_VehMRAPMin + floor(random _VehMRAPDif)) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehmrap%2", _grpPrefix, _x]];

        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehmrapList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehmrapSkill] call TFS_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
} else {
    if (_AIReporting && { _VehMRAPMax >0 }) exitwith {systemchat format ["TFS Fundamentals: INFO: %1 no MRAPs to select from. Step skipped.",_FactionName]};
    };

///////////////////////////////////////////////////////////
// LIGHT VEHS
///////////////////////////////////////////////////////////

if !(_vehLightList isEqualTo []) then {

   private _VehLightDif = _VehLightMax - _VehLightMin;
    if (_VehLightDif <0) then {_VehLightDif = 0};

    for "_x" from 1 to (_VehLightMin + floor(random _VehLightDif)) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehLight%2", _grpPrefix, _x]];

        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehLightList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehLightSkill] call TFS_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
} else {
    if (_AIReporting && { _VehLightMax >0 }) exitwith {systemchat format ["TFS Fundamentals: INFO: %1 no Light Vehicles to select from. Step skipped.",_FactionName]};
    };

///////////////////////////////////////////////////////////
// HEAVY VEHS
///////////////////////////////////////////////////////////

if !(_vehHeavyList isEqualTo []) then {
   private _VehHeavyDif = _VehHeavyMax - _VehHeavyMin;
    if (_VehHeavyDif <0) then {_VehHeavyDif = 0};

    for "_x" from 1 to (_VehHeavyMin + floor(random _VehHeavyDif)) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehHeavy%2", _grpPrefix, _x]];

        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehHeavyList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehHeavySkill] call TFS_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
} else {

    if (_AIReporting && { _VehHeavyMax >0 }) exitwith {systemchat format ["TFS Fundamentals: INFO: %1 no Heavy Vehicles to select from. Step skipped.",_FactionName]};
    };




///////////////////////////////////////////////////////////
// RANDOM VEHS
///////////////////////////////////////////////////////////
{_vehRandList append _x} foreach [_vehAAList, _vehMrapList, _vehLightList, _vehHeavyList];

if !(_vehRandList isEqualTo []) then {

   private _VehRandDif = _VehRandMax - _VehRandMin;
    if (_VehRandDif <0) then {_VehRandDif = 0};

    for "_x" from 1 to (_VehRandMin + floor(random _VehRandDif)) do {

        _g = createGroup _side;
        _g setGroupIdGlobal [format ["%1_vehrand%2", _grpPrefix, _x]];

        _rpos = [_center, _radius, _waypoints] call _fnc_pos_veh;

        if !(_rpos isEqualTo [0,0]) then {
            _v = (selectRandom _vehRandList) createVehicle _rpos ;
            _v lock 3;

            [_v, _g] call BIS_fnc_spawnCrew;
            [_g, _center, _radius, _waypoints] call _fnc_patrol_veh;
            [_g, _vehrandSkill] call TFS_fnc_SetUnitSkill;
            if (random 1 >= 0.5) then { _v allowCrewInImmobile true; };

            _units append (units _g);
            _vehicles pushBack _v;
        };
    };
};

{
    if !(dynamicSimulationEnabled (group _x)) then {
        (group _x) enableDynamicSimulation true;
    };
    _x  disableAI "AUTOCOMBAT";
} forEach _units;

{
    if !(dynamicSimulationEnabled (group _x)) then {
        (group _x) enableDynamicSimulation true;
    };
} forEach _vehicles;

{
    _x addCuratorEditableObjects [_units, false];
    _x addCuratorEditableObjects [_vehicles, true];
} forEach allCurators;

[_units, _vehicles]
