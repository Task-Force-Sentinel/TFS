private ["_updatetype"];
_updatetype = [_this, 0, 0, [0]] call BIS_fnc_param;
// 1 - view, 2 - obj, 3 - both, 4 - FOV, 0 - both and terrain

switch (_updatetype) do {
    case 1: {
        switch (CHVD_vehtype) do {
            case 0: {
                setviewDistance CHVD_foot
            };
            case 1: {
                setviewDistance CHVD_car
            };
            case 2: {
                setviewDistance CHVD_air
            };
        };
    };
    case 2: {
        switch (CHVD_vehtype) do {
            case 0: {
                setobjectviewDistance CHVD_footobj
            };
            case 1: {
                setobjectviewDistance CHVD_carObj
            };
            case 2: {
                setobjectviewDistance CHVD_airObj
            };
        };
    };
    case 4: {
        switch (CHVD_vehtype) do {
            case 0: {
                setobjectviewDistance ([CHVD_footobj] call CHVD_fnc_fovviewDistance)
            };
            case 1: {
                setobjectviewDistance ([CHVD_carObj] call CHVD_fnc_fovviewDistance)
            };
            case 2: {
                setobjectviewDistance ([CHVD_airObj] call CHVD_fnc_fovviewDistance)
            };
        };
    };
    default {
        switch (CHVD_vehtype) do {
            case 0: {
                setviewDistance CHVD_foot;
                setobjectviewDistance CHVD_footobj
            };
            case 1: {
                setviewDistance CHVD_car;
                setobjectviewDistance CHVD_carObj
            };
            case 2: {
                setviewDistance CHVD_air;
                setobjectviewDistance CHVD_airObj
            };
        };
    };
};

if (_updatetype isEqualto 0) then {
    [] call CHVD_fnc_updateTerrain;
};