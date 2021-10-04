#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

private _ctrlgrouplistBox = (_display displayCtrl IDC_TFS_adminMENU_RESP_grouplist);
lbClear _ctrlgrouplistBox;

{
    _x params ["_rankIdx", "_obj", "_roleIdx"];
    private _name = _obj getVariable ["TFS_spectator_name", name _obj];
    private _idx = _ctrlgrouplistBox lbAdd format["%1 - %2", _name, (respawnMenuRoles select _roleIdx) select 1];
    // set image based on rank
    switch (_rankIdx) do {
        case 0 : {
            _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\private_gs.paa"];
        };
        case 1 : {
            _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\corporal_gs.paa"];
        };
        case 2 : {
            _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\sergeant_gs.paa"];
        };
        case 3 : {
            _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\lieutenant_gs.paa"];
        };
        case 4 : {
            _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\captain_gs.paa"];
        };
        case 5 : {
            _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\major_gs.paa"];
        };
        case 6 : {
            _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\colonel_gs.paa"];
        };
        default {};
    };
    _ctrlgrouplistBox lbsetColor [_idx, [1, 1, 1, 1]];
    _ctrlgrouplistBox lbsetpictureColor [_idx, [1, 1, 1, 0.7]];
    _ctrlgrouplistBox lbsetpictureColorselected [_idx, [1, 1, 1, 1]];
} forEach GVAR(selectedRespawngroup);