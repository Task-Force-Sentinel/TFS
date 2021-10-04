["TFS", QGVAR(openKey), ["Open admin Menu", "Only available for admins and in singleplayer"], FUNC(keyPressed), {
    false
}, [59, [true, false, false]], false, 0] call CBA_fnc_addKeybind;

["TFS", QGVAR(spectatorremoteControl), ["Control Focused Spectator Unit", "Only available in TFS Spectator, and only for admins and in singleplayer"], FUNC(keyPressed), {
    false
}, [0, [false, false, false]], false, 0] call CBA_fnc_addKeybind;

[QEGVAR(spectator, keydown), {
    params ["", "_args"];
    _args call FUNC(keyPressed);
}] call CBA_fnc_addEventHandler;