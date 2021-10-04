/*
TFS MISSION TEMPLATE
RespawnOnStartposition.sqf
Author: MitchJC
Description: Scripts executed when a player respawns.
*/
player disableConversation true;
[player, "NoVoice"] remoteExec ["setspeaker", 0, true];

call TFS_fnc_playeraddActions;

{
    _x addcuratorEditableObjects [[player], false];
} count allCurators;

if (isnil {
    player getVariable "StartingPos";
} ) then {
    player setVariable ["StartingPos", getPosATL player];
    player setVariable ["StartingDir", getDir player];
} else {
    player setPosATL (player getVariable ["StartingPos", getPosATL player]);
    player setDir (player getVariable ["StartingDir", 0]);
};

if (TFS_Main_Earplugs) then {
    [] execVM "z\tfs\addons\main\Scripts\Earplugs\earplugs.sqf";
};