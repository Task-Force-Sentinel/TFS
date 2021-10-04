#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_checkTFSVersion
* Author: Snippers
*
* Arguments:
* Array - Version to check
*
* Return:
* Boolean
*
* Description:
* Checks if TFS Mission version is larger than the input version;
*/

params [
    ["_input", [0, 0, 0]]
];

private _tfsVersion = getMissionConfigValue ["VERSION", [0, 0, 0]];

([_tfsVersion, _input] call EFUNC(common, checkVersionArray));