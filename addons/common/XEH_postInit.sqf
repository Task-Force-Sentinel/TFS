#include "\z\tfs\addons\common\script_component.hpp"

// IS TFS mission

if (isTFS) then {
    enableSaving [false, false];
    // Disable mission saving
    enableSentences false;
    // Mute AI reports?
    
    if (hasinterface && GVAR(weaponsafety)) then {
        [{
            time > 0
        },
        {
            // Turn on Weapon Safety.
            if (currentWeapon player != "") then {
                [player, currentWeapon player, currentMuzzle player] call ACE_safemode_fnc_lockSafety;
            };
        }, 0] call CBA_fnc_waitUntilandexecute;
    };
};

// todo - Remove if added to ST HUD.
[{
    !isnil "STHud_Getname"
},
{
    STHud_Getname =
    {
        params ["_unit", "_fullname"];
        private _value = _unit getVariable ["sth_name", []];
        if ((count(_value) isEqualto 0) || {
            !(isplayer(_unit) isEqualto (_value select 0))
        }) then
        {
            private _newname = name (_unit);
            if (_newname != "") then {
                _value = [isplayer(_unit), _newname, _unit call STHud_Getname_Short];
            } else {
                if (count _value > 0) then {
                    // Already defined.
                    _value set [0, isplayer(_unit)];
                } else {
                    _value = [isplayer(_unit), "", ""];
                };
            };
            _unit setVariable ["sth_name", _value, false];
        };
        
        if (_fullname) then {
            _value select 1;
        } else {
            _value select 2;
        };
    };
}, []] call CBA_fnc_waitUntilandexecute;

// VARIABLE SYNCHRONIZATION - ENSURE VARIABLES ARE SYNCHRONIZED BEforE PROCESsinG.
// Some code relies on tfs_common__VarSync being set before processing e.g. briefing/radio assignment
// Register event to recieve notification of variable synchorization has been completed.
[QGVAR(serverVariableSyncResponse), {
    GVAR(VarSync) = true;
    diag_log "TFS Common: Variable Synchronization Completed";
}] call CBA_fnc_addEventHandler;

// Send request event to server. Server will respon a frame later with the response being added to back of message queue.
// initially wait 2 frames to allow all group variable initialization to finish
[{
    [{
        [QGVAR(requestServerSync), [clientowner]] call CBA_fnc_serverEvent;
    }] call CBA_fnc_execNextFrame;
}] call CBA_fnc_execNextFrame;

["unit", {
    TFS_unit = (_this select 0);
}, true] call CBA_fnc_addplayerEventHandler;

mod_ACE3 = isClass (configFile >> "CfgPatches" >> "ace_common");

if (isServer) then {
    [{
        time > 5
    }, {
        call FUNC(initDB);
        call FUNC(rptlog);
        {
            private _markername = "respawn_" + name _x;
            if !(_markername in allMapMarkers) then {
                createMarker [_markername, ASLtoAGL getPosASL _x];
            };
        } forEach allplayers;
    }] call CBA_fnc_waitUntilandexecute;
};

if (hasinterface) then {
    call compile preprocessFileLineNumbers QPATHtoF(tplCredits.sqf);
    [] spawn FUNC(missioninitialization);
};