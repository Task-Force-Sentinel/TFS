// not documented: postinit
if !(hasinterface && (isClass (configFile >> "CfgPatches" >> "ace_main"))) exitwith {};

TFS_actionIDs = [];

_action = [
    "Creatoractions",
    "Mission Creator actions",
    "",
    {
        diag_log "running parent action"
    },
    {
        (_player getUnitTrait "Mission Maker") || (serverCommandAvailable '#kick')
    }
] call ace_interact_menu_fnc_createaction;

[player, 1, ["ACE_Selfactions"], _action] call ace_interact_menu_fnc_addActiontoObject;
[["ACE_Zeusactions"], _action] call ACE_interact_menu_fnc_addActiontoZeus;

["TFS_RegisterCreatoraction", {
    params ["_action", "_actionPath", "_actionname"];
    
    if (_actionname in TFS_actionIDs) exitwith {};
    
    [player, 1, ["ACE_Selfactions", "Creatoractions"] + _actionPath, _action] call ace_interact_menu_fnc_addActiontoObject;
    [["ACE_Zeusactions", "Creatoractions"] + _actionPath, _action] call ACE_interact_menu_fnc_addActiontoZeus;
    
    TFS_actionIDs pushBack _actionname;
}] call CBA_fnc_addEventHandler;