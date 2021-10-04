/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\hints\functions\ace_common\fn_stringtoColoredtext.sqf
*	by Ojemineh
*
*	replace ace core displayIcon
*
*	Arguments:
* 0: text <ANY>
* 1: Color <ARRAY, strinG>
*
*	Return:
*	text <strinG>
*
*	Example:
*	["text", [0, 1, 2]] call ACE_common_fnc_stringtoColoredtext
*
*/

// -------------------------------------------------------------------------------------------------

params ["_string", "_color"];

_string = format ["%1", _string];
_return = "";

if (_color isEqualtype []) then {
    _color = "#" + ([255 * (_color select 0), 2] call ACE_common_fnc_toHex) + ([255 * (_color select 1), 2] call ACE_common_fnc_toHex) + ([255 * (_color select 2), 2] call ACE_common_fnc_toHex);
};

private _hint_enabled = (missionnamespace getVariable ["tfs_hint_enabled", true]);
private _hint_option_ace = (missionnamespace getVariable ["tfs_hint_option_ace", true]);

if (_hint_enabled && _hint_option_ace) then {
    _return = format ["<t align='center' color='%1' >%2</t>", _color, _string];
} else {
    _return = parsetext format ["<t align='center' color='%1' >%2</t>", _color, _string];
};

_return