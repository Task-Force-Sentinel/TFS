/*
Function: TFS_fnc_makeIED

Description:
sets up a given object as an IED. The explosive will be armed and
primed for detonation if any player comes within the given radius.
The explosives will detonate roughly after the time given has passed.
The detonation may also produce smaller secondary detonations.

if the time until detonation is a negative number (eg. -5), the actual time
until detonation is randomised between 0 and that number, in our example a
value somewhere between 0 and 5.

if _announce is set to true, an announcement will be made once the IED has
been armed, indicating the approximate time until detonation and when it is
about to detonate.

Additionally, you can set the _announceinterval parameter to enable
occasional announcements about the time left until detonation.

The armed IED can be disarmed through ACE interaction. if enabled, players
also need to have a defusal kit on them in order to be able to disable the
IED. Once disarmed it cannot be primed again.

note: ACE is absolutely necessary for using this function. Please use
TFS_fnc_IEDvehicle for a vanilla alternative, restricted to land vehicles.

Arguments:
_object - The object which shall be initialized as an IED <OBJECT>
_detonationtime - The time in seconds after which the explosives will go off once armed, negative for random time up to that value <SCALAR>
_proximityradius - The IED will be armed if any player comes closer to the vehicle than this radius (in metres) <SCALAR>
_secondaries - set to true to have the detonation of the IED also produce a random amount of secondary explosions around the main detonation <BOOLEAN>
_announce - set to true to enable announcements about the state of the IED <BOOLEAN>
_announceinterval - The interval in seconds in which players should be informed about the time left <SCALAR>
_requireDefusalKit - set to true to require players to have a defusal kit on them in order to defuse the IED <BOOLEAN>

Return Values:
None

Examples:
(begin example)
// in the init field of an object in the editor (e.g. a Crate)
[
    this,
    120,
    20,
    true,
    true,
    30,
    true
] call TFS_fnc_makeIED;
(end)

Author:
Mokka
*/

params [
    ["_object", objNull],
    ["_detonationtime", 120],
    ["_proximityradius", 20],
    ["_secondaries", true],
    ["_announce", true],
    ["_announceinterval", 30],
    ["_requireDefusalKit", true]
];

if (!isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

if (hasinterface && {
    (!(_object getVariable ["IEDdisarmed", false])) &&
    (!(_object getVariable ["IEDdetonated", false]))
}) then {
    _condition = [{
        ((_this select 0) getVariable ["IEDarmed", false])
        && {
            not ((_this select 0) getVariable ["IEDdetonated", false])
        }
        && {
            not ((_this select 0) getVariable ["IEDdisarmed", false])
        }
    }, {
        ((_this select 0) getVariable ["IEDarmed", false])
        && {
            not ((_this select 0) getVariable ["IEDdetonated", false])
        }
        && {
            not ((_this select 0) getVariable ["IEDdisarmed", false])
        }
        && {
            [(_this select 1)] call ace_explosives_fnc_candefuse
        }
    }] select (_requireDefusalKit);
    
    [
        _object,
        "DefuseIED" + str (floor (random 360)),
        "Defuse IED",
        "",
        _condition,
        "true",
        {
            ["You've started disarming the IED.", [-1, 0.8], "#339900", 0.5, false] call TFS_fnc_dynamictext;
        },
        {
            ["Disarming the IED.", [-1, 0.8], "#339900", 0.5, false] call TFS_fnc_dynamictext;
        },
        {
            (_this select 0) setVariable ["IEDdisarmed", true, true];
            ["You've disarmed the IED.", [-1, 0.8], "#339900", 0.5, false] call TFS_fnc_dynamictext;
        },
        {
            ["The IED was not disarmed.", [-1, 0.8], "#339900", 0.5, false] call TFS_fnc_dynamictext;
        },
        [],
        10 + random 10,
        true,
        "Disarming IED",
        false
    ] call TFS_fnc_AddHoldaction;
};

if (!isServer) exitwith {};

// randomise detonation time if param is negative
if (_detonationtime < 0) then {
    _detonationtime = random (abs _detonationtime);
};

// Create the physical explosive
_explosive = "ACE_explosives_Place_SatchelCharge" createvehicle [0, 0, 0];
_pos = getPos _object;
_explosive setPos _pos;
_explosive attachto [_object];
hideObjectglobal _explosive;

// Add PFH for proximity checking
[
    {
        params ["_args", "_pfhID"];
        _args params ["_object", "_proximityradius", "_detonationtime", "_announce"];
        _armed = _object getVariable ["IEDarmed", false];
        _disarmed = _object getVariable ["IEDdisarmed", false];
        _destroyed = _object getVariable ["IEDdetonated", false];
        
        if (_disarmed || _destroyed) exitwith {
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
        
        {
            if ((_object distance2D _x) < _proximityradius && (not _disarmed) && (not _armed)) then {
                _object setVariable ["IEDarmed", true, true];
                
                // Tell everyone that this is a thing that happened if the user so wishes:
                if (_announce) then {
                    [
                        format ["The IED has been armed and will detonate in %1 seconds!", _detonationtime],
                        [-1, 0.8], "#cc3232", 0.5, true
                    ] call TFS_fnc_dynamictext;
                };
            };
        } forEach allplayers;
    },
    1,
    [_object, _proximityradius, _detonationtime, _announce]
] call CBA_fnc_addPerFrameHandler;

// Add PFH to check for explosives armed
[
    {
        params ["_args", "_pfhID"];
        _args params ["_explosive", "_object", "_detonationtime", "_secondaries", "_announce", "_announceinterval"];
        
        _armed = _object getVariable ["IEDarmed", false];
        _disarmed = _object getVariable ["IEDdisarmed", false];
        _destroyed = _object getVariable ["IEDdetonated", false];
        
        if (_disarmed || _destroyed) exitwith {
            deletevehicle _explosive;
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
        if ((not _armed)) exitwith {};
        
        _starttime = _object getVariable ["starttime", 0];
        
        if (_starttime == 0) then {
            _starttime = time;
            _object setVariable ["starttime", _starttime, true];
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
                [-1, 0.8], "#cc3232", 0.5, true
            ] call TFS_fnc_dynamictext;
        };
        
        // if the delta of starttime and current time exceeds the detonation timer,
        // we blow the vehicle up!
        // We do this check every frame since we want to be able to disarm the bomb.
        if (_timeLeft <= 3) then {
            _object setVariable ["IEDdetonated", true, true];
            
            if (_announce) then {
                [
                    "time's out, the IED could detonate any second!",
                    [-1, 0.8], "#cc3232", 0.5, true
                ] call TFS_fnc_dynamictext;
            };
            
            _detin = _timeLeft + random (3) - 1.5;
            
            [
                {
                    params ["_object", "_secondaries"];
                    _secArray = [0, 0, 0];
                    
                    // set the amount of secondary explosions according to the param.
                    if (_secondaries) then {
                        _secArray = [(ceil (random 6) + 2), (random 4 + 1), (random 2 + 1)];
                    };
                    _pos = position _object;
                    // Detonate using TFS_fnc_spawnexplosives.
                    [
                        0,
                        _pos,
                        _secArray
                    ] call TFS_fnc_spawnexplosives;
                    
                    _bomb = "SatchelCharge_Remote_ammo_Scripted" createvehicle (_pos);
                    _bomb setDamage 1;
                }, [_object, _secondaries], (_detin)
                
            ] call CBA_fnc_waitandexecute;
            
            deletevehicle _explosive;
        };
    },
    1,
    [_explosive, _object, _detonationtime, _secondaries, _announce, _announceinterval]
] call CBA_fnc_addPerFrameHandler;