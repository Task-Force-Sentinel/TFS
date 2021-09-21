if !(isserver) exitwith {};

// Enable/Disable Channels
[0, [TFSRHS_Channels_GlobalText, TFSRHS_Channels_GlobalVoice]] remoteExec ["enablechannel",0,true];
[1, [TFSRHS_Channels_SideText, TFSRHS_Channels_SideVoice]] remoteExec ["enablechannel",0,true];
[2, [TFSRHS_Channels_CommandText, TFSRHS_Channels_CommandVoice]] remoteExec ["enablechannel",0,true];
[3, [TFSRHS_Channels_GroupText, TFSRHS_Channels_GroupVoice]] remoteExec ["enablechannel",0,true];
[4, [TFSRHS_Channels_VehicleText, TFSRHS_Channels_VehicleVoice]] remoteExec ["enablechannel",0,true];
[5, [TFSRHS_Channels_DirectText, TFSRHS_Channels_DirectVoice]] remoteExec ["enablechannel",0,true];


// Global Duration Check
[{
	params ["_args", "_pfhID"];
	_args params [];
	if (TFSRHS_Channels_GlobalDuration isEqualTo 0) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
		if (time > (TFSRHS_Channels_GlobalDuration * 60)) then {
			[0, [false, false]] remoteExec ["enablechannel",0,true];
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};
	};
}, 60, []] call CBA_fnc_addPerFrameHandler;

// Side Duration Check
[{
	params ["_args", "_pfhID"];
	_args params [];
	if (TFSRHS_Channels_SideDuration isEqualTo 0) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
		if (time > (TFSRHS_Channels_SideDuration * 60)) then {
			[1, [false, false]] remoteExec ["enablechannel",0,true];
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};
	};
}, 60, []] call CBA_fnc_addPerFrameHandler;

// Command Duration Check
[{
	params ["_args", "_pfhID"];
	_args params [];
	if (TFSRHS_Channels_CommandDuration isEqualTo 0) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
		if (time > (TFSRHS_Channels_CommandDuration * 60)) then {
			[2, [false, false]] remoteExec ["enablechannel",0,true];
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};
	};
}, 60, []] call CBA_fnc_addPerFrameHandler;

// Group Duration Check
[{
	params ["_args", "_pfhID"];
	_args params [];
	if (TFSRHS_Channels_GroupDuration isEqualTo 0) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
		if (time > (TFSRHS_Channels_GroupDuration * 60)) then {
			[3, [false, false]] remoteExec ["enablechannel",0,true];
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};
	};
}, 60, []] call CBA_fnc_addPerFrameHandler;

// Vehicle Duration Check
[{
	params ["_args", "_pfhID"];
	_args params [];
	if (TFSRHS_Channels_VehicleDuration isEqualTo 0) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
		if (time > (TFSRHS_Channels_VehicleDuration * 60)) then {
			[4, [false, false]] remoteExec ["enablechannel",0,true];
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};
	};
}, 60, []] call CBA_fnc_addPerFrameHandler;

// Direct Duration Check
[{
	params ["_args", "_pfhID"];
	_args params [];
	if (TFSRHS_Channels_DirectDuration isEqualTo 0) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
		if (time > (TFSRHS_Channels_DirectDuration * 60)) then {
			[5, [false, false]] remoteExec ["enablechannel",0,true];
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};
	};
}, 60, []] call CBA_fnc_addPerFrameHandler;