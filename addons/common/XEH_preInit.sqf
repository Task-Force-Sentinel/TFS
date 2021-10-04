#include "\z\tfs\addons\common\script_component.hpp"

#include "XEH_PREP.sqf"
#include "initSettings.sqf"

ADDON = false;

TFS_unit = objNull;
uiNamespace setVariable ["TFS_unit", objNull];

enableSaving [false,false]; // Disables save when aborting.
enableTeamSwitch false; // Disables team switch.

// Disable all AI chatter
player setVariable ["BIS_noCoreConversations",true]; // Disable AI chatter.
enableSentences false; // Disable AI chatter.
enableRadio false; // Disable AI radio.

ADDON = true;

if is3DEN call {
    call FUNC(edenInit);
};

isTFS = ((getMissionConfigValue ["VERSION",[0,0,0]] select 0) > 0);


// Rig up server event handler for variable sync requests.
if (isServer) then {
    [QGVAR(requestServerSync), {
        // Delay a frame.
        [{
            params ["_clientOwnerId"];
            [QGVAR(serverVariableSyncResponse), [], _clientOwnerId] call CBA_fnc_ownerEvent;
        }, _this] call CBA_fnc_execNextFrame;
    }] call CBA_fnc_addEventHandler;
};

GVAR(ace) = IS_MOD_LOADED(ace_common);
GVAR(aceArsenal) = IS_MOD_LOADED(ace_arsenal);
GVAR(aceFatigue) = IS_MOD_LOADED(ace_advanced_fatigue);
GVAR(aceFastroping) = IS_MOD_LOADED(ace_fastroping);
GVAR(aceFinger) = IS_MOD_LOADED(ace_finger);
GVAR(aceHearing) = IS_MOD_LOADED(ace_hearing);
GVAR(aceInteractMenu) = IS_MOD_LOADED(ace_interact_menu);
GVAR(aceMedical) = IS_MOD_LOADED(ace_medical_engine);
GVAR(aceSafemode) = IS_MOD_LOADED(ace_safemode);
GVAR(aceTagging) = IS_MOD_LOADED(ace_tagging);
GVAR(acre) = IS_MOD_LOADED(acre_main);
GVAR(tfar) = IS_MOD_LOADED(tfar_core);
GVAR(playerMarkerIdx) = 0;

// Handling for running code after settings are initialized
GVAR(settingsInitialized) = false;
GVAR(runAfterSettingsInit) = [];

["CBA_settingsInitialized", {
    GVAR(settingsInitialized) = true;

    {
        _x params ["_function", "_args"];
        _args call _function;
    } forEach GVAR(runAfterSettingsInit);

    GVAR(runAfterSettingsInit) = nil;
}] call CBA_fnc_addEventHandler;

