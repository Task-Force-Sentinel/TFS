/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\modules\functions\speech\fn_moduleGlobalSpeech.sqf
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
*	[] call TFS_fnc_moduleGlobalSpeech;
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
        private _onlyOnce = _logic getVariable ["onlyOnce", false];
        private _reaction = _logic getVariable ["reaction", 0];
        private _animation = _logic getVariable ["animation", ""];
        
        if ((_sound isEqualto "") || (_sound isEqualto "$NONE$")) exitwith {};
        
        // VALIdate SOURCE
        
        if (_source isEqualto "") exitwith {
            [format [localize "str_TFS_moduleError_UnitIsEmpty", _source]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_UnitIsEmpty", _source]], "modules"] call TFS_fnc_log;
        };
        
        if (isNull (missionnamespace getVariable [_source, objNull])) exitwith {
            [format [localize "str_TFS_moduleError_VarIsUnknown", _source]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_VarIsUnknown", _source]], "modules"] call TFS_fnc_log;
        };
        
        private _unit = missionnamespace getVariable _source;
        
        if !(_unit isKindOf "Man") exitwith {
            [format [localize "str_TFS_moduleError_IsnotUnit", _unit]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_IsnotUnit", _unit]], "modules"] call TFS_fnc_log;
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
            [format [localize "str_TFS_moduleError_UnknowninCfgSounds", _sound]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_UnknowninCfgSounds", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate distance
        
        if (_distance <= 0) exitwith {
            [format [localize "str_TFS_moduleError_distanceGreaterZero", _distance]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_distanceGreaterZero", _distance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate max distance
        
        if ((_maxdistance > 0) && (_maxdistance <= _distance)) exitwith {
            [format [localize "str_TFS_moduleError_maxGreaterdistance", _distance, _maxdistance]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_maxGreaterdistance", _distance, _maxdistance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate DURATION
        
        if (_duration <= 0) then {
            _duration = [_sound] call TFS_fnc_getSoundDuration;
        };
        if (_duration <= 0) exitwith {
            [format [localize "str_TFS_moduleError_DurationnotDefined", _sound]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_DurationnotDefined", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate ANIMATION
        
        if ((_reaction > 2) && (_animation isEqualto "")) exitwith {
            [format [localize "str_TFS_moduleError_AnimationEmpty", _reaction, _animation]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_AnimationEmpty", _reaction, _animation]], "modules"] call TFS_fnc_log;
        };
        
        // GLOBAL SPEECH MENU
        
        [_logic] remoteExec ["TFS_fnc_moduleGlobalSpeechMenu", 0, true];
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
        private _onlyOnce = _logic getVariable ["onlyOnce", false];
        private _reaction = _logic getVariable ["reaction", 0];
        private _animation = _logic getVariable ["animation", ""];
        
        if ((_sound isEqualto "") || (_sound isEqualto "$NONE$")) exitwith {};
        
        // VALIdate SOURCE
        
        if (_source isEqualto "") exitwith {
            [format [localize "str_TFS_moduleError_UnitIsEmpty", _source]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_UnitIsEmpty", _source]], "modules"] call TFS_fnc_log;
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
            [format [localize "str_TFS_moduleError_UnknowninCfgSounds", _sound]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_UnknowninCfgSounds", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate distance
        
        if (_distance <= 0) exitwith {
            [format [localize "str_TFS_moduleError_distanceGreaterZero", _distance]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_distanceGreaterZero", _distance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate max distance
        
        if ((_maxdistance > 0) && (_maxdistance <= _distance)) exitwith {
            [format [localize "str_TFS_moduleError_maxGreaterdistance", _distance, _maxdistance]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_maxGreaterdistance", _distance, _maxdistance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate DURATION
        
        if (_duration <= 0) then {
            _duration = [_sound] call TFS_fnc_getSoundDuration;
        };
        if (_duration <= 0) exitwith {
            [format [localize "str_TFS_moduleError_DurationnotDefined", _sound]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_DurationnotDefined", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate ANIMATION
        
        if ((_reaction > 2) && (_animation isEqualto "")) exitwith {
            [format [localize "str_TFS_moduleError_AnimationEmpty", _reaction, _animation]] call BIS_fnc_error;
            [2, "moduleGlobalSpeech '%1' - %2", [_logic, format [localize "str_TFS_moduleError_AnimationEmpty", _reaction, _animation]], "modules"] call TFS_fnc_log;
        };
    };
};