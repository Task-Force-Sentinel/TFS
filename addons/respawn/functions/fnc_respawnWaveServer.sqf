// REspawn WAVE SERVER FUNCTION
// This function initiates the group respawn, sending the data to each client to start the respawn
// The actual group will be created on the leader's client and then broadcast to everyone.
// This code will then wait for that group to return before then notifying all clients of the new group marker.
// #include "\z\tfs\addons\respawn\script_component.hpp"

params ["_groupname", "_position", "_faction", "_selectedRespawngroup", "_markertype", "_markerColor", "_markername", "_halo", "_side"];

// Loop through each proposed client for respawn.
{
    if (_halo) then {
        _position = _position vectorAdd [10, 0, 0];
        // do position transofmration
    } else {
        _position = _position vectorAdd [1, 0, 0];
        // do position transofmration
    };
    
    _x params ["_rank", "_client", "_typeOfUnit"];
    private _leader = _forEachindex==0;
    
    [[GVAR(serverRespawngroupcounter),
        _position,
        _faction,
        _typeOfUnit,
        _rank,
        GVAR(serverRespawnplayercounter),
    _leader, _halo, _side, _groupname],
"TFS_respawn_fnc_respawnlocalClient", _client] call BIS_fnc_MP;

// setup respawned player to die if he disconnects?
[GVAR(serverRespawnplayercounter)] spawn {
    sleep 5;
    private _unitname = format["respawnedUnit%1", (_this select 0)];
    waitUntil{
        sleep 3;
        !isnil _unitname
    };
    private _unit = missionnamespace getVariable[_unitname, objNull];
    while {true} do {
        if (isNull _unit) exitwith {};
        if (!isplayer _unit) exitwith {
            _unit setDamage 1;
            [_unit] join grpNull;
        };
        sleep 5;
    };
};
GVAR(serverRespawnplayercounter) = GVAR(serverRespawnplayercounter) + 1;
} forEach _selectedRespawngroup;

_groupVarname = format ["GrpRespawn_%1", GVAR(serverRespawngroupcounter)];
GVAR(serverRespawngroupcounter) = GVAR(serverRespawngroupcounter) + 1;

[_groupVarname, _markertype, _markername, _markerColor, _groupname] spawn {
    params["_groupVarname", "_markertype", "_markername", "_markerColor", "_groupname"];
    
    waitUntil{
        !isnil _groupVarname
    };
    
    sleep 2;
    // Give some time to allow clients time to make their players transfer across the network.
    
    // Check if a marker was requested before sending to all clients to be created.
    if (_markertype != -1) then {
        // Garbage collector: Cleanup GVAR(respawnedgroupsMarkerData) of old invalid groups.
        // private _x = 0;
        private _length = count GVAR(respawnedgroupsMarkerData);
        while {_x < _length} do {
            // 0 for target, 0 for s
            private _entry = GVAR(respawnedgroupsMarkerData) select _x;
            private _toremove = false;
            if (isnil (_entry select 0)) then {
                _toremove = true;
            } else {
                private _entity = missionnamespace getVariable [(_entry select 0), objNull];
                if (isNull _entity) then {
                    _toremove = true;
                } else {
                    if (!isNull leader _entity) then {
                        _toremove = false;
                        // FUTURE consider removing group if the leader is dead.
                    } else {
                        _toremove = true;
                    };
                };
            };
            
            if (_toremove) then {
                GVAR(respawnedgroupsMarkerData) deleteAt _x;
                _x = _x - 1;
                _length = _length - 1;
            };
            _x = _x + 1;
        };
        
        // Add the group marker data for the new group.
        GVAR(respawnedgroupsMarkerData) pushBack [_groupVarname, _markername, _markertype, _markerColor];
        
        // Broadcast the respawn group data to all clients.
        publicVariable QGVAR(respawnedgroupsMarkerData);
        
        // publicVariable handler won't be called on the host if non-dedicated.
        if (isServer && !isDedicated) then {
            [] call FUNC(respawngroupMarkerUpdate);
        };
    };
};