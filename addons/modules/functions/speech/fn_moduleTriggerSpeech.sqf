/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\modules\functions\speech\fn_moduleTriggerSpeech.sqf
*	by Ojemineh
*
*	module function
*
*	Arguments:
*	0: mode		- <strinG>
*	1: input	- <ARRAY>
*
*	Return:
*	nothing
*
*	Example:
*	[] call TFS_fnc_moduleTriggerSpeech;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_mode", "_input"];

_mode = param [0, "", [""]];
_input = param [1, [], [[]]];

// -------------------------------------------------------------------------------------------------

switch _mode do {
    // inITIALIZE
    // =============================================================================================
    
    case "init": {
        private _logic = _input param [0, objNull, [objNull]];
        private _isActivated = _input param [1, true, [true]];
        private _isCuratorPlaced = _input param [2, false, [true]];
        
        private _enabled = _logic getVariable ["enabled", 0];
        private _source = _logic getVariable ["source", ""];
        private _sound = _logic getVariable ["sound", ""];
        private _distance = _logic getVariable ["distance", 30];
        private _maxdistance = _logic getVariable ["maxdistance", -1];
        private _duration = _logic getVariable ["duration", -1];
        private _loop = _logic getVariable ["loop", false];
        private _ignorestop = _logic getVariable ["ignorestop", false];
        private _animation = _logic getVariable ["animation", ""];
        
        if ((_sound isEqualto "") || (_sound isEqualto "$NONE$")) exitwith {};
        
        // VALIdate SOURCE
        
        if (_source isEqualto "") exitwith {
            [format [localize "str_TFS_Modules_UnitIsEmpty", _source]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_UnitIsEmpty", _source]], "modules"] call TFS_fnc_log;
        };
        
        if (isNull (missionnamespace getVariable [_source, objNull])) exitwith {
            [format [localize "str_TFS_Modules_VarIsUnknown", _source]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_VarIsUnknown", _source]], "modules"] call TFS_fnc_log;
        };
        
        private _unit = missionnamespace getVariable _source;
        
        if !(_unit isKindOf "Man") exitwith {
            [format [localize "str_TFS_Modules_IsnotUnit", _unit]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_IsnotUnit", _unit]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate classname
        
        private _soundExist = 0;
        
        if (isClass (missionConfigFile >> "CfgSounds" >> _sound)) then {
            _soundExist = 1;
        } else {
            if (isClass (configFile >> "CfgSounds" >> _sound)) then {
                _soundExist = 2;
            };
        };
        
        if (_soundExist isEqualto 0) exitwith {
            [format [localize "str_TFS_Modules_UnknowninCfgSounds", _sound]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_UnknowninCfgSounds", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate distance
        
        if (_distance <= 0) exitwith {
            [format [localize "str_TFS_Modules_distanceGreaterZero", _distance]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_distanceGreaterZero", _distance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate max distance
        
        if ((_maxdistance > 0) && (_maxdistance <= _distance)) exitwith {
            [format [localize "str_TFS_Modules_maxGreaterdistance", _distance, _maxdistance]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_maxGreaterdistance", _distance, _maxdistance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate DURATION
        
        if (_duration <= 0) then {
            _duration = [_sound] call TFS_fnc_getSoundDuration;
        };
        if (_duration <= 0) exitwith {
            [format [localize "str_TFS_Modules_DurationnotDefined", _sound]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_DurationnotDefined", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // modULE
        
        if (_isActivated) then {
            if (_loop) then {
                private _pfhHandler = [{
                    params ["_params", "_pfhHandler"];
                    _params params ["_logic", "_unit", "_sound", "_distance", "_maxdistance", "_duration", "_lasttimePlayed"];
                    
                    if (!alive _logic) exitwith {
                        [_unit, _sound] call TFS_fnc_stop3dSound;
                        [_pfhHandler] call CBA_fnc_removePerFrameHandler;
                    };
                    
                    if ((_logic getVariable ["enabled", 0]) isEqualto 0) exitwith {};
                    
                    if ((CBA_missiontime - _lasttimePlayed) >= _duration) then {
                        private _allplayers = (allplayers - entities "HeadlessClient_F");
                        if ((count _allplayers) == 0) exitwith {};
                        
                        [_unit, _sound, _distance, _maxdistance, _duration] call TFS_fnc_speak3d;
                        
                        _params set [6, CBA_missiontime];
                    };
                }, 0, [_logic, _unit, _sound, _distance, _maxdistance, _duration, (CBA_missiontime - _duration)]] call CBA_fnc_addPerFrameHandler;
                
                _logic setVariable ["tfs_pfhHandler", _pfhHandler];
            } else {
                if (_enabled > 0) then {
                    [_unit, _sound, _distance, _maxdistance, _duration] call TFS_fnc_speak3d;
                };
            };
            
            if (_animation != "") then {
                _unit setVariable ["tfs_isAnimEnabled", (_unit checkAifeature "ANIM")];
                _unit setVariable ["tfs_ismoveEnabled", (_unit checkAifeature "move")];
                _unit setVariable ["tfs_unitPosition", (getPosASL _unit)];
                _unit setVariable ["tfs_unitdirection", (getDir _unit)];
                _unit disableAI "ANIM";
                _unit disableAI "move";
                [_unit, _animation] remoteExecCall ["switchMove", 0];
            };
        } else {
            if !(_ignorestop) then {
                if (_loop) then {
                    private _pfhHandler = _logic getVariable ["tfs_pfhHandler", -1];
                    if (_pfhHandler > -1) then {
                        [_pfhHandler] call CBA_fnc_removePerFrameHandler;
                    };
                    _logic setVariable ["tfs_pfhHandler", nil];
                };
                
                [_unit, _sound] call TFS_fnc_stop3dSound;
                
                if (_animation != "") then {
                    private _isAnimEnabled = _unit getVariable ["tfs_isAnimEnabled", true];
                    private _ismoveEnabled = _unit getVariable ["tfs_ismoveEnabled", true];
                    private _unitPosition = _unit getVariable ["tfs_unitPosition", (getPosASL _unit)];
                    private _unitdirection = _unit getVariable ["tfs_unitdirection", (getDir _unit)];
                    [_unit, ""] remoteExecCall ["switchMove", 0];
                    _unit setPosASL _unitPosition;
                    _unit setDir _unitdirection;
                    if (_ismoveEnabled) then {
                        _unit enableAI "move";
                    } else {
                        _unit disableAI "move";
                    };
                    if (_isAnimEnabled) then {
                        _unit enableAI "ANIM";
                    } else {
                        _unit disableAI "ANIM";
                    };
                };
            };
        };
    };
    
    // ATTRIBUTES
    // =============================================================================================
    
    case "attributesChanged3DEN": {
        private _logic = _input param [0, objNull, [objNull]];
        
        private _enabled = _logic getVariable ["enabled", 0];
        private _source = _logic getVariable ["source", ""];
        private _sound = _logic getVariable ["sound", ""];
        private _distance = _logic getVariable ["distance", 30];
        private _maxdistance = _logic getVariable ["maxdistance", -1];
        private _duration = _logic getVariable ["duration", -1];
        private _loop = _logic getVariable ["loop", false];
        private _ignorestop = _logic getVariable ["ignorestop", false];
        private _animation = _logic getVariable ["animation", ""];
        
        if ((_sound isEqualto "") || (_sound isEqualto "$NONE$")) exitwith {};
        
        // VALIdate SOURCE
        
        if (_source isEqualto "") exitwith {
            [format [localize "str_TFS_Modules_UnitIsEmpty", _source]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_UnitIsEmpty", _source]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate classname
        
        private _soundExist = 0;
        
        if (isClass (missionConfigFile >> "CfgSounds" >> _sound)) then {
            _soundExist = 1;
        } else {
            if (isClass (configFile >> "CfgSounds" >> _sound)) then {
                _soundExist = 2;
            };
        };
        
        if (_soundExist isEqualto 0) exitwith {
            [format [localize "str_TFS_Modules_UnknowninCfgSounds", _sound]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_UnknowninCfgSounds", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate distance
        
        if (_distance <= 0) exitwith {
            [format [localize "str_TFS_Modules_distanceGreaterZero", _distance]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_distanceGreaterZero", _distance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate max distance
        
        if ((_maxdistance > 0) && (_maxdistance <= _distance)) exitwith {
            [format [localize "str_TFS_Modules_maxGreaterdistance", _distance, _maxdistance]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_maxGreaterdistance", _distance, _maxdistance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate DURATION
        
        if (_duration <= 0) then {
            _duration = [_sound] call TFS_fnc_getSoundDuration;
        };
        if (_duration <= 0) exitwith {
            [format [localize "str_TFS_Modules_DurationnotDefined", _sound]] call BIS_fnc_error;
            [2, "moduleTriggerpeech '%1' - %2", [_logic, format [localize "str_TFS_Modules_DurationnotDefined", _sound]], "modules"] call TFS_fnc_log;
        };
    };
};