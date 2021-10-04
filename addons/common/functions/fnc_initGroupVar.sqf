#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_initgroupVar
* Author: Snippers
*
* Arguments:
* 0: group: Target group
* 1: strinG: Variable name
* 2: ANY: Variable Value
*
* Return:
* none
*
* Description:
* group variables will not be broadcast globally during init. calling this function during init can be used to bypass this limitation;
*/

// setting a group variable to true on init doesn't syncrhonize in MP. Here we delay by a frame.

params ["_entity", "_str", "_val"];

_entity setVariable [_str, _val];
// for Eden

[{
    params["_entity", "_str", "_val"];
    _entity setVariable [_str, _val, true];
}, [_entity, _str, _val]] call CBA_fnc_execNextFrame;