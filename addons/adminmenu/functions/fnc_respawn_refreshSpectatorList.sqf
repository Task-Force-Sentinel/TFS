#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

private _ctrlSpectatorlistBox = (_display displayCtrl IDC_TFS_adminMENU_RESP_SPECTAtorlist);

lbClear _ctrlSpectatorlistBox;
{
    private _found = false;
    private _deadplayer = _x;
    
    // Check if already selected and thus in the selected respawn listBox.
    {
        if (_deadplayer == (_x select 1)) exitwith {
            _found = true;
        };
    } forEach GVAR(selectedRespawngroup);
    
    if (!_found) then {
        private _name = _deadplayer getVariable ["TFS_spectator_name", name _deadplayer];
        private _idx = _ctrlSpectatorlistBox lbAdd _name;
        _ctrlSpectatorlistBox lbsetData[_idx, _name];
    };
} forEach GVAR(spectatorlist);