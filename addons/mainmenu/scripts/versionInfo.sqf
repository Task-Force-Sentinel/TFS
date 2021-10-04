#include "\a3\ui_f\hpp\defineResinclDesign.inc"
/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\mainmenu\scripts\versioninfo.sqf
*	by Ojemineh
*
*	show version info box
*
*	Arguments:
*	0: Display	- <DISPLAY>
*
*	Return:
*	nothing
*
*	Example:
*	[0] execVM "\z\tfs\addons\mainmenu\scripts\versioninfo.sqf";
*
*/

// -------------------------------------------------------------------------------------------------

params ["_display"];

private _controlsgroup = _display displayCtrl 90090;

// -------------------------------------------------------------------------------------------------

private _projectopfor = isClass (configFile >> "CfgPatches" >> "po_main");

// -------------------------------------------------------------------------------------------------

if (profileNamespace getVariable ["tfs_showNewsOnMainMenu", true]) then {
    if (_projectopfor) then {
        private _poCtrl = _display displayCtrl 1299;
        _poCtrl ctrlShow false;
    };
    
    _controlsgroup ctrlShow true;
    
    private _fnc_onsetFocus = {
        params ["_control"];
        private _controlsgroup = ctrlParentControlsgroup _control;
        
        (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_BACKGround) ctrlsettextColor [1, 1, 1, 1];
        (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_BACKGround_ICON) ctrlsettextColor [1, 1, 1, 1];
        (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_ICON) ctrlsettextColor [0, 0, 0, 1];
    };
    
    private _fnc_onKillFocus = {
        params ["_control"];
        private _controlsgroup = ctrlParentControlsgroup _control;
        
        (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_BACKGround) ctrlsettextColor [0, 0, 0, 0.75];
        (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_BACKGround_ICON) ctrlsettextColor [0, 0, 0, 0.75];
        (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_ICON) ctrlsettextColor [1, 1, 1, 0.5];
    };
    
    (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_BUTtoN) ctrlAddEventHandler ["MouseEnter", _fnc_onsetFocus];
    (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_BUTtoN) ctrlAddEventHandler ["Mouseexit", _fnc_onKillFocus];
    (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_BUTtoN) ctrlAddEventHandler ["setFocus", _fnc_onsetFocus];
    (_controlsgroup controlsgroupCtrl IDC_MAin_inFO_BUTtoN) ctrlAddEventHandler ["KillFocus", _fnc_onKillFocus];
    
    private _versionstr = gettext (configFile >> "CfgPatches" >> "tfs_main" >> "versionstr") splitstring ".";
    _versionstr resize 3;
    _versionstr = _versionstr joinstring ".";
    
    (_display displayCtrl 90091) ctrlsettext format ["Version: %1", _versionstr];
    (_display displayCtrl 90092) htmlload (localize "str_TFS_Main_URL_Version");
} else {
    _controlsgroup ctrlShow false;
    
    if (_projectopfor) then {
        private _poCtrl = _display displayCtrl 1299;
        _poCtrl ctrlShow true;
    };
};