/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\hints\functions\ace_common\fn_displaytextpicture.sqf
*	by Ojemineh
*
*	replace ace core displaytextstructured
*
*	Arguments:
*	0: text			- <ANY>
*	1: size			- <NUMBER>
*	3: target unit	- <OBJECT>
*	4: custom width	- <NUMBER>
*
*	Return:
*	nothing
*
*	Example:
*	[["Test: %1", 123], 1.5] call ACE_common_fnc_displaytextstructured
*
*/

// -------------------------------------------------------------------------------------------------

params [["_text", ""], ["_size", 1.5, [0]], ["_target", ACE_player, [objNull]], ["_width", 10, [0]]];

private _hint_enabled = (missionnamespace getVariable ["tfs_hint_enabled", true]);
private _hint_option_ace = (missionnamespace getVariable ["tfs_hint_option_ace", true]);

if (_hint_enabled && _hint_option_ace) then {
    if (_target != ACE_player) exitwith {};
    
    if (typeName _text != "text") then {
        if (_text isEqualtype []) then {
            if (count _text > 0) then {
                {
                    if (_x isEqualtype "" && {
                        islocalized _x
                    }) then {
                        _text set [_forEachindex, localize _x];
                    };
                } forEach _text;
                _text = format _text;
            };
        };
        if (_text isEqualtype "" && {
            islocalized _text
        }) then {
            _text = localize _text;
        };
    };
    
    _text = format [hint_tpl_liner_1, _text];
    
    [_text] call tfs_fnc_hint;
} else {
    [_text, _size, _target, _width] call ACE_common_fnc_displaytextstructuredEx;
};