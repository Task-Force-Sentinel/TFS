params ["_display"];
#include "\z\tfs\addons\spectator\script_component.hpp"

uiNamespace setVariable [QGVAR(display), _display];
GVAR(unitUpdate) = -1;
// force unit list to update.
GVAR(vehicles) = [];
with uiNamespace do {
    GVAR(display) = _display;
    GVAR(unitlabel) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_UNITLABEL;
    GVAR(unitlist) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_UNITlist;
    
    GVAR(vision) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_VISION;
    
    GVAR(filter) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_FILTER;
    GVAR(side) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_BUTtoN;
    GVAR(tagsbutton) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_TAGS;
    GVAR(view) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_VIEW;
    GVAR(mute) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_MUTE;
    GVAR(radio) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_radIO;
    GVAR(map) = _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_MAP;
    GVAR(compass) = [_display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_COMPASSLEFT, _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_COMPASS, _display displayCtrl IDC_SPECTAtor_TFS_SPECTAtor_COMPASSRight];
    
    private _labelParent = _display displayCtrl 2300;
    GVAR(labels) = [
        _labelParent controlsgroupCtrl 6,
        _labelParent controlsgroupCtrl 7,
        _labelParent controlsgroupCtrl 8,
        _labelParent controlsgroupCtrl 9,
        _labelParent controlsgroupCtrl 10,
        _labelParent controlsgroupCtrl 11
    ];
    
    GVAR(map) ctrlShow (missionnamespace getVariable [QGVAR(showMap), false]);
    GVAR(map) mapCenterOnCamera false;
};

if (!GVAR(canSpectateAllsides)) then {
    GVAR(sides) = [tfs_spectator_entryside];
    GVAR(sides_button_mode) = [[tfs_spectator_entryside], []];
    GVAR(sides_button_strings) = ["SHOWinG YOUR side", "NONE"];
};

if (!isnil QGVAR(zeusPos) && {
    GVAR(freeCameraEnabled)
}) then {
    GVAR(mode) = FREECAM;
    [] call FUNC(setTarget);
    
    private _pitch = GVAR(zeuspitchBank) select 0;
    GVAR(followcam_angle) = [GVAR(zeusDir), _pitch];
    GVAR(camera) setPos GVAR(zeusPos);
    GVAR(camera) setDir GVAR(zeusDir);
    [GVAR(camera), _pitch, 0] call BIS_fnc_setPitchBank;
    GVAR(camera) camsetFov GVAR(followcam_fov);
    GVAR(camera) camCommit 0;
    GVAR(zeusPos) = nil;
} else {
    if (missionnamespace getVariable [QGVAR(mode), -1] isEqualto -1) then {
        private _allowedmodes = [GVAR(followCameraEnabled), GVAR(freeCameraEnabled), GVAR(firstPersonCameraEnabled)];
        {
            if (_x) exitwith {
                GVAR(mode) = _forEachindex;
                [] call FUNC(setTarget);
            };
        } forEach _allowedmodes;
    } else {
        [] call FUNC(setTarget);
    };
};

// if ACRE2 is enabled, enable the mute button
if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {
    [true] call acre_api_fnc_setSpectator;
    private _data = ["ACRE2", "Headset"] call CBA_fnc_getKeybind;
    GVAR(mute_key) = (_data select 5) select 0;
    GVAR(mute_modifers) = (_data select 5) select 1;
    
    // Add all languages
    if (!isnil "tfs_acre2_languagesTable") then {
        private _languages = tfs_acre2_languagesTable apply {
            _x select 0
        };
        _languages call acre_api_fnc_babelsetSpokenlanguages;
    };
} else {
    // else remove it
    with uiNamespace do {
        GVAR(mute) ctrlShow false;
        // hide mute button
        GVAR(radio) ctrlShow false;
    };
};

[QGVAR(displayOnload), [_display]] call CBA_fnc_localEvent;