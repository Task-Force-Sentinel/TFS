params ["_object", "_selection", "_name", "_args"];

private _parentaction = [
    format ["screen%1_parent", _selection],
    format ["%1", _name],
    "",
    {
        diag_log "hi"
    },
    {
        true
    },
    nil,
    []
] call ACE_interact_menu_fnc_createaction;

private _configaction = [
    format ["screen%1_config", _selection],
    "Configure Screen",
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_selection", "_args"];
        
        [_object, _selection, _args] call TFS_fnc_configureScreen;
    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_selection"];
        
        _object getVariable [format ["TFS_CC_screen_%1_on", _selection], false];
    },
    nil,
    [_object, _selection, _args],
    nil,
    nil,
    nil,
    {
        params ["_target", "_player", "_params", "_actionData"];
        _params params ["_object", "_selection"];
        
        private _screenmode = _object getVariable [format ["TFS_CC_screen_%1_mode", _selection], ""];
        private _screenTarget = _object getVariable [format ["TFS_CC_screen_%1_target", _selection], ""];
        private "_modename";
        
        if ((!(_screenmode isEqualto "")) && (!(_screenTarget isEqualto ""))) then {
            switch (_screenmode) do {
                case "HCAM": {
                    _modename = "Viewing Helmet Cam";
                };
                case "DCAM": {
                    _modename = "Viewing Drone Cam";
                };
                case "SAT": {
                    _modename = "Viewing Satellite Footage";
                };
                default {
                    _modename = "Error, invalid mode!";
                };
            };
            
            _actionData set [1, format["Configure Screen - %1: %2", _modename, _screenTarget]];
        } else {
            _actionData set [1, "Configure Screen"]
        };
    }
] call ACE_interact_menu_fnc_createaction;

private _turnOnaction = [
    format ["screen%1_turnOn", _selection],
    "Turn On",
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_selection", "_args"];
        
        [_object, _selection, true, _args] call TFS_fnc_turnOnScreen;
    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_selection"];
        
        !(_object getVariable [format ["TFS_CC_screen_%1_on", _selection], false]);
    },
    nil,
    [_object, _selection, _args]
] call ACE_interact_menu_fnc_createaction;

private _turnOffaction = [
    format ["screen%1_turnOff", _selection],
    "Turn Off",
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_selection", "_args"];
        
        [_object, _selection, false, _args] call TFS_fnc_turnOnScreen;
    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_selection"];
        
        _object getVariable [format ["TFS_CC_screen_%1_on", _selection], false];
    },
    nil,
    [_object, _selection, _args]
] call ACE_interact_menu_fnc_createaction;

private _toggleVisualaction = [
    format ["screen%1_toggleVisual", _selection],
    "toggle Visual mode",
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_selection"];
        
        [_object, _selection] call TFS_fnc_toggleVisualmode;
    },
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_selection"];
        
        _object getVariable [format ["TFS_CC_screen_%1_on", _selection], false];
    },
    nil,
    [_object, _selection]
] call ACE_interact_menu_fnc_createaction;

[_object, 0, ["ACE_Mainactions"], _parentaction] call ACE_interact_menu_fnc_addActiontoObject;
[_object, 0, ["ACE_Mainactions", format ["screen%1_parent", _selection]], _configaction] call ACE_interact_menu_fnc_addActiontoObject;
[_object, 0, ["ACE_Mainactions", format ["screen%1_parent", _selection]], _toggleVisualaction] call ACE_interact_menu_fnc_addActiontoObject;
[_object, 0, ["ACE_Mainactions", format ["screen%1_parent", _selection]], _turnOnaction] call ACE_interact_menu_fnc_addActiontoObject;
[_object, 0, ["ACE_Mainactions", format ["screen%1_parent", _selection]], _turnOffaction] call ACE_interact_menu_fnc_addActiontoObject;