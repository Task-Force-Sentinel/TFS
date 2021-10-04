#include "\z\tfs\addons\common\script_component.hpp"

#include "XEH_PREP.sqf"
#include "initsettings.sqf"

ADdoN = false;

TFS_unit = objNull;
uiNamespace setVariable ["TFS_unit", objNull];

enableSaving [false, false];
// Disables save when aborting.
enableteamSwitch false;
// Disables team switch.

// Disable all AI chatter
player setVariable ["BIS_noCoreConversations", true];
// Disable AI chatter.
enableSentences false;
// Disable AI chatter.
enableradio false;
// Disable AI radio.

ADdoN = true;

if is3DEN call {
    call FUNC(edeninit);
};

isTFS = ((getMissionConfigValue ["VERSION", [0, 0, 0]] select 0) > 0);

// Rig up server event handler for variable sync requests.
if (isServer) then {
    [QGVAR(requestServerSync), {
        // Delay a frame.
        [{
            params ["_clientownerId"];
            [QGVAR(serverVariableSyncResponse), [], _clientownerId] call CBA_fnc_ownerEvent;
        }, _this] call CBA_fnc_execNextFrame;
    }] call CBA_fnc_addEventHandler;
};

GVAR(ace) = IS_mod_loadED(ace_common);
GVAR(aceArsenal) = IS_mod_loadED(ace_arsenal);
GVAR(aceFatigue) = IS_mod_loadED(ace_advanced_fatigue);
GVAR(aceFastroping) = IS_mod_loadED(ace_fastroping);
GVAR(aceFinger) = IS_mod_loadED(ace_finger);
GVAR(aceHearing) = IS_mod_loadED(ace_hearing);
GVAR(aceinteractMenu) = IS_mod_loadED(ace_interact_menu);
GVAR(aceMedical) = IS_mod_loadED(ace_medical_engine);
GVAR(aceSafemode) = IS_mod_loadED(ace_safemode);
GVAR(aceTagging) = IS_mod_loadED(ace_tagging);
GVAR(acre) = IS_mod_loadED(acre_main);
GVAR(tfar) = IS_mod_loadED(tfar_core);
GVAR(playerMarkerIdx) = 0;

// Handling for running code after settings are initialized
GVAR(settingsinitialized) = false;
GVAR(runAftersettingsinit) = [];

["CBA_settingsinitialized", {
    GVAR(settingsinitialized) = true;
    
    {
        _x params ["_function", "_args"];
        _args call _function;
    } forEach GVAR(runAftersettingsinit);
    
    GVAR(runAftersettingsinit) = nil;
}] call CBA_fnc_addEventHandler;