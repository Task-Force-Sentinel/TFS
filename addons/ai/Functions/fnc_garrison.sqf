#include "\z\tfs\addons\ai\script_component.hpp"
params ["_logic", "_units", "_activated"];

private _headless = (synchronizedObjects _logic) select {
    _x isKindOf "HeadlessClient_F" && !local _x
};
if (count _headless > 0 && isServer) exitwith {
    _this remoteExec [QFUNC(garrison), _headless select 0];
};

if (!(_logic getVariable [QGVAR(init), false])) then {
    private _grps = [];
    {
        _grps pushBackUnique group _x
    } forEach (synchronizedObjects _logic);
    private _unitData = [];
    {
        private _grp = _x;
        {
            _unitData pushBack [side _x, typeOf _x, getUnitloadout _x];
            deletevehicle _x;
        } forEach units _grp;
        deletegroup _grp;
    } forEach (_grps select {
        side _x != sideLogic
    });
    _logic setVariable [QGVAR(unitData), _unitData];
    _logic setVariable [QGVAR(init), true];
};

if (!_activated) exitwith {};

private _houseRatio = _logic getVariable ["houseratio", 0.7];
private _unitRatio = _logic getVariable ["unitRatio", 0.7];
private _debug = _logic getVariable ["Debug", false];
private _areas = (synchronizedObjects _logic) select {
    side _x == sideLogic && _x isKindOf QGVAR(area)
};
private _unitData = _logic getVariable [QGVAR(unitData), []];
private _maingroup = creategroup ((_unitData select 0) select 0);
[_maingroup, QGVAR(garrisongroup), true] call tfs_common_fnc_initgroupVar;
private _holdPos = _logic getVariable ["hold", false];

if (count _areas > 0) then {
    {
        private _arealogic = _x;
        (_arealogic getVariable ["objectArea", [0, 0, 0, false, 0]]) params ["_a", "_b", "_dir", "_isrect"];
        private _buildings = ((getPos _x) nearObjects ["Static", _a * _b]) select {
            count (_x buildingPos -1) > 0 && {
                (getPos _x) inArea [getPos _arealogic, _a, _b, _dir, _isrect]
            }
        };
        
        private _freeBuildings = [];
        // list of buildings that list have free positions.
        {
            private _building = _x;
            private _freePoses = _building getVariable [QGVAR(freespawnPoses), -1];
            
            // if building has not been initialized find the free positions.
            if (_freePoses isEqualto -1) then {
                private _buildingPoses = _x buildingPos -1;
                
                // todo - Test if positions are blocked.
                [_buildingPoses, true] call CBA_fnc_shuffle;
                // Shuffle for easy randomisation.
                _x setVariable [QGVAR(freespawnPoses), _buildingPoses];
                _freePoses = _buildingPoses;
            };
            if (count _freePoses > 0) then {
                _freeBuildings pushBack _building;
            };
        } forEach _buildings;
        
        [_freeBuildings, true] call CBA_fnc_shuffle;
        private _numberOfHouses = round (count _freeBuildings * _houseRatio);
        for "-" from 1 to _numberOfHouses do {
            private _building = _freeBuildings deleteAt 0;
            private _freebuildingpositions = _building getVariable [QGVAR(freespawnPoses), []];
            // select position
            
            _building setVariable [QGVAR(freespawnPoses), _freebuildingpositions];
            
            private _numberOfunits = round (count _freebuildingpositions * _unitRatio);
            for "-" from 1 to _numberOfunits do {
                private _postoUse = _freebuildingpositions deleteAt 0;
                
                private _unitData = selectRandom _unitData;
                _unitData params ["", "_unitclassname", "_unitloadout"];
                private _unit = _maingroup createUnit [_unitclassname, _postoUse, [], 0, "NONE"];
                _unit setPosATL _postoUse;
                _unit setUnitLoadout [_unitloadout, false];
                
                if (_holdPos) then {
                    _unit disableAI "PATH";
                    _unit setunitPos "UP";
                };
                
                if (_debug) then {
                    private _mkr = createMarker [str (random 999), _postoUse];
                    _mkr setMarkerShape "ICON";
                    _mkr setMarkertype "mil_dot";
                    _mkr setMarkersize [0.5, 0.5];
                    _mkr setMarkerColor "ColorRed";
                    _mkr setMarkertext (_unitclassname);
                };
            };
            
            // set free positions left in building.
            _building setVariable [QGVAR(freespawnPoses), _freebuildingpositions];
        };
    } forEach _areas;
} else {
    ERRor_MSG("TFS Garrison module has no TFS Area connected to it.");
};

_logic setVariable ["spawned_units", units _maingroup, true];
// global set variable