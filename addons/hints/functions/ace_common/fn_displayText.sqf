/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\z\tfsrhs\addons\hints\functions\ace_common\fn_displayText.sqf
 *	by Ojemineh
 *	
 *	replace ace core displayText
 *	
 *	Arguments:
 *	0: text			- <STRING>
 *	1: sound		- <BOOLEAN>
 *	2: delay		- <NUMBER>
 *	3: priority		- <NUMBER>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	["Message", true, 5, 2] call ACE_common_fnc_displayText
 *	
 */

// -------------------------------------------------------------------------------------------------

params ["_text", ["_sound", false], ["_delay", 2], ["_priority", 0]];

private _hint_enabled = (missionNamespace getVariable ["tfsrhs_hint_enabled", true]);
private _hint_option_ace = (missionNamespace getVariable ["tfsrhs_hint_option_ace", true]);

if (_hint_enabled && _hint_option_ace) then {
	
	_text = format [hint_tpl_liner_1, _text];
	
	private _snd = 0;
	
	if (_sound) then { _snd = -1; };
	
	[_text, -1, _snd] call TFSRHS_fnc_hint;
	
} else {
	
	[_text, _sound, _delay, _priority] call ACE_common_fnc_displayTextEx;
	
};
