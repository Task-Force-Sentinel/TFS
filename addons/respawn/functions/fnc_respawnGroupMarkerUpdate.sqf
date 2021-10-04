#include "\z\tfs\addons\respawn\script_component.hpp"

// Goes through GVAR(respawnedgroupsMarkerData), ensuring all groups already have markers.
if (isnil QGVAR(respawnedgroupsMarkerData)) exitwith {};

{
    // Check if group already has a group marker.
    if (!isnil (_x select 0)) then {
        private _found = false;
        
        // Check if the entity is already setup to be drawn (aka in f_grpMkr_groups)
        private _entity = missionnamespace getVariable[(_x select 0), objNull];
        
        _found = (count ([EGVAR(orbat, orbatMarkerArray), _entity] call BIS_fnc_findNestedElement) != 0);
        
        // if not add the new group.
        if (!_found) then {
            // Check if we should be adding the group.
            private _toAdd = false;
            if (_entity isEqualtype grpNull) then {
                _toAdd = faction player == faction leader _entity;
            } else {
                _toAdd = faction player == faction _entity;
            };
            
            if (_toAdd) then {
                // private _markertexture = ((GVAR(respawnMenuMarkers) select (_x select 2)) select 0);
                // private _markerColorRGB = (GVAR(respawnMenuMarkerColours) select (_x select 3)) select 0;
                // private _size = [28, 28];
                
                private _color = ((GVAR(respawnMenuMarkerColours) select (_x select 3)) select 2);
                private _type = ((GVAR(respawnMenuMarkers) select (_x select 2)) select 2);
                private _markertexture = "z\tfs\addons\orbat\textures\" + _color + "_" + _type;
                private _markerColorRGB = [1, 1, 1, 1];
                private _size = [32, 32];
                
                ["", (_x select 1), [_markertexture, _markerColorRGB, _size], "", _entity] call EFUNC(orbat, add);
            };
        };
    };
} forEach GVAR(respawnedgroupsMarkerData);