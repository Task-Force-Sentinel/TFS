/*
TFS MISSION TEMPLATE
RespawnforWarlords.sqf
Author: MitchJC
Description: Scripts executed when a player respawns.
*/
player disableConversation true;
[player, "NoVoice"] remoteExec ["setspeaker", 0, true];

call TFS_fnc_playeraddActions;

{
    _x addcuratorEditableObjects [[player], false];
} count allCurators;

call TFS_fnc_ProfileCredits;