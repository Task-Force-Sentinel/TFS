// not documented: postinit

private _markerlocal = false;
private _source = "";
private _position = 1;

if (isServer) then {
    _source = "Server";
} else {
    // if we have not got our map display yet, retry when we do
    if (isNull (findDisplay 12)) exitwith {
        [{
            !isNull (findDisplay 12)
        }, {
            call YAinA_F_fnc_showFPS
        }, []] call CBA_fnc_waitUntilandexecute;
    };
    
    if (hasinterface) then {
        _position = 0;
        _source = "local";
        _markerlocal = true;
    } else {
        // todo: Get rid of this shit...
        if ((profileName select [0, 2]) isEqualto "HC") then {
            _position = floor(parseNumber(profileName select [2])) + 1;
            _source = profileName;
        };
    };
};

if (_source != "") then {
    if (_markerlocal) then {
        _myfpsmarker = createMarkerlocal [ format ["localFPS%1", name player ], [ 250, 250 + (250 * _position) ] ];
        _myfpsmarker setMarkertypeLocal "mil_box";
        _myfpsmarker setMarkersizeLocal [ 0.5, 0.5 ];
        
        // Add PFH for 5 second intervals
        [{
            params ["_args", "_pfhID"];
            _args params ["_source", "_myfpsmarker"];
            
            _myfps = diag_fps;
            _localunits = {
                local _x
            } count allunits;
            _localgroups = {
                local _x
            } count allgroups;
            _localvehicles = {
                local _x
            } count vehicles;
            
            _myfpsmarker setMarkerColorLocal "ColorGUER";
            if (_myfps < 30) then {
                _myfpsmarker setMarkerColorLocal "ColorUNKNOWN";
            };
            if (_myfps < 20) then {
                _myfpsmarker setMarkerColorLocal "ColororANGE";
            };
            if (_myfps < 10) then {
                _myfpsmarker setMarkerColorLocal "coloropfor";
            };
            
            _myfpsmarker setMarkertextLocal format [ "%1: %2 fps, %3 units, %4 groups, %5 vehicles", _source, (round ( _myfps * 100.0 )) / 100.0, _localunits, _localgroups, _localvehicles ];
        }, 5, [_source, _myfpsmarker]] call CBA_fnc_addPerFrameHandler;
    } else {
        _myfpsmarker = createMarker [ format ["fpsmarker%1", _source ], [ 250, 250 + (250 * _position) ] ];
        _myfpsmarker setMarkertype "mil_triangle";
        _myfpsmarker setMarkersize [ 0.5, 0.5 ];
        
        // Add PFH for 5 second intervals
        [{
            params ["_args", "_pfhID"];
            _args params ["_source", "_myfpsmarker"];
            
            _myfps = diag_fps;
            _localunits = {
                local _x
            } count allunits;
            _localgroups = {
                local _x
            } count allgroups;
            _localvehicles = {
                local _x
            } count vehicles;
            
            _myfpsmarker setMarkerColor "ColorGUER";
            if (_myfps < 30) then {
                _myfpsmarker setMarkerColor "ColorUNKNOWN";
            };
            if (_myfps < 20) then {
                _myfpsmarker setMarkerColor "ColororANGE";
            };
            if (_myfps < 10) then {
                _myfpsmarker setMarkerColor "coloropfor";
            };
            
            _myfpsmarker setMarkertext format [ "%1: %2 fps, %3 units, %4 groups, %5 vehicles", _source, (round ( _myfps * 100.0 )) / 100.0, _localunits, _localgroups, _localvehicles ];
        }, 5, [_source, _myfpsmarker]] call CBA_fnc_addPerFrameHandler;
    };
};