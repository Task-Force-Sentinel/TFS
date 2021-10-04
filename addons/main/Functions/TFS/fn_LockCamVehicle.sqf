// not documented, called by module

player setVariable ["TFS_VehCamlockHandle", -1];

_getinEHId = player addEventHandler ["GetinMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    
    _handle = [
        {
            if ((toUpper cameraView) isEqualto "EXTERNAL" && {
                player != vehicle player
            }) then {
                player switchCamera "inTERNAL";
            };
        },
        0, []
    ] call CBA_fnc_addPerFrameHandler;
    
    player setVariable ["TFS_VehCamlockHandle", _handle];
}
];

_getoutEHId = player addEventHandler["GetoutMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    
    _handle = player getVariable ["TFS_VehCamlockHandle", -1];
    
    if (_handle != -1) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
        player setVariable ["TFS_VehCamlock", -1];
    }
}
];