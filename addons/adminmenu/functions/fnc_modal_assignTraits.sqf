#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_ctrlgroup"];

(ctrlposition _ctrlgroup) params ["", "", "_ctrlGrpWidth", "_ctrlGrpHeight"];

private _ctrlLabelTraits = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlLabelTraits;
_ctrlLabelTraits ctrlsetPosition [0, 0, (0.25 * _ctrlGrpWidth), TFS_adminMENU_STD_HEIGHT];
_ctrlLabelTraits ctrlCommit 0;
_ctrlLabelTraits ctrlsettext "Assign players' Traits";

private _ctrlComboTraitLabelW = 0.4 * _ctrlGrpWidth;
private _ctrlComboTraitX = 0.5 * _ctrlGrpWidth;
private _ctrlComboTraitY = 2.2 * TFS_adminMENU_STD_HEIGHT;
private _ctrlComboTraitW = 0.5 * _ctrlGrpWidth;
private _traitComboCtrls = [];

{
    private _ctrlLineY = _ctrlComboTraitY + _forEachindex * (1.1 * TFS_adminMENU_STD_HEIGHT);
    
    private _ctrlComboTraitLabel = _display ctrlCreate [QGVAR(RsctextLarge), -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlComboTraitLabel;
    _ctrlComboTraitLabel ctrlsetPosition [0.1 * TFS_adminMENU_STD_WIDTH, _ctrlLineY, _ctrlComboTraitLabelW, TFS_adminMENU_STD_HEIGHT];
    _ctrlComboTraitLabel ctrlCommit 0;
    _ctrlComboTraitLabel ctrlsettext _x;
    
    private _ctrlComboTrait = _display ctrlCreate [QGVAR(RscCombo), -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlComboTrait;
    _traitComboCtrls pushBack _ctrlComboTrait;
    _ctrlComboTrait ctrlsetPosition [_ctrlComboTraitX, _ctrlLineY, _ctrlComboTraitW, TFS_adminMENU_STD_HEIGHT];
    _ctrlComboTrait ctrlCommit 0;
    
    _ctrlComboTrait lbsetValue [(_ctrlComboTrait lbAdd "don't Change"), -1];
    _ctrlComboTrait lbsetCurSel 0;
    
    if (_x isEqualto "Medic" && isClass (configFile >> "CfgPatches" >> "ace_medical")) then {
        _ctrlComboTrait lbsetValue [(_ctrlComboTrait lbAdd "Medic (1)"), 1];
        _ctrlComboTrait lbsetValue [(_ctrlComboTrait lbAdd "doctor (2)"), 2];
        _ctrlComboTrait lbsetValue [(_ctrlComboTrait lbAdd "Untrained (0)"), 0];
    } else {
        _ctrlComboTrait lbsetValue [(_ctrlComboTrait lbAdd "Yes"), 1];
        _ctrlComboTrait lbsetValue [(_ctrlComboTrait lbAdd "No"), 0];
    };
} forEach ["Medic", "Engineer", "explosive Specialist", "UAV Hacker"];

private _ctrlButton = _display ctrlCreate [QGVAR(RscButtonMenu), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlButton;
_ctrlButton ctrlsetPosition [_ctrlGrpWidth * 0.8, _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT, _ctrlGrpWidth * 0.2, TFS_adminMENU_STD_HEIGHT];
_ctrlButton ctrlCommit 0;
_ctrlButton ctrlsettext "Assign Traits";
_ctrlButton setVariable [QGVAR(association), _traitComboCtrls];
_ctrlButton ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrlButton"];
    _ctrlButton call FUNC(debounceButton);
    
    private _traitComboCtrls = _ctrlButton getVariable [QGVAR(association), []];
    _traitComboCtrls params ["_comboMed", "_comboEng", "_comboexp", "_comboUAV"];
    
    private _valueMed = _comboMed lbValue lbCurSel _comboMed;
    private _valueEng = _comboEng lbValue lbCurSel _comboEng;
    private _valueexp = _comboexp lbValue lbCurSel _comboexp;
    private _valueUAV = _comboUAV lbValue lbCurSel _comboUAV;
    
    {
        if (_valueMed != -1) then {
            _x setUnitTrait ["medic", _valueMed > 0];
            _x setVariable ["ace_medical_medicClass", _valueMed, true];
        };
        
        if (_valueEng != -1) then {
            _x setUnitTrait ["engineer", _valueEng > 0];
            _x setVariable ["ACE_isEngineer", _valueEng > 0, true];
        };
        
        if (_valueexp != -1) then {
            _x setUnitTrait ["explosiveSpecialist", _valueexp > 0];
            _x setVariable ["ACE_isEOD", _valueexp > 0, true];
        };
        
        if (_valueUAV != -1) then {
            _x setUnitTrait ["UAVHacker", _valueUAV > 0];
        };
    } forEach GVAR(utilityData);
    
    systemChat format ["[TFS admin Menu] Assigned traits to %1 player(s)", count GVAR(utilityData)];
    [format ["%1 Assigned traits to %2", profileName, GVAR(utilityData) apply {
        name _x
    }], false, "admin Menu"] call FUNC(log);
}];