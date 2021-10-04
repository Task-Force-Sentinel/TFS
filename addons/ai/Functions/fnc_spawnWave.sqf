#include "\z\tfs\addons\ai\script_component.hpp"
/*
* name: TFS_ai_fnc_spawnWave
* Author: Head, Snippers
*
* Arguments:
* 0: TFS wavespawner logic
*
* Return:
* N/A
*
* Description:
* Handles spawning units
*/
params ["_logic"];
private _spawnedvehicles = [];
private _spawnedgroups = [];
private _spawnedunits = [];
private _data = _logic getVariable [QGVAR(waveData), []];
_data params ['_groups', '_vehicles'];
{
    _x params ['_type', '_pos', '_dir', '_custom', '_pylons'];
    private _formationtype = "NONE";
    if ((_pos select 2) > 3) then {
        _formationtype = "FLY"
    };
    private _vehicle = createvehicle [_type, [0, 0, 0], [], 0, _formationtype];
    _vehicle setPosATL _pos;
    _vehicle setDir _dir;
    [_vehicle, _custom select 0, _custom select 1] spawn BIS_fnc_initvehicle;
    
    if (count _pylons > 0) then {
        private _pylonPaths = (configProperties [configFile >> "Cfgvehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {
            getArray (_x >> "turret")
        };
        {
            _vehicle removeWeaponGlobal gettext (configFile >> "Cfgmagazines" >> _x >> "pylonWeapon")
        } forEach getPylonmagazines _vehicle;
        {
            _vehicle setPylonLoadout [_forEachindex + 1, _x, true, _pylonPaths select _forEachindex]
        } forEach _pylons;
    };
    _spawnedvehicles pushBack _vehicle;
} forEach _vehicles;

{
    _x params ['_side', '_units', '_waypoints'];
    
    private _grp = creategroup [_side, true];
    // Delete group when empty
    {
        _x params ["_type", "_pos", "_dir", "_gear", "_vehicleindex", "_vehicleRole"];
        private _unit = _grp createUnit [_type, [0, 0, 0], [], 0, "NONE"];
        _spawnedunits pushBack _unit;
        _unit setPosATL _pos;
        _unit setUnitLoadout [_gear, false];
        _unit setDir _dir;
        if (_vehicleindex >= 0) then {
            private _vehicle = _spawnedvehicles # _vehicleindex;
            _vehicleRole params ["_role", "_path"];
            _role = toLower _role;
            switch(_role) do {
                case 'driver': {
                    _unit assignAsdriver _vehicle;
                    _unit moveInDriver _vehicle;
                };
                case 'cargo': {
                    if (isnil '_path') then {
                        _unit assignAsCargo _vehicle;
                        _unit moveInCargo _vehicle;
                    } else {
                        if (_path isEqualtype []) then {
                            _unit assignAsTurret [_vehicle, _path];
                            _unit moveInTurret [_vehicle, _path];
                        } else {
                            _unit assignAsCargoindex [_vehicle, _path];
                            _unit moveInCargo [_vehicle, _path];
                        }
                    }
                };
                case 'turret': {
                    _unit assignAsTurret [_vehicle, _path];
                    _unit moveInTurret [_vehicle, _path];
                };
            };
        };
    } forEach _units;
    (units _grp) join _grp;
    _lastindex = (count waypoints _grp)-1;
    [_grp] call CBA_fnc_clearwaypoints;
    {
        [_grp, _forEachindex + 1, _x] call CFUNC(deserializeWaypoint);
    } forEach _waypoints;
    if ((count waypoints _grp) > 1) then {
        _grp setCurrentWaypoint [_grp, 1];
        // skip the next one okeyyo..
    };
    _spawnedgroups pushBack _grp;
} forEach _groups;

_wave = _logic getVariable ["waves", 1];
_logic setVariable ["waves", (_wave-1)];
_handlers = _logic getVariable ["Handlers", []];
{
    if (_x isEqualtype {}) then {
        [_wave, _spawnedgroups] call _x;
    };
} forEach _handlers;
// Check if there is another wave
if (_logic getVariable ["waves", 1] > 0) then {
    // Check if we need to wait for them to die
    if (_logic getVariable ["WhenDead", false]) then {
        [{
            {
                {
                    alive _x
                } count (units _x) > 0
            } count (_this select 1) <= 0
        }, FUNC(spawnWave), [_logic, _spawnedgroups]] call CBA_fnc_waitUntilandexecute;
    } else {
        // Otherwise spawn the wave after sleeping for some time
        [FUNC(spawnWave), [_logic], _logic getVariable ["time", 10]] call CBA_fnc_waitandexecute;
    };
};

[format ["spawned wave, unit count: %1, vehicle count: %2, group count %3", count _spawnedunits, count _spawnedvehicles, count _spawnedgroups], count _spawnedunits > 40, "AI"] call EFUNC(adminmenu, log);