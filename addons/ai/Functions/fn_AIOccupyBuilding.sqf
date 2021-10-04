/*
Function: derp_fnc_AIOccupyBuilding

Description:
Garrison function used to garrison AI inside buildings.

Arguments:
_startingPos - The building(s) nearest this position are used <position 3D>
_buildingtypes - Limit the building search to those type of building <ARRAY OF strinGS>
_unitsArray - units that will be garrisoned <ARRAY OF units>
_fillingradius - radius to fill building(s) <SCALAR, defaults to 50>
_fillingtype - even filling, 1: building by building, 2: random filling <SCALAR, defaults to 0>
_topdownFilling - true to fill building(s) from top to bottom <BOOLEAN, defaults to false>
_maxFill - max number of positions to fill in any given building, <SCALAR, defaults to 0 (all positions)>
_excludes - list of positions to exclude <ARRAY OF strinGS>

Return Value:
Array of units not garrisoned <ARRAY OF units>

Example:
(begin example)
[position, nil, [unit1, unit2, unit3, unitN], 200, 1, false] call derp_fnc_AIOccupyBuilding
(end)

Author:
alganthe, modified by Mokka
*/

params [
    ["_startingPos", [0, 0, 0], [[]], 3],
    ["_buildingtypes", ["Building"], [[]]],
    ["_unitsArray", [], [[]]],
    ["_fillingradius", [0, 50], [[]]],
    ["_fillingtype", 0, [0]],
    ["_topdownFilling", false, [true]],
    ["_maxFill", 0, [0]],
    ["_excludes", [], [[]]]
];

_origunits = _unitsArray + [];
_unitsArray = _unitsArray select {
    alive _x && {
        !isplayer _x
    }
};

if (_startingPos isEqualto [0, 0, 0]) exitwith {
    diag_log "[derp_fnc_AIOccupyBuilding] Error: position provided is invalid";
    systemChat "[derp_fnc_AIOccupyBuilding] Error: position provided is invalid";
};

if (count _unitsArray == 0 || {
    isNull (_unitsArray select 0)
}) exitwith {
    diag_log "[derp_fnc_AIOccupyBuilding] Error: No unit provided";
    systemChat "[derp_fnc_AIOccupyBuilding] Error: No unit provided";
};

private _buildings = [];

if ((_fillingradius select 1) < 30) then {
    _fillingradius set [1, 30];
};

_buildings =
nearestobjects [_startingPos, _buildingtypes, _fillingradius select 1] select {
    _x distance2D _startingPos > (_fillingradius select 0) && {
        !(_x in _excludes)
    }
};

_buildings = _buildings call BIS_fnc_arrayShuffle;

if (count _buildings == 0) exitwith {
    diag_log "[derp_fnc_AIOccupyBuilding] Error: No valid building found";
    systemChat "[derp_fnc_AIOccupyBuilding] Error: No valid building found";
    _unitsArray
};

private _buildingsindexes = [];

if (_topdownFilling) then {
    {
        private _buildingPos = (_x buildingPos -1) select {
            !(_x in _excludes)
        };
        
        // Those reverse are necessary, as dumb as it is there's no better way to sort those subarrays in sqf
        {
            reverse _x;
        } forEach _buildingPos;
        
        _buildingPos sort false;
        
        {
            reverse _x;
        } forEach _buildingPos;
        
        if (_maxFill > 0) then {
            _buildingsindexes pushBack (_buildingPos select [0, _maxFill]);
        } else {
            _buildingsindexes pushBack _buildingPos;
        };
    } forEach _buildings;
} else {
    {
        if (_maxFill > 0) then {
            _buildingsindexes pushBack ((((_x buildingPos -1) select {
                !(_x in _excludes)
            }) call BIS_fnc_arrayShuffle) select [0, _maxFill]);
        } else {
            _buildingsindexes pushBack ((_x buildingPos -1) select {
                !(_x in _excludes)
            });
        };
    } forEach _buildings;
};

// Remove buildings without positions
{
    _buildingsindexes deleteAt (_buildingsindexes find _x);
} forEach (_buildingsindexes select {
    count _x == 0
});

// Warn the user that there's not enough positions to place all units
private _count = 0;
{
    _count = _count + count _x;
} forEach _buildingsindexes;
private _leftoverAIcount = (count _unitsArray) - _count;
if (_leftoverAIcount > 0) then {
    diag_log "[derp_fnc_AIOccupyBuilding] Warning: not enough positions to place all units";
    systemChat "[derp_fnc_AIOccupyBuilding] Warning: not enough positions to place all units";
};

private _placedunits = [];

// do the placement
switch (_fillingtype) do {
    case 0: {
        while {count _unitsArray > 0} do {
            if (count _buildingsindexes == 0) exitwith {};
            
            private _building = _buildingsindexes select 0;
            
            if (_building isEqualto []) then {
                _buildingsindexes deleteAt 0;
            } else {
                private _pos = _building select 0;
                
                private _nearestunits = (_pos nearEntities ["CAManBase", 1]);
                if (count _nearestunits > 0 && {
                    count (_nearestunits select {
                        getPos _x select 2 == _pos select 2
                    }) > 0
                }) then {
                    _buildingsindexes set [0, _building - [_pos]];
                } else {
                    private _unit = _unitsArray select 0;
                    _unit setPos _pos;
                    _placedunits pushBack _unit;
                    _unitsArray deleteAt (_unitsArray find _unit);
                    _building deleteAt 0;
                    _buildingsindexes deleteAt 0;
                    _buildingsindexes pushBackUnique _building;
                };
            };
        };
    };
    
    case 1: {
        while {count _unitsArray > 0} do {
            if (count _buildingsindexes == 0) exitwith {};
            
            private _building = _buildingsindexes select 0;
            
            if (_building isEqualto []) then {
                _buildingsindexes deleteAt 0;
            } else {
                private _pos = _building select 0;
                
                private _nearestunits = (_pos nearEntities ["CAManBase", 1]);
                if (count _nearestunits > 0 && {
                    count (_nearestunits select {
                        getPos _x select 2 == _pos select 2
                    }) > 0
                }) then {
                    _buildingsindexes set [0, _building - [_pos]];
                } else {
                    private _unit = _unitsArray select 0;
                    _unit setPos _pos;
                    _placedunits pushBack _unit;
                    _unitsArray deleteAt (_unitsArray find _unit);
                    _buildingsindexes set [0, _building - [_pos]];
                };
            };
        };
    };
    
    case 2: {
        while {count _unitsArray > 0} do {
            if (count _buildingsindexes == 0) exitwith {};
            
            private _building = selectRandom _buildingsindexes;
            
            if (_building isEqualto []) then {
                _buildingsindexes deleteAt (_buildingsindexes find _building);
            } else {
                private _pos = selectRandom _building;
                
                private _nearestunits = (_pos nearEntities ["CAManBase", 1]);
                if (count _nearestunits > 0 && {
                    count (_nearestunits select {
                        getPos _x select 2 == _pos select 2
                    }) > 0
                }) then {
                    _buildingsindexes set [(_buildingsindexes find _building), _building - [_pos]];
                } else {
                    private _unit = _unitsArray select 0;
                    _unit setPos _pos;
                    _unitsArray deleteAt (_unitsArray find _unit);
                    _placedunits pushBack _unit;
                    _buildingsindexes set [(_buildingsindexes find _building), _building - [_pos]];
                };
            };
        };
    };
};

{
    _x disableAI "AUtoCOMBAT";
    _x disableAI "PATH";
    if !(dynamicsimulationEnabled (group _x)) then {
        (group _x) enableDynamicSimulation true;
    };
} forEach _placedunits;

_origunits - _placedunits