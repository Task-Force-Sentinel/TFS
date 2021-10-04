#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_edenDraw
* Author: Snippers
*
* Arguments:
* None
*
* Return:
* nil
*
* Description:
* called on the draw event in EDEN.
*
*/
if (GVAR(Garrison)) then {
    [] call FUNC(edenMouseOver);
    [] call FUNC(edenMouseKeydown);
};

[] call FUNC(edenHideMapObjects);