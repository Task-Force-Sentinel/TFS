#include "\z\tfs\addons\adminmenu\script_component.hpp"

if (!isServer) exitwith {};
params [["_add", true, [true]]];

if (isMultiplayer) then {
    if (_add) then {
        if (isnil QGVAR(fps_pfh)) then {
            GVAR(fps_pfh) = [{
                GVAR(fps) = round diag_fps;
                
                private _allgroups = allgroups;
                private _headlessstring = format["Server: %1", {
                    groupowner _x == 2
                } count _allgroups];
                {
                    private _headless = _x;
                    private _headlessClientId = owner _headless;
                    if (_headlessClientId != 2) then {
                        // not server.
                        private _varname = vehicleVarName _headless;
                        if (count _varname == 0) then {
                            _varname = roleDescription _headless;
                        };
                        _headlessstring = _headlessstring + format[", %1: %2", _varname, {
                            groupowner _x == _headlessClientId
                        } count _allgroups];
                    };
                } forEach (entities "HeadlessClient_F");
                GVAR(headlessinfo) = _headlessstring;
                
                {
                    _x publicVariableClient QGVAR(fps);
                    _x publicVariableClient QGVAR(headlessinfo);
                } forEach GVAR(activeClients);
            }, 1] call CBA_fnc_addPerFrameHandler;
        };
        
        GVAR(activeClients) pushBackUnique remoteExecutedOwner;
    } else {
        GVAR(activeClients) = GVAR(activeClients) - [remoteExecutedOwner];
        
        if (((count GVAR(activeClients)) isEqualto 0) && {
            !isnil QGVAR(fps_pfh)
        }) then {
            [GVAR(fps_pfh)] call CBA_fnc_removePerFrameHandler;
            GVAR(fps_pfh) = nil;
        };
    };
} else {
    // singleplayer
    if (_add && isnil QGVAR(fps_pfh)) then {
        GVAR(fps_pfh) = [{
            disableSerialization;
            
            private _ctrl = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_TFS_adminMENU_FPS;
            if (isNull _ctrl) exitwith {};
            
            _ctrl ctrlsettext format ["%1 SFPS", round diag_fps];
        }, 1] call CBA_fnc_addPerFrameHandler;
    } else {
        if (!isnil QGVAR(fps_pfh)) then {
            [GVAR(fps_pfh)] call CBA_fnc_removePerFrameHandler;
            GVAR(fps_pfh) = nil;
        };
    };
};