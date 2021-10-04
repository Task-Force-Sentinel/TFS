/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\modules\functions\sound\fn_moduleTriggerSound.sqf
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
*	[] call TFS_fnc_moduleTriggerSound;
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
        private _offset = _logic getVariable ["offset", []];
        private _sound = _logic getVariable ["sound", ""];
        private _distance = _logic getVariable ["distance", 100];
        private _maxdistance = _logic getVariable ["maxdistance", -1];
        private _duration = _logic getVariable ["duration", -1];
        private _loop = _logic getVariable ["loop", false];
        private _ignorestop = _logic getVariable ["ignorestop", false];
        
        if ((_sound isEqualto "") || (_sound isEqualto "$NONE$")) exitwith {};
        
        // VALIdate OFFset
        
        private _soundoffset = [];
        
        if (_offset isEqualto "") then {
            _offset = "[]";
        };
        
        _soundoffset = call compile _offset;
        
        if (_soundoffset isEqualto []) then {
            _soundoffset = [0, 0, 0];
        };
        
        if !((typeName _soundoffset) isEqualtype "ARRAY") exitwith {
            [format [localize "str_TFS_moduleError_OffsetnotValid", _soundoffset]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_OffsetnotValid", _soundoffset]], "modules"] call TFS_fnc_log;
        };
        
        if !((count _soundoffset) isEqualto 3) exitwith {
            [format [localize "str_TFS_moduleError_OffsetnotValid", _soundoffset]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_OffsetnotValid", _soundoffset]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate SOURCE
        
        private _soundSource = objNull;
        
        if (_source != "") then {
            if (isNull (missionnamespace getVariable [_source, objNull])) exitwith {
                [format [localize "str_TFS_moduleError_VarIsUnknown", _source]] call BIS_fnc_error;
                [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_VarIsUnknown", _source]], "modules"] call TFS_fnc_log;
            };
            
            _soundSource = missionnamespace getVariable _source;
            
            if !((typeName _soundSource) isEqualtype "OBJECT") exitwith {
                [format [localize "str_TFS_moduleError_Isnotobject", _soundSource]] call BIS_fnc_error;
                [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_Isnotobject", _soundSource]], "modules"] call TFS_fnc_log;
            };
        } else {
            _soundSource = _logic;
            _soundoffset = [0, 0, 0];
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
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_UnknowninCfgSounds", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate distance
        
        if (_distance <= 0) exitwith {
            [format [localize "str_TFS_moduleError_distanceGreaterZero", _distance]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_distanceGreaterZero", _distance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate max distance
        
        if ((_maxdistance > 0) && (_maxdistance <= _distance)) exitwith {
            [format [localize "str_TFS_moduleError_maxGreaterdistance", _distance, _maxdistance]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_maxGreaterdistance", _distance, _maxdistance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate DURATION
        
        if (_duration <= 0) then {
            _duration = [_sound] call TFS_fnc_getSoundDuration;
        };
        if (_duration <= 0) exitwith {
            [format [localize "str_TFS_moduleError_DurationnotDefined", _sound]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_DurationnotDefined", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // modULE
        
        if (_isActivated) then {
            if (_enabled > 0) then {
                if (_loop) then {
                    [_soundSource, _sound, _soundoffset, _distance, _maxdistance, _duration] call TFS_fnc_loop3dSound;
                } else {
                    [_soundSource, _sound, _soundoffset, _distance, _maxdistance, _duration] call TFS_fnc_play3dSound;
                };
            };
        } else {
            if !(_ignorestop) then {
                [_soundSource, _sound] call TFS_fnc_stop3dSound;
            };
        };
    };
    
    // ATTRIBUTES
    // =============================================================================================
    
    case "attributesChanged3DEN": {
        private _logic = _input param [0, objNull, [objNull]];
        
        private _enabled = _logic getVariable ["enabled", 0];
        private _source = _logic getVariable ["source", ""];
        private _offset = _logic getVariable ["offset", []];
        private _sound = _logic getVariable ["sound", ""];
        private _distance = _logic getVariable ["distance", 100];
        private _maxdistance = _logic getVariable ["maxdistance", -1];
        private _duration = _logic getVariable ["duration", -1];
        private _loop = _logic getVariable ["loop", false];
        private _ignorestop = _logic getVariable ["ignorestop", false];
        
        if ((_sound isEqualto "") || (_sound isEqualto "$NONE$")) exitwith {};
        
        // VALIdate OFFset
        
        private _soundoffset = [];
        
        if (_offset isEqualto "") then {
            _offset = "[]";
        };
        
        _soundoffset = call compile _offset;
        
        if (_soundoffset isEqualto []) then {
            _soundoffset = [0, 0, 0];
        };
        
        if !((typeName _soundoffset) isEqualtype "ARRAY") exitwith {
            [format [localize "str_TFS_moduleError_OffsetnotValid", _soundoffset]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_OffsetnotValid", _soundoffset]], "modules"] call TFS_fnc_log;
        };
        
        if !((count _soundoffset) isEqualto 3) exitwith {
            [format [localize "str_TFS_moduleError_OffsetnotValid", _soundoffset]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_OffsetnotValid", _soundoffset]], "modules"] call TFS_fnc_log;
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
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_UnknowninCfgSounds", _sound]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate distance
        
        if (_distance <= 0) exitwith {
            [format [localize "str_TFS_moduleError_distanceGreaterZero", _distance]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_distanceGreaterZero", _distance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate max distance
        
        if ((_maxdistance > 0) && (_maxdistance <= _distance)) exitwith {
            [format [localize "str_TFS_moduleError_maxGreaterdistance", _distance, _maxdistance]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_maxGreaterdistance", _distance, _maxdistance]], "modules"] call TFS_fnc_log;
        };
        
        // VALIdate DURATION
        
        if (_duration <= 0) then {
            _duration = [_sound] call TFS_fnc_getSoundDuration;
        };
        if (_duration <= 0) exitwith {
            [format [localize "str_TFS_moduleError_DurationnotDefined", _sound]] call BIS_fnc_error;
            [2, "moduleTriggerSound '%1' - %2", [_logic, format [localize "str_TFS_moduleError_DurationnotDefined", _sound]], "modules"] call TFS_fnc_log;
        };
    };
};