/*
Function: TFS_fnc_addAction

Description:
Adds an action to an object. The action is added only to the clients on
which the function was originally called. if the function is called with
_global set to true the action will be added to every player and JIP.

The condition has the following keywords available:

_target - The object that the action is attached to
_player - The player that is currently checked

The keyword "_this" is reserved, don't use it in the condition string!

Arguments:
_object - The object to which the action is added <OBJECT>
_id - The globally unique identifier of the action (used for ACE, JIP etc) <strinG>
_title - The title of the action as shown to players <strinG>
_statement - The code executed upon calling the action, the following params are available: [_target, _caller, _args] <CODE>
_args - Arguments for the statement script (Optional), default: [] <ARRAY OF ANYTHinG>
_condition - Code in string which needs to be true for the action to show up, default: "true" <strinG>
_removeCompleted - Remove the action after it has been completed/called, default: true <BOOLEAN>
_distance - The radius in m around the object in which the object is visible, default: 10 <SCALAR>
_global - set to true to add the action to every player <BOOLEAN>

Return Values:
None

Examples:
(begin example)
[
    Car,
    "UnlockCar",
    "Unlock Car",
    {
        hint "Car unlocked!";
    },
    [],
    "true",
    true,
    15,
    true
] call TFS_fnc_addAction;
(end)

Author:
Mokka
*/

params [
    "_object",
    "_id",
    "_title",
    "_statement",
    ["_args", []],
    ["_condition", "true"],
    ["_removeCompleted", true],
    ["_distance", 10],
    ["_global", false]
];

if (_global) exitwith {
    [
        _object,
        _id,
        _title,
        _statement,
        _args,
        _condition,
        _removeCompleted,
        _distance,
        false
    ] remoteExec ["TFS_fnc_addAction", 0, _id];
};

if (!hasinterface) exitwith {};

if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
    if (_condition isEqualtype "") then {
        _condition = compileFinal _condition;
    };
    
    _action = [
        _id,
        _title,
        "",
        {
            params ["_target", "_caller", "_arguments"];
            _arguments params ["_code", "_args", "_id", "_remove"];
            
            [_target, _caller, _args] call _code;
            
            if (_remove) then {
                [_target, 0, ["ACE_Mainactions", _id]] call ace_interact_menu_fnc_removeActionfromObject;
            };
        },
        _condition,
        {},
        [_statement, _args, _id, _removeCompleted],
        "",
        _distance
    ] call ace_interact_menu_fnc_createaction;
    
    [_object, 0, ["ACE_Mainactions"], _action] call ace_interact_menu_fnc_addActiontoObject;
} else {
    // Fix the condition string (replace _player with _this)
    _condition = [_condition, "_player", "_this", nil, false] call TFS_fnc_findReplacestring;
    
    _object addAction [
        _title,
        {
            params ["_target", "_caller", "_actionId", "_arguments"];
            _arguments params ["_code", "_args", "_remove"];
            
            [_target, _caller, _args] call _code;
            
            if (_remove) then {
                _target removeAction _actionId;
            };
        },
        [_statement, _args, _removeCompleted],
        1.5,
        true,
        true,
        "",
        _condition,
        _distance
    ];
};