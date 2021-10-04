CHVD_inUAV = if ((call CHVD_fnc_UAVstatus) isEqualto 0) then {
    false
} else {
    true
};

if (CHVD_inUAV) then {
    switch (true) do {
        case (getConnectedUAV player isKindOf "landvehicle" || getConnectedUAV player isKindOf "Ship"): {
            CHVD_vehtype = 1;
        };
        case (getConnectedUAV player isKindOf "Man"): {
            CHVD_vehtype = 0;
        };
        default {
            CHVD_vehtype = 2;
        };
    };
} else {
    switch (true) do {
        case (vehicle player isKindOf "landvehicle" || vehicle player isKindOf "Ship"): {
            CHVD_vehtype = 1;
        };
        case (vehicle player isKindOf "Air"): {
            CHVD_vehtype = 2;
        };
        default {
            CHVD_vehtype = 0;
        };
    };
};