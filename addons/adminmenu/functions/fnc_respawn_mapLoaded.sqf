#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

private _mapCtrl = ((findDisplay IDC_TFS_adminMENU_RESP_MAP_DISPLAY) displayCtrl IDC_TFS_adminMENU_RESP_MAP_CONTROL);
// _this select 0;//
private _pos = [0, 0, 0];

if (alive player && !(player isKindOf "TFS_spectator_unit")) then {
    _pos = getPos player;
} else {
    if (count playableunits > 0) then {
        _pos = getPos (playableunits select 0);
    } else {
        if (count allunits > 0) then {
            _pos = getPos (allunits select 0);
        };
    };
};
_mapCtrl ctrlmapAnimAdd [0, 0.1, _pos];
ctrlmapAnimCommit _mapCtrl;
GVAR(respawnMousePos) = -1;
GVAR(respawnHalo) = false;
hint "Click on the map or click on respawn location to draft a position. Hit enter to confirm. Spacebar toggles HALO option (only for user defined point).";