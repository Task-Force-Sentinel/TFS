#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_sidetype
* Author: Nick
*
* Arguments:index of side
*
* Return:
* side
*
* Description:
* Turns the sidetype into actual side
*/
params ["_side"];

_side = _side max 0 min 3;
["east", "west", "resistance", "civilian"] select _side