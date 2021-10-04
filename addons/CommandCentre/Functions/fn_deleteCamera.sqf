params ["_object", "_selection"];

// delete cameras
private _cam = _object getVariable format ["TFS_CC_screen_%1_Cam", _selection];

// obtain render target
private _screen_id = _object getVariable [format ["TFS_CC_screen_%1_ID", _selection], -1];
private _renderTarget = format["screenrt%1", _screen_id];

if !(isnil "_cam") then {
    if !(isNull (_cam select 0)) then {
        (_cam select 0) cameraEffect ["terminate", "BACK", _renderTarget];
        camDestroy (_cam select 0);
    };
    
    if !(isNull (_cam select 1)) then {
        deletevehicle (_cam select 1);
    };
};

_object setVariable [format ["TFS_CC_screen_%1_Cam", _selection], nil];