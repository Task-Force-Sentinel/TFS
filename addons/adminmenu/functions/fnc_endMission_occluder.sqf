#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display", ["_checkboxIDC", IDC_TFS_adminMENU_ENDM_fromMISSION, [0]]];

private _occludertext = switch (_checkboxIdc) do {
    case IDC_TFS_adminMENU_ENDM_fromMISSION: {
        "Using Ending from Mission"
    };
    case IDC_TFS_adminMENU_ENDM_sideSPECifIC: {
        "Using side-Specific Ending"
    };
    case IDC_TFS_adminMENU_ENDM_CUStoM: {
        "Using Custom Ending"
    };
    default {
        "..."
    };
};

{
    (_display displayCtrl _x) ctrlsettext _occludertext;
} forEach IDCS_TFS_adminMENU_ENDM_OCCLUDERS;

private _usefromMission = (_checkboxIdc isEqualto IDC_TFS_adminMENU_ENDM_fromMISSION);
(_display displayCtrl IDC_TFS_adminMENU_ENDM_fromMISSION) cbsetChecked _usefromMission;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_list) ctrlEnable _usefromMission;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_fromMISSION_ISDEFEAT) ctrlEnable _usefromMission;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_OCCLUDER_LU) ctrlEnable !_usefromMission;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_OCCLUDER_LU) ctrlShow !_usefromMission;

private _usesideSpecific = (_checkboxIdc isEqualto IDC_TFS_adminMENU_ENDM_sideSPECifIC);
(_display displayCtrl IDC_TFS_adminMENU_ENDM_sideSPECifIC) cbsetChecked _usesideSpecific;
{
    (_display displayCtrl _x) ctrlEnable _usesideSpecific;
} forEach IDCS_TFS_adminMENU_ENDM_sideSPECifIC;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_OCCLUDER_R) ctrlEnable !_usesideSpecific;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_OCCLUDER_R) ctrlShow !_usesideSpecific;

private _useCustom = (_checkboxIdc isEqualto IDC_TFS_adminMENU_ENDM_CUStoM);
(_display displayCtrl IDC_TFS_adminMENU_ENDM_CUStoM) cbsetChecked _useCustom;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_CUStoM_TITLE) ctrlEnable _useCustom;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_CUStoM_SUBtext) ctrlEnable _useCustom;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_CUStoM_ISDEFEAT) ctrlEnable _useCustom;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_OCCLUDER_LD) ctrlEnable !_useCustom;
(_display displayCtrl IDC_TFS_adminMENU_ENDM_OCCLUDER_LD) ctrlShow !_useCustom;