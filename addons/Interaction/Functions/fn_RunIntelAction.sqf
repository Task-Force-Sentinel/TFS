// not documented: internal function
_object = _this select 0;
_caller = _this select 1;
_arguments = _this select 2;
_callername = if (_caller == player) then {
    profileName
} else {
    name _caller
};
_var = (_fnc_scriptName + str _object) call bis_fnc_filterstring;

// --- Create marker to which diary link is pointed
_marker = createMarker [_var, position _object];

// --- Process intel data
_data = [_object, "RscAttributeDiaryRecord", ["", "", ""]] call bis_fnc_getServerVariable;
_title = _data select 0;
_text = _data select 1;
_texture = _object getVariable ["RscAttributeDiaryRecord_texture", ""];

// --- Save intel data to server (clients will get them on request)
[nil, _var, [_title, _text, _texture, _marker, _callername]] call bis_fnc_setServerVariable;

// --- Get intel recipients
_recipients = _object getVariable ["recipients", west];
_persistent = if (isnil "_recipients") then {
    _recipients = _caller;
    false
} else {
    true
};

// --- call scripted event handlers
{
    [[_x, "intelObjectFound", [_x, _caller, _object]], "bis_fnc_callscriptedeventhandler", _x] call bis_fnc_mp;
} forEach (objectCurators _object);
[_object, "intelObjectFound", [_object, _caller]] call bis_fnc_callscriptedeventhandler;

// --- Play taking animation and delete the object afterwards
_caller playAction "putdown";
for "_i" from 0 to 1 do {
    _state = animationState _caller;
    waitUntil {
        _state != animationState _caller
    };
};

deletevehicle _object;

[_var, "diary"] remoteExec ["BIS_fnc_initintelObject", _recipients, _persistent];