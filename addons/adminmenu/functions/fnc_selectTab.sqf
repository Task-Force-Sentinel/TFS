#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display", ["_tab", IDC_TFS_adminMENU_G_DASH]];

_display call FUNC(utilityClose);

GVAR(selectedTab) = _tab;

while {count GVAR(tabPFHHandles) > 0} do {
    [GVAR(tabPFHHandles) deleteAt 0] call CBA_fnc_removePerFrameHandler;
};

{
    if (_tab isEqualto _x) then {
        (_display displayCtrl _x) ctrlShow true;
        (_display displayCtrl _x) ctrlEnable true;
    } else {
        (_display displayCtrl _x) ctrlShow false;
        (_display displayCtrl _x) ctrlEnable false;
    };
} forEach IDCS_TFS_adminMENU_GRPS;

switch (_tab) do {
    case IDC_TFS_adminMENU_G_DASH: {
        log("selected Dashboard");
        ctrlsetFocus (_display displayCtrl IDC_TFS_adminMENU_DASH);
        _display call FUNC(dashboard);
    };
    case IDC_TFS_adminMENU_G_PMAN: {
        log("selected player Management");
        ctrlsetFocus (_display displayCtrl IDC_TFS_adminMENU_PMAN);
        _display call FUNC(playerManagement);
    };
    case IDC_TFS_adminMENU_G_RESP: {
        log("selected Respawn");
        ctrlsetFocus (_display displayCtrl IDC_TFS_adminMENU_RESP);
        _display call FUNC(respawn);
    };
    case IDC_TFS_adminMENU_G_ENDM: {
        log("selected End Mission");
        ctrlsetFocus (_display displayCtrl IDC_TFS_adminMENU_ENDM);
        _display call FUNC(endMission);
    };
    case IDC_TFS_adminMENU_G_MSGS: {
        log("selected logs");
        ctrlsetFocus (_display displayCtrl IDC_TFS_adminMENU_MSGS);
        _display call FUNC(messagelog);
    };
};