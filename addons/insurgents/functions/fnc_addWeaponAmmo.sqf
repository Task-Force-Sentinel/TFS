#include "script_component.hpp"
/*
* Author: vetran29
* Add random compatible ammo to unit weapon.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: Weapon <strinG>
* 2: Primary muzzle ammo count, defaults to 6 <NUMBER>
* 3: Additional muzzles ammo count, defaults to 3 <NUMBER>
*
* Return Value:
* None
*
* Public: No
*/

params ["_unit", "_weapon", ["_primaryammo", 6], ["_additionalammo", 3]];

private _weaponCfg = configFile >> "Cfgweapons" >> _weapon;
{
    if (_x == "this") then {
        private _primaryMag = selectRandom (_weaponCfg call CBA_fnc_compatiblemagazines);
        _unit addWeaponItem [_weapon, _primaryMag];
        _unit addmagazines [_primaryMag, _primaryammo - 1];
    } else {
        private _additionalMag = selectRandom ((_weaponCfg >> _x) call CBA_fnc_compatiblemagazines);
        _unit addWeaponItem [_weapon, _additionalMag];
        _unit addmagazines [_additionalMag, _additionalammo];
    };
} forEach getArray (_weaponCfg >> "muzzles");

nil