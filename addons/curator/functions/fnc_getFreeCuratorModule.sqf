#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function returns free curator module or creates new module if no free module available.
*
* Arguments:
* None
*
* Return Value:
* 0: Free curator module <OBJECT>
*
* Example:
* call tfs_curator_fnc_getFreeCuratormodule
*
* Public: No
*/

private _freeCuratorID = GVAR(curators) findif {
    isNull getAssignedCuratorUnit _x
};
if (_freeCuratorID isEqualto -1) exitwith {
    call FUNC(createCuratormodule)
};

GVAR(curators) select _freeCuratorID