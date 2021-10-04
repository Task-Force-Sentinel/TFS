#include "\z\tfs\addons\spectator\script_component.hpp"
/*
* Author: Head, Snippers
* Creates a unit node for units tree node
*
* Arguments:
* 0: _unit - a unit
* 1: _parentindex - parent index for the treeview group node
*
* Return Value:
* index <NUMBER>
*
* Example:
* [group player] call tfs_spectator_fnc_createUnitNode
*
* Public: No
*/
params["_unit", "_parentindex"];

disableSerialization;

private _name = name _unit;
private _unitlistControl = (uiNamespace getVariable [QGVAR(unitlist), controlnull]);
private _index = _unitlistControl tvAdd [[_parentindex], _name];
_unitlistControl tvSetData [[_parentindex, _index], _unit call BIS_fnc_netId];

private _icon = gettext (configFile >> "Cfgvehicles" >> typeOf (vehicle _unit) >> "icon");
if (istext (configFile >> "CfgvehicleIcons" >> _icon )) then {
    _icon = gettext (configFile >> "CfgvehicleIcons" >> _icon);
};
_unitlistControl tvSetPicture [[_parentindex, _index], _icon];