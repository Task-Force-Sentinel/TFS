#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];
uiNamespace setVariable [QGVAR(modalDisplay), _display];

GVAR(modalDetails) params ["_utilityFunction", "_utilityname"];
(_display displayCtrl IDC_TFS_adminMENU_modAL_TITLE) ctrlsettext _utilityname;
(_display displayCtrl IDC_TFS_adminMENU_G_modAL) call (missionnamespace getVariable _utilityFunction);