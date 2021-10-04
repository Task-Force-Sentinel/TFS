/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\gear\functions\load\fn_load_loadout.sqf
*	by Ojemineh
*
*	load loadout
*
*	Arguments:
*	0: unit	- <OBJECT>
*	1: role	- <strinG>
*	2: type	- <strinG>
*	3: team	- <strinG>
*
*	Return:
*	nothing
*
*	Example:
*	[player, "curator"] call TFS_gear_fnc_load_loadout;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit", "_role", "_type", "_team"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_role = [_this, 1, "", [""]] call BIS_fnc_param;
_type = [_this, 2, "", [""]] call BIS_fnc_param;
_team = [_this, 4, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};

// -------------------------------------------------------------------------------------------------

if (not local _unit) exitwith {
    [_unit, _role, _type, _team] remoteExecCall ["TFS_gear_fnc_load_loadout", _unit];
};

// -------------------------------------------------------------------------------------------------

private _loadout_path = GEAR_loadoUT_PATH;
private _default_role = GEAR_default_ROLE;
private _default_type = GEAR_default_type;
private _default_team = GEAR_default_TEAM;

private _gear_role = toUpper(_unit getVariable ["gear_role", _default_role]);
private _gear_type = toUpper(_unit getVariable ["gear_type", _default_type]);
private _gear_team = toUpper(_unit getVariable ["gear_team", _default_team]);

if (_role isEqualto "") then {
    _role = _gear_role;
};
if (_type isEqualto "") then {
    _type = _gear_type;
};
if (_team isEqualto "") then {
    _team = _gear_team;
};

// -------------------------------------------------------------------------------------------------

private _file = format ["%1\%2\%3\%4\loadout.hpp", _loadout_path, _team, _role, _type];
private _data = [] call compile preprocessFileLineNumbers _file;

if (isnil "_data") exitwith {
    [4, "Can't read unit-loadout from file (%1)", [_file], "gear"] call TFS_fnc_log;
};
[5, "'%1' loading gear '%2' (File: %3) - Data: %4", [_unit, _role, _file, _data], "gear"] call TFS_fnc_diaglog;

// -------------------------------------------------------------------------------------------------

_unit setUnitLoadout [_data, false];

// -------------------------------------------------------------------------------------------------
// load playerS default goggles

if (GEAR_KEEP_goggles) then {
    private _unit_goggles = _unit getVariable ["TFS_gear_goggles", ""];
    if (_unit_goggles != "") then {
        if ((goggles _unit) != "") then {
            removeGoggles _unit;
        };
        _unit addgoggles _unit_goggles;
        _unit setVariable ["TFS_gear_goggles", nil];
    };
};

// -------------------------------------------------------------------------------------------------
/*
private _data_primary	= (_data select 0);
private _data_secondary	= (_data select 1);
private _data_handgun	= (_data select 2);
private _data_uniform	= (_data select 3);
private _data_vest		= (_data select 4);
private _data_backpack	= (_data select 5);
private _data_headgear	= (_data select 6);
private _data_goggles	= (_data select 7);
private _data_binocular	= (_data select 8);
private _data_items		= (_data select 9);

// -------------------------------------------------------------------------------------------------

// PRIMARY
if (count _data_primary > 0) then {
    private _primary = (_data_primary select 0);
    if (_primary != "") then {
        _unit addWeapon _primary;
    };
    
    private _primary_items = +_data_primary;
    _primary_items deleteAt 0;
    
    if ((primaryWeapon _unit != "") && (count _primary_items > 0)) then {
        {
            if (_x isEqualtype []) then {
                if (count _x > 0) then {
                    _unit addprimaryWeaponItem (_x select 0);
                };
            } else {
                if (_x != "") then {
                    _unit addprimaryWeaponItem _x;
                };
            };
        } forEach _primary_items;
    };
};

// SECONDARY
if (count _data_secondary > 0) then {
    private _secondary = (_data_secondary select 0);
    if (_secondary != "") then {
        _unit addWeapon _secondary;
    };
    
    private _secondary_items = +_data_secondary;
    _secondary_items deleteAt 0;
    
    if ((secondaryWeapon _unit != "") && (count _secondary_items > 0)) then {
        {
            if (_x isEqualtype []) then {
                if (count _x > 0) then {
                    _unit addsecondaryWeaponItem (_x select 0);
                };
            } else {
                if (_x != "") then {
                    _unit addsecondaryWeaponItem _x;
                };
            };
        } forEach _secondary_items;
    };
};

// HandGUN
if (count _data_handgun > 0) then {
    private _handgun = (_data_handgun select 0);
    if (_handgun != "") then {
        _unit addWeapon _handgun;
    };
    
    private _handgun_items = +_data_handgun;
    _handgun_items deleteAt 0;
    
    if ((handgunWeapon _unit != "") && (count _handgun_items > 0)) then {
        {
            if (_x isEqualtype []) then {
                if (count _x > 0) then {
                    _unit addHandgunItem (_x select 0);
                };
            } else {
                if (_x != "") then {
                    _unit addHandgunItem _x;
                };
            };
        } forEach _handgun_items;
    };
};

// -------------------------------------------------------------------------------------------------

// uniform
if (count _data_uniform > 0) then {
    private _uniform = (_data_uniform select 0);
    if (_uniform != "") then {
        _unit forceAdduniform _uniform;
    };
    
    private _uniform_items = (_data_uniform select 1);
    
    if ((uniform _unit != "") && (count _uniform_items > 0)) then {
        {
            private _item = (_x select 0);
            private _quantity = (_x select 1);
            if (_quantity > 0) then {
                for "_i" from 1 to _quantity do {
                    if (_unit canAddItemtouniform _item) then {
                        _unit addItemtouniform _item;
                    };
                };
            };
        } forEach _uniform_items;
    };
};

// vest
if (count _data_vest > 0) then {
    private _vest = (_data_vest select 0);
    if (_vest != "") then {
        _unit addvest _vest;
    };
    
    private _vest_items = (_data_vest select 1);
    
    if ((vest _unit != "") && (count _vest_items > 0)) then {
        {
            private _item = (_x select 0);
            private _quantity = (_x select 1);
            if (_quantity > 0) then {
                for "_i" from 1 to _quantity do {
                    if (_unit canAddItemtovest _item) then {
                        _unit addItemtovest _item;
                    };
                };
            };
        } forEach _vest_items;
    };
};

// backpack
if (count _data_backpack > 0) then {
    private _backpack = (_data_backpack select 0);
    if (_backpack != "") then {
        _unit addbackpack _backpack;
    };
    
    private _backpack_items = (_data_backpack select 1);
    
    if ((backpack _unit != "") && (count _backpack_items > 0)) then {
        {
            private _item = (_x select 0);
            private _quantity = (_x select 1);
            if (_quantity > 0) then {
                for "_i" from 1 to _quantity do {
                    if (_unit canAddItemtoBackpack _item) then {
                        _unit addItemtobackpack _item;
                    };
                };
            };
        } forEach _backpack_items;
    };
};

// -------------------------------------------------------------------------------------------------

// headgear
private _headgear = _data_headgear;
if (_headgear != "") then {
    _unit addheadgear _headgear;
};

// GOOGLES
private _goggles = _data_goggles;
if (_goggles != "") then {
    _unit addgoggles _goggles;
};

// binocular
if (count _data_binocular > 0) then {
    private _binocular = (_data_binocular select 0);
    if (_binocular != "") then {
        _unit addWeapon _binocular;
    };
    
    private _binocular_items = +_data_binocular;
    _binocular_items deleteAt 0;
    
    if ((_binocular != "") && (count _binocular_items > 0)) then {
        {
            if (_x isEqualtype []) then {
                if (count _x > 0) then {
                    _unit addWeaponItem [_binocular, (_x select 0), true];
                };
            } else {
                if (_x != "") then {
                    _unit addWeaponItem [_binocular, _x, true];
                };
            };
        } forEach _binocular_items;
    };
};

// -------------------------------------------------------------------------------------------------

// items
if (count _data_items > 0) then {
    // MAP
    private _map = (_data_items select 0);
    if (_map != "") then {
        _unit linkItem _map;
    };
    
    // GPS
    private _gps = (_data_items select 1);
    if (_gps != "") then {
        _unit linkItem _gps;
    };
    
    // radIO
    private _radio = (_data_items select 2);
    if (_radio != "") then {
        _unit linkItem _radio;
    };
    
    // COMPASS
    private _compass = (_data_items select 3);
    if (_compass != "") then {
        _unit linkItem _compass;
    };
    
    // WATCH
    private _watch = (_data_items select 4);
    if (_watch != "") then {
        _unit linkItem _watch;
    };
    
    // NVG
    private _nvg = (_data_items select 5);
    if (_nvg != "") then {
        _unit addWeapon _nvg;
    };
};

// -------------------------------------------------------------------------------------------------
*/