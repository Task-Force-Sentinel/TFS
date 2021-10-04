#include "\z\tfs\addons\spectator\script_component.hpp"
/*
* Author: Head, Snippers
* Creates a group node for units tree node
*
* Arguments:
* 0: _grp <group>
*
* Return Value:
* index <NUMBER>
*
* Example:
* [group player] call tfs_spectator_fnc_creategroupNode
*
* Public: not really
*/
params ["_grp"];

disableSerialization;

private _twGrpMkr = [_grp] call EFUNC(orbat, getgroupMarkerData);

private _grpname = groupid _grp;
private _icon = "\A3\ui_f\data\map\markers\nato\b_unknown.paa";
private _color = (side _grp) call CFUNC(sidetoColor);

if (count _twGrpMkr >= 3) then {
    _icon = _twGrpMkr select 0;
    _color = [1, 1, 1, 1];
};

private _unitlistControl = (uiNamespace getVariable [QGVAR(unitlist), controlnull]);

private _index = _unitlistControl tvAdd [[], _grpname];
_unitlistControl tvSetPicture [[_index], _icon];
_unitlistControl tvSetData [[_index], _grp call BIS_fnc_netId];
_unitlistControl tvSetPictureColor [[_index], _color];

{
    if (alive _x) then {
        [_x, _index] call FUNC(createUnitNode);
    };
} forEach (units _grp);

if({
    isplayer _x
} count (units _grp) > 0) then {
    _unitlistControl tvExpand [_index];
};

_index