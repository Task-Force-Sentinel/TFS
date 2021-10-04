#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

private _list = _display displayCtrl IDC_TFS_adminMENU_PMAN_list;
private _filterside = [sideUnknown, blufor, opfor, resistance, civilian] param [(lbCurSel (_display displayCtrl IDC_TFS_adminMENU_PMAN_FILTER_side)) max 0];
private _filterState = (lbCurSel (_display displayCtrl IDC_TFS_adminMENU_PMAN_FILTER_STATE)) max 0;

private _allplayers = allplayers - entities "HeadlessClient_F";
if (!isMultiplayer) then {
    _allplayers = switchableunits - entities "HeadlessClient_F";
};

private _newplayers = [];

{
    private _addplayer = [true, alive _x, !alive _x] param [_filterState];
    
    private _isSpectator = _x isKindOf QEGVAR(spectator, unit);
    private _playerside = side _x;
    
    if (_addplayer && !(_filterside isEqualto sideUnknown)) then {
        if (_isSpectator) then {
            _playerside = (_x getVariable [QEGVAR(spectator, side), sideUnknown]);
        };
        
        _addplayer = _playerside isEqualto _filterside;
    };
    
    if (_addplayer) then {
        private _text = "";
        private _role = "";
        
        if (_isSpectator) then {
            _text = groupid (_x getVariable [QEGVAR(spectator, group), grpNull]);
            _role = toUpper (_x getVariable [QEGVAR(spectator, role), ""]);
        } else {
            _text = groupid group _x;
            _role = toUpper (_x getVariable [QEGVAR(assigngear, role), ""]);
        };
        
        if (count _role > 0) then {
            if (count _text > 0) then {
                _text = format ["%1: %2", _text, _role];
            } else {
                _text = _role;
            };
        };
        
        private _idx = count _newplayers;
        if (_idx >= lbsize _list) then {
            _idx = _list lbAdd name _x;
            _list lbsetpictureRight [_idx, "\a3\ui_f\data\IGUI\RscTitles\MPProgress\respawn_ca.paa"];
        } else {
            _list lbsettext [_idx, name _x];
        };
        _list lbsettextRight [_idx, _text];
        
        private _netId = _x call BIS_fnc_netId;
        _list lbsetData [_idx, _netId];
        _newplayers pushBack _netId;
        
        private _sidetexture = "\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa";
        
        if (_isSpectator) then {
            _list lbsetColor [_idx, [0.6, 0.6, 0.6, 1]];
            _list lbsetColorRight [_idx, [0.6, 0.6, 0.6, 1]];
            _list lbsetpicture [_idx, _sidetexture];
            
            private _sideColor = _playerside call FUNC(sidetoColor);
            _list lbsetpictureColor [_idx, _sideColor];
            _list lbsetpictureColorselected [_idx, _sideColor];
            
            // if quick respawnable
            if (false) then {
                _list lbsetpictureRightColor [_idx, [1, 1, 1, 0.8]];
                _list lbsetpictureRightColorselected [_idx, [1, 1, 1, 0.8]];
            } else {
                _list lbsetpictureRightColor [_idx, [1, 1, 1, 0]];
                _list lbsetpictureRightColorselected [_idx, [1, 1, 1, 0]];
            };
        } else {
            _list lbsetColor [_idx, [1, 1, 1, 1]];
            _list lbsetColorRight [_idx, [1, 1, 1, 1]];
            
            switch (_playerside) do {
                case blufor: {
                    _sidetexture = "\a3\ui_f\data\Map\Diary\Icons\playerwest_ca.paa";
                };
                case opfor: {
                    _sidetexture = "\a3\ui_f\data\Map\Diary\Icons\playereast_ca.paa";
                };
                case independent: {
                    _sidetexture = "\a3\ui_f\data\Map\Diary\Icons\playerGuer_ca.paa";
                };
                case civilian: {
                    _sidetexture = "\a3\ui_f\data\Map\Diary\Icons\playerCiv_ca.paa";
                };
                case sideLogic: {
                    _sidetexture = "\a3\ui_f\data\Map\Diary\Icons\playerVirtual_ca.paa";
                };
                default {
                    _sidetexture = "\a3\ui_f\data\Map\Diary\Icons\playerBriefUnknown_ca.paa";
                };
            };
            
            _list lbsetpicture [_idx, _sidetexture];
            _list lbsetpictureColor [_idx, [1, 1, 1, 0.8]];
            _list lbsetpictureColorselected [_idx, [1, 1, 1, 0.8]];
            _list lbsetpictureRightColor [_idx, [1, 1, 1, 0]];
            _list lbsetpictureRightColorselected [_idx, [1, 1, 1, 0]];
        };
    };
} forEach _allplayers;

GVAR(playerManagement_players) = +_newplayers;
GVAR(playerManagement_selected) = GVAR(playerManagement_selected) arrayintersect GVAR(playerManagement_players);

while {(lbsize _list) > count _newplayers} do {
    _list lbDelete ((lbsize _list) - 1);
};

lbsort _list;

for "_i" from 0 to ((lbsize _list) - 1) do {
    _list lbsetselected [_i, (_list lbData _i) in GVAR(playerManagement_selected)];
};