#include "script_component.hpp"
/*
* Author: DerZade
* Returns the cargo container of a unit's chestpack. note that this is only a prop and does not contain any items. items which
* were added with vanilla commands like 'addweaponCargo' etc. will be ignored. You have to use the provided functions instead.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* Cargo container or objNull <OBJECT>
*
* Example:
* [player] call TFS_boc_fnc_chestpackContainer;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]] ];
private ["_var", "_weaponHolder"];

if (isNull _unit) exitwith {
    objNull
};

_var = _unit getVariable [QGVAR(chestpack), [["", objNull]]];
_weaponHolder = (_var select 0) select 1;

// return backpack
firstBackpack _weaponHolder