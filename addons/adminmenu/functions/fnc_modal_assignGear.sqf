#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_ctrlgroup"];

(ctrlposition _ctrlgroup) params ["", "", "_ctrlGrpWidth", "_ctrlGrpHeight"];

private _ctrlCheckfaction = _display ctrlCreate ["RscCheckBox", -1, _ctrlgroup];
GVAR(utilityTabControls) = [_ctrlCheckfaction];
_ctrlCheckfaction ctrlsetPosition [0, 0, TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
_ctrlCheckfaction ctrlCommit 0;

private _ctrlLabelfaction = _display ctrlCreate [QGVAR(RsctextLarge), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlLabelfaction;
_ctrlLabelfaction ctrlsetPosition [TFS_adminMENU_STD_WIDTH, 0, (0.25 * _ctrlGrpWidth), TFS_adminMENU_STD_HEIGHT];
_ctrlLabelfaction ctrlCommit 0;
_ctrlLabelfaction ctrlsettext "Change faction";

private _ctrlCheckfromMission = _display ctrlCreate ["RscCheckBox", -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlCheckfromMission;
_ctrlCheckfromMission ctrlsetPosition [(2 * TFS_adminMENU_STD_WIDTH) + (0.25 * _ctrlGrpWidth), 0, TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
_ctrlCheckfromMission ctrlCommit 0;
_ctrlCheckfromMission ctrlAddEventHandler ["CheckedChanged", FUNC(modal_assignGear_listboxfactions)];

private _ctrlLabelfromMission = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlLabelfromMission;
_ctrlLabelfromMission ctrlsetPosition [(3 * TFS_adminMENU_STD_WIDTH) + (0.25 * _ctrlGrpWidth), 0, (0.6 * _ctrlGrpWidth), TFS_adminMENU_STD_HEIGHT];
_ctrlLabelfromMission ctrlCommit 0;
_ctrlLabelfromMission ctrlsettext "list factions present in scenario only";

private _ctrlCombofaction = _display ctrlCreate [QGVAR(RscCombo), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlCombofaction;
_ctrlCombofaction ctrlsetPosition [(0.1 * TFS_adminMENU_STD_WIDTH), (1.1 * TFS_adminMENU_STD_HEIGHT), _ctrlGrpWidth - (0.2 * TFS_adminMENU_STD_WIDTH), TFS_adminMENU_STD_HEIGHT];
_ctrlCombofaction ctrlCommit 0;
_ctrlCheckfromMission setVariable [QGVAR(association), _ctrlCombofaction];
_ctrlCombofaction ctrlAddEventHandler ["LBSelChanged", FUNC(modal_assignGear_listboxRoles)];

private _ctrlLabelBracketNumbers = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlLabelBracketNumbers;
_ctrlLabelBracketNumbers ctrlsetPosition [0, (2.2 * TFS_adminMENU_STD_HEIGHT), _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
_ctrlLabelBracketNumbers ctrlCommit 0;
_ctrlLabelBracketNumbers ctrlsettext "* denotes a mission config loadout. to change role, tick the adjacent checkbox.";

private _ctrlLabelRoles = _display ctrlCreate [QGVAR(RsctextLarge), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlLabelRoles;
_ctrlLabelRoles ctrlsetPosition [0, (4.2 * TFS_adminMENU_STD_HEIGHT), (0.25 * _ctrlGrpWidth), TFS_adminMENU_STD_HEIGHT];
_ctrlLabelRoles ctrlCommit 0;
_ctrlLabelRoles ctrlsettext "Change Roles";

private _ctrlGrpRolesWidth = _ctrlGrpWidth - (0.2 * TFS_adminMENU_STD_WIDTH);
private _ctrlGrpRoles = _display ctrlCreate ["RscControlsgroup", -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlGrpRoles;
_ctrlGrpRoles ctrlsetPosition [(0.1 * TFS_adminMENU_STD_WIDTH), (5.3 * TFS_adminMENU_STD_HEIGHT), _ctrlGrpRolesWidth, _ctrlGrpHeight - (6.4 * TFS_adminMENU_STD_HEIGHT)];
_ctrlGrpRoles ctrlCommit 0;
_ctrlGrpRoles ctrlsettext "Number within brackets tell how many players use the loadout";

GVAR(utility_assigngear_rolectrls) = [];
private _ctrlLabelplayerW = 0.4 * _ctrlGrpRolesWidth;
private _ctrlComboroleX = 0.5 * _ctrlGrpRolesWidth;
private _ctrlComboroleW = (0.5 * _ctrlGrpRolesWidth) - TFS_adminMENU_STD_WIDTH;
private _ctrlCheckChangeX = _ctrlGrpRolesWidth - TFS_adminMENU_STD_WIDTH;
{
    private _ctrlLineY = _forEachindex * (1.1 * TFS_adminMENU_STD_HEIGHT);
    
    private _ctrlLabelplayer = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlGrpRoles];
    GVAR(utilityTabControls) pushBack _ctrlLabelplayer;
    _ctrlLabelplayer ctrlsetPosition [0, _ctrlLineY, _ctrlLabelplayerW, TFS_adminMENU_STD_HEIGHT];
    _ctrlLabelplayer ctrlCommit 0;
    _ctrlLabelplayer ctrlsettext format ["%1 [%2]", name _x, _x getVariable [QEGVAR(assigngear, role), "no role"]];
    
    private _ctrlComborole = _display ctrlCreate [QGVAR(RscCombo), -1, _ctrlGrpRoles];
    GVAR(utilityTabControls) pushBack _ctrlComborole;
    _ctrlComborole ctrlsetPosition [_ctrlComboroleX, _ctrlLineY, _ctrlComboroleW, TFS_adminMENU_STD_HEIGHT];
    _ctrlComborole ctrlCommit 0;
    
    private _ctrlCheckChange = _display ctrlCreate ["RscCheckBox", -1, _ctrlGrpRoles];
    GVAR(utilityTabControls) pushBack _ctrlCheckChange;
    GVAR(utility_assigngear_rolectrls) pushBack _ctrlCheckChange;
    _ctrlCheckChange ctrlsetPosition [_ctrlCheckChangeX, _ctrlLineY, TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
    _ctrlCheckChange ctrlCommit 0;
    _ctrlCheckChange setVariable [QGVAR(association), [_x, _ctrlComborole]];
} forEach GVAR(utilityData);

private _ctrlButton = _display ctrlCreate [QGVAR(RscButtonMenu), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlButton;
_ctrlButton ctrlsetPosition [_ctrlGrpWidth * 0.8, _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT, _ctrlGrpWidth * 0.2, TFS_adminMENU_STD_HEIGHT];
_ctrlButton ctrlCommit 0;
_ctrlButton ctrlsettext "Assign Gear";
_ctrlButton setVariable [QGVAR(association), [_ctrlCheckfaction, _ctrlCombofaction]];
_ctrlButton ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrlButton"];
    _ctrlButton call FUNC(debounceButton);
    
    (_ctrlButton getVariable [QGVAR(association), [controlnull, controlnull]]) params ["_ctrlCheckfaction", "_ctrlCombofaction"];
    private _setfaction = cbChecked _ctrlCheckfaction;
    private _selectedfaction = _ctrlCombofaction lbData (lbCurSel _ctrlCombofaction);
    
    {
        (_x getVariable [QGVAR(association), [objNull, controlnull]]) params ["_player", "_ctrlComborole"];
        
        private _playerRole = _player getVariable [QEGVAR(assignGear, role), ""];
        if (cbChecked _x || _playerRole isEqualto "") then {
            _playerRole = _ctrlComborole lbData (lbCurSel _ctrlComborole);
            if (_playerRole isEqualto "") then {
                _playerRole = "r";
            };
        };
        
        private _playerfaction = _player getVariable [QEGVAR(assignGear, faction), ""];
        if (_setfaction || _playerfaction isEqualto "") then {
            _playerfaction = _selectedfaction;
        };
        
        [_player, _playerfaction, _playerRole] remoteExecCall [QEFUNC(assignGear, assignGear), _player];
    } forEach GVAR(utility_assigngear_rolectrls);
    
    systemChat format ["[TFS admin Menu] Assigned gear to %1 players", count GVAR(utility_assigngear_rolectrls)];
}];

[_ctrlCheckfromMission, false] call FUNC(modal_assignGear_listboxfactions);