#include "script_component.hpp"
/*
* Author: Jonpas
* sets pop-up target groups from lists of targets, invalid targets and markers.
*
* Arguments:
* 0: targets <ARRAY>
* 1: invalid targets <ARRAY>
* 2: Markers <ARRAY>
*
* Return Value:
* None
*
* Example:
* [[target1, target2], [invalidTarget1, invalidTarget2], [marker1, marker2]] call TFS_shootingrange_fnc_setTargetgroups;
*
* Public: No
*/

params ["_targets", "_targetsinvalid", "_markers"];
TRACE_3("set Target groups", _targets, _targetsinvalid, _markers);

// Parse target groups
private _targetgroups = [];
private _targetinvalidgroups = [];
private _lastMarker = "";
private _currentTargetgroup = [];
private _currentTargetinvalidgroup = [];
private _numtargetsinvalid = count _targetsinvalid;

{
    if (_forEachindex != 0 && {
        _x != _lastMarker
    }) then {
        _targetgroups pushBack _currentTargetgroup;
        _currentTargetgroup = [];
        _targetinvalidgroups pushBack _currentTargetinvalidgroup;
        _currentTargetinvalidgroup = [];
    };
    
    private _target = _targets select _forEachindex;
    if (!isNull _target) then {
        _currentTargetgroup pushBack _target;
    };
    if (_numtargetsinvalid > _forEachindex) then {
        private _targetinvalid = _targetsinvalid select _forEachindex;
        if (!isNull _targetinvalid) then {
            _currentTargetinvalidgroup pushBack _targetinvalid;
        };
    };
    
    if (_forEachindex + 1 == count _markers) then {
        _targetgroups pushBack _currentTargetgroup;
        _targetinvalidgroups pushBack _currentTargetinvalidgroup;
    };
    
    _lastMarker = _x;
} forEach _markers;

TRACE_2("Target groups", _targetgroups, _targetinvalidgroups);

// set targets groups on targets
{
    private _targetgroup = _x;
    private _targetinvalidgroup = _targetinvalidgroups select _forEachindex;
    {
        _x setVariable [QGVAR(targetgroup), _targetgroup];
        _x setVariable [QGVAR(targetinvalidgroup), _targetinvalidgroup];
    } forEach _targetgroup;
} forEach _targetgroups;