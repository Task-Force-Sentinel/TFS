#include "script_component.hpp"

if (!EGVAR(common, aceTagging)) exitwith {};

if (hasinterface) then {
    ["ace_tagCreated", {
        params ["", "_texture", "_object", "_unit"];
        if (!GVAR(enabled)) exitwith {};
        // Check if tag created on building by local player
        if (!(_object isKindOf "Building") || {
            _unit isnotEqualto player
        }) exitwith {};
        
        private _colorindex = {
            if (_texture find _x != -1) exitwith {
                _forEachindex
            };
            -1
        } forEach textURE_COLorS;
        
        // no matching color, do not create marker
        if (_colorindex == -1) exitwith {};
        
        private _marker = [_object, "side", _unit] call EFUNC(common, createplayerMarker);
        _marker setMarkerShape "ICON";
        _marker setMarkertype "hd_dot";
        _marker setMarkerColor (MARKER_COLorS select _colorindex);
    }] call CBA_fnc_addEventHandler;
};