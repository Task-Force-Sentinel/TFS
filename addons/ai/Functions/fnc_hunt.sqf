#include "\z\tfs\addons\ai\script_component.hpp"
params ["_logic", "_units", "_activated"];

if (!_activated) exitwith {};

private _hunters = [];

private _hunterVal = _logic getVariable ["Hunters", -1];
if (_hunterVal == -1) then {
    _hunters = synchronizedObjects _logic;
    {
        private _vehicle = vehicle _x;
        {
            _hunters pushBackUnique _x;
        } forEach (crew _vehicle);
    } forEach _hunters;
} else {
    private _side = switch (_hunterVal) do {
        case 0: {
            east
        };
        case 1: {
            west
        };
        case 2: {
            resistance
        };
        default {
            civilian
        };
    };
    _hunters = allunits select {
        side _x == _side
    };
};
// filter out player units and playable
_hunters = ((_hunters - playableunits) - switchableunits) - [player];

private _targetside = switch (_logic getVariable ["targetside", 1]) do {
    case 0: {
        east
    };
    case 1: {
        west
    };
    case 2: {
        resistance
    };
    default {
        civilian
    };
};

private _position = getPos _logic;
private _range = _logic getVariable ["Range", 100];
_range = ((_range) max 50) min 5000;
// Ensure minimum of 50 min anx max of 5000

// setup units.
private _oldgroups = [];
{
    private _unit = _x;
    _oldgroups pushBackUnique (group _unit);
    
    [_unit] joinSilent grpNull;
    _unit setunitPos "UP";
    _unit disableAI "SUPPRESSION";
    _unit disableAI "AUtoCOMBAT";
    // Already applied at init but reapply.
    _unit setBehaviour "AWARE";
    _unit setspeedMode "FULL";
    
    // Just in case MM went crazy.
    _unit enableAI "PATH";
    _unit enableAI "move";
    
    _unit allowfleeing 0;
    dostop _unit;
} forEach _hunters;

// Cleanup groups no longer used.
{
    if (count (units _x) == 0) then {
        deletegroup _x;
    };
} forEach (_oldgroups - [grpNull]);

[format ["Triggered hunt on %1 units", count _hunters], false, "AI"] call EFUNC(adminmenu, log);

// spawn for performance reasons.

[_hunters, _targetside, _position, _range] spawn FUNC(huntLoop);