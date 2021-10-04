if !(isServer) exitwith {};

// Enable/Disable Channels
[0, [TFS_Channels_Globaltext, TFS_Channels_GlobalVoice]] remoteExec ["enableChannel", 0, true];
[1, [TFS_Channels_sidetext, TFS_Channels_sideVoice]] remoteExec ["enableChannel", 0, true];
[2, [TFS_Channels_Commandtext, TFS_Channels_CommandVoice]] remoteExec ["enableChannel", 0, true];
[3, [TFS_Channels_grouptext, TFS_Channels_groupVoice]] remoteExec ["enableChannel", 0, true];
[4, [TFS_Channels_vehicletext, TFS_Channels_vehicleVoice]] remoteExec ["enableChannel", 0, true];
[5, [TFS_Channels_Directtext, TFS_Channels_DirectVoice]] remoteExec ["enableChannel", 0, true];

// Global Duration Check
[{
    params ["_args", "_pfhID"];
    _args params [];
    if (TFS_Channels_GlobalDuration isEqualto 0) then {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        if (time > (TFS_Channels_GlobalDuration * 60)) then {
            [0, [false, false]] remoteExec ["enableChannel", 0, true];
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
    };
}, 60, []] call CBA_fnc_addPerFrameHandler;

// side Duration Check
[{
    params ["_args", "_pfhID"];
    _args params [];
    if (TFS_Channels_sideDuration isEqualto 0) then {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        if (time > (TFS_Channels_sideDuration * 60)) then {
            [1, [false, false]] remoteExec ["enableChannel", 0, true];
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
    };
}, 60, []] call CBA_fnc_addPerFrameHandler;

// Command Duration Check
[{
    params ["_args", "_pfhID"];
    _args params [];
    if (TFS_Channels_CommandDuration isEqualto 0) then {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        if (time > (TFS_Channels_CommandDuration * 60)) then {
            [2, [false, false]] remoteExec ["enableChannel", 0, true];
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
    };
}, 60, []] call CBA_fnc_addPerFrameHandler;

// group Duration Check
[{
    params ["_args", "_pfhID"];
    _args params [];
    if (TFS_Channels_groupDuration isEqualto 0) then {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        if (time > (TFS_Channels_groupDuration * 60)) then {
            [3, [false, false]] remoteExec ["enableChannel", 0, true];
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
    };
}, 60, []] call CBA_fnc_addPerFrameHandler;

// vehicle Duration Check
[{
    params ["_args", "_pfhID"];
    _args params [];
    if (TFS_Channels_vehicleDuration isEqualto 0) then {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        if (time > (TFS_Channels_vehicleDuration * 60)) then {
            [4, [false, false]] remoteExec ["enableChannel", 0, true];
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
    };
}, 60, []] call CBA_fnc_addPerFrameHandler;

// Direct Duration Check
[{
    params ["_args", "_pfhID"];
    _args params [];
    if (TFS_Channels_DirectDuration isEqualto 0) then {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        if (time > (TFS_Channels_DirectDuration * 60)) then {
            [5, [false, false]] remoteExec ["enableChannel", 0, true];
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
    };
}, 60, []] call CBA_fnc_addPerFrameHandler;