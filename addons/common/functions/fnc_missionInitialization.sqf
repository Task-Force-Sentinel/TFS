#include "script_component.hpp"
/*
Author: NemesisRE

Description:
Shows initialization message

*/

if (GVAR(skipMissioninit)) exitwith {};

private _lastState = TFS_unit call EFUNC(loadout, checkSavedunitstate);
if !(count _lastState == 0) exitwith {};

if (vehicle TFS_unit == TFS_unit) then {
    if (mod_ACE3) then {
        [TFS_unit, currentWeapon TFS_unit, currentMuzzle TFS_unit] call ACE_Safemode_fnc_lockSafety;
    };
    if (primaryWeapon TFS_unit != "") then {
        TFS_unit playMove "AmovPercMstpSlowWrflDnon";
    } else {
        if (handgunWeapon TFS_unit != "") then {
            TFS_unit playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon";
        };
    };
};

switch (GVAR(missionintro)) do {
    case 1: {
        private _uavintro = [] call FUNC(uavintro);
        
        waitUntil {
            scriptDone _uavintro
        };
        
        switch (GVAR(uavintroVision)) do {
            case 1: {
                camUseNVG false
            };
            case 2: {
                false setCamUseTI 0
            };
            case 3: {
                false setCamUseTI 1
            };
            case 4: {
                false setCamUseTI 2
            };
            case 5: {
                false setCamUseTI 3
            };
            case 6: {
                false setCamUseTI 4
            };
            case 7: {
                false setCamUseTI 5
            };
            case 8: {
                false setCamUseTI 6
            };
            case 9: {
                false setCamUseTI 7
            };
        };
    };
    case 2: {
        titleCut ["", "BLACK FADED", 999];
        titleText [".", "PLAin doWN"];
        titleFadeOut 5;
        sleep 5;
        {
            titleText [_x, "PLAin"];
            titleFadeOut 10;
            sleep 10;
        } forEach (parseSimpleArray GVAR(introtext));
        titleCut ["", "BLACK in", 9];
    };
    case 3: {
        [parseSimpleArray GVAR(introtext)] spawn BIS_fnc_typetext;
    };
    case 0;
    default {};
};

[] call FUNC(playerinit);