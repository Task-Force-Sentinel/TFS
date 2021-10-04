if (is3DEN) exitwith {};
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

private _ainumbertospawn = _logic getVariable ["ainumbertospawn", 0];
// private _unitRatio = _logic getVariable ["unitRatio", 0.7];
private _debug = _logic getVariable ["Debug", false];
private _areas = (synchronizedObjects _logic) select {
    side _x == sideLogic && _x isKindOf QGVAR(area)
};
_areas pushBack _logic;
// Add the garrison module as viable area.
private _unitData = _logic getVariable [QGVAR(unitData), []];
private _side = ((_unitData select 0) select 0);
private _maingroup = creategroup _side;
[_maingroup, QGVAR(garrisongroup), true] call tfs_common_fnc_initgroupVar;
private _holdPos = _logic getVariable ["hold", false];

private _buildings = [];
{
    private _arealogic = _x;
    (_arealogic getVariable ["objectArea", [0, 0, 0, false, 0]]) params ["_a", "_b", "_dir", "_isrect"];
    
    private _nearObjects = ((getPos _x) nearObjects ["Static", _a * _b]) select {
        count (_x buildingPos -1) > 0 && {
            (getPos _x) inArea [getPos _arealogic, _a, _b, _dir, _isrect]
        }
    };
    _buildings append _nearObjects;
} forEach _areas;

// todo building filter? max/min spots (no lone wolves)

[_buildings, true] call CBA_fnc_shuffle;
private _availableBuildings = [];

private _freeBuildingSpaces = 0;
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
        _freeBuildingSpaces = _freeBuildingSpaces + count _freePoses;
    };
} forEach _buildings;
// Filter building claimed spots.

if (_ainumbertospawn > _freeBuildingSpaces) then {
    systemChat "TFS Garrison - insufficent free building positions check your map for location and details.";
    private _mkr = createMarkerlocal [str (random 99999), getPos _logic];
    _mkr setMarkerShape "ICON";
    _mkr setMarkertype "mil_dot";
    _mkr setMarkersize [0.5, 0.5];
    _mkr setMarkerColor "ColorRed";
    _mkr setMarkertext format ["Error - TFS Garrison module - Unable to find sufficent building places (%1 available / %2 needed)", _freeBuildingSpaces, _ainumbertospawn];
};
private _garrisonedBuildings = [];
for "_i" from 1 to (_ainumbertospawn min _freeBuildingSpaces) do {
    private _building = selectRandom _freeBuildings;
    private _freebuildingpositions = _building getVariable [QGVAR(freespawnPoses), []];
    // select position
    private _postoUse = _freebuildingpositions deleteAt 0;
    _building setVariable [QGVAR(freespawnPoses), _freebuildingpositions];
    
    if (count _freebuildingpositions == 0) then {
        // if building no longer has free spaces remove it from future selection.
        _freeBuildings = _freeBuildings - [_building];
    };
    
    private _unitData = selectRandom _unitData;
    _unitData params ["", "_unitclassname", "_unitloadout"];
    private _unit = _maingroup createUnit [_unitclassname, _postoUse, [], 0, "NONE"];
    _unit setPosATL _postoUse;
    _unit setUnitLoadout [_unitloadout, false];
    
    if (_holdPos) then {
        _unit disableAI "PATH";
        _unit setunitPos "UP";
    };
    _building setVariable
    [
        QGVAR(garrisonedunits),
        (_building getVariable [QGVAR(garrisonedunits), []]) + [_unit]
    ];
    
    _garrisonedBuildings pushBackUnique _building;
    
    if (_debug) then {
        private _mkr = createMarker [str (random 999), _postoUse];
        _mkr setMarkerShape "ICON";
        _mkr setMarkertype "mil_dot";
        _mkr setMarkersize [0.5, 0.5];
        _mkr setMarkerColor "ColorRed";
        _mkr setMarkertext (_unitclassname);
    };
};
if ((_logic getVariable ["WakeUp", false])) then {
    {
        private _building = _x;
        private _buildingCenter = _building modeltoWorld (boundingCenter _building);
        _buildingCenter set [2, 0];
        // set to ground
        private _buildingsize = (boundingBox _building) # 2;
        private _trigger = createTrigger ["EmptyDetector", _buildingCenter, false];
        _trigger setVariable ["side", _side];
        _trigger setVariable ["units", _building getVariable [QGVAR(garrisonedunits), []]];
        _trigger settriggerInterval 2;
        // set interval to 2 seconds
        _trigger settriggerArea [_buildingsize * 3, _buildingsize * 3, 0, false, 10];
        _trigger settriggerActivation ["ANYplayer", "PRESENT", false];
        _trigger settriggerStatements [
            QUOTE(private _side = (thistrigger getVariable [ARR_2('side', opfor)]);
            this && ({
                side _x != _side
            } count thislist) > 0),
            QUOTE({
                _x enableAI 'PATH';
                _x setunitPos 'AUto';
            } forEach (thistrigger getVariable [ARR_2('units', [])]);
            deletevehicle thistrigger;
            ),
            ""
        ];
    } forEach _garrisonedBuildings;
};

// Ensure side is corrected -- https://feedback.bistudio.com/T70739.
private _units = units _maingroup;
_units join _maingroup;

_logic setVariable ["spawned_units", _units, true];
// global set variable