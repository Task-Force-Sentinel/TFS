/*
Function: TFS_fnc_initScreen

Description:
initializes a Screen for the Command Centre based on the passed parameters.

Arguments:
_object - Screen object
_name - name of the screen, used for the actions
_allowCam - if true, allows viewing Helmet Cameras through the screen
_allowDrone - if true, allows viewing Drone Cameras through the screen
_allowSat - if true, allows viewing Satellite imagery through the screen
_allowMap - if true, allows viewing the Tactical Map through the screen
_selection - The texture selection of the screen content

Return Values:
nothing.

Examples:
nothing to see here

Author:
Mokka
*/

params [
    "_object",
    "_name",
    ["_allowCam", true],
    ["_allowDrone", true],
    ["_allowSat", true],
    ["_allowMap", true],
    ["_selection", 0]
];

if !(isServer) exitwith {};
if !(isClass (configFile >> "CfgPatches" >> "cTab")) exitwith {};

// register screen, important to properly assign the render targets later down the line
if (isnil "TFS_CC_nextScreenID") then {
    TFS_CC_nextScreenID = 0;
};

_object setVariable [format ["TFS_CC_screen_%1_ID", _selection], TFS_CC_nextScreenID, true];

TFS_CC_nextScreenID = TFS_CC_nextScreenID + 1;

_object setVariable [format ["TFS_CC_screen_%1_on", _selection], false, true];
_object setVariable [format ["TFS_CC_screen_%1_mode", _selection], "", true];
_object setVariable [format ["TFS_CC_screen_%1_target", _selection], "", true];

// set default screen texture
_object setobjecttextureGlobal [_selection, "z\tfs\addons\media\images\cc_screen_standby.paa"];

[_object, _selection, _name, [_allowCam, _allowDrone, _allowSat, _allowMap]] remoteExec ["TFS_fnc_addScreenactions", 0, true];