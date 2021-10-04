#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_endMission
* Author: Snippers
*
* Arguments:
* See - https:// community.bistudio.com/wiki/BIS_fnc_endMission
*
* Return:
* nil
*
* Description:
* Function to gracefully end the mission and display the end mission splash screen.
*
*/

if (!isServer) exitwith {};
// Only run on server.

if (missionnamespace getVariable [QGVAR(ending), false]) exitwith {};
// Already trying to end.

// Message admins
private _message = format["[TFS] Ending mission..."];
[_message, 'tac1_admin_fnc_messageadmin', true] call BIS_fnc_MP;

GVAR(endMissionWait) = -1;
GVAR(ending) = true;

if (!isnil "ocap_fnc_exportData") then {
    _message = format["[TFS] OCAP detected exporting (10 second timeout)..."];
    [_message, 'tac1_admin_fnc_messageadmin', true] call BIS_fnc_MP;
    
    GVAR(endMissionWait) = time + 10;
    // Give OCAP 10 seconds.
    
    // Start in own 'thread'
    [] spawn {
        {
            [] call ocap_fnc_exportData;
            private _message = format["[TFS] OCAP export complete. Ending..."];
            [_message, 'tac1_admin_fnc_messageadmin', true] call BIS_fnc_MP;
            GVAR(endMissionWait) = -1;
        } call CBA_fnc_directcall;
    };
};

// End Mission.

// todo - Replace with our own splashscreen
// [endname, isVictory, fadetype, playMusic, completeTasks] spawn BIS_fnc_endMission;
[{
    time > GVAR(endMissionWait)
}, {
    [(_this select 0), 'BIS_fnc_endMission', true] call BIS_fnc_MP;
    // End the mission for everyone.
}, [_this]] call CBA_fnc_waitUntilandexecute;