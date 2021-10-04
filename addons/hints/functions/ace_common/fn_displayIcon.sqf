/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\hints\functions\ace_common\fn_displayIcon.sqf
* by Ojemineh
*
* replace ace core displayIcon
*
* Arguments:
* 0: id - <strinG>
* 1: show - <BOOLEAN>
* 2: file - <strinG>
* 3: color - <ARRAY>
* 4: timealive - <NUMBER> [-1 = forever (default: 6)]
*
* Return:
* nothing
*
* Example:
* ["myID", true, "data\icon_group.paa", [1, 1, 1, 1], 0] call ACE_common_fnc_displayIcon;
*
*/

// -------------------------------------------------------------------------------------------------

params ["_iconId", "_show", "_icon", ["_color", [1, 1, 1, 1]], ["_timealive", 6]];

private _hint_enabled = (missionnamespace getVariable ["tfs_hint_enabled", true]);
private _hint_option_ace = (missionnamespace getVariable ["tfs_hint_option_ace", true]);

if (_hint_enabled && _hint_option_ace) then {
    private _text = format [hint_tpl_icon_1, _icon, _color];
    
    [_text, -1, 0] call TFS_fnc_hint;
} else {
    [_iconId, _show, _icon, _color, _timealive] call ACE_common_fnc_displayIconEx;
};