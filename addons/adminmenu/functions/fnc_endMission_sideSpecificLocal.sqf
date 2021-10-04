#include "\z\tfs\addons\adminmenu\script_component.hpp"

params ["_winners"];

private _playerside = playerside;

// Check side before entering spectator
private _unitData = player getVariable QEGVAR(spectator, unitData);
if (!isnil "_unitData") then {
    _playerside = _unitData # 3;
};

private _isWinner = _playerside in _winners;

if (_isWinner) then {
    [QGVAR(victory), true] call EFUNC(common, endMission);
} else {
    [QGVAR(defeat), false] call EFUNC(common, endMission);
};