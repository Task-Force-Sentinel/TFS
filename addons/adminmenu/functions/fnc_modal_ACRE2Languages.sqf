#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_ctrlgroup"];

(ctrlposition _ctrlgroup) params ["", "", "_ctrlGrpWidth", "_ctrlGrpHeight"];

private _ctrlLabelLangs = _display ctrlCreate [QGVAR(RsctextLarge), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlLabelLangs;
_ctrlLabelLangs ctrlsetPosition [0, 0, (0.5 * _ctrlGrpWidth), TFS_adminMENU_STD_HEIGHT];
_ctrlLabelLangs ctrlCommit 0;
_ctrlLabelLangs ctrlsettext "Assign players' ACRE2 Babel languages";

if (count acre_sys_core_languages == 0) exitwith {
    _ctrlLabelLangs = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlLabelLangs;
    _ctrlLabelLangs ctrlsetPosition [0, 2.1 * TFS_adminMENU_STD_HEIGHT, (0.25 * _ctrlGrpWidth), TFS_adminMENU_STD_HEIGHT];
    _ctrlLabelLangs ctrlCommit 0;
    _ctrlLabelLangs ctrlsettext "No languages configured for mission!";
};

private _langY = 2.1 * TFS_adminMENU_STD_HEIGHT;
private _langComboCtrls = [];

{
    _x params ["_key", "_name"];
    
    private _ctrlLabelname = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlLabelname;
    _ctrlLabelname ctrlsetPosition [0, _langY + (_forEachindex * (1.1 * TFS_adminMENU_STD_HEIGHT)), (0.25 * _ctrlGrpWidth), TFS_adminMENU_STD_HEIGHT];
    _ctrlLabelname ctrlCommit 0;
    _ctrlLabelname ctrlsettext _name;
    
    private _ctrlComboaction = _display ctrlCreate [QGVAR(RscCombo), -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlComboaction;
    _langComboCtrls pushBack _ctrlComboaction;
    _ctrlComboaction ctrlsetPosition [0.5 * _ctrlGrpWidth, _langY + (_forEachindex * (1.1 * TFS_adminMENU_STD_HEIGHT)), 0.5 * _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
    _ctrlComboaction ctrlCommit 0;
    
    _ctrlComboaction lbsetValue [(_ctrlComboaction lbAdd "don't Change"), -1];
    _ctrlComboaction lbsetValue [(_ctrlComboaction lbAdd "Yes"), 1];
    _ctrlComboaction lbsetValue [(_ctrlComboaction lbAdd "No"), 0];
    _ctrlComboaction lbsetCurSel 0;
    _ctrlComboaction setVariable [QGVAR(association), _key];
} forEach acre_sys_core_languages;

private _ctrlButton = _display ctrlCreate [QGVAR(RscButtonMenu), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlButton;
_ctrlButton ctrlsetPosition [_ctrlGrpWidth * 0.8, _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT, _ctrlGrpWidth * 0.2, TFS_adminMENU_STD_HEIGHT];
_ctrlButton ctrlCommit 0;
_ctrlButton ctrlsettext "Assign languages";
_ctrlButton setVariable [QGVAR(association), _langComboCtrls];
_ctrlButton ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrlButton"];
    _ctrlButton call FUNC(debounceButton);
    
    private _langComboCtrls = _ctrlButton getVariable [QGVAR(association), []];
    private _langstoAdd = [];
    private _langstoremove = [];
    
    {
        private _lang = _x getVariable [QGVAR(association), ""];
        
        switch (_x lbValue lbCurSel _x) do {
            case 0: {
                _langstoremove pushBack _lang;
            };
            case 1: {
                _langstoAdd pushBack _lang;
            };
            default {};
        };
    } forEach _langComboCtrls;
    
    if (count _langstoAdd == 0) then {
        if (count _langstoremove == 0) exitwith {
            systemChat "[TFS admin Menu] No changes selected";
        };
        
        systemChat "[TFS admin Menu] Any change that would leave players with no language to speak will fail";
    };
    
    [_langstoAdd, _langstoremove] remoteExecCall [QFUNC(modal_ACRE2languages_assign), GVAR(utilityData)];
    
    systemChat format ["[TFS admin Menu] Assigned ACRE2 languages to %1 player(s)", count GVAR(utilityData)];
    [format ["%1 Assigned ACRE2 languages to %2", profileName, GVAR(utilityData) apply {
        name _x
    }], false, "admin Menu"] call FUNC(log);
}];