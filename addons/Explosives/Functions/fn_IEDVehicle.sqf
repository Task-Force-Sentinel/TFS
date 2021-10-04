/*
Function: TFS_fnc_IEDvehicle

Description:
sets up a given vehicle as a driven IED. The explosive will be armed and
primed for detonation if any player comes within the given radius.
The explosives will detonate roughly after the time given has passed.
The detonation may also produce smaller secondary detonations.

if _announce is set to true, an announcement will be made on the sideChat
once the IED has been armed, indicating the approximate time until
detonation and when it is about to detonate.

Additionally, you can set the _announceinterval parameter to enable
occasional announcements about the time left until detonation.

The armed IED vehicle can be disarmed through a mouse-wheel action.
Once disarmed it cannot be primed again.

Arguments:
_vehicle - The vehicle which shall be initialized <OBJECT>
_detonationtime - The time in seconds after which the explosives will go off once armed <SCALAR>
_proximityradius - The IED will be armed if any player comes closer to the vehicle than this radius (in metres) <SCALAR>
_secondaries - set to true to have the detonation of the IED also produce a random amount of secondary explosions around the main detonation <BOOLEAN>
_announce - set to true to enable announcements about the state of the IED <BOOLEAN>
_announceinterval - The interval in seconds in which players should be informed about the time left <SCALAR>
_engineOn - if true, the vehicle's engine needs to be running in order to set off the explosive <BOOLEAN>

Return Values:
None

Examples:
(begin example)
// in the init field of a vehicle in the editor (e.g. a Truck)
[
    this,
    120,
    20,
    true,
    true,
    30,
    false
] call TFS_fnc_IEDvehicle;
(end)

Author:
Mokka
*/

params [
    ["_vehicle", objNull],
    ["_detonationtime", 120],
    ["_proximityradius", 20],
    ["_secondaries", true],
    ["_announce", true],
    ["_announceinterval", 30],
    ["_engineOn", false]
];

if (!isServer) exitwith {};

// Check if we are using a valid vehicle.
if (not (_vehicle isKindOf "landvehicle")) exitwith {
    systemChat "TFS_fnc_IEDvehicle: invalid vehicle passed, needs to be a land vehicle!";
};

private ["_fnc_engineCheck"];

if (_engineOn) then {
    _fnc_engineCheck = {
        isEngineOn _this;
    };
} else {
    _fnc_engineCheck = {
        true;
    };
};

// Add PFH for proximity checking
_proxCheck = [
    {
        (_this select 0) params ["_vehicle", "_proximityradius", "_detonationtime", "_announce", "_fnc_engineCheck"];
        _armed = _vehicle getVariable ["IEDarmed", false];
        _disarmed = _vehicle getVariable ["IEDdisarmed", false];
        {
            if ((_vehicle distance2D _x) < _proximityradius && {
                (not _disarmed) && (not _armed) && (_vehicle call _fnc_engineCheck)
            }) then {
                _vehicle setVariable ["IEDarmed", true];
                
                if (_announce) then {
                    // Tell everyone that this is a thing that happened if the user so wishes:
                    [
                        format ["The IED has been armed and will detonate in %1 seconds!", _detonationtime],
                        [-1, 0.8], "#cc3232", 0.5
                    ] call TFS_fnc_dynamictext;
                };
            };
        } forEach allplayers;
    },
    5,
    [_vehicle, _proximityradius, _detonationtime, _announce, _fnc_engineCheck]
] call CBA_fnc_addPerFrameHandler;

// Add PFH to check for explosives armed
[
    {
        (_this select 0) params ["_vehicle", "_detonationtime", "_secondaries", "_announce", "_announceinterval", "_proxCheck"];
        
        _armed = _vehicle getVariable ["IEDarmed", false];
        _disarmed = _vehicle getVariable ["IEDdisarmed", false];
        _destroyed = _vehicle getVariable ["IEDdetonated", false];
        
        // Check if armed
        if ((not _armed) || _disarmed || _destroyed) exitwith {};
        
        // Destroy old PFH
        [_proxCheck] call CBA_fnc_removePerFrameHandler;
        
        _starttime = _vehicle getVariable ["starttime", 0];
        
        if (_starttime == 0) then {
            _starttime = time;
            _vehicle setVariable ["starttime", _starttime];
        };
        
        // Delta time since the IED has been armed
        _deltatime = time - _starttime;
        
        // Calculate time left until detonation
        _timeLeft = floor (_detonationtime - _deltatime);
        
        if ((_announce)
        && (_announceinterval > 0)
        && (_timeLeft % _announceinterval) == 0
        && (not (_timeLeft == _detonationtime))
        && (_timeLeft != 0)) then {
            [
                format ["The IED will detonate in %1 seconds!", _timeLeft],
                [-1, 0.8], "#cc3232", 0.5
            ] call TFS_fnc_dynamictext;
        };
        
        // if the delta of starttime and current time exceeds the detonation timer,
        // we blow the vehicle up!
        // We do this check every frame since we want to be able to disarm the bomb.
        if (_timeLeft <= 5) then {
            _vehicle setVariable ["IEDdetonated", true, true];
            
            if (_announce) then {
                [
                    "time's out, the IED could detonate any second!",
                    [-1, 0.8], "#cc3232", 0.5
                ] call TFS_fnc_dynamictext;
            };
            
            // set the amount of secondary explosions according to the param.
            if (_secondaries) then {
                _secArray = [ceil (random 8), random 10, random 8];
            } else {
                _secArray = [0, 0, 0];
            };
            
            // Detonate using TFS_fnc_spawnexplosives.
            [
                _timeLeft + (random 2) - 1,
                position _vehicle,
                _secArray
            ] call TFS_fnc_spawnexplosives;
        };
    },
    1,
    [_vehicle, _detonationtime, _secondaries, _announce, _announceinterval, _proxCheck]
] call CBA_fnc_addPerFrameHandler;

// Add a holdaction for disarming the bomb.
[
    _vehicle, format ["disarm_ied_%1", time], "Disarm IED", "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_hack_ca.paa", "isplayer _player
    && {
        _player distance _target < 5
    }
    && {
        _target getVariable [""IEDarmed"", false]
    }
    && {
        not (_target getVariable [""IEDdetonated"", false])
    }", "true", {
        ["You're disarming the IED.", [-1, 0.8], "#FFBB00", 0.5, false] call TFS_fnc_dynamictext;
    }, {}, {
        (_this select 0) setVariable ["IEDdisarmed", true, true];
        ["You've disarmed the IED.", [-1, 0.8], "#339900", 0.5, false] call TFS_fnc_dynamictext;
    },
    {
        ["You've stopped disarming the IED.", [-1, 0.8], "#cc3232"] call TFS_fnc_dynamictext;
    }, [], random [5, 7.5, 10], true, "Disarming IED", true
] call TFS_fnc_AddHoldaction;