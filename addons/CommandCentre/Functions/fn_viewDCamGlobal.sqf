params ["_object", "_selection", "_rendertarget", "_data", "_seat"];

private _uav = objNull;

call cTab_fnc_updatelists;

{
    if (_data == str _x) exitwith {
        _uav = _x;
    };
} forEach cTabUAVlist;

// exit if requested UAV could not be found
if (isNull _uav) exitwith {
    false
};

// exit if requested UAV is not alive
if (!alive _uav) exitwith {
    false
};

[_object, _selection] call TFS_fnc_deleteCamera;

private _cam = objNull;
private _camPosMemPt = "";
private _camDirMemPt = "";

private _seatname = call {
    if (_seat == 0) exitwith {
        "driver"
    };
    if (_seat == 1) exitwith {
        "gunner"
    };
    ""
};

if (_seatname != "") then {
    _camPosMemPt = gettext (configFile >> "Cfgvehicles" >> typeOf _uav >> "uavCamera" + _seatname + "Pos");
    _camDirMemPt = gettext (configFile >> "Cfgvehicles" >> typeOf _uav >> "uavCamera" + _seatname + "Dir");
};

if ((_camPosMemPt != "") && (_camDirMemPt != "")) then {
    _cam = "camera" camCreate [0, 0, 0];
    _cam attachto [_uav, [0, 0, 0], _camPosMemPt];
    // set up cam on render target
    _cam cameraEffect ["inTERNAL", "BACK", _renderTarget];
    _object setobjecttexture [_selection, format ["#(argb, 512, 512, 1)r2t(%1, 1.3096153846)", _renderTarget]];
    call {
        if (_seat == 1) exitwith {
            _cam camsetFov 0.1;
            // set zoom
        };
        _cam camsetFov 0.5;
        // set default zoom
    };
    // set up cam updating
    [_uav, _renderTarget, _cam, _camPosMemPt, _camDirMemPt] spawn {
        private _uav = _this select 0;
        private _cam = _this select 2;
        
        while {(not isNull _uav) && (not isNull _cam)} do {
            if (alive _uav) then {
                _dir = (_uav selectionPosition (_this select 3)) vectorFromTo (_uav selectionPosition (_this select 4));
                _cam setvectorDirAndUp [_dir, _dir vectorCrossProduct [-(_dir select 1), _dir select 0, 0]];
            } else {
                _cam cameraEffect ["terminate", "BACK"];
                camDestroy _cam;
            };
            sleep 0.1;
        };
    };
    _object setVariable [format ["TFS_CC_screen_%1_Cam", _selection], [_cam, objNull, _uav]];
};