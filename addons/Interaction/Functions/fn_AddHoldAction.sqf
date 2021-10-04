/*
Function: TFS_fnc_AddHoldaction

Description:
Adds a timed action to an object. The action will only complete after a
certain amount of time, wich progresses only if certain conditions are met.
The player executing the action is informed about the progress.
The action is added only to the clients on which the function was originally
called. if the function is called with _global set to true the action will
be added to every player and JIP.

The condition for showing the action has the following keywords available:

_target - The object that the action is attached to
_player - The player that is currently checked

The keyword "_this" is reserved, don't use it in the condition string!

All the _codeX clocks have the following parameters available:

_this select 0 - The object to which the action is assigned to <OBJECT>
_this select 1 - The unit that activated the action <OBJECT>
_this select 2 - The arguments passed through the function in _args <ARRAY of ANYTHinG>

Arguments:
_object - The object to which the action is added <OBJECT>
_id - The globally unique identifier of the action (used for ACE, JIP etc) <strinG>
_title - The title of the action as shown to players <strinG>
_icon - The icon that's shown to the player <strinG>
_conditionShow - Condition for the action to be shown, default: "true" <strinG>
_conditionProgress - Condition for the action to progress;
if false is returned action progress is paused, default: "true" <strinG>
_codeStart - Code executed when action starts <CODE>
_codeProgress - Code executed on every progress tick <CODE>
_codeCompleted - Code executed on completion <CODE>
_codeinterrupted - Code executed on interrupted <CODE>
_args - Arguments that are passed to the code blocks <ARRAY OF ANYTHinG>
_duration - The duration in seconds it takes to complete the action, default: 10 <SCALAR>
_removeCompleted - Remove the action once it's completed, default: true <BOOLEAN>
_progressTitle - Shown in the ACE progress bar, optional <strinG>
_global - set to true to add the action to every player <BOOLEAN>

Return Values:
None

Examples:
(begin example)
[
    Car,
    "UnlockCar",
    "Unlock Car",
    "",
    "true",
    "true",
    {
        hint "Unlocking Car!";
    },
    {
        hint "Still unlocking Car!";
    },
    {
        hint "Car unlocked!";
    },
    {
        hint "Couldn't unlock Car!";
    },
    [],
    14,
    true,
    "Unlocking Car...",
    true
] call TFS_fnc_AddHoldaction;
(end)

Author:
Mokka
*/

params [
    "_object",
    "_id",
    "_title",
    ["_icon", ""],
    "_conditionShow",
    "_conditionProgress",
    "_codeStart",
    "_codeProgress",
    "_codeCompleted",
    "_codeinterrupted",
    ["_args", []],
    ["_duration", 10],
    ["_removeCompleted", true],
    ["_progressTitle", ""],
    ["_global", false]
];

if (_global) exitwith {
    [
        _object,
        _id,
        _title,
        _icon,
        _conditionShow,
        _conditionProgress,
        _codeStart,
        _codeProgress,
        _codeCompleted,
        _codeinterrupted,
        _args,
        _duration,
        _removeCompleted,
        _progressTitle,
        false
    ] remoteExec ["TFS_fnc_AddHoldaction", 0, _id];
};

if (!hasinterface) exitwith {};

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
    if (_conditionShow isEqualtype "") then {
        _conditionShow = compileFinal _conditionShow;
    };
    
    if (_conditionProgress isEqualtype "") then {
        _conditionProgress = compileFinal _conditionProgress;
    };
    
    _action = [
        _id,
        _title,
        _icon,
        {
            params ["_target", "_caller", "_arguments"];
            
            _arguments params [
                "_args",
                "_conditionProgress",
                "_codeStart",
                "_codeProgress",
                "_codeCompleted",
                "_codeinterrupted",
                "_id",
                "_remove",
                "_duration",
                "_progressTitle"
            ];
            
            [_target, _caller, _args] call _codeStart;
            
            [
                _duration,
                [_args, _codeCompleted, _codeinterrupted, _remove, _target, _caller, _id],
                {
                    (_this select 0) params [
                        "_parameters",
                        "_codeCompleted",
                        "_codeinterrupted",
                        "_remove",
                        "_target",
                        "_caller",
                        "_id"
                    ];
                    
                    [_target, _caller, _parameters] call _codeCompleted;
                    
                    if (_remove) then {
                        [_target, 0, ["ACE_Mainactions", _id]] call ace_interact_menu_fnc_removeActionfromObject;
                    };
                },
                {
                    (_this select 0) params [
                        "_parameters",
                        "_codeCompleted",
                        "_codeinterrupted",
                        "_remove",
                        "_target",
                        "_caller",
                        "_id"
                    ];
                    
                    [_target, _caller, _parameters] call _codeinterrupted;
                },
                _progressTitle,
                compile format ["(_this select 0) params [""_parameters"", ""_codeCompleted"", ""_codeinterrupted"", ""_remove"", ""_target"", ""_caller""];
                    _nul = [_target, _caller, _parameters] call %1;
                _bool = [_target, _caller, _parameters] call %2; _bool", _codeProgress, _conditionProgress]
            ] call ace_common_fnc_progressBar;
        },
        _conditionShow,
        {},
        [_args, _conditionProgress, _codeStart, _codeProgress, _codeCompleted, _codeinterrupted, _id, _removeCompleted, _duration, _progressTitle]
    ] call ace_interact_menu_fnc_createaction;
    
    [_object, 0, ["ACE_Mainactions"], _action] call ace_interact_menu_fnc_addActiontoObject;
} else {
    // Fix the condition string (replace _player with _this)
    _conditionShow = [_conditionShow, "_player", "_this", nil, false] call TFS_fnc_findReplacestring;
    _conditionProgress = [_conditionProgress, "_player", "_this", nil, false] call TFS_fnc_findReplacestring;
    
    [
        _object,
        _title,
        _icon,
        _icon,
        _conditionShow,
        _conditionProgress,
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            
            _arguments params [
                "_args",
                "_codeStart",
                "_codeProgress",
                "_codeCompleted",
                "_codeinterrupted"
            ];
            
            [_target, _caller, _args] call _codeStart;
        },
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            
            _arguments params [
                "_args",
                "_codeStart",
                "_codeProgress",
                "_codeCompleted",
                "_codeinterrupted"
            ];
            
            [_target, _caller, _args] call _codeProgress;
        },
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            
            _arguments params [
                "_args",
                "_codeStart",
                "_codeProgress",
                "_codeCompleted",
                "_codeinterrupted"
            ];
            
            [_target, _caller, _args] call _codeCompleted;
        },
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            
            _arguments params [
                "_args",
                "_codeStart",
                "_codeProgress",
                "_codeCompleted",
                "_codeinterrupted"
            ];
            
            [_target, _caller, _args] call _codeinterrupted;
        },
        [_args, _codeStart, _codeProgress, _codeCompleted, _codeinterrupted],
        _duration,
        -99,
        _removeCompleted
    ] call BIS_fnc_holdactionAdd;
};