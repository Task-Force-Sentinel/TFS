#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_ctrlgroup"];

(ctrlposition _ctrlgroup) params ["", "", "_ctrlGrpWidth", "_ctrlGrpHeight"];

private _ctrlLabelradios = _display ctrlCreate [QGVAR(RsctextLarge), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlLabelradios;
_ctrlLabelradios ctrlsetPosition [0, 0, (0.5 * _ctrlGrpWidth), TFS_adminMENU_STD_HEIGHT];
_ctrlLabelradios ctrlCommit 0;
_ctrlLabelradios ctrlsettext "Add radios";

private _ctrlLabelradiogroup = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlLabelradiogroup;
_ctrlLabelradiogroup ctrlsetPosition [0, (1.1 * TFS_adminMENU_STD_HEIGHT), 0.5 * _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
_ctrlLabelradiogroup ctrlCommit 0;
_ctrlLabelradiogroup ctrlsettext "radios with the same (number) postfix are compatible";

private _radios = [];
{
    _radios append (_x select 0);
} forEach EGVAR(acre2, radioCoresettings);
private _radioCtrls = [];
private _radioCtrlsY = 2.2 * TFS_adminMENU_STD_HEIGHT;

{
    private _radio = _x;
    private _radiogroup = (EGVAR(acre2, radioCoresettings) findif {
        _radio in (_x select 0)
    }) + 1;
    // arbitrary index to identify what group of radios it's compatible with
    
    private _ctrlradioCheck = _display ctrlCreate ["RscCheckBox", -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlradioCheck;
    _radioCtrls pushBack _ctrlradioCheck;
    _ctrlradioCheck ctrlsetPosition [0, _radioCtrlsY + (_forEachindex * TFS_adminMENU_STD_HEIGHT), TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
    _ctrlradioCheck ctrlCommit 0;
    _ctrlradioCheck setVariable [QGVAR(association), _x];
    
    private _ctrlradioname = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlradioname;
    _ctrlradioname ctrlsetPosition [TFS_adminMENU_STD_WIDTH, _radioCtrlsY + (_forEachindex * TFS_adminMENU_STD_HEIGHT), (0.5 * _ctrlGrpWidth) - TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
    _ctrlradioname ctrlCommit 0;
    if (_radiogroup > 0) then {
        _ctrlradioname ctrlsettext format ["%1 (%2)", gettext (configFile >> "Cfgweapons" >> _x >> "displayname"), _radiogroup];
    } else {
        _ctrlradioname ctrlsettext gettext (configFile >> "Cfgweapons" >> _x >> "displayname");
    };
    _ctrlradioname ctrlsettooltip gettext (configFile >> "Cfgweapons" >> _x >> "descriptionShort");
} forEach _radios;

private _networkCtrls = [];

if (!isnil QEGVAR(acre2, networkswithradioChannels)) then {
    private _ctrlCheckNetwork = _display ctrlCreate ["RscCheckBox", -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlCheckNetwork;
    _networkCtrls pushBack _ctrlCheckNetwork;
    _ctrlCheckNetwork ctrlsetPosition [0.5 * _ctrlGrpWidth, 0, TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
    _ctrlCheckNetwork ctrlCommit 0;
    
    private _ctrlLabelnetwork = _display ctrlCreate [QGVAR(RsctextLarge), -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlLabelnetwork;
    _ctrlLabelnetwork ctrlsetPosition [(0.5 * _ctrlGrpWidth) + TFS_adminMENU_STD_WIDTH, 0, (0.5 * _ctrlGrpWidth) - (1.1 * TFS_adminMENU_STD_WIDTH), TFS_adminMENU_STD_HEIGHT];
    _ctrlLabelnetwork ctrlCommit 0;
    _ctrlLabelnetwork ctrlsettext "Change radio Network";
    _ctrlCheckNetwork ctrlCommit 0;
    
    private _ctrlLabelnetworkWarning = _display ctrlCreate [QGVAR(Rsctext), -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrlLabelnetworkWarning;
    _ctrlLabelnetworkWarning ctrlsetPosition [0.5 * _ctrlGrpWidth, (1.1 * TFS_adminMENU_STD_HEIGHT), 0.5 * _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
    _ctrlLabelnetworkWarning ctrlsettextColor [1, 192/255, 77/255, 1];
    _ctrlLabelnetworkWarning ctrlCommit 0;
    _ctrlLabelnetworkWarning ctrlsettext "Warning: Change only if you know what you're doing!";
    
    private _ctrllistNetwork = _display ctrlCreate [QGVAR(RsclistBox), -1, _ctrlgroup];
    GVAR(utilityTabControls) pushBack _ctrllistNetwork;
    _networkCtrls pushBack _ctrllistNetwork;
    _ctrllistNetwork ctrlsetPosition [0.5 * _ctrlGrpWidth, _radioCtrlsY, (0.5 * _ctrlGrpWidth) - (0.1 * TFS_adminMENU_STD_WIDTH), _ctrlGrpHeight - _radioCtrlsY - (2 * TFS_adminMENU_STD_HEIGHT)];
    _ctrllistNetwork ctrlCommit 0;
    
    {
        _x params ["_conditions"];
        
        private _netId = _forEachindex + 1;
        private _conditionsstr = (_conditions apply {
            // convert different conditions to strings
            if (_x isEqualtype "") then {
                format ["faction: %1", _x]
            } else {
                if (_x isEqualtype 0) then {
                    toLower str (_x call EFUNC(common, numtoside))
                } else {
                    str _x
                };
            };
        }) joinstring ", ";
        
        private _idx = _ctrllistNetwork lbAdd format ["%1: %2", _netId, _conditionsstr];
        _ctrllistNetwork lbsetValue [_idx, _netId];
        systemChat format ["Network %1: %2", _netId, _conditionsstr];
    } forEach EGVAR(acre2, networkswithradioChannels);
};

private _ctrlButton = _display ctrlCreate [QGVAR(RscButtonMenu), -1, _ctrlgroup];
GVAR(utilityTabControls) pushBack _ctrlButton;
_ctrlButton ctrlsetPosition [_ctrlGrpWidth * 0.8, _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT, _ctrlGrpWidth * 0.2, TFS_adminMENU_STD_HEIGHT];
_ctrlButton ctrlCommit 0;
_ctrlButton ctrlsettext "Assign radios";
_ctrlButton setVariable [QGVAR(association), [_radioCtrls, _networkCtrls]];
_ctrlButton ctrlAddEventHandler ["ButtonClick", {
    params ["_ctrlButton"];
    _ctrlButton call FUNC(debounceButton);
    
    (_ctrlButton getVariable [QGVAR(association), []]) params [["_radioCtrls", []], ["_networkCtrls", []]];
    
    private _radios = (_radioCtrls select {
        cbChecked _x
    }) apply {
        _x getVariable [QGVAR(association), "???"]
    };
    // get classnames of ticked radios
    systemChat (_radios joinstring ", ");
    private _network = -1;
    
    if !(_networkCtrls isEqualto []) then {
        _networkCtrls params ["_ctrlnetworkCheck", "_ctrlnetworklist"];
        
        if (cbChecked _ctrlnetworkCheck) then {
            private _idx = lbCurSel _ctrlnetworklist;
            if (_idx < 0) exitwith {
                systemChat "[TFS admin Menu] No network selected";
            };
            
            _network = _ctrlnetworklist lbValue _idx;
            systemChat format ["selected network %1", _network];
        };
    };
    
    [_radios, _network] remoteExecCall [QFUNC(modal_ACRE2languages_assign), GVAR(utilityData)];
    [format ["%1 Assigned radios %2 on network %3 to ", profileName, _radio, _network, GVAR(utilityData) apply {
        name _x
    }], false, "admin Menu"] call FUNC(log);
}];