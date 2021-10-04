params ["_object", "_radio", "_turnOn"];

private _settings = _radio call TFAR_fnc_getLrsettings;

_settings set [8, _turnOn];
(_radio select 0) setVariable ["TFAR_LRspeakersEnabled", _turnOn, true];

[_radio, _settings] call TFAR_fnc_setLrsettings;