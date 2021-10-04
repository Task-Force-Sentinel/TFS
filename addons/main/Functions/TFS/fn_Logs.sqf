// not documented: postinit

// Server log Check
if (isServer) then {
    _A3ServerlogsEnabled = false;
    
    if (isClass (configFile >> "CfgPatches" >> "a3log")) exitwith {
        _A3ServerlogsEnabled = true;
    };
};

if (isnil "_A3ServerlogsEnabled") exitwith {};
if (not _A3ServerlogsEnabled) exitwith {};

// Client called logs
if (hasinterface) then {
    _log = format ["%1 attended as %2.", name player, roleDescription player ];
    [_log, "TFS_CONNECTlog"] remoteExecCall ["A3log", 2];
};

// Server called logs
if (isServer) then {
    [
        "ace_unconscious", {
            if (_this select 1) then {
                // Get player object
                _player = _this select 0;
                
                // increment death count
                _deathcount = _player getVariable ["deathcount", 0];
                _deathcount = _deathcount + 1;
                _player setVariable ["deathcount", _deathcount];
                
                // logging
                _log = format ["--- %1 --- is Unconscious. (total: %2)", name _player, _deathcount];
                [_log, "TFS_DEATHlog"] call A3log;
            };
        }
    ] call CBA_fnc_addEventHandler;
    
    _log = format ["********************* %1 *********************", briefingname];
    [_log, "TFS_CONNECTlog"] remoteExecCall ["A3log", 2];
    [_log, "TFS_DEATHlog"] remoteExecCall ["A3log", 2];
};