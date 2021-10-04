#include "script_component.hpp"
/*
* Author: veteran29
* onload handler for modal
*
* Arguments:
* 0: modal display <DISPLAY>
*
* Return Value:
* None
*
* Public: No
*/

params ["_display"];

uiNamespace setVariable [QGVAR(modalDisplay), _display];

nil