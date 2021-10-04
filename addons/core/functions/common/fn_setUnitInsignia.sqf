/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\common\fn_setUnitinsignia.sqf
* by Ojemineh
*
* set unit insignia
*
* Arguments:
* 0: unit - <OBJECT>
* 1: insignia - <strinG>
*
* Return:
* nothing
*
* Example:
* [player, "curator"] call TFS_fnc_setUnitinsignia;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit", "_insignia"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_insignia = [_this, 1, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};
if ((uniform _unit) isEqualto "") exitwith {};

// -------------------------------------------------------------------------------------------------

private _selectionindex = -1;
private _uniformClass = gettext (configFile >> "Cfgweapons" >> (uniform _unit) >> "Iteminfo" >> "uniformClass");
private _material = gettext (configFile >> "CfgUnitinsignia" >> _insignia >> "material");
private _texture = gettext (configFile >> "CfgUnitinsignia" >> _insignia >> "texture");

{
    if (_x == "insignia") exitwith {
        _selectionindex = _forEachindex;
    };
} forEach getArray (configFile >> "Cfgvehicles" >> _uniformClass >> "hiddenselections");

if (_selectionindex > -1) then {
    if (_material != "") then {
        _unit setobjectMaterialGlobal [_selectionindex, _material];
    } else {
        _unit setobjectMaterialGlobal [_selectionindex, "\a3\data_f\default.rvmat"];
    };
    
    if (_texture != "") then {
        _unit setobjecttextureGlobal [_selectionindex, _texture];
    } else {
        _unit setobjecttextureGlobal [_selectionindex, "#(rgb, 8, 8, 3)color(0, 0, 0, 0)"];
    };
    
    _unit setVariable ["BIS_fnc_setUnitinsignia_class", _insignia, true];
} else {
    _unit setVariable ["BIS_fnc_setUnitinsignia_class", nil, true];
};