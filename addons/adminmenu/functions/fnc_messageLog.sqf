#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

TRACE_1("initializing message log", _display);

[] call FUNC(resynclog);

private _pfhRefresh = [{
    disableSerialization;
    params ["_display", "_handle"];
    
    private _listCtrl = _display displayCtrl IDC_TFS_adminMENU_MSGS_list;
    
    private _entriesNum = lbsize _listCtrl;
    private _newEntriesNum = count GVAR(logEntries);
    
    for "_i" from (_entriesNum + 1) to _newEntriesNum do {
        (GVAR(logEntries) # (_i - 1)) params [
            ["_time", CBA_missiontime, [-1]],
            ["_text", "", [""]],
            ["_isWarning", false, [false]]
        ];
        TRACE_3("Adding log entry", _time, _text, _isWarning);
        
        _text = format ["[%1]: %2", [_time, "MM:SS"] call BIS_fnc_secondstoString, _text];
        
        private _index = _listCtrl lbAdd _text;
        
        if (_isWarning) then {
            _listCtrl lbsetpictureRight [_index, QPATHtoEF(autotest, ui\warning.paa)];
        };
    };
    
    // Autoscroll
    private _curSel = lbCurSel _listCtrl;
    if (_curSel == -1 || (_curSel == _entriesNum -1 && _entriesNum != _newEntriesNum)) then {
        log("Autoscroll log");
        _listCtrl lbsetCurSel (lbsize _listCtrl - 1);
    };
}, 1, _display] call CBA_fnc_addPerFrameHandler;

GVAR(tabPFHHandles) pushBack _pfhRefresh;