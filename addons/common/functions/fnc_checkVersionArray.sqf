#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_checkVersionArray
* Author: Snippers
*
* Arguments:
* Array - input version
* Array - Required version.
*
* Return:
* Boolean
*
* Description:
* Checks if the input version is greater or equal to the required version
*/

params [
    ["_input", [0, 0, 0]],
    ["_required", [1, 0, 0]]
];

_input params ["_i0", "_i1", "_i2"];
_required params ["_r0", "_r1", "_r2"];

if (_i0 > _r0) exitwith {
    true
};
if (_i0 < _r0) exitwith {
    false
};
if (_i1 > _r1) exitwith {
    true
};
if (_i1 < _r1) exitwith {
    false
};
if (_i2 < _r2) exitwith {
    false
};

true;