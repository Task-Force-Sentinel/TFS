#include "script_component.hpp"
/*
* Author: DerZade
* Triggered by the onButtonClick-EventHandler.
*
* Arguments:
* None
*
* Return Value:
* nothing
*
* Example:
* [] call TFS_boc_fnc_arsenal_onButtonClick;
*
* Public: No
*/
private ["_center", "_chestpack", "_backpack", "_action"];

_center = missionnamespace getVariable ["BIS_fnc_arsenal_center", player];
_chestpack = [_center] call FUNC(chestpack);
_backpack = backpack _center;
_action = ["onback", "onchest"] select (_chestpack isEqualto "");

if (!(_backpack isEqualto "") and !(_chestpack isEqualto "")) then {
    _action = "swap";
};

// execute action
[_center] call (missionnamespace getVariable (format ["TFS_boc_fnc_action%1", _action]));

// update arsenal
["listselectCurrent"] call BIS_fnc_arsenal;