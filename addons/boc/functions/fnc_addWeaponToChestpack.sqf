#include "script_component.hpp"
/*
* Author: DerZade
* Creates new weapon and stores it in the soldier's chestpack. Only weapons are supported.
* The purpose of this function is to ensure that weapons with specific attachments and magazines can be added.
* if you want to add weapon(s) without any attachments you may want to use 'TFS_boc_fnc_addItemtoChestpack' instead.
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
* 		0: Weapon classname <strinG>
* 2: Amount <NUMBER> (optional | default: 1)
*
* Return Value:
* nothing
*
* Example:
* [player, ["arifle_MX_GL_F", "", "acc_pointer_IR", "optic_Aco", ["30Rnd_65x39_caseless_mag", 30], ["1Rnd_Smokeorange_Grenade_shell", 1], ""], 2] call TFS_boc_fnc_addWeapontoChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_weapon", [], [[]], [7]], ["_amount", 1, [0]] ];

if (isNull _unit || count _weapon isEqualto 0 || _amount < 1) exitwith {};

if ([_unit] call FUNC(chestpack) isEqualto "") exitwith {};

_weapon params [
    ["_class", "", [""]],
    ["_silencer", "", [""]],
    ["_pointer", "", [""]],
    ["_optic", "", [""]],
    ["_primary", [], [[]], [0, 2]],
    ["_secondary", [], [[]], [0, 2]],
    ["_bipod", "", [""]]
];

if (_class isEqualto "") exitwith {};

// validate primary mag
if (count _primary > 0) then {
    _primary params [["_mag", "", [""]]];
    if (_mag isEqualto "") then {
        _primary = [];
    };
};

// validate secondary mag
if (count _secondary > 0) then {
    _secondary params [["_mag", "", [""]]];
    if (_mag isEqualto "") then {
        _secondary = [];
    };
};

// exit if there is not enough space left
if !([_unit, _class, _amount] call FUNC(canAddItemtoChestpack)) exitwith {};

[_unit, [[_class, _silencer, _pointer, _optic, _primary, _secondary, _bipod], _amount]] call FUNC(modifyItemAmount);