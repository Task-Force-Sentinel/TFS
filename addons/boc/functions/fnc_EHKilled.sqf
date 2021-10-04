#include "script_component.hpp"
/*
* Author: DerZade
* Triggerd by Killed-Eventhandler
*
* Arguments:
* 0: unit <OBJECT>
*
* Return Value:
* nothing
*
* Example:
* _this call TFS_boc_fnc_EHKilled;
*
* Public: No
*/
params ["_unit"];
private ["_chestpack", "_chestpackitems", "_chestpackmags", "_holder", "_backpack"];

// todo: check if unit was player
if (GVAR(removeKilledplayerChestpack)) exitwith {
    [_unit] call FUNC(removeChestpack);
};

_chestpack = [_unit] call FUNC(chestpack);
_chestpackitems = [_unit, false] call FUNC(chestpackitems);
_chestpackmags = [_unit] call FUNC(chestpackmagazines);
_holder = createvehicle ["WeaponHolderSimulated", (getPos _unit), [], 0, "CAN_COLLIDE"];

// add pack
_holder addbackpackCargoGlobal [_chestpack, 1];
_backpack = firstBackpack _holder;
clearAllitemsfromBackpack _backpack;

// add items
{
    _backpack additemCargoGlobal [_x, 1];
} forEach _chestpackitems;

// add magazines
{
    _backpack addMagazineammoCargo [(_x select 0), (_x select 2), (_x select 1)];
} forEach _chestpackmags;

// remove the backpack from the dead unit
[_unit] call FUNC(removeChestpack);