params ["_object", "_selection", "_rendertarget", "_data"];

private ["_targetoffset", "_camOffset"];
private _host = objNull;
private _isMan = false;

call cTab_fnc_updatelists;

{
    if (_data isEqualto (str _x)) exitwith {
        _host = _x;
    };
} forEach cTabHcamlist;

if (isNull _host) then {
    {
        if (_data isEqualto (str _x)) exitwith {
            _host = _x;
        };
    } forEach TFS_CC_vehicleCamlist;
} else {
    _isMan = true;
};

call {
    if (_isMan) exitwith {
        // should unit not be in a vehicle
        if (vehicle _host isKindOf "CAManBase") exitwith {
            _camOffset = [0.12, 0, 0.15];
            _targetoffset = [0, 8, 1];
        };
        _host = vehicle _host;
        _camOffset = [0, -8, 4];
        _targetoffset = [0, 8, 2];
    };
    
    // Might want to calculate offsets based on the actual vehicle dimensions in the future
    _camOffset = [0, -8, 4];
    _targetoffset = [0, 8, 2];
};

if (isNull _host) exitwith {
    // systemChat "Could not find camera host.";
};

private _cam = objNull;
private _exit = false;

[_object, _selection] call TFS_fnc_deleteCamera;

private _target = "Sign_Sphere10cm_F" createvehiclelocal (position player);
hideObject _target;
_target attachto [_host, _targetoffset];

_cam = "camera" camCreate (getPosATL _host);
_cam camPrepareFov 0.7;
_cam camPrepareTarget _target;
_cam camCommitPrepared 0;

if (vehicle _host == _host) then {
    _cam attachto [_host, _camOffset, "Head"];
} else {
    _cam attachto [_host, _camOffset];
};

_cam cameraEffect ["inTERNAL", "BACK", _renderTarget];

_object setobjecttexture [_selection, format ["#(argb, 512, 512, 1)r2t(%1, 1.3096153846)", _renderTarget]];

_object setVariable [format ["TFS_CC_screen_%1_Cam", _selection], [_cam, _target, _host]];