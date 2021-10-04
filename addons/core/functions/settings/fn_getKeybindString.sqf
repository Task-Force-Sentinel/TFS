/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\settings\fn_getKeybindstring.sqf
* by Ojemineh
*
* get keybind string
*
* Arguments:
* 0: addon - <strinG>
* 1: actionname - <strinG>
*
* Return:
* strinG
*
* Example:
* ["CH View distance", "open_settings"] call TFS_fnc_getKeybindstring;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_addon", "_actionname"];

_addon = [_this, 0, "", [""]] call BIS_fnc_param;
_actionname = [_this, 1, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_addon isEqualto "") exitwith {
    ""
};
if (_actionname isEqualto "") exitwith {
    ""
};

// -------------------------------------------------------------------------------------------------

private _entry = [_addon, _actionname] call CBA_fnc_getKeybind;
private _return = "";

if (!isnil "_entry") then {
    private _keybind = _entry select 5;
    
    private _useShift = (_keybind select 1) select 0;
    private _useCtrl = (_keybind select 1) select 1;
    private _useAlt = (_keybind select 1) select 2;
    
    private _modifier =
    (if (_useShift) then {
        localize "str_TFS_Core_ShiftModifier"
    } else {
        ""
    }) +
    (if (_useCtrl) then {
        localize "str_TFS_Core_CtrlModifier"
    } else {
        ""
    }) +
    (if (_useAlt) then {
        localize "str_TFS_Core_AltModifier"
    } else {
        ""
    });
    
    _return = toUpper(format ["%1%2", _modifier, [_keybind select 0] call BIS_fnc_keyCode]);
};

_return;