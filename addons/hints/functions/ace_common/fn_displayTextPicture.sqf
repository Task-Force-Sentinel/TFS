/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\hints\functions\ace_common\fn_displaytextpicture.sqf
* by Ojemineh
*
* replace ace core displaytextpicture
*
* Arguments:
* 0: text - <ANY>
* 1: image - <strinG>
* 2: image color - <ARRAY>
* 3: target unit - <OBJECT>
* 4: size - <NUMBER>
*
* Return:
* nothing
*
* Example:
* ["text", "image", [1, 1, 1], ACE_player, 2] call ACE_common_fnc_displaytextpicture
*
*/

// -------------------------------------------------------------------------------------------------

params [["_text", ""], ["_image", "", [""]], ["_imageColor", [1, 1, 1], [[]]], ["_target", ACE_player, [objNull]], ["_size", 2, [0]]];

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
    
    _text = format [hint_tpl_image_3, _image, _imageColor call BIS_fnc_colorRGBtoHTML, _text];
    
    [_text] call tfs_fnc_hint;
} else {
    [_text, _image, _imageColor, _target, _size] call ACE_common_fnc_displaytextpictureEx;
};