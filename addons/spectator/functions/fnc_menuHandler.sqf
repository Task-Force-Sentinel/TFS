#include "\z\tfs\addons\spectator\script_component.hpp"
params ["_button", "_args"];

_args params ["_control"];

switch (_button) do {
    // sidefilter button
    case "sidefilter": {
        GVAR(sides_button_state) = (GVAR(sides_button_state) + 1);
        
        // if above array size, restart at zero
        if (GVAR(sides_button_state) > (count GVAR(sides_button_mode))-1) then {
            GVAR(sides_button_state) = 0;
        };
        
        GVAR(sides) = GVAR(sides_button_mode) select GVAR(sides_button_state);
        
        if (count GVAR(sides) == 1) then {
            _control ctrlsettextColor ((GVAR(sides) select 0) call CFUNC(sidetoColor));
        } else {
            _control ctrlsettextColor [1, 1, 1, 1];
        };
        
        _control ctrlsettooltip (GVAR(sides_button_strings) select GVAR(sides_button_state));
        
        GVAR(cleargroups) = true;
    };
    
    // AI button
    case "disableAI": {
        GVAR(playersOnly) = !GVAR(playersOnly);
        
        _text = "\A3\ui_f\data\gui\Rsc\RscDisplayMultiplayersetup\enabledai_ca.paa";
        _messsage = "AI + playerS";
        
        if (GVAR(playersOnly)) then {
            _messsage = "playerS ONLY";
            _text = "\A3\ui_f\data\gui\Rsc\RscDisplayMultiplayersetup\disabledai_ca.paa";
        };
        
        GVAR(cleargroups) = true;
        
        _control ctrlsettext (_text);
        _control ctrlsettooltip _messsage;
    };
    
    // Tags button
    case "tags" : {
        GVAR(tags) = !GVAR(tags);
        
        private _tooltip = "ENABLE TAGS";
        
        if (GVAR(tags)) then {
            _tooltip = "DISABLE TAGS";
        } else {
            // Remove controls.
            {
                _x setVariable [QGVAR(tagControl), nil];
            } forEach allunits;
            {
                _x setVariable [QGVAR(tagControl), nil];
            } forEach allgroups;
            {
                ctrlDelete _x
            } forEach GVAR(controls);
            GVAR(controls) = [];
        };
        
        _control ctrlsettooltip _tooltip;
    };
    case "mute" : {
        [] call acre_sys_core_fnc_toggleHeadset;
    };
    case "radio": {
        // Broadcast event.
        [QGVAR(radioButtonPressed), []] call CBA_fnc_localEvent;
    };
    case "vision" : {
        GVAR(visionmode) = GVAR(visionmode) +1;
        if (GVAR(visionmode) > 2) then {
            GVAR(visionmode) = 0
        };
        false setCamUseTI 0;
        camUseNVG false;
        switch (GVAR(visionmode)) do {
            case 1: {
                camUseNVG true;
            };
            case 2: {
                true setCamUseTI 0;
            };
        };
        _i = (GVAR(visionmode))+1;
        if (_i > 2) then {
            _i = 0
        };
        if(isnil "_control" || {
            isNull _control
        }) then {
            _control = uiNamespace getVariable [QGVAR(vision), controlnull];
        };
        _control ctrlsettooltip format ["switch to %1", GVAR(visionmode_strings) select _i ];
    };
    case "camera" : {
        if(count (GVAR(allowed_modes) select {
            _x
        }) <= 0) exitwith {
            // we leave because otherwise it will loop forever...
        };
        
        private _nextmode = GVAR(mode) + 1;
        if (_nextmode > 2) then {
            _nextmode = 0;
        };
        while {!(GVAR(allowed_modes) # _nextmode)} do {
            _nextmode = _nextmode + 1;
            if (_nextmode > 2) then {
                _nextmode = 0;
            };
        };
        
        switch(_nextmode) do {
            case FOLLOWCAM: {
                if (GVAR(mode) == FREECAM) then {
                    private _pitch = (GVAR(camera) call BIS_fnc_getpitchBank) select 0;
                    GVAR(followcam_angle) = [(getDir GVAR(camera) + 180) mod 360, (_pitch+180) mod 360];
                };
                GVAR(mode) = FOLLOWCAM;
            };
            case FREECAM: {
                if (GVAR(mode) == FOLLOWCAM) then {
                    GVAR(followcam_angle) = [getDir GVAR(camera), (GVAR(camera) call BIS_fnc_getpitchBank) select 0];
                };
                GVAR(mode) = FREECAM;
            };
            case FIRSTPERSON: {
                GVAR(mode) = FIRSTPERSON;
            };
        };
        [] call FUNC(setTarget);
        
        _nextmode = GVAR(mode) + 1;
        if (_nextmode > 2) then {
            _nextmode = 0;
        };
        while {!(GVAR(allowed_modes) # _nextmode)} do {
            _nextmode = _nextmode + 1;
            if (_nextmode > 2) then {
                _nextmode = 0;
            };
        };
        
        private _tooltip = "switch to FOLLOW CAMERA";
        switch (_nextmode) do {
            case (FOLLOWCAM): {
                _tooltip = "switch to FREECAM";
            };
            case (FREECAM): {
                _tooltip = "switch to FRISTPERSON";
            };
            case (FIRSTPERSON): {
                _tooltip = "switch to FOLLOWCAM";
            };
        };
        _control ctrlsettooltip _tooltip;
    };
};