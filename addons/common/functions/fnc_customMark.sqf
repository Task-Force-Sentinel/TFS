#include "script_component.hpp"

["TFS_setCustomMark", "onMapSingleClick", {
    params ["_pos","_shift"];
    if (_shift) then {
        TFS_unit setVariable ["TFS_customMarkLocation",_pos];
    };
}] call BIS_fnc_addStackedEventHandler;

addMissionEventHandler ["Draw3D", {
    private _TFS_customMarkLocation = TFS_unit getVariable ["TFS_customMarkLocation",nil];
    if (!isNil "_TFS_customMarkLocation") then {
        drawIcon3D [
            "tacticalpingdefault",
            [1,1,1,0.75],
            _TFS_customMarkLocation,
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
