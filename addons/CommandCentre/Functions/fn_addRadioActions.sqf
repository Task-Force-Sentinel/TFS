// adds ace actions to radio
params ["_object", "_radio"];

private _parentaction = [
    "radioParentaction",
    "Stationary radio",
    "",
    {
        diag_log "hi"
    },
    {
        true
    },
    nil,
    []
] call ACE_interact_menu_fnc_createaction;

private _configaction = [
    "radioConfigaction",
    "Configure radio",
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_radio"];
        [_object, _player, _radio] call TFS_fnc_configureradio;
    },
    {
        true
    },
    nil,
    [_object, _radio]
] call ACE_interact_menu_fnc_createaction;

private _turnOnaction = [
    "radioTurnOnaction",
    "Turn On radio",
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_radio"];
        [_object, _radio, true] call TFS_fnc_turnOnradio;
    },
    {
        params ["_target", "_player", "_params"];
        !((_params select 1) call TFAR_fnc_getLrspeakers);
    },
    nil,
    [_object, _radio]
] call ACE_interact_menu_fnc_createaction;

private _turnOffaction = [
    "radioTurnOffaction",
    "Turn Off radio",
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_object", "_radio"];
        [_object, _radio, false] call TFS_fnc_turnOnradio;
    },
    {
        params ["_target", "_player", "_params"];
        (_params select 1) call TFAR_fnc_getLrspeakers;
    },
    nil,
    [_object, _radio]
] call ACE_interact_menu_fnc_createaction;

[_object, 0, ["ACE_Mainactions"], _parentaction] call ACE_interact_menu_fnc_addActiontoObject;
[_object, 0, ["ACE_Mainactions", "radioParentaction"], _configaction] call ACE_interact_menu_fnc_addActiontoObject;
[_object, 0, ["ACE_Mainactions", "radioParentaction"], _turnOnaction] call ACE_interact_menu_fnc_addActiontoObject;
[_object, 0, ["ACE_Mainactions", "radioParentaction"], _turnOffaction] call ACE_interact_menu_fnc_addActiontoObject;