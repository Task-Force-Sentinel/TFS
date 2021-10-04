/*
Author: diwako
Description:
Applies fast rope action to every helicopter
*/

if !(hasinterface) exitwith {};
params [["_helicopter", objNull]];

if (!(tfs_quickactions_add_fast_rope) || {
    isNull _helicopter || {
        !(_helicopter isKindOf "Helicopter")
    }
}) exitwith {};

_helicopter addAction ["<t color='#00FF00'>Perform fast rope</t>", {
    params ["_helicopter", "_unit", "_actionId", "_arguments"];
    [_unit, _helicopter] call ace_fastroping_fnc_fastrope;
}, [], -100, false, true, "", "_originalTarget == (objectParent ace_player) && {
    [ace_player, objectParent ace_player] call ace_fastroping_fnc_canFastrope
}", 10];