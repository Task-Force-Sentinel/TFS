#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_ctrlgroup"];

(ctrlposition _ctrlgroup) params ["", "", "_ctrlGrpWidth", "_ctrlGrpHeight"];

private _display = uiNamespace getVariable [QGVAR(modalDisplay), displayNull];
private _ctrlEdit = _display ctrlCreate [QGVAR(RscEditMultiCode), -1, _ctrlgroup];
_ctrlEdit ctrlsetPosition [0.1 * TFS_adminMENU_STD_WIDTH, 1.1 * TFS_adminMENU_STD_HEIGHT, _ctrlGrpWidth - (0.2 * TFS_adminMENU_STD_WIDTH), _ctrlGrpHeight - (2.3 * TFS_adminMENU_STD_HEIGHT)];
_ctrlEdit ctrlCommit 0;
_ctrlEdit ctrlsettext (missionnamespace getVariable [QGVAR(utility_runcode_last), ""]);

private _ctrlhintEdit = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
_ctrlhintEdit ctrlsetPosition [0, 0, _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
_ctrlhintEdit ctrlCommit 0;
_ctrlhintEdit ctrlsettext "'_this' is the targetted player object";

private _bottomY = _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT;

private _ctrlhintCombo = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
_ctrlhintCombo ctrlsetPosition [0, _bottomY, 0.15 * _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
_ctrlhintCombo ctrlCommit 0;
_ctrlhintCombo ctrlsettext "execute on:";

private _ctrlCombo = _display ctrlCreate [QGVAR(RscCombo), -1, _ctrlgroup];
_ctrlCombo ctrlsetPosition [0.15 * _ctrlGrpWidth, _bottomY, 0.25 * _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
_ctrlCombo ctrlCommit 0;
_ctrlCombo lbAdd "Your Client";
_ctrlCombo lbAdd "targets' Clients";
_ctrlCombo lbAdd "Server";
_ctrlCombo lbAdd "All Clients and Server";
_ctrlCombo lbsetCurSel 0;

private _ctrlButton = _display ctrlCreate [QGVAR(RscButtonMenu), -1, _ctrlgroup];
_ctrlButton ctrlsetPosition [0.8 * _ctrlGrpWidth, _bottomY, 0.2 * _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
_ctrlButton ctrlCommit 0;
_ctrlButton ctrlsettext "execute";
_ctrlButton setVariable [QGVAR(association), [_ctrlEdit, _ctrlCombo]];
_ctrlButton ctrlAddEventHandler ["buttonClick", {
    params ["_ctrlButton"];
    (_ctrlButton getVariable [QGVAR(association), [controlnull, controlnull]]) params ["_ctrlEdit", "_ctrlCombo"];
    _ctrlButton call FUNC(debounceButton);
    
    private _edittext = ctrltext _ctrlEdit;
    if (_edittext isEqualto "") then {
        systemChat "[TFS admin Menu] Code field is empty";
    } else {
        private _code = compile _edittext;
        private _selected = lbCurSel _ctrlCombo;
        private _target = call {
            if (_selected isEqualto 0) exitwith {
                -1
            };
            if (_selected isEqualto 1) exitwith {
                GVAR(utilityData)
            };
            if (_selected isEqualto 2) exitwith {
                2
            };
            0
        };
        
        if (_target isEqualto -1) then {
            {
                _x call _code;
            } forEach GVAR(utilityData);
        } else {
            if (_target isEqualtype []) then {
                [compile _edittext, {
                    params ["_code"];
                    player call _code;
                }] remoteExec ["call", GVAR(utilityData)];
            } else {
                [[GVAR(utilityData), compile _edittext], {
                    params ["_players", "_code"];
                    {
                        _x call _code;
                    } forEach _players;
                }] remoteExec ["call", _target];
            };
        };
        
        systemChat format ["[TFS admin Menu] Code was executed on %1", _ctrlCombo lbtext (lbCurSel _ctrlCombo)];
        [format ["%1 executed code:%2, on %3", profileName, _code, _target], false, "admin Menu"] call FUNC(log);
        GVAR(utility_runcode_last) = _edittext;
    };
}];