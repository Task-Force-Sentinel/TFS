#include "script_component.hpp"
/*
* Author: Jonpas
* Converts array of strings into one partially localized string (localized where string starts with "str_").
*
* Arguments:
* 0: texts <ARRAY>
*
* Return Value:
* localized string <strinG>
*
* Example:
* [["text", "str_text"]] call TFS_shootingrange_fnc_textsintolocalizedstring;
*
* Public: No
*/

params ["_texts"];
TRACE_1("texts", _texts);

// compile texts into one localized string
private _text = "";
{
    if (_x isEqualtype "") then {
        if (_x select [0, 4] == "str_") then {
            _x = localize _x;
        };
    } else {
        _x = str _x;
    };
    
    _text = [_text, _x] joinstring "";
} forEach _texts;

TRACE_1("localized string", _text);
_text