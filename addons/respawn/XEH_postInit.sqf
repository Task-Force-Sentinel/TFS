#include "script_component.hpp"

if (isServer) then {
    // Event forces respawn for all clients
    [QGVAR(force), {
        [QGVAR(force)] call CBA_fnc_remoteEvent;
    }] call CBA_fnc_addEventHandler;
};

if (hasinterface) then {
    // Save equipment event if anyone wanted to save it by himself at any time
    [QGVAR(saveEquipment), {
        GVAR(savedEquipment) = getUnitloadout player;
    }] call CBA_fnc_addEventHandler;
    
    // Save initial equipment
    [{
        alive player
    }, {
        [QGVAR(saveEquipment)] call CBA_fnc_localEvent;
    }] call CBA_fnc_waitUntilandexecute;
    
    // Event forces respawn for local client if he's ded
    [QGVAR(force), {
        if (alive player) exitwith {};
        setPlayerRespawntime time_minIMUM;
    }] call CBA_fnc_addEventHandler;
    
    // Events for enabling/disabling respawn locally
    [QGVAR(enable), {
        _this call FUNC(enable);
    }] call CBA_fnc_addEventHandler;
    
    [QGVAR(disable), {
        _this call FUNC(disable);
    }] call CBA_fnc_addEventHandler;
    
    // Event for adjusting remaining respawn time when respawn time changes
    [QGVAR(adjusttimelocal), {
        _this call FUNC(adjusttimelocal);
    }] call CBA_fnc_addEventHandler;
};