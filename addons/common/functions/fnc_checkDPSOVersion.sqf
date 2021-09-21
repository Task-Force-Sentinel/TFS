#include "\z\tfsrhs\addons\common\script_component.hpp"
/*
 * Name: TFSRHS_common_fnc_checkTFSRHSVersion
 * Author: Snippers
 *
 * Arguments:
 *  Array - Version to check
 *
 * Return:
 * Boolean
 *
 * Description:
 * Checks if TFSRHS Mission version is larger than the input version;
 */

params [
    ["_input",[0,0,0]]
];

private _tfsrhsVersion = getMissionConfigValue ["VERSION",[0,0,0]];

([_tfsrhsVersion,_input] call EFUNC(common,checkVersionArray));

