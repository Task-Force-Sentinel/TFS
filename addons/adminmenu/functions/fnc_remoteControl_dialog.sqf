#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_ctrlBackground"];

if (isnil QGVAR(remoteControlunits) || {
    GVAR(remoteControlunits) isEqualto []
}) exitwith {
    systemChat "[TFS admin Menu] No unit candidates for remote control";
};

private _display = ctrlParent _ctrlBackground;
private _dialogposition = ctrlposition _ctrlBackground;

private _ctrllist = _display ctrlCreate [QGVAR(RsclistBox), -1];
_ctrllist ctrlsetPosition [(_dialogposition # 0) + 0.1 * TFS_adminMENU_STD_WIDTH, (_dialogposition # 1) + 0.1 * TFS_adminMENU_STD_HEIGHT, (_dialogposition # 2) - (0.2 * TFS_adminMENU_STD_WIDTH), (_dialogposition # 3) - (0.2 * TFS_adminMENU_STD_HEIGHT)];
_ctrllist ctrlCommit 0;
{
    private _name = _x # 1;
    private _turretPath = _x # 3;
    if !(_turretPath isEqualto [] || _turretPath isEqualto [-1]) then {
        _name = gettext (([GVAR(remoteControlunits) # 1, _turretPath] call BIS_fnc_turretConfig) >> "gunnername");
    };
    private _i = _ctrllist lbAdd _name;
    _ctrllist lbsettextRight [_i, gettext (configFile >> "Cfgvehicles" >> typeOf (_x # 0) >> "displayname")];
    _ctrllist lbsettooltip [_i, format ["Turret Path: %1\nFFV: %2", _x # 3, _x # 4]];
    _ctrllist lbsetpicture [_i, format ["\A3\Ui_f\data\GUI\Cfg\ranks\%1_gs.paa", rank (_x # 0)]];
    _ctrllist lbsetpictureColor [_i, [1, 1, 1, 1]];
} forEach (GVAR(remoteControlunits) # 0);
_ctrllist lbsetCurSel 0;

private _ctrlOK = _display ctrlCreate [QGVAR(RscButtonMenu), -1];
_ctrlOK ctrlsettext "Control";
_ctrlOK ctrlsetPosition [(_dialogposition # 0) + 0.67 * (_dialogposition # 2), (_dialogposition # 1) + (_dialogposition # 3) + 0.1 * TFS_adminMENU_STD_HEIGHT, 0.33 * (_dialogposition # 2), TFS_adminMENU_STD_HEIGHT];
_ctrlOK ctrlCommit 0;
_ctrlOK setVariable [QGVAR(association), _ctrllist];
_ctrlOK ctrlAddEventHandler ["buttonClick", {
    params ["_ctrlOK"];
    
    private _listindex = lbCurSel (_ctrlOK getVariable [QGVAR(association), controlnull]);
    private _unit = ((GVAR(remoteControlunits) # 0) # _listindex) # 0;
    
    closedialog 0;
    
    [_unit, true, true] call FUNC(remoteControl);
    GVAR(remoteControlunits) = nil;
}];