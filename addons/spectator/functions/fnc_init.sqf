#include "\z\tfs\addons\spectator\script_component.hpp"

if ((_this select 2) isEqualtype 0) then {
    _this set [2, false]
};
params ["_unit", "_oldUnit", ["_forced", false, [false]]];

if (typeOf _unit == "seagull") then {
    _unit setPos [0, 0, 5];
    [{
        params ["_seagull"];
        if (player != _seagull) then {
            deletevehicle _seagull;
        };
    }, [_unit], 5] call CBA_fnc_waitandexecute;
};

// On Re-Open purge any old controls (as they will exist on an old display)
if (!isnil QGVAR(controls)) then {
    {
        _x setVariable [QGVAR(tagControl), nil];
    } forEach allunits;
    {
        _x setVariable [QGVAR(tagControl), nil];
    } forEach allgroups;
    {
        ctrlDelete _x
    } forEach GVAR(controls);
    GVAR(controls) = [];
};

if(!isnil QGVAR(unit) && {
    player == GVAR(unit)
}) exitwith {
    createdialog QGVAR(dialog);
};

// Wait until mission is loaded properly. Prevents JIP issues.
waitUntil {
    !isNull ([] call BIS_fnc_DisplayMission)
};

private _isJip = didJIP;

// disable this to instantly switch to the spectator script.
waitUntil {
    missionnamespace getVariable ["BIS_fnc_feedback_allowDeathScreen", false] || isNull (_oldUnit) || _isJip || _forced
};

// Disable effects
// disable effects death effects
if (!isnil "BIS_fnc_feedback_allowPP") then {
    BIS_fnc_feedback_allowPP = false;
};

if (_isJip) then {
    [] spawn {
        [QGVAR(blackout), false] call BIS_fnc_blackOut;
        uiSleep 3;
        [QGVAR(blackout)] call BIS_fnc_blackin;
    };
};

if (isnil QGVAR(unit)) then {
    GVAR(unit) = objNull
};

// Create a Virtual agent to act as our player to make sure we get to keep Draw3D
if (isNull GVAR(unit) || !(typeOf GVAR(unit) isEqualto QGVAR(unit))) then {
    if (isNull GVAR(group)) then {
        /* incase spectator group is null */
        createCenter sideLogic;
        GVAR(group) = creategroup sideLogic;
        
        if (isNull GVAR(group)) then {
            createCenter civilian;
            GVAR(group) = creategroup civilian;
        };
        
        publicVariable QGVAR(group);
    };
    
    private _newUnit = (GVAR(group)) createUnit [QGVAR(unit), [0, 0, 5], [], 0, "forM"];
    if (isNull _newUnit) then {
        // Unable to create new unit - Usually if too many groups for sideLogic exist.
        
        GVAR(unit) = _oldUnit;
    } else {
        _newUnit allowdamage false;
        _newUnit hideObjectglobal true;
        _newUnit enableSimulationGlobal false;
        _newUnit setPos [0, 0, 5];
        
        // save some infomation regarding the units death and role etc.
        _newUnit setVariable [QGVAR(name), profileName, true];
        
        _newUnit setVariable [QGVAR(unitData),
            [
                group _oldUnit,
                _oldUnit getVariable [QEGVAR(assignGear, faction), ""],
                _oldUnit getVariable [QEGVAR(assignGear, role), ""],
                side (group _oldUnit),
                getPos _oldUnit,
                objectParent _oldUnit
            ],
            true
        ];
        
        selectPlayer _newUnit;
        GVAR(unit) = _newUnit;
    };
} else {
    selectPlayer GVAR(unit);
};

// if oldunit is null set a new starting target
if (isNull _oldUnit) then {
    _oldUnit = allunits select 0
};

GVAR(entryside) = side _oldUnit;

if(!isnil QGVAR(freeCam) && {
    !isNull GVAR(freeCam)
}) exitwith {
    createdialog QGVAR(dialog);
};

GVAR(freeCam) = "camera" camCreate [position _oldUnit # 0, position _oldUnit # 1, 3];
GVAR(followCam) = "camera" camCreate [position _oldUnit # 0, position _oldUnit # 1, 3];
GVAR(camera) = GVAR(followCam);
GVAR(target) = _oldUnit;

if (isnil QGVAR(objectives)) then {
    GVAR(objectives) = [];
};

// UI
GVAR(showUI) = true;
GVAR(interfaceControls) = [
    IDC_SPECTAtor_TFS_SPECTAtor_KILlist, IDC_SPECTAtor_TFS_SPECTAtor_UNITLABEL,
    IDC_SPECTAtor_TFS_SPECTAtor_UNITlist, IDC_SPECTAtor_TFS_SPECTAtor_VISION,
    IDC_SPECTAtor_TFS_SPECTAtor_FILTER, IDC_SPECTAtor_TFS_SPECTAtor_BUTtoN,
    IDC_SPECTAtor_TFS_SPECTAtor_TAGS, IDC_SPECTAtor_TFS_SPECTAtor_VIEW,
    IDC_SPECTAtor_TFS_SPECTAtor_COMPASS, IDC_SPECTAtor_TFS_SPECTAtor_COMPASSLEFT,
    IDC_SPECTAtor_TFS_SPECTAtor_COMPASSRight, IDC_SPECTAtor_TFS_SPECTAtor_MUTE,
    IDC_SPECTAtor_TFS_SPECTAtor_radIO, IDC_SPECTAtor_TFS_SPECTAtor_MENUBACK
];

GVAR(vehicles) = [];
GVAR(tracers) = true;
GVAR(bulletTrails) = false;
GVAR(showMap) = false;
GVAR(controls) = [];

showCinemaBorder false;
GVAR(camera) cameraEffect ["internal", "back"];

// setup follow cam
private _pos = getPosVisual GVAR(target);
_pos set [2, (_pos select 2)+1.3];
GVAR(followCam) camsetTarget _pos;
GVAR(followCam) camsetRelPos [2, 2, 3];
GVAR(relpos) = [2, 2, 3];

// set FOV
GVAR(followCam) camsetFov 1.2;
GVAR(freeCam) camsetFov 1.2;

// commit it
GVAR(freeCam) camCommit 0;
GVAR(camera) camCommit 0;
// 0 follow cam, 1 freecam, 2 firstperson
GVAR(mode) = FOLLOWCAM;
GVAR(allowed_modes) = [GVAR(followCameraEnabled), GVAR(freeCameraEnabled), GVAR(firstPersonCameraEnabled)];
{
    if (_x) exitwith {
        GVAR(mode) = _forEachindex;
    };
} forEach GVAR(allowed_modes);

// sides Button
GVAR(sides) = [blufor, civilian, opfor, independent];
GVAR(sides_button_state) = 0;
GVAR(sides_button_mode) = [
    [blufor, civilian, opfor, independent],
    [blufor],
    [opfor],
    [independent],
    [civilian]
];
GVAR(sides_button_strings) = ["SHOWinG ALL sideS", "SHOWinG blufor", "SHOWinG opfor", "SHOWinG independent", "SHOWinG civilian"];

if (!GVAR(canSpectateAllsides)) then {
    GVAR(sides) = [tfs_spectator_entryside];
    GVAR(sides_button_mode) = [[tfs_spectator_entryside]];
    GVAR(sides_button_strings) = ["SHOWinG YOUR side"];
};

GVAR(visionmode) = 0;
GVAR(visionmode_strings) = ["NorMAL", "NIGHTVISION", "WHITE HOT"];

GVAR(playersOnly) = false;
if (isMultiplayer) then {
    GVAR(playersOnly) = true;
};

// Mouse values
GVAR(mButtons) = [false, false];
GVAR(mPos) = [0, 0];
GVAR(lmPos) = [0, 0];

// Follow cam values
GVAR(followcam_angle) = [0, 0];
GVAR(followcam_zoom) = 0.3;
GVAR(followcam_fov) = 0.7;

// Freecam values
GVAR(freecam_zoom) = 0;
GVAR(freecam_move) = [0, 0, 0];
GVAR(freecam_timestamp) = time;
GVAR(rounds) = [];

// WASD Q/E scroll
GVAR(movement_keys) = [false, false, false, false, false, false, 0];

// Ctrl, alt, shift
GVAR(modifiers_keys) = [false, false, false];

// Tags
GVAR(tags) = true;
GVAR(showlines) = false;

GVAR(cleargroups) = false;
GVAR(unitUpdate) = 0;
GVAR(killedunits) = [];
GVAR(killlist_forceUpdate) = false;
GVAR(killlist_update) = time;
// set modes
cameraEffectEnableHUD true;
showCinemaBorder false;
GVAR(mute_key) = -1;
GVAR(mute_modifers) = [false, false, false];

createdialog QGVAR(dialog);

// Add to the text channel.
GVAR(radioChannel) radioChannelAdd [player];
setCurrentChannel (GVAR(radioChannel)+5);
// Disable normal channels
{
    _x enableChannel false;
} forEach [1, 2, 3, 4, 5];

// Enable global if admin
if !([] call tfs_common_fnc_isadmin) then {
    0 enableChannel false;
};

if (isnil QGVAR(setupEH)) then {
    addMissionEventHandler ["EntityKilled", FUNC(onEntityKilled)];
    ["Allvehicles", "fired", {
        if ([] call FUNC(isOpen)) then {
            _this call FUNC(onfired)
        }
    }] call CBA_fnc_addClassEventHandler;
    ["Allvehicles", "hit", {
        if ([] call FUNC(isOpen)) then {
            (_this select 0) setVariable [QGVAR(lastdamage), (_this select 3)]
        }
    }] call CBA_fnc_addClassEventHandler;
    GVAR(setupEH) = true;
};

GVAR(messages) = [];
GVAR(compassValues) = ["N", "NE", "E", "SE", "S", "SW", "W", "NW", "N", "NE"];
GVAR(lastCompassValue) = ["A", "B", "C"];
GVAR(lastControlindex) = 0;

GVAR(perFrameHandle) = [FUNC(perFrameHandler)] call CBA_fnc_addPerFrameHandler;
GVAR(handleCameraHandle) = [FUNC(handleCamera)] call CBA_fnc_addPerFrameHandler;
GVAR(processData) = [FUNC(processData), 1] call CBA_fnc_addPerFrameHandler;
if (isnil QGVAR(drawEvent)) then {
    // We use the Draw3D here due to it only running when a user can see it.
    GVAR(drawEvent) = addMissionEventHandler ["Draw3D", {
        [] call FUNC(drawTags);
    }];
};

[QGVAR(init), _this] call CBA_fnc_localEvent;