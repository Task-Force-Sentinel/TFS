#include "\z\tfs\addons\spectator\script_component.hpp"
/*
* Author: Head
* set control picture for a 3D tag
*
* Arguments:
* 0: _control
* 1: _picturePath
* 2: _color
*
* Return Value:
* nil
*
* Example:
* [_control, "pathtopicture", [1, 1, 1, 1]] call tfs_spectator_fnc_controlsetpicture
*
* Public: No
*/
params ["_control", "_picturePath", "_color"];
disableSerialization;
private _image = (_control controlsgroupCtrl 1);
if (_picturePath != "" && {
    _control getVariable [QGVAR(lastimage), ""] != _picturePath
}) then {
    _image ctrlsettext _picturePath;
    _control setVariable [QGVAR(lastimage), _picturePath];
};
if (!(_control getVariable [QGVAR(lastColor), ""] isEqualto _color)) then {
    _image ctrlsettextColor _color;
    _control setVariable [QGVAR(lastColor), _color];
};