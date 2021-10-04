#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_ctrlgroup"];

(ctrlposition _ctrlgroup) params ["", "", "_ctrlGrpWidth", "_ctrlGrpHeight"];

private _display = uiNamespace getVariable [QGVAR(modalDisplay), displayNull];
private _ctrlEdit = _display ctrlCreate ["RscEditMulti", -1, _ctrlgroup];
private _ctrlEditPos = [0.1 * TFS_adminMENU_STD_WIDTH, 0.1 * TFS_adminMENU_STD_HEIGHT, _ctrlGrpWidth - (0.2 * TFS_adminMENU_STD_WIDTH), _ctrlGrpHeight - (1.3 * TFS_adminMENU_STD_HEIGHT)];
_ctrlEdit ctrlsetPosition _ctrlEditPos;
_ctrlEdit ctrlCommit 0;
_ctrlEdit ctrlsettext (missionnamespace getVariable [QGVAR(utility_message_last), ""]);

private _ctrlCombo = _display ctrlCreate [QGVAR(RscCombo), -1, _ctrlgroup];
_ctrlCombo ctrlsetPosition [0.1 * TFS_adminMENU_STD_WIDTH, _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT, _ctrlGrpWidth * 0.3, TFS_adminMENU_STD_HEIGHT];
_ctrlCombo ctrlCommit 0;
_ctrlCombo lbAdd "Show in Chat";
_ctrlCombo lbAdd "Show in hint";
_ctrlCombo lbAdd "Show in Subtitle from 'PAPA BEAR'";
_ctrlCombo lbsetCurSel 0;

private _ctrlButtonPreview = _display ctrlCreate [QGVAR(RscButtonMenu), -1, _ctrlgroup];
_ctrlButtonPreview ctrlsetPosition [(_ctrlGrpWidth * 0.7) - (0.2 * TFS_adminMENU_STD_WIDTH), _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT, (_ctrlGrpWidth * 0.15), TFS_adminMENU_STD_HEIGHT];
_ctrlButtonPreview ctrlCommit 0;
_ctrlButtonPreview ctrlsettext "Preview";
_ctrlButtonPreview setVariable [QGVAR(association), [_ctrlEdit, _ctrlCombo]];
_ctrlButtonPreview ctrlAddEventHandler ["buttonClick", {
    params ["_ctrlButton"];
    (_ctrlButton getVariable [QGVAR(association), [controlnull, controlnull]]) params ["_ctrlEdit", "_ctrlCombo"];
    _ctrlButton call FUNC(debounceButton);
    
    private _edittext = ctrltext _ctrlEdit;
    
    if (_edittext isEqualto "") then {
        systemChat "[TFS admin Menu] Message can't be empty";
    } else {
        private _venue = ["systemChat", "hint", QFUNC(showSubtitle)] select (lbCurSel _ctrlCombo);
        
        if (_venue isEqualto QFUNC(showSubtitle)) then {
            ["PAPA BEAR", _edittext] call FUNC(showSubtitle);
        } else {
            if (_venue isEqualto "hint") then {
                hint format ["\n\n%1", _edittext];
            } else {
                systemChat format ["[TFS admin Message] %1", _edittext];
            };
        };
        
        systemChat "[TFS admin Menu] Message previewed";
    };
}];

private _ctrlButtonCommit = _display ctrlCreate [QGVAR(RscButtonMenu), -1, _ctrlgroup];
_ctrlButtonCommit ctrlsetPosition [(_ctrlGrpWidth * 0.85), _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT, (_ctrlGrpWidth * 0.15) - (0.1 * TFS_adminMENU_STD_WIDTH), TFS_adminMENU_STD_HEIGHT];
_ctrlButtonCommit ctrlCommit 0;
_ctrlButtonCommit ctrlsettext "Send Message";
_ctrlButtonCommit setVariable [QGVAR(association), [_ctrlEdit, _ctrlCombo]];
_ctrlButtonCommit ctrlAddEventHandler ["buttonClick", {
    params ["_ctrlButton"];
    (_ctrlButton getVariable [QGVAR(association), [controlnull, controlnull]]) params ["_ctrlEdit", "_ctrlCombo"];
    _ctrlButton call FUNC(debounceButton);
    
    private _edittext = ctrltext _ctrlEdit;
    GVAR(utility_message_last) = _edittext;
    // _edittext may receive local edits
    
    if (_edittext isEqualto "") then {
        systemChat "[TFS admin Menu] Message can't be empty";
    } else {
        private _venue = ["systemChat", "hint", QFUNC(showSubtitle)] select (lbCurSel _ctrlCombo);
        
        if (_venue isEqualto QFUNC(showSubtitle)) then {
            ["PAPA BEAR", _edittext] remoteExec [_venue, GVAR(utilityData)];
        } else {
            if (_venue isEqualto "hint") then {
                _edittext = format ["\n\n%1", _edittext];
            };
            (format ["[TFS admin Message] %1", _edittext]) remoteExec [_venue, GVAR(utilityData)];
        };
        
        systemChat "[TFS admin Menu] Message sent to player(s)";
        [format ["%1 Sent message: ""%2"", via venue: ""%3"", to: %4", profileName, _edittext, _venue, GVAR(utilityData) apply {
            name _x
        }], false, "admin Menu"] call FUNC(log);
    };
}];