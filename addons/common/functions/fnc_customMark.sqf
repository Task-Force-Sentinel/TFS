#include "script_component.hpp"

["TFSRHS_setCustomMark", "onMapSingleClick", {
    params ["_pos","_shift"];
    if (_shift) then {
        TFSRHS_unit setVariable ["TFSRHS_customMarkLocation",_pos];
    };
}] call BIS_fnc_addStackedEventHandler;

addMissionEventHandler ["Draw3D", {
    private _TFSRHS_customMarkLocation = TFSRHS_unit getVariable ["TFSRHS_customMarkLocation",nil];
    if (!isNil "_TFSRHS_customMarkLocation") then {
        drawIcon3D [
            "tacticalpingdefault",
            [1,1,1,0.75],
            _TFSRHS_customMarkLocation,
            1,
            1,
            0,
            "Marker",
            1,
            0.3,
            "TahomaB",
            'center'
        ];
    };
}];
