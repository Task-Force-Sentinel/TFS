/*
Function: TFS_fnc_initinspectableintel

Description:
initializes a given object as a piece of inspectable intel.

Upon interaction, the player that started interaction will have
the piece of intel as a full-screen image with the ability to
display supplied text (optionally).

players can also take the intel, adding the acquired intel
to the diary (on the map) of all players.

The intel Argument Array needs to supply the following information:

_texture - The path to the texture of the intel which shall be displayed in full-screen upon inspection
_diarypicture - The path to the picture which shall be displayed in the diary
_diaryRecord - Array containing the message in format: [Title, Entry text]
_fullScreentext - Optional: The text to be shown if player clicks button "Read" during inspection
_actionTitle - Title of the action to be added to the object for picking up
_sharedwith - The side with which the intel shall be shared (default: west)
_notifyside - Optional: notify the player's side through systemChat? (default: no)

Arguments:
_object - The object to initialize
_args - intel Argument Array (see above)

Return Values:
None

Examples:
(begin example)
// in the init field of an object in the editor (e.g. a Laptop or documents)
[
    this,
    [
        "data\images\example.paa", "data\images\example_small.paa", [
            "intel Report Nr 332-Charlie", "Lorem Ipsum dolor sit amet, etc etc"
        ], "Lorem Ipsum", "Search Files", west, true
    ]
] call TFS_fnc_initinspectableintel;
(end)

Author:
Mokka,
MitchJC
*/

// todo: Allow sharing the intel with specific groups, units and whatnot (needs
// testing, sharing with side and one specific TFS group works though)

if (!isServer) exitwith {};

_this params ["_object", "_args"];
_args params [
    ["_texture", "a3\data_f\clear_empty.paa"],
    ["_diarypicture", "a3\data_f\clear_empty.paa"],
    "_diaryRecord",
    ["_fullScreentext", ""],
    ["_actionTitle", "Take intel"],
    ["_sharedwith", west],
    ["_notifyside", false]
];

// Make the object inspectable
[_object, _texture, _fullScreentext] remoteExec ["BIS_fnc_initinspectable", 0, true];

// Add the action
[_object, _actionTitle, _diaryRecord select 0] remoteExec ["TFS_fnc_setintelaction", 0, true];

// set the diary picture
_object setVariable [
    "RscAttributeDiaryRecord_texture",
    // Path to picture
    _diarypicture,
    true
];

// Diary Title and Description
_diaryRecord append [""];
[
    _object,
    "RscAttributeDiaryRecord",
    // [ Title, Description, "" ]
    _diaryRecord
] call BIS_fnc_setServerVariable;

if (typeName _sharedwith == "strinG") then {
    _recipients = [];
    {
        if (side _x == west && {
            _x getVariable ["TFS_section", "Command"] == _sharedwith
        }) then {
            _recipients pushBackUnique _x;
        };
    } forEach allgroups;
} else {
    _recipients = _sharedwith;
};

// Diary entry shared with.. follows BIS_fnc_MP target rules
_object setVariable ["recipients", _recipients, true];

// sides that can interact with intelObject
_object setVariable ["RscAttributeowners", [_sharedwith], true];

// Add intel object scripted event that systemChats to all clients when found and by who
if (_notifyside) then {
    [
        _object,
        "intelObjectFound",
        {
            params[ "", "_foundBy" ];
            [format ["intel collected by %1", name _foundBy], [1, -0.2], "#339900", 0.5] call TFS_fnc_dynamictext;
        }
    ] call BIS_fnc_addScriptedEventHandler;
};