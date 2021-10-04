#include "script_component.hpp"
/*
* Author: Jonpas
* Creates a shooting range. local effect, must be called on each client machine.
*
* Arguments:
* 0: name <strinG> (default: "")
* 1: targets <ARRAY>
* 2: Controllers <ARRAY>
* 3: mode (1 = time, 2 = Hit (time Limited), 3 = Hit (Target Limited), 4 = Trigger, 5 = Rampage) <NUMBER> (default: 1)
* 4: Durations <ARRAY> (default: [0, 30, 60, 150, 300])
* 5: default Duration <NUMBER> (default: 60)
* 6: Pause Durations <ARRAY> (default: [1, 2, 3, 4, 5])
* 7: default Pause Duration <NUMBER> (default: 5)
* 8: countdown times <ARRAY> (default: 6, 9, 12, 15)
* 9: default countdown time <NUMBER> (default: 9)
* 10: Trigger Markers <ARRAY> (default: [])
* 11: Pop on Trigger exit <BOOL> (default: true)
* 12: invalid targets <ARRAY> (default: [])
* 13: Sound Sources <ARRAY> (default: [])
* 14: Deprecated - used to be: Hits <ARRAY> (default: [1])
* 15: Deprecated - used to be: Show Hits <BOOL> (default: true)
*
* Return Value:
* None
*
* Example:
* [
    * "range", [target1, target2], [controller1, controller2], 1, [30, 60], 60, [3, 5], 5, 10, [5, 9],
    * [trigger1, trigger2], true, [invalidTarget1, invalidTarget2], [source1, source2]
* ] call TFS_shootingrange_fnc_create;
*
* Public: Yes
*/

params [
    ["_name", "", [""] ],
    ["_targets", [], [[]] ],
    ["_controllers", [], [[]] ],
    ["_mode", modE_default, [0] ],
    ["_durations", DURATIONS_default, [[]] ],
    ["_defaultDuration", DURATION_default, [0] ],
    ["_targetAmounts", TARGETAMOUNTS_default, [[]] ],
    ["_defaultTargetAmount", TARGETAMOUNT_default, [0] ],
    ["_pauseDurations", PAUSEDURATIONS_default, [[]] ],
    ["_defaultPauseDuration", PAUSEDURATION_default, [0] ],
    ["_countdowntimes", countdoWNtimeS_default, [[]] ],
    ["_defaultcountdowntime", countdoWNtime_default, [0] ],
    ["_triggerMarkers", [], [[]] ],
    ["_popOnTriggerexit", POPONTRIGGERexit_default, [true] ],
    ["_targetsinvalid", [], [[]] ],
    ["_soundSources", [], [[]] ],
    "", // deprecated - backwards compatibility
    "" // deprecated - backwards compatibility
];

// Verify data
if (_targets isEqualto [] || {
    _controllers isEqualto []
}) exitwith {
    ERRor_1("targets and Controllers fields/arguments must not be empty! (%1)", _name);
};

if (_mode == 4 && {
    count _triggerMarkers != count _targets
}) exitwith {
    ERRor_1("Trigger Markers field/argument must have the same number of elements as targets field/argument when Trigger mode is used! (%1)", _name);
};
if (_mode == 4 && {
    count _triggerMarkers < count _targetsinvalid
}) exitwith {
    ERRor_1("invalid targets field/argument must have equal or less elements than Trigger Markers and targets fields/arguments when Trigger mode is used! (%1)", _name);
};

if (_defaultcountdowntime < countdoWNtime_LOwest) then {
    WARNinG_1("default countdown time field/argument is below 5! Value set to default. (%1)", _name);
    _defaultcountdowntime = countdoWNtime_default;
};
{
    if (_x < countdoWNtime_LOwest) then {
        WARNinG_1("countdown times field/argument contains a value below 5! Removed value. (%1)", _name);
        _countdowntimes deleteAt _forEachindex;
    };
} forEach _countdowntimes;

// Filter Trigger Markers manually as they can be markers or triggers
private _triggerMarkersFiltered = _triggerMarkers apply {
    if (getmarkerColor _x == "") then {
        [missionnamespace getVariable _x, objNull] select (isnil _x);
    } else {
        _x
    };
};
if (count _triggerMarkers != count _triggerMarkersFiltered) then {
    ERRor_1("invalid triggers in Trigger Markers! Make sure all triggers are correctly set! (%1)", _name);
};
_triggerMarkers = _triggerMarkersFiltered;

// defaults
if !(_name isEqualto "") then {
    _name = [" (", _name, ")"] joinstring "";
};

if (_durations isEqualto []) then {
    _durations = DURATIONS_default;
} else {
    _durations pushBack 0;
    // Add infinite duration
};

if (_targetAmounts isEqualto []) then {
    _targetAmounts = TARGETAMOUNTS_default;
};

if (_pauseDurations isEqualto []) then {
    _pauseDurations = PAUSEDURATIONS_default;
};

if (_countdowntimes isEqualto []) then {
    _countdowntimes = countdoWNtimeS_default;
};

if !(_defaultDuration in _durations) then {
    _durations pushBack _defaultDuration;
};

if !(_defaultTargetAmount in _targetAmounts) then {
    _targetAmounts pushBack _defaultTargetAmount;
};

if !(_defaultPauseDuration in _pauseDurations) then {
    _pauseDurations pushBack _defaultPauseDuration;
};

if !(_defaultcountdowntime in _countdowntimes) then {
    _countdowntimes pushBack _defaultcountdowntime;
};

_durations sort true;
_targetAmounts sort true;
_pauseDurations sort true;
_countdowntimes sort true;

// Filter null targets to have correct target count, keep them for target grouping (Trigger mode)
private _targetsAll = _targets;
_targets = _targets select {
    !isNull _x
};
TRACE_2("targets All", _targetsAll, _targets);

// set up default configuration and interactions
{
    _x setVariable [QGVAR(targets), _targets];
    _x setVariable [QGVAR(targetsinvalid), _targetsinvalid];
    if (_x getVariable [QGVAR(duration), 0] == 0) then {
        _x setVariable [QGVAR(duration), _defaultDuration, true];
    };
    if (_x getVariable [QGVAR(targetAmount), 0] == 0) then {
        _x setVariable [QGVAR(targetAmount), _defaultTargetAmount, true];
    };
    if (_x getVariable [QGVAR(pauseDuration), 0] == 0) then {
        _x setVariable [QGVAR(pauseDuration), _defaultPauseDuration, true];
    };
    if (_x getVariable [QGVAR(countdowntime), 0] == 0) then {
        _x setVariable [QGVAR(countdowntime), _defaultcountdowntime, true];
    };
    if (_x getVariable [QGVAR(mode), 0] == 0) then {
        _x setVariable [QGVAR(mode), _mode, true];
    };
    _x setVariable [QGVAR(soundSources), _controllers + _soundSources];
    
    // Main
    private _actionRange = [
        QGVAR(Range),
        format ["%1%2", localize LstrinG(Range), _name],
        "",
        {
            true
        },
        {
            !((_this select 2) getVariable [QGVAR(running), false])
        },
        {},
        _x
    ] call ACEFUNC(interact_menu, createaction);
    
    // stop
    private _actionstop = [
        QGVAR(Rangestop),
        format ["%1 %2%3", localize LstrinG(stop), localize LstrinG(Range), _name],
        "",
        {
            (_this select 2) call FUNC(stop)
        },
        {
            ((_this select 2) select 0) getVariable [QGVAR(running), false]
        },
        {},
        [_x, _controllers, _name, _targets]
    ] call ACEFUNC(interact_menu, createaction);
    
    [_x, 0, ["ACE_Mainactions"], _actionRange] call ACEFUNC(interact_menu, addActiontoObject);
    [_x, 0, ["ACE_Mainactions"], _actionstop] call ACEFUNC(interact_menu, addActiontoObject);
    
    // Start
    private _actionStart = [
        QGVAR(RangeStart),
        localize LstrinG(Start),
        "",
        {
            (_this select 2) call FUNC(start)
        },
        {
            true
        },
        {},
        [_x, _controllers, _name, _targets, _targetsinvalid]
    ] call ACEFUNC(interact_menu, createaction);
    
    [_x, 0, ["ACE_Mainactions", QGVAR(Range)], _actionStart] call ACEFUNC(interact_menu, addActiontoObject);
    
    // Configuration
    private _actionConfig = [
        QGVAR(RangeConfig),
        localize LstrinG(Configure),
        "",
        {
            true
        },
        {
            true
        },
        {},
        [_x]
    ] call ACEFUNC(interact_menu, createaction);
    
    [_x, 0, ["ACE_Mainactions", QGVAR(Range)], _actionConfig] call ACEFUNC(interact_menu, addActiontoObject);
    
    private _actionCheckConfig = [
        QGVAR(RangeConfigCheck),
        localize LstrinG(Check),
        "",
        {
            (_this select 2) call FUNC(checkConfig)
        },
        {
            true
        },
        {},
        [_x, _name, _targets]
    ] call ACEFUNC(interact_menu, createaction);
    
    [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig)], _actionCheckConfig] call ACEFUNC(interact_menu, addActiontoObject);
    
    private _actionConfigDuration = [
        QGVAR(RangeConfigDuration),
        localize LstrinG(Duration),
        "",
        {
            true
        },
        {
            ((_this select 2) select 1) getVariable [QGVAR(mode), modE_default] in [1, 2, 5]
        },
        {
            (_this select 2) call FUNC(addConfigDurations)
        },
        [_name, _x, _controllers, _durations, _targets]
    ] call ACEFUNC(interact_menu, createaction);
    
    [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigDuration] call ACEFUNC(interact_menu, addActiontoObject);
    
    private _actionConfigTargetAmount = [
        QGVAR(RangeConfigTargetAmount),
        localize LstrinG(TargetAmount),
        "",
        {
            true
        },
        {
            ((_this select 2) select 1) getVariable [QGVAR(mode), modE_default] == 3
        },
        {
            (_this select 2) call FUNC(addConfigTargetAmounts)
        },
        [_name, _x, _controllers, _targetAmounts, _targets]
    ] call ACEFUNC(interact_menu, createaction);
    
    [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigTargetAmount] call ACEFUNC(interact_menu, addActiontoObject);
    
    if (_mode != 4) then {
        private _actionConfigPauseDuration = [
            QGVAR(RangeConfigPauseDuration),
            localize LstrinG(PauseDuration),
            "",
            {
                true
            },
            {
                ((_this select 2) select 1) getVariable [QGVAR(mode), modE_default] == 1
            },
            {
                (_this select 2) call FUNC(addConfigPauseDurations)
            },
            [_name, _x, _controllers, _pauseDurations, _targets]
        ] call ACEFUNC(interact_menu, createaction);
        
        [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigPauseDuration] call ACEFUNC(interact_menu, addActiontoObject);
    };
    
    private _actionConfigcountdowntime = [
        QGVAR(RangeConfigcountdowntime),
        localize LstrinG(countdowntime),
        "",
        {
            true
        },
        {
            true
        },
        {
            (_this select 2) call FUNC(addConfigcountdowntimes)
        },
        [_name, _x, _controllers, _countdowntimes, _targets]
    ] call ACEFUNC(interact_menu, createaction);
    
    [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigcountdowntime] call ACEFUNC(interact_menu, addActiontoObject);
    
    if (_mode != 4) then {
        private _actionConfigmode = [
            QGVAR(RangeConfigmode),
            localize LstrinG(mode),
            "",
            {
                true
            },
            {
                true
            },
            {},
            []
        ] call ACEFUNC(interact_menu, createaction);
        
        private _actionConfigmodetime = [
            QGVAR(RangeConfigmodetime),
            localize LstrinG(timed),
            "",
            {
                (_this select 2) call FUNC(setConfigmode)
            },
            {
                true
            },
            {},
            [_name, _x, _controllers, 1, _targets]
        ] call ACEFUNC(interact_menu, createaction);
        
        private _actionConfigmodeHittimeLimited = [
            QGVAR(RangeConfigmodeHittimeLimited),
            localize LstrinG(HittimeLimit),
            "",
            {
                (_this select 2) call FUNC(setConfigmode)
            },
            {
                true
            },
            {},
            [_name, _x, _controllers, 2, _targets]
        ] call ACEFUNC(interact_menu, createaction);
        
        private _actionConfigmodeHitTargetLimited = [
            QGVAR(RangeConfigmodeHitTargetLimited),
            localize LstrinG(HitTargetLimit),
            "",
            {
                (_this select 2) call FUNC(setConfigmode)
            },
            {
                true
            },
            {},
            [_name, _x, _controllers, 3, _targets]
        ] call ACEFUNC(interact_menu, createaction);
        
        private _actionConfigmodeRampage = [
            QGVAR(RangeConfigmodeRampage),
            localize LstrinG(Rampage),
            "",
            {
                (_this select 2) call FUNC(setConfigmode)
            },
            {
                true
            },
            {},
            [_name, _x, _controllers, 5, _targets]
        ] call ACEFUNC(interact_menu, createaction);
        
        [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig)], _actionConfigmode] call ACEFUNC(interact_menu, addActiontoObject);
        [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigmode)], _actionConfigmodetime] call ACEFUNC(interact_menu, addActiontoObject);
        [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigmode)], _actionConfigmodeHittimeLimited] call ACEFUNC(interact_menu, addActiontoObject);
        [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigmode)], _actionConfigmodeHitTargetLimited] call ACEFUNC(interact_menu, addActiontoObject);
        [_x, 0, ["ACE_Mainactions", QGVAR(Range), QGVAR(RangeConfig), QGVAR(RangeConfigmode)], _actionConfigmodeRampage] call ACEFUNC(interact_menu, addActiontoObject);
    };
} forEach _controllers;

private _triggers = [];
private _triggerMarkersset = [];
if (_mode == 4) then {
    // Prepare target groups
    [_targetsAll, _targetsinvalid, _triggerMarkers] call FUNC(setTargetgroups);
    
    // set up triggers
    {
        if !(_x in _triggerMarkersset) then {
            private _trigger = _x;
            
            if (_x isEqualtype "") then {
                // Marker was passed, we create trigger manually
                _trigger = createTrigger ["EmptyDetector", getmarkerPos _x, false];
                
                (getmarkersize _x) params ["_markersizeX", "_markersizeY"];
                _trigger settriggerArea [_markersizeX, _markersizeY, markerDir _x, markerShape _x == "RECtanGLE"];
            } else {
                // Fail-safes for pre-defined triggers
                _trigger settriggertype "NONE";
            };
            
            _trigger settriggerActivation ["ANY", "PRESENT", true];
            
            private _target = _targetsAll select _forEachindex;
            private _controller = _controllers select 0;
            _trigger settriggerStatements [
                format ["[%1, %2] call %3", _controller, _target, QFUNC(canActivateTrigger)],
                format ["[%1, %2] call %3", _target, 0, QFUNC(triggerPopup)],
                format ["if (%1) then {
                    [%2, %3] call %4
                }", _popOnTriggerexit, _target, 1, QFUNC(triggerPopup)]
            ];
            
            _trigger enableSimulation false;
            
            _triggers pushBack _trigger;
            _triggerMarkersset pushBack _x;
        };
    } forEach _triggerMarkers;
};

// set up targets
{
    _x setVariable [QGVAR(targets), _targets];
    _x setVariable [QGVAR(targetsinvalid), _targetsinvalid];
    _x setVariable [QGVAR(controllers), _controllers];
    _x setVariable [QGVAR(triggers), _triggers];
} forEach (_targets + _targetsinvalid);