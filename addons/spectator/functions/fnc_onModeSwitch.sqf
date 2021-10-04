#include "\z\tfs\addons\spectator\script_component.hpp"
/*
* Author: Head
* Handles mode switching
*
* Arguments:
* None
*
* Return Value:
* None
*
*
* Public: not really
*/
switch(GVAR(mode)) do {
    case FREECAM : {
        if (GVAR(followCameraEnabled)) exitwith {
            GVAR(mode) = FOLLOWCAM;
            private _pitch = (GVAR(camera) call BIS_fnc_getpitchBank) select 0;
            GVAR(followcam_angle) = [(getDir GVAR(camera) + 180) mod 360, (_pitch+180) mod 360];
        };
        if (GVAR(firstPersonCameraEnabled)) exitwith {
            GVAR(mode) = FIRSTPERSON;
        };
    };
    case FOLLOWCAM: {
        if (GVAR(freeCameraEnabled)) exitwith {
            GVAR(mode) = FREECAM;
            GVAR(followcam_angle) = [getDir GVAR(camera), (GVAR(camera) call BIS_fnc_getpitchBank) select 0];
        };
        if (GVAR(firstPersonCameraEnabled)) exitwith {
            GVAR(mode) = FIRSTPERSON;
        };
    };
    case FIRSTPERSON: {
        if (GVAR(freeCameraEnabled)) exitwith {
            GVAR(mode) = FREECAM;
        };
        if (GVAR(followCameraEnabled)) exitwith {
            GVAR(mode) = FOLLOWCAM;
        };
    };
};