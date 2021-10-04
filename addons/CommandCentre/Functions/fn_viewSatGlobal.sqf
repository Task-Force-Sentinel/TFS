params ["_object", "_selection", "_rendertarget", "_data"];

private _host = objNull;

call cTab_fnc_updatelists;

{
    if (_data isEqualto (str _x)) exitwith {
        _host = _x;
    };
} forEach (cTabHcamlist + TFS_CC_vehicleCamlist);

if (isNull _host) exitwith {
    // systemChat "Could not find camera host.";
};

private _cam = objNull;

[_object, _selection] call TFS_fnc_deleteCamera;

_cam = "camera" camCreate [(getPosATL _host) select 0, (getPosATL _host) select 1, ((getPosATL _host) select 2) + 300];
_cam camPrepareFov 0.15;
_cam setvectorDirAndUp [[0, 0, -1], [0, 1, 0]];
_cam camCommitPrepared 0;

[_cam, _host] spawn {
    params ["_cam", "_host"];
    while {(not isNull _cam) && (not isNull _host)} do {
        _cam setPos [(getPos _host select 0), (getPos _host select 1), (getPos _host select 2) + 300];
        sleep 0.1;
    };
};

_cam cameraEffect ["inTERNAL", "BACK", _renderTarget];
_object setobjecttexture [_selection, format ["#(argb, 512, 512, 1)r2t(%1, 1.3096153846)", _renderTarget]];

_object setVariable [format ["TFS_CC_screen_%1_Cam", _selection], [_cam, objNull, _host]];