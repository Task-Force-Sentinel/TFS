if !(hasinterface && (isClass (configFile >> "CfgPatches" >> "ace_main"))) exitwith {};

[
    "Channelactions",
    "Channel actions",
    "",
    {
        diag_log "Running channel actions parent";
    },
    {
        true
    },
    []
] call TFS_fnc_AddCreatoraction;

{
    _channelID = _forEachindex;
    _channelname = _x;
    
    _enableStatement = compile format ["[%1, [true, false]] remoteExec [""enableChannel"", 0, true];
    ", _channelID];
    _disableStatement = compile format ["[%1, [false, false]] remoteExec [""enableChannel"", 0, true];
    ", _channelID];
    
    _channelEnabled = compile format ["(channelEnabled %1) select 0", _channelID];
    _channelDisabled = compile format ["not ((channelEnabled %1) select 0)", _channelID];
    
    [
        format ["Enable%1", _channelID],
        format ["Enable %1", _channelname],
        "",
        _enableStatement,
        _channelDisabled,
        ["Channelactions"]
    ] call TFS_fnc_AddCreatoraction;
    
    [
        format ["Disable%1", _channelID],
        format ["Disable %1", _channelname],
        "",
        _disableStatement,
        _channelEnabled,
        ["Channelactions"]
    ] call TFS_fnc_AddCreatoraction;
    } forEach [
        "Global",
        "side",
        "Command",
        "group",
        "vehicle",
        "Direct"
    ];