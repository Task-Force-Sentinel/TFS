#include "\z\tfs\addons\spectator\script_component.hpp"
/*
* Author: Head
* set control text for a 3D tag
*
* Arguments:
* 0: _control
* 1: _text
* 2: _color
* 3: _subtext - Controls if its the subtext being set or the main text.
*
* Return Value:
* nil
*
* Example:
* [_control, "mytext", [1, 1, 1, 1], false] call tfs_spectator_fnc_controlsetpicture
*
* Public: No
*/
params ["_control", "_text", ["_color", []], ["_subtext", false]];
disableSerialization;

private _textControl = controlnull;

if (!_subtext) then {
    _textControl = _control controlsgroupCtrl 2;
} else {
    _textControl = _control controlsgroupCtrl 3;
};
if (!(_textControl getVariable [QGVAR(lasttext), ""] isEqualto _text)) then {
    _textControl ctrlsettext _text;
    _textControl setVariable [QGVAR(lasttext), _text];
};
if (!isnil "_color" && {
    count _color == 4
}) then {
    _textControl ctrlsettextColor _color;
};