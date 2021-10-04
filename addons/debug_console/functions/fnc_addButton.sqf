#include "script_component.hpp"
/*
* Author: veteran29
* Adds custom button to debug console
*
* Arguments:
* 0: name <strinG, ARRAY>
* 0: name <strinG>
* 1: tooltip <strinG
* 1: Code to execute on button click <CODE>
*
* Return Value:
* None
*
* Example:
* [["Test", "This is a button"], {
    hint "Button was clicked"
}] call tfs_debug_console_fnc_addButton
*
* Public: Yes
*/

params [["_name", "", ["", []]], ["_code", "", [{}]]];
_name params [["_displayname", "", [""]], ["_tooltip", "", [""]]];

GVAR(buttons) pushBack [_displayname, _tooltip, _code];

nil