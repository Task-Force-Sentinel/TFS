/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\hints\functions\fn_hintglobal.sqf
* by Ojemineh
*
* extended hint system
*
* Arguments:
* 0: text - <strinG>
* 1: color - <COLor> (index 0-2 or Array [0, 0, 1, 1])
* 2: sound - <NUMBER> (index 0-4)
* 3: delay - <NUMBER> (Seconds 5-30)
* 1: position - <NUMBER> (0 top right, 1 top left, 2 bottom left, 3 bottom right)
*
* Return:
* nothing
*
* Example:
* [ format [hint_tpl_default, "Hello World"] ] call TFS_fnc_hintglobal;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_text", "_color", "_delay", "_sound", "_position"];

_text = [_this, 0, "", [""]] call BIS_fnc_param;
_color = [_this, 1, -1, [0, []]] call BIS_fnc_param;
_sound = [_this, 2, -1, [0]] call BIS_fnc_param;
_delay = [_this, 3, -1, [0]] call BIS_fnc_param;
_position = [_this, 4, -1, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

[_text, _color, _sound, _delay, _position] remoteExecCall ["tfs_fnc_hint", 0];

// -------------------------------------------------------------------------------------------------