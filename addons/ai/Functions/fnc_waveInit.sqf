/*
* name: TFS_ai_fnc_waveinit
* Author: Head, Snippers
*
* Arguments:
* 0: TFS wavespawner logic
* 1: _units
* 2: _activated
*
* Return:
* N/A
*
* Description:
* Handles creation of wavespawner structure
*/
if (is3DEN) exitwith {};
#include "\z\tfs\addons\ai\script_component.hpp"
params ["_logic", "_units", "_activated"];

_headless = (synchronizedObjects _logic) select {
    _x isKindOf "HeadlessClient_F" && !local _x
};
if (count _headless > 0 && isServer) exitwith {
    _this remoteExec [QFUNC(waveinit), _headless select 0];
};

// check if we have done the setup.
if (!(_logic getVariable [QGVAR(init), false])) then {
    private _synchronizedgroups = [];
    {
        if(_x isEqualtype grpNull && {
            side _x in [blufor, opfor, independent, civilian]
        }) then {
            _synchronizedgroups pushBackUnique _x;
        };
        if(_x isEqualtype objNull && {
            side _x in [blufor, opfor, independent, civilian]
        }) then {
            if (_x isKindOf 'Man') then {
                _synchronizedgroups pushBackUnique (group _x);
            } else {
                {
                    _synchronizedgroups pushBackUnique (group _x);
                } forEach crew _x;
            };
        };
    } forEach synchronizedObjects _logic;
    private _allunits = [];
    {
        _allunits append (units _x)
    } forEach _synchronizedgroups;
    private _vehicles = (_allunits) apply {
        objectParent _x
    } select {
        !isNull _x
    };
    _vehicles = _vehicles arrayintersect _vehicles;
    private _groups = [];
    
    {
        private _grp = _x;
        private _units = (units _grp) apply {
            private _unit = _x;
            private _data = [
                typeOf _unit,
                getPosATL _unit,
                getDir _unit,
                getUnitloadout _unit,
                -1,
                []
            ];
            if (!isNull objectParent _x) then {
                _data set [4, _vehicles find (objectParent _x)];
                _data set [5, assignedvehicleRole _x]
            };
            _data
        };
        _groups pushBack [side _x, _units, [_x] call CFUNC(serializewaypoints)];
    } forEach _synchronizedgroups;
    // store vehicle data
    _vehicles = _vehicles apply {
        [typeOf _x, getPosATL _x, getDir _x, [_x] call BIS_fnc_getvehicleCustomization, getPylonmagazines _x]
    };
    
    _logic setVariable [QGVAR(waveData), [_groups, _vehicles]];
    
    // Clean up the template units.
    {
        _units = units _x;
        {
            if (!isNull objectParent _x) then {
                _units pushBackUnique vehicle _x
            };
            deletevehicle _x;
        } forEach _units;
    } forEach _synchronizedgroups;
    
    _logic setVariable [QGVAR(init), true, true];
};

if (_activated) then {
    private _delay = _logic getVariable ["Delay", 0];
    [FUNC(spawnWave), [_logic], _delay] call CBA_fnc_waitandexecute;
};