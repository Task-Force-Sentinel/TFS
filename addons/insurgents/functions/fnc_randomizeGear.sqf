#include "script_component.hpp"
/*
* Author: veteran29
* randomize gear of the unit from available items.
*
* Arguments:
* 0: Unit <OBJECT>
*
* Return Value:
* None
*
*
* Public: No
*/
params [
    ["_unit", objNull, [objNull]]
];

private _currentloadout = getUnitloadout _unit;
_currentloadout set [7, ""];
// ignore facewear

if (!local _unit || {
    (EMPTY_loadoUT isnotEqualto _currentloadout) || {
        is3DEN
    }
}) exitwith {
    log_1("Unit modified, no randomization - %1", _unit);
};

log_1("randomizing gear - %1", _unit);

// check if there is a chance for the unit to have headgear and facewear
if (random 1 <= CHANCE_headgear) then {
    _unit addheadgear selectRandom random_GEAR(headgear);
};

if (random 1 <= CHANCE_faceWEAR) then {
    removeGoggles _unit;
    _unit addgoggles selectRandom random_GEAR(facewear);
};

_unit forceAdduniform selectRandom random_GEAR(uniforms);
_unit addvest selectRandom random_GEAR(vests);

// add basic gear to the uniform
{
    _unit addItemtouniform _x;
} forEach ["FirstAidKit", "HandGrenade", "SmokeShell"];

// add primary weapon
private _weapon = selectRandom random_GEAR(weapons);
_unit addWeapon _weapon;
[_unit, _weapon, 8, 4] call FUNC(addWeaponammo);

// add pistol
if (random 1 <= CHANCE_piStoL) then {
    private _pistol = selectRandom random_GEAR(pistols);
    _unit addWeapon _pistol;
    [_unit, _pistol, 3, 1] call FUNC(addWeaponammo);
};

// add launcher
if (random 1 <= CHANCE_LAUNCHER) then {
    private _launcher = selectRandom random_GEAR(launchers);
    _unit addWeapon _launcher;
    
    if (!IS_DISPOSABLE(_launcher)) then {
        private _backpack = selectRandom random_GEAR(backpacks);
        _unit addbackpack _backpack;
        
        [_unit, _launcher, 3, 1] call FUNC(addWeaponammo);
    };
};

nil