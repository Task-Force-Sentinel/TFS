/*
Function: TFS_fnc_AddCreatoraction

Description:
Adds an action for the mission creator that allows executing code/functions
during the live mission.

Arguments:
_actionname - action name <strinG>
_displayname - name of the action shown in the menu <strinG>
_icon - Icon file path or Array of icon file path and hex color ("" for default icon) <strinG|ARRAY>
_statement - Statement <CODE>
_condition - Condition <CODE>
_actionPath - Path for the action, subpath of Creatoractions <ARRAY> (Optional)
_insertChildren - insert children code <CODE> (Optional)
_customparams - action parameters <ANY> (Optional)
_params - Other parameters [showDisabled, enableinside, canCollapse, runOnHover, donotCheckLOS] <ARRAY> (Optional)
_modifierFunction -: modifier function <CODE> (Optional)

Return Values:
None

Examples:
(begin example)
[
    "missionStart",
    "Start Mission",
    "",
    {
        hint "Mission started!";
    },
    {
        true
    },
    ["Exampleactions"]
] call TFS_fnc_AddCreatoraction;
(end)

Author:
Mokka
*/

if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};
if (!TFS_Creatoractions_Master) exitwith {};

params [
    "_actionname",
    "_displayname",
    "_icon",
    "_statement",
    "_condition",
    ["_actionPath", []],
    ["_insertChildren", {}],
    ["_customparams", []],
    ["_params", [false, false, false, false, false]],
    ["_modifierFunction", {}]
];

_action = [
    _actionname, _displayname, _icon, _statement, _condition, _insertChildren,
    _customparams, nil, nil, _params, _modifierFunction
] call ACE_interact_menu_fnc_createaction;

[
    "TFS_RegisterCreatoraction", [_action, _actionPath, _actionname], format["TFS_CAJIP_%1", _actionname]
] call CBA_fnc_globalEventJIP;