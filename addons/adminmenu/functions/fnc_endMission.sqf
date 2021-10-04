#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

[_display] call FUNC(endMission_occluder);

// Populate mission ending list
private _endinglist = (_display displayCtrl IDC_TFS_adminMENU_ENDM_list);
if ((lbsize _endinglist) == 0) then {
    {
        private _title = gettext (_x >> "title");
        
        private _extra = gettext (_x >> "description");
        if !(_extra isEqualto "") then {
            _title = _title + " | " + _extra;
        };
        
        _extra = gettext (_x >> "subtitle");
        if !(_extra isEqualto "") then {
            _title = _title + " | " + _extra;
        };
        
        _endinglist lbAdd _title;
        _endinglist lbsetData [_forEachindex, configname _x];
    } forEach ("true" configClasses (missionConfigFile >> "CfgDebriefing"));
    
    _endinglist lbsetData [(_endinglist lbAdd "Generic Success"), QGVAR(victory)];
    _endinglist lbsetData [(_endinglist lbAdd "Generic Fail"), QGVAR(defeat)];
    _endinglist lbsetData [(_endinglist lbAdd "Generic Draw"), QGVAR(draw)];
    _endinglist lbsetData [(_endinglist lbAdd "Generic Technical Issues"), QGVAR(technical_issues)];
};