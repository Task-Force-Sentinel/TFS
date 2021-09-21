#include "script_component.hpp"
/*
	Author: NemesisRE

	Description:
	Shows initialization message

*/

if (GVAR(skipMissionInit)) exitWith {};

private _lastState = TFSRHS_unit call EFUNC(loadout,checkSavedUnitState);
if !(count _lastState == 0) exitWith {};

if ( vehicle TFSRHS_unit == TFSRHS_unit ) then {
    if (mod_ACE3) then {
        [TFSRHS_unit, currentWeapon TFSRHS_unit, currentMuzzle TFSRHS_unit] call ACE_SafeMode_fnc_lockSafety;
    };
    if ( primaryWeapon TFSRHS_unit != "" ) then {
        TFSRHS_unit playMove "AmovPercMstpSlowWrflDnon";
    } else {
        if ( handgunWeapon TFSRHS_unit != "" ) then {
            TFSRHS_unit playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon";
        };
    };
};

switch (GVAR(missionIntro)) do {
    case 1: {
                private _uavIntro = [] call FUNC(uavIntro);

                waitUntil {scriptDone _uavIntro};

                switch (GVAR(uavIntroVision)) do {
                    case 1: {camUseNVG false};
                    case 2: {false setCamUseTI 0};
                    case 3: {false setCamUseTI 1};
                    case 4: {false setCamUseTI 2};
                    case 5: {false setCamUseTI 3};
                    case 6: {false setCamUseTI 4};
                    case 7: {false setCamUseTI 5};
                    case 8: {false setCamUseTI 6};
                    case 9: {false setCamUseTI 7};
                };
            };
    case 2: {
                titleCut ["", "BLACK FADED", 999];
                titleText [".","PLAIN DOWN"];
                titleFadeOut 5;
                sleep 5;
                {
                    titleText [_x,"PLAIN"];
                    titleFadeOut 10;
                    sleep 10;
                } forEach (parseSimpleArray GVAR(introText));
                titleCut ["", "BLACK IN", 9];
            };
    case 3: {
                [parseSimpleArray GVAR(introText)] spawn BIS_fnc_typeText;
            };
    case 0;
    default {};
};

[] call FUNC(playerInit);
