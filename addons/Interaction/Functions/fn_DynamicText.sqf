/*
Function: TFS_fnc_Dynamictext

Description:
Displays formatted dynamic text on player's screen. if the _global flag is
set to false, the text will only be displayed for the player that called the
function.

The position of the text must be given as an x-y coordinate in the format

_posX - X coordinate
_posY - Y coordinate

with _pos = [_posX, _posY]. The _colour of the text must be given in the
HTML hexadecimal format. to get your favourite colour in that format, look
here: https:// www.w3schools.com/colors/colors_picker.asp

_msg - The message that shall be displayed
_pos - The position of the text as an x-y coordinate in the above format
_colour - The colour of the text in HTML hexadecimal format
_size - The size of the text on-screen
_global - set to false to only show the message on the player's screen that called the function

Return Values:
None

Examples:
(begin example)
[
    "Lorem Ipsum dolor Sit Amet",
    [-1, 0.8], 	// This is the bottom-centre position on the screen
    "#ffffff", 	// White
    0.5,
    true
] call TFS_fnc_Dynamictext;
(end)

Author:
MitchJC, Mokka
*/

// if called on a client tell the server to execute this function instead!
if (!isServer) exitwith {
    _this remoteExec ["TFS_fnc_Dynamictext", 2];
};

params [
    "_msg",
    ["_pos", [-1, 0.8]],
    ["_colour", "#ffffff"],
    ["_size", 0.5],
    ["_global", true],
    ["_duration", 5],
    ["_fadeinfor", 2]
];

_pos params ["_posX", "_posY"];

private _formstring = "<t color='#%2' size='%3'>%1</t>";
private _rscLayer = 789;

_rexecTarget = 0;

if (not _global) then {
    _rexecTarget = remoteExecutedOwner;
};

[
    format [_formstring, _msg, _colour, _size],
    _posX,
    _posY,
    _duration,
    _fadeinfor,
    0,
    _rscLayer
] remoteExec ["BIS_fnc_dynamictext", _rexecTarget];