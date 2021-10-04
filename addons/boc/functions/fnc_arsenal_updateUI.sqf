#include "script_component.hpp"
/*
* Author: DerZade
* called when backpack of arsenal unit changes. Updates Button icon / tooltip.
*
* Arguments:
* 0: Arsenal Display <DISPLAY>
*
* Return Value:
* nothing
*
* Example:
* [_disp] call TFS_boc_fnc_arsenal_updateUI);
*
* Public: No
*/
disableSerialization;
params ["_display"];
private ["_center", "_chestpack", "_backpack", "_action"];

if (_display isEqualtype controlnull) exitwith {
    // the onSelChanged EH calls before the actual backpack changed so we have to wait a little bit
    [ctrlParent _display] spawn {
        sleep 0.05;
        _this call FUNC(arsenal_updateUI)
    };
};

// the arsenal unit
_center = missionnamespace getVariable ["BIS_fnc_arsenal_center", player];

_chestpack = [_center] call FUNC(chestpack);
_backpack = backpack _center;

_action = ["onBack", "onChest"] select (_chestpack isEqualto "");
if (!(_backpack isEqualto "") and !(_chestpack isEqualto "")) then {
    _action = "swap";
};

(_display displayCtrl 9233) ctrlsettext format [QPATHtoF(data\actions\%1_ca.paa), _action];
(_display displayCtrl 9233) ctrlsettooltip localize format ["str_TFS_boc_%1", _action];

if ((_backpack isEqualto "") and (_chestpack isEqualto "")) then {
    (_display displayCtrl 9233) ctrlEnable false;
    (_display displayCtrl 9233) ctrlsettooltip "";
} else {
    (_display displayCtrl 9233) ctrlEnable true;
};