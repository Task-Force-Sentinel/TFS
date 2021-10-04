/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\common\fn_addItem.sqf
* by Ojemineh
*
* add item to unit/vehicle
*
* Arguments:
* 0: unit - <OBJECT>
* 1: item - <strinG>
* 2: amount - <NUMBER>
* 3: priority - <ARRAY> [1 = uniform, 2 = vest, 3 = backpack]
* 4: overflow - <BOOLEAN> [default = true]
*
* Return:
* 0: addtoUnit - <BOOLEAN>
* 1: addtoGround - <BOOLEAN>
*
* Examples:
* [player, "ACE_EarPlugs", 1, [3, 2, 1], true] call TFS_fnc_addItem;
* [truck1, "ACE_EarPlugs", 1] call TFS_fnc_addItem;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit", "_item", "_amount", "_priority", "_overflow"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_item = [_this, 1, "", [""]] call BIS_fnc_param;
_amount = [_this, 2, 1, [0]] call BIS_fnc_param;
_priority = [_this, 3, [0], [[]]] call BIS_fnc_param;
_overflow = [_this, 4, false, [true]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {
    [false, false]
};
if (_item isEqualto "") exitwith {
    [false, false]
};
if (_amount < 1) exitwith {
    [false, false]
};

if (_priority isEqualto []) then {
    _priority = [1, 2, 3];
};

// -------------------------------------------------------------------------------------------------

private _added = false;
private _addtoUnit = false;
private _addtoGround = false;

for "_i" from 1 to _amount do {
    _added = false;
    
    // ADD to CONTAinER
    {
        switch (_x) do {
            case 0: {
                if ((_unit canAdd _item) && (!_added)) then {
                    _unit additemCargoGlobal [_item, 1];
                    _addtoUnit = true;
                    _added = true;
                };
            };
            case 1: {
                if ((uniform _unit != "") && (_unit canAddItemtouniform _item) && (!_added)) then {
                    _unit addItemtouniform _item;
                    _addtoUnit = true;
                    _added = true;
                };
            };
            case 2: {
                if ((vest _unit != "") && (_unit canAddItemtovest _item) && (!_added)) then {
                    _unit addItemtovest _item;
                    _addtoUnit = true;
                    _added = true;
                };
            };
            case 3: {
                if ((backpack _unit != "") && (_unit canAddItemtoBackpack _item) && (!_added)) then {
                    _unit addItemtobackpack _item;
                    _addtoUnit = true;
                    _added = true;
                };
            };
            default {};
        };
    } forEach _priority;
    
    // if CONTAinER IS FULL
    if ((!_added) && (_overflow)) then {
        if (vehicle _unit != _unit) exitwith {
            [_addtoUnit, _addtoGround]
        };
        if ((surfaceIsWater (position _unit)) &&
        (((getPosASL _unit)-(getPosATL _unit)) select 0 < -1.5)) exitwith {
            [_addtoUnit, _addtoGround]
        };
        
        private _gwh = nearestobject [_unit, "GroundWeaponHolder"];
        private _pos = [0, 0, 0];
        
        if ((isNull _gwh) || (_unit distance _gwh > 3)) then {
            _gwh = createvehicle ["GroundWeaponHolder", [0, 0, 0], [], 0, "CAN_COLLIDE"];
            _pos = (getPosATL _unit) findEmptyposition [0, 3, "GroundWeaponHolder"];
            
            if (_pos isEqualto []) then {
                _pos = (getPosASL _unit);
            } else {
                _pos = (ATLtoASL _pos);
            };
            
            _gwh setPosASL _pos;
        };
        
        _gwh additemCargoGlobal [_item, 1];
        _gwh setvectorUp surfaceNormal (position _gwh);
        
        _addtoGround = true;
    };
};

[_addtoUnit, _addtoGround];