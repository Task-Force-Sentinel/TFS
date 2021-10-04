#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

if (count GVAR(selectedRespawngroup) < 1) exitwith {
    hint "No players selected";
};

private _groupname = ctrltext (_display displayCtrl IDC_TFS_adminMENU_RESP_groupname);

// respawnMenufactions control.
private _control = (_display displayCtrl 26928);
private _faction = _control lbData (lbCurSel _control);

private _markername = ctrltext (_display displayCtrl IDC_TFS_adminMENU_RESP_groupMARKERname);
private _markertype = lbCurSel (_display displayCtrl IDC_TFS_adminMENU_RESP_markertype);
// type == -1 if no spawn marker
private _markerColor =lbCurSel (_display displayCtrl IDC_TFS_adminMENU_RESP_MARKERCOLOUR);

private _useMarker = cbChecked (_display displayCtrl IDC_TFS_adminMENU_RESP_groupMARKERCHECKBOX);
if (!_useMarker) then {
    // GVAR(respawngroupMarkerCheckBoxVal)
    _markertype = -1;
};

// Hand over control to the map dialog.
closedialog IDD_TFS_adminMENU;
createdialog QGVAR(respawnMapdialog);

GVAR(respawnGuiparameters) = [_faction, _groupname, _markertype, _markerColor, _markername];