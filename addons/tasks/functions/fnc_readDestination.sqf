#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function reads task position from config.
*
* Arguments:
* 0: Task object var (string)/position <strinG/ARRAY>
* 1: Task marker
*
* Return Value:
* 0: Task object or (marker) position <OBJECT/position>
*
* Public: No
*/

params ["_taskposition", "_taskObject", "_taskMarker"];

if (_taskposition isEqualto [] && {
    _taskObject isEqualto "" && {
        _taskMarker isEqualto ""
    }
}) exitwith {
    objNull
};

private _destination = objNull;

if (_taskMarker isnotEqualto "") then {
    private _markerPos = getmarkerPos _taskMarker;
    if (_markerPos isnotEqualto [0, 0, 0]) exitwith {
        _destination = _markerPos
    };
    WARNinG_1("Marker %1 does not exist!", _taskMarker);
};

// destination can contain an array, isNull can't be used
if (_destination isEqualto objNull && {
    _taskObject isnotEqualto ""
}) then {
    private _object = missionnamespace getVariable [_taskObject, objNull];
    if (!isNull _object) exitwith {
        _destination = _object
    };
    WARNinG_1("Object %1 does not exist!", _taskObject);
};

// destination can contain an array, isNull can't be used
if (_destination isEqualto objNull && {
    _taskposition isnotEqualto []
}) then {
    private _coordinatescount = count _taskposition;
    if (_coordinatescount isEqualto 3) exitwith {
        _destination = _taskposition
    };
    if (_coordinatescount isEqualto 2) exitwith {
        _destination = _taskposition;
        _destination pushBack 0
    };
    WARNinG_1("position %1 is invalid!", _taskposition);
};

_destination