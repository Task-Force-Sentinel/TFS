private _fnc_settings = {
    [
        QGVAR(printtoChat),
        "list",
        ["Print log messages to chat", "Whether to print logged messages to chat. Only visible for admins."],
        ["TFS adminmenu"],
        [[2, 1, 0], ["All Messages", "Only Warnings", "None"], 1]
    ] call CBA_fnc_addsetting;
    
    [
        QGVAR(endlogtorPT),
        "CHECKBOX",
        ["Print log to server RPT on mission end", "toggles whether to print the admin log to server RPT once mission ends."],
        ["TFS adminmenu"],
        false
    ] call CBA_fnc_addsetting;
};

if is3DEN then _fnc_settings else {
    [{
        [] call FUNC(isAuthorized) || isServer
    }, _fnc_settings] call CBA_fnc_waitUntilandexecute;
};