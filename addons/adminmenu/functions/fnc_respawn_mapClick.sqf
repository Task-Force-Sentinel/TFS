#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

params["_fullmapwindow", "_type", "_x", "_y"];

if (_type == 0) then {
    // left click
    private _i = 1;
    private _found = false;
    private _var = missionnamespace getVariable[format["TFS_respawnPoint%1", _i], objNull];
    while {!(isNull _var)} do {
        private _pos = (position _var);
        if (([_x, _y] distance (_fullmapwindow posworldToScreen _pos)) < 0.1) then {
            GVAR(respawnMousePos) = _i;
            _found = true;
        };
        _i = _i + 1;
        _var = missionnamespace getVariable[format["TFS_respawnPoint%1", _i], objNull];
    };
    if (!_found) then {
        GVAR(respawnMousePos) = _fullmapwindow posscreentoWorld [_x, _y];
    };
};