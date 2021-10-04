/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\common\fn_attachtorel.sqf
* by Ojemineh
*
* attach object relative to parent
*
* Arguments:
* 0: object - <OBJECT>
* 1: parent - <OBJECT>
*
* Return:
* nothing
*
* Example:
* [player, vehicle1] call TFS_fnc_attachtorel;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_object", "_parent"];

_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_parent = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitwith {};
if (isNull _parent) exitwith {};

// -------------------------------------------------------------------------------------------------

private _vectorDirandUpRel = {
    private ["_o", "_p", "_v"];
    
    _o = _this select 0;
    _p = _this select 1;
    
    _v = _p worldToModelVisual [0, 0, 0];
    
    [
        _p worldToModelVisual vectorDirVisual _o vectorDiff _v,
        _p worldToModelVisual vectorUpVisual _o vectorDiff _v
    ]
};

private _vector = _this call _vectorDirandUpRel;

_object attachto [_parent];
_object setvectorDirAndUp _vector;