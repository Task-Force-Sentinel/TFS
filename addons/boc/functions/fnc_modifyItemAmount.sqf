#include "script_component.hpp"
/*
* Author: DerZade
* Helper function for adding/removing items from chespackloadout.
*
* Arguments:
* 0: unit <OBJECT>
* 1: params (depeding on type) <ARRAY>
*
* Return Value:
* nothing
*
* Example:
* _this call TFS_boc_fnc_modifyItemAmount;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_params", [], [[]], [2, 3]]];
private ["_loadout", "_paramswithoutAmount", "_loadoutwithoutAmount", "_index", "_prevAmount"];

_loadout = [_unit] call FUNC(chestpackloadout);
_paramswithoutAmount = +_params;
_loadoutwithoutAmount = +_loadout;

// remove amounts from _loadout and _params
_paramswithoutAmount deleteAt 1;
_loadoutwithoutAmount = _loadoutwithoutAmount apply {
    _x deleteAt 1;
    _x
};

_index = _loadoutwithoutAmount find _paramswithoutAmount;

// add completely new item
if (_index isEqualto -1) then {
    _index = _loadout pushBack _params;
} else {
    _params params ["", "_amount"];
    _prevAmount = (_loadout select _index) select 1;
    (_loadout select _index) set [1, _prevAmount + _amount];
};

// delete item if the new amount is below 1
if ((_loadout select _index) select 1 < 1) then {
    _loadout deleteAt _index;
};

// update variable
[_unit, _loadout] call FUNC(setChestpackloadout);