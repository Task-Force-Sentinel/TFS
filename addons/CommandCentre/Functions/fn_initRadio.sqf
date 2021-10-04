/*
Function: TFS_fnc_initradio

Description:
initializes a Stationary radio for use with the Command Centre.

Arguments:
_object - radio object
_radioOn - Turn radio on by default?
_radioCh1 - default frequency of Channel 1
_radioCh2 - default frequency of Channel 2
_radioVol - default radio Volume

Return Values:
nothing.

Examples:
nothing to see here

Author:
Mokka
*/

params [
    "_object",
    ["_radioClass", "TFAR_anarc210"],
    ["_radioOn", true],
    ["_radioCh1", 30],
    ["_radioCh2", 40],
    ["_radioVol", 7],
    ["_radioCode", "_bluefor"]
];

if !(isServer) exitwith {};
if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitwith {};

// Create new radio object at 0, 0 for setup
private _radioContainer = createvehicle ["GroundWeaponHolder_Scripted", (getPosATL _object), [], 0, "CAN_COLLIDE"];
_radioContainer allowdamage false;
hideObjectglobal _radioContainer;

_radioContainer addbackpackCargoGlobal [_radioClass, 1];

// instanciate radio
private _radio = _radioContainer call TFAR_static_radios_fnc_instanciatedradio;
_radio = [_radio, "radio_settings"];

// set up TFAR settings for the radio
private _settings = [0, (_radioVol - 1), [(str _radioCh1), (str _radioCh2)], 0, _radioCode, 1, 0, nil, _radioOn, true];
// _radio setVariable ["radio_settings", _settings, true];
[_radio, _settings] call TFAR_fnc_setLrsettings;

(_radio select 0) setVariable ["TFAR_LRspeakersEnabled", _radioOn, true];

_object setVariable ["TFS_CC_radioObject", _radio, true];

// done setting up, now add the actions for channel switching etc.
[_object, _radio] remoteExec ["TFS_fnc_addradioactions", 0, true];