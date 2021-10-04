#include "script_component.hpp"
/*
* Author: DerZade
* Get loadout of soldier's chestpack. The loadout is a array similar to the loadout of a container in a 'Unit loadout Array'
* (i.e. returned in 'getUnitloadout'). It can contain as many items as you wish. The items can be split into three categories
* (items, weaons, magazines), which all have their own specific format in the array:
* items: [<classname>, <AMOUNT>] i.e.: ["NVgoggles", 1],
* magazines: [<classname>, <AMOUNT>, <ammo count>] i.e.: ["30Rnd_65x39_caseless_mag", 6, 30]
* weapons: [[<classname>, <SILENCER>, <POinTER>, <OPTIC>, <PRIMARY MAG>, <SECONDARY MAG>, <BIPOD>], <AMOUNT>]
* 		where PRIMARY/SECONDARY MAG is [<classname>, <ammo count>]
*		i.e.: [["arifle_MX_GL_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_mag", 30], ["1Rnd_Smokeorange_Grenade_shell", 1], ""], 1]
*
* The easiest way to get such a loadout is just "getUnitloadout player select 5 select 1", which will return the loadout
* of the players backpack.
* for further information see https:// community.bistudio.com/wiki/Unit_loadout_Array
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* Chestpack loadout <ARRAY>
*
* Example:
* [player] call TFS_boc_fnc_chestpackloadout;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]] ];
private ["_var"];

if (isNull _unit) exitwith {
    []
};

_var = _unit getVariable [QGVAR(chestpack), [nil, nil, []]];

+(_var select 2);