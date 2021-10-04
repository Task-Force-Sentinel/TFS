#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_evaluateCondArray
* Author: Snippers
*
* Arguments:
* Object: Unit, Array: Conditions
*
* Return:
* Boolean
*
* Description:
* Use this function to see check if a unit matches any conditions in the arrays. Apropriate conditions are sides (side type variables or scalars), factions (all strings are assumed factions),
*/

params ["_unit", "_condArray"];
private _return = false;
{
    if ((_x isEqualtype "") and {
        _x == (faction (leader _unit))
    }) exitwith {
        _return = true;
    };
    if ((_x isEqualtype 0) && {
        (_x call EFUNC(common, numtoside)) == side _unit
    }) exitwith {
        _return = true;
    };
    if ((_x isEqualtype east) && {
        _x == side _unit
    }) exitwith {
        _return = true;
    };
} forEach _condArray;

_return