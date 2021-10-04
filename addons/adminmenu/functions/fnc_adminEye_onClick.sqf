#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

params["_fullmapwindow", "_type", "_x", "_y"];

private _mousePos = [_x, _y];

if (_type == 0) then {
    // left click
    GVAR(adminEyeselectedobj) = objNull;
    {
        private _pos = (position _x);
        if (_mousePos distance (_fullmapwindow posworldToScreen _pos) < 0.1) exitwith {
            GVAR(adminEyeselectedobj) = _x;
        };
    } forEach GVAR(Triggers);
    
    {
        private _pos = (position _x);
        if (_mousePos distance (_fullmapwindow posworldToScreen _pos) < 0.1) exitwith {
            GVAR(adminEyeselectedobj) = _x;
        };
    } forEach GVAR(wavespawners);
};