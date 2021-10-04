// Updates the group names on the slotting/lobby screen.

#include "\z\tfs\addons\common\script_component.hpp"

params ["_display"];

// Deprecated in newer versions, replaced by CBA system
// https://github.com/CBATeam/CBA_A3/wiki/name-groups-in-Lobby
if ([[1, 1, 0]] call FUNC(checkTFSVersion)) exitwith {};

private _fn_update_group_names_in_lobby = {
    params ["_display"];
    private _slotlistControl = _display displayCtrl 109;
    
    private _lastgroupname = "";
    for "_playerlistIdx" from 1 to (lbsize _slotlistControl) do {
        private _currenttext = _slotlistControl lbtext 0;
        private _currentValue = _slotlistControl lbValue 0;
        
        // delete old lb entry (replace later)
        _slotlistControl lbDelete 0;
        
        if (_currentValue isEqualto -1) then {
            // Value is -1 when it's a groupname.
            
            // Collect descriptions of upcoming roles/terminate if another group appears.
            private _descriptions = [];
            for "_idx" from 0 to (lbsize _slotlistControl -1) do {
                private _currentValue = _slotlistControl lbValue _idx;
                if (_currentValue isEqualto -1) exitwith {};
                // terminate upon reaching next group.
                _descriptions pushBack (_slotlistControl lbtext _idx);
            };
            _descriptions = _descriptions apply {
                (/*toLower*/ _x) splitstring " "
            };
            if (count _descriptions > 1) then {
                private _common = _descriptions select 0;
                _common = _common select [0, count _common -1];
                // Ensure the last word isn't used so every description has at least one word.
                {
                    // Ensure common is not more tokens than the present description and one less than the current ensures that every slot has at least one word remaining.
                    _common resize (((count _x)-1) min (count _common));
                    for "_idx2" from 0 to (count _common -1) do {
                        if (_common select _idx2 != _x select _idx2) exitwith {
                            _common resize _idx2;
                        }
                    };
                } forEach _descriptions;
                _lastgroupname = _common joinstring " ";
            } else {
                _lastgroupname = "";
            };
            
            if (_lastgroupname != "") then {
                _currenttext = _lastgroupname;
            };
        } else {
            _currenttext = _currenttext select [count _lastgroupname];
        };
        
        // Add new entry.
        private _slotlistIdx = _slotlistControl lbAdd _currenttext;
        _slotlistControl lbsetValue [_slotlistIdx, _currentValue];
    };
};

_display call _fn_update_group_names_in_lobby;

// Refresh constantly.
_display displayAddEventHandler ["MouseMoving", _fn_update_group_names_in_lobby];
_display displayAddEventHandler ["MouseHolding", _fn_update_group_names_in_lobby];