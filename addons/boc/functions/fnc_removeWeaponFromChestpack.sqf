#include "script_component.hpp"
/*
* Author: DerZade
* Removes weapon from unit's chestpack. The purpose of this function is to ensure that weapons with specific attachments and magazines can be removed.
* if you want to remove a weapon with just any attachments/magazines you may want to use 'FUNC(removeItemfromChestpack)' instead.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: Weapon <ARRAY> [<classname>, <SILENCER>, <POinTER>, <OPTIC>, <PRIMARY MAG>, <SECONDARY MAG>, <BIPOD>]
* 		0: Weapon classname <strinG>
* 		1: Silencer classname <strinG>
* 		2: Pointer classname <strinG>
* 		3: Optic classname <strinG>
* 		4: Primary magazine [classname <strinG>, ammo count <NUMBER>] or []
* 		5: Secondary magazine [classname <strinG>, ammo count <NUMBER>] or []
* 		6: Bipod classname <strinG>
* 2: ammo count <NUMBER>
*
* Return Value:
* nothing
*
* Example:
* [player, ["arifle_MX_GL_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_mag", 30], ["1Rnd_Smokeorange_Grenade_shell", 1], ""], 2] call TFS_boc_fnc_removeWeaponfromChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_weapon", [], [[]], [7]], ["_amount", 1, [0]] ];

if (isNull _unit || count _weapon isEqualto 0 || _amount < 1) exitwith {};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {};

// exit if there is no such item in chestpack
if ([_unit] call FUNC(chestpackitems) find _weapon isEqualto -1) exitwith {};

[_unit, [_weapon, (-1)*_amount]] call FUNC(modifyItemAmount);