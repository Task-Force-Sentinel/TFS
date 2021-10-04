#include "\z\tfs\addons\adminmenu\script_component.hpp"

#include "initKeybinds.sqf"

if (isTFS) then {
    GVAR(disconnectEH) = addMissionEventHandler ["HandleDisconnect", {
        params ["_unit", "_id", "_uid", "_name"];
        if !(typeOf _unit isEqualto QEGVAR(spectator, unit)) then {
            [format ["player disconnected while not spectator: %1", _name], true] call FUNC(log);
        };
    }];
};

// Trigger Hunt.
[QGVAR(hunt), {
    // find player side
    private _playerside = west;
    // default.
    private _playercount = {
        side _x == west && {
            isplayer _x
        }
    } count (playableunits + switchableunits);
    
    private _eastcount = {
        side _x == east && {
            isplayer _x
        }
    } count (playableunits + switchableunits);
    if (_eastcount > _playercount) then {
        _playerside = east;
        _playercount = _eastcount;
    };
    private _indcount = {
        side _x == independent && {
            isplayer _x
        }
    } count (playableunits + switchableunits);
    if (_indcount > _playercount) then {
        _playerside = independent;
        _playercount = _indcount;
    };
    
    // find AI sides.
    private _aisides = [west, east, independent] select {
        [_playerside, _x] call BIS_fnc_sideIsEnemy
    };
    
    private _hunters = allunits select {
        (!isplayer _x) && {
            (side _x) in _aisides
        }
    };
    
    // setup units.
    private _oldgroups = [];
    {
        private _unit = _x;
        _oldgroups pushBackUnique (group _unit);
        
        [_unit] joinSilent grpNull;
        _unit setunitPos "UP";
        _unit disableAI "SUPPRESSION";
        _unit disableAI "AUtoCOMBAT";
        // Already applied at init but reapply.
        _unit setBehaviour "AWARE";
        _unit setspeedMode "FULL";
        
        // Just in case MM went crazy.
        _unit enableAI "PATH";
        _unit enableAI "move";
        
        _unit allowfleeing 0;
        dostop _unit;
    } forEach _hunters;
    
    // Cleanup groups no longer used.
    {
        if (count (units _x) == 0) then {
            deletegroup _x;
        };
    } forEach (_oldgroups - [grpNull]);
    
    // params ["_hunters", "_targetside", "_position", "_range", ["_targets", []]]
    private _targets = allunits select {
        side _x == _playerside && isplayer _x
    };
    [_hunters, _playerside, [0, 0, 0], 6000, _targets] spawn EFUNC(ai, huntLoop);
}] call CBA_fnc_addEventHandler;

if (isMultiplayer) then {
    GVAR(activeClients) = [];
    
    private _id = addMissionEventHandler ["HandleDisconnect", {
        private _clientownerId = _this select 4;
        GVAR(activeClients) = GVAR(activeClients) - [_clientownerId];
        
        if (((count GVAR(activeClients)) isEqualto 0) && {
            !isnil QGVAR(fps_pfh)
        }) then {
            [GVAR(fps_pfh)] call CBA_fnc_removePerFrameHandler;
            GVAR(fps_pfh) = nil;
        };
    }];
};

if (isnil QGVAR(sideCenter)) then {
    GVAR(sideCenter) = createCenter sideLogic;
};

GVAR(zeusgroup) = creategroup GVAR(sideCenter);
if (isNull GVAR(zeusgroup)) then {
    GVAR(zeusgroup) = creategroup civilian;
};