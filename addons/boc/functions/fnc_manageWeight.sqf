#include "script_component.hpp"
/*
* Author: NemesisRE
* Will add/remove the weigth of hte chestpack to/from a given unit
*
* Arguments:
* 0: Unit <OBJECT>
* 1: add weight <BOOL>
*
* Return Value:
* None
*
* Example:
* [player, true] call TFS_boc_fnc_manageWeight;
*
* Public: No
*/
params [["_unit", objNull, [objNull]], ["_add", true, [true]]];
private ["_chestpackClass", "_chestpackitemsMass", "_chestpackClassMass", "_totalChestpackMass"];

if (isNull _unit) exitwith {
    false
};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {
    false
};

_chestpackClass = [_unit] call FUNC(chestpack);
_chestpackitemsMass = [_unit] call FUNC(loadChestpack);
_chestpackClassMass = [_chestpackClass] call TFS_boc_fnc_itemMass;
_totalChestpackMass = _chestpackitemsMass + _chestpackClassMass;

if (_add) then {
    [_unit, _unit, _totalChestpackMass] call ace_movement_fnc_addloadtoUnitContainer;
} else {
    [_unit, _unit, -_totalChestpackMass] call ace_movement_fnc_addloadtoUnitContainer;
};