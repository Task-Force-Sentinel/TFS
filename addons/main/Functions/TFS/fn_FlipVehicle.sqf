if (!hasinterface) exitwith {};

[
    player,
    "<t color='#ffae00'>Flip vehicle</t>",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_takeOff1_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_takeOff1_ca.paa",
    "_this == (vehicle _target) && {
        (count nearestobjects [_target, ['landvehicle'], 5]) > 0 && {
            (vectorUp cursortarget) select 2 < 0
        }
    }",
    "true",
    {},
    {},
    {
        _veh = cursortarget;
        _veh setvectorUp [0, 0, 1];
        cursortarget setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0];
    },
    {},
    [],
    5,
    -93,
    false,
    false
] call BIS_fnc_holdactionAdd;

player addEventHandler ["Respawn", {
    params ["_unit", "_corpse"];
    [
        player,
        "<t color='#ffae00'>Flip vehicle</t>",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_takeOff1_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_takeOff1_ca.paa",
        "_this == (vehicle _target) && {
            (count nearestobjects [_target, ['landvehicle'], 5]) > 0 && {
                (vectorUp cursortarget) select 2 < 0
            }
        }",
        "true",
        {},
        {},
        {
            _veh = cursortarget;
            _veh setvectorUp [0, 0, 1];
            cursortarget setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0];
        },
        {},
        [],
        5,
        -93,
        false,
        false
    ] call BIS_fnc_holdactionAdd;
}];