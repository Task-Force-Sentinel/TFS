#include "script_component.hpp"
/*
* Author: DerZade
* Get mass of item based on item type.
*
* Arguments:
* 0: classname <strinG>
*
* Return Value:
* mass <NUMBER>
*
* Example:
* ["FirstAidKit"] call TFS_boc_fnc_itemMass;
*
* Public: No
*/
params [ ["_item", "", [""]] ];
private ["_config", "_itemMass"];

if (_item isEqualto "") exitwith {
    0
};

// todo: use BIS_fnc_itemtype
_config = configNull;
if (isClass (configFile >> "Cfgweapons" >> _item >> "Iteminfo")) then {
    _config = (configFile >> "Cfgweapons" >> _item >> "Iteminfo");
};
if (isClass (configFile >> "Cfgweapons" >> _item >> "weaponslotsinfo")) then {
    _config = (configFile >> "Cfgweapons" >> _item >> "weaponslotsinfo");
};
if (isClass (configFile >> "Cfgmagazines" >> _item)) then {
    _config = (configFile >> "Cfgmagazines" >> _item);
};
if (isClass (configFile >> "Cfgvehicles" >> _item)) then {
    _config = (configFile >> "Cfgvehicles" >> _item);
};
if (isClass (configFile >> "CfgGlasses" >> _item)) then {
    _config = (configFile >> "CfgGlasses" >> _item);
};

if (isNull _config) exitwith {
    0
};

_itemMass = [_config, "Mass", 0] call BIS_fnc_returnConfigEntry;

_itemMass;