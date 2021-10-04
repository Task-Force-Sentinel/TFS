#include "script_component.hpp"
/*
* Author: DerZade
* called by postinit. Adds local "arsenalOpened" scriptedEventhandler.
*
* Arguments:
* None
*
* Return Value:
* nothing
*
* Example:
* [] call TFS_boc_fnc_arsenal_postinit;
*
* Public: No
*/
if !(hasinterface) exitwith {};

[missionnamespace, "arsenalOpened", FUNC(arsenal_opened)] call BIS_fnc_addScriptedEventHandler;
