/*
Function: TFS_fnc_spawncivilians

Description:
Used to populate an area with a certain type of civilians. spawns pedestrian
patrols, garrisoned peds, vehicle patrols and parked vehicles.

Arguments:
_grpPrefix - The prefix for the group IDs <strinG>
_center - The center position of the area we want to populate <position 3D>
_radius - The radius of the area we want to populate <SCALAR>
_faction - The faction which we want to use for populating the AO <strinG>
_side - The side of the civilians <side>
_garrisons - Garrison parameters <ARRAY OF [min Amount of units, random Upper Bound of units]>
_ped - Pedestrian parameters <ARRAY OF [min Amount of units, random Upper Bound of units]>
_vehpatrol - vehicle Patrol parameters <ARRAY OF [min Amount of vehicles, random Upper Bound of vehicles]>
_vehparked - Parked vehicles parameters <ARRAY OF [min Amount of vehicles, random Upper Bound of vehicles]>

Example:
(begin example)
[
    "Kavala",
    "CIV_F",
    civilian,
    100,
    [5, 10],
    300,
    [13, 25],
    [2, 4],
    [1, 3]
] call TFS_fnc_spawncivilians;
(end)

Author:
Mokka
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
    "_grpPrefix",
    ["_faction", "CIV_F"],
    ["_side", civilian],
    "_Garrradius",
    ["_garrisons", [0, 0]],
    "_radius",
    ["_ped", [0, 0]],
    ["_vehpatrol", [0, 0]],
    ["_vehparked", [0, 0]]
];

private _AIReporting = TFS_AI_Reporting;

_typeNameCenter = typeName _center;

call {
    if (_typeNameCenter isEqualto "OBJECT") exitwith {
        _center = getPos _center;
    };
    if (_typeNameCenter isEqualto "strinG") exitwith {
        _center = getmarkerPos _center;
    };
    if (_typeNameCenter isEqualto [0, 0, 0]) exitwith {
        systemChat "Civspawns - position is invalid";
    };
};

_center set [2, 0];
if (_center isEqualto [0, 0]) exitwith {
    systemChat "Center for spawncivilians may not be [0, 0]!"
};

_garrisons params ["_garrisonsmin", "_garrisonsmax"];
_ped params ["_pedmin", "_pedmax"];
_vehpatrol params ["_vehpatrolmin", "_vehpatrolmax"];
_vehparked params ["_vehparkedmin", "_vehparkedmax"];

_GetfactionArrays = compileFinal format ["call TFS_fnc_%1", _faction];
_factionArrays = call _GetfactionArrays;
_factionArrays params ["_pedPool", "_motPool"];

// Populate road positions for waypoints etc...
// Obtain as many positions as we need
_minpositions = _garrisonsmax + _pedmax + _vehpatrolmax + _vehparkedmax + SLACK;

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

// Shuffle the road array to have random spawn locations
_roadlist = _roadlist call BIS_fnc_arrayShuffle;

// Now let's get to spawning civilians...
private _units = [];
private _vehicles = [];

// GARRISONS

if !(_pedPool isEqualto []) then {
    if (_garrisonsmax > 0) then {
        private _GarDif = _garrisonsmax - _garrisonsmin;
        if (_GarDif <0) then {
            _GarDif = 0
        };
        
        private _garrisonsExact = _garrisonsmin + floor (random _GarDif);
        private _garrisonedunits = [
            _center,
            [0, _Garrradius],
            _faction, _side,
            _pedPool, _garrisonsExact
        ] call TFS_fnc_civilianGarrison;
        
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
        _garrisonsmax > 0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no civilian peds to select from. step skipped.", _faction]
    };
};

// StandARD inFANtry

if !(_pedPool isEqualto []) then {
    private _pedDif = _pedmax - _pedmin;
    if (_pedDif <0) then {
        _pedDif = 0
    };
    
    for "_x" from 1 to (_pedmin + floor(random _pedDif)) do {
        private _rpos = selectRandom _roadlist;
        private _g = creategroup [_side, true];
        private _u = _g createUnit [selectRandom _pedPool, _rpos, [], 0, "NONE"];
        
        _g setgroupIdGlobal [format["%1_inf%2", _grpPrefix, _x]];
        
        // setup patrol task
        [_g, _roadlist] call TFS_fnc_civilianPatrol;
        _units append (units _g);
    };
} else {
    if (_AIReporting && {
        _pedmax > 0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no civilian peds to select from. step skipped.", _faction]
    };
};

// vehicles (PATROL)

if !((_motPool isEqualto []) || (_pedPool isEqualto [])) then {
    private _vehpatrolDif = _vehpatrolmax - _vehpatrolmin;
    if (_vehpatrolDif <0) then {
        _vehpatrolDif = 0
    };
    
    for "_x" from 1 to (_vehpatrolmin + floor(random _vehpatrolDif)) do {
        private _rpos = selectRandom _roadlist;
        private _dir = round (random 360);
        
        // Obtain direction stuff, bit of a pain...
        if ((typeName _rpos) isEqualto "OBJECT") then {
            private _connectedRoads = roadsConnectedto _rpos;
            if ((count _connectedRoads) > 0) then {
                _adjRoad = _connectedRoads select 0;
                _dir = [_rpos, _adjRoad] call BIS_fnc_dirto;
            };
        };
        
        private _g = creategroup [_side, true];
        private _u = _g createUnit [selectRandom _pedPool, _rpos, [], 0, "CAN_COLLIDE"];
        [_u] joinSilent _g;
        
        _g setgroupIdGlobal [format["%1_vehPatrol%2", _grpPrefix, _x]];
        
        private _v = createvehicle [(selectRandom _motPool), _rpos];
        _v setDir _dir;
        
        _u assignAsdriver _v;
        _u moveInDriver _v;
        
        // setup patrol task
        [_g, _roadlist] call TFS_fnc_civilianPatrol;
        _units append (units _g);
        _vehicles append [_v];
    };
} else {
    if (_AIReporting && {
        _vehpatrolmax > 0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no civilian peds or vehicles to select from. step skipped.", _faction]
    };
};

// vehicles (PARKED)

if !(_motPool isEqualto []) then {
    private _vehparkedDif = _vehparkedmax - _vehparkedmin;
    if (_vehparkedDif <0) then {
        _vehparkedDif = 0
    };
    
    for "_x" from 1 to (_vehparkedmin + floor(random _vehparkedDif)) do {
        private _rpos = selectRandom _roadlist;
        private _dir = round (random 360);
        
        // Obtain direction stuff, bit of a pain...
        if ((typeName _rpos) isEqualto "OBJECT") then {
            private _connectedRoads = roadsConnectedto _rpos;
            if ((count _connectedRoads) > 0) then {
                _adjRoad = _connectedRoads select 0;
                _dir = [_rpos, _adjRoad] call BIS_fnc_dirto;
            };
        };
        
        private _v = createvehicle [(selectRandom _motPool), _rpos];
        _v setDir _dir;
        _v setPos [((getPos _v) select 0) - 6, (getPos _v) select 1, (getPos _v) select 2];
        
        _vehicles append [_v];
    };
} else {
    if (_AIReporting && {
        _vehparkedmax > 0
    }) exitwith {
        systemChat format ["TFS Fundamentals: inFO: %1 no civilian vehicles to select from. step skipped.", _faction]
    };
};

// set up dynamic sim and curator stuff

{
    if !(dynamicsimulationEnabled (group _x)) then {
        (group _x) enableDynamicSimulation true;
    };
    _x  disableAI "AUtoCOMBAT";
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