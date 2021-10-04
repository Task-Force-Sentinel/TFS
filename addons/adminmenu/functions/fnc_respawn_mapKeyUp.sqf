#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

params["", "_type"];
// 28 = enter key
if (_type == 28) then {
    if (GVAR(respawnMousePos) isEqualto -1) then {
        hint "No position selected for respawn. Click on a position then hit enter.";
    } else {
        private _position = [0, 0, 0];
        private _halo = false;
        if (GVAR(respawnMousePos) isEqualtype []) then {
            _position = GVAR(respawnMousePos);
            _halo = GVAR(respawnHalo);
        } else {
            private _var = missionnamespace getVariable[format["TFS_respawnPoint%1", GVAR(respawnMousePos)], objNull];
            if (!isNull _var) then {
                _position = position _var;
            };
        };
        if (_halo) then {
            hint "group created as HALO group.";
        } else {
            hint "group created on ground.";
        };
        
        GVAR(respawnGuiparameters) params ["_faction", "_groupname", "_markertype", "_markerColor", "_markername"];
        
        {
            _x params ["_rankIdx", "_obj", "_roleIdx"];
            _x set [2, (respawnMenuRoles select _roleIdx) select 0];
        } forEach GVAR(selectedRespawngroup);
        
        TRACE_9("Triggered respawn wave", _groupname, _position, _faction, GVAR(selectedRespawngroup), _markertype, _markerColor, _markername, _halo, GVAR(selectedside));
        [[_groupname, _position, _faction, GVAR(selectedRespawngroup), _markertype, _markerColor, _markername, _halo, GVAR(selectedside)], QEFUNC(respawn, respawnwaveserver), false] call BIS_fnc_MP;
        
        // Print to log
        private _argsstr = [
            format ["side: %1, ", [east, west, resistance, civilian] # GVAR(selectedside)],
            format ["position: %1, ", _position],
            format ["group array: %1, ", GVAR(selectedRespawngroup) apply {
                [name (_x # 1), _x # 2]
            }]
        ];
        [format ["%1 Triggered a respawn wave: %2", profileName, _argsstr joinstring " "], false, "admin Menu"] call FUNC(log);
        
        GVAR(selectedRespawngroup) = [];
        
        // Close the Map
        ((findDisplay IDC_TFS_adminMENU_RESP_MAP_DISPLAY) displayCtrl IDC_TFS_adminMENU_RESP_MAP_CONTROL) ctrlShow false;
        ((findDisplay IDC_TFS_adminMENU_RESP_MAP_DISPLAY) displayCtrl IDC_TFS_adminMENU_RESP_MAP_CONTROL) mapCenterOnCamera false;
        closedialog IDC_TFS_adminMENU_RESP_MAP_DISPLAY;
    };
};
// SPACEBAR (HALO toGGLE)
if (_type == 57) then {
    GVAR(respawnHalo) = !GVAR(respawnHalo);
};