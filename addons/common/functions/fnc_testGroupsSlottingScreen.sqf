#include "\z\tfs\addons\autotest\script_component.hpp"
/*
* name: TFS_common_fnc_testgroupsSlottingScreen
* Author: Snippers
*
* Arguments:index of side
*
* Return:
* side
*
* Description:
* checks if groups will have a custom name in the slotting screen.
*/

private _output = [];

// Deprecated in newer versions, replaced by CBA system
// https://github.com/CBATeam/CBA_A3/wiki/name-groups-in-Lobby
if ([[1, 1, 0]] call FUNC(checkTFSVersion)) then {
    // find groups with playableunits
    private _groups = [];
    {
        _groups pushBackUnique (group _x);
    } forEach playableunits;
    
    private _outputgroups = [];
    {
        private _group = _x;
        private _descriptions = [];
        private _skip = false;
        {
            private _description = (_x get3DENAttribute "description") select 0;
            if (_description find "@" != -1) exitwith {
                _skip = true
            };
            _descriptions pushBack _description;
        } forEach (units _group select {
            _x in playableunits
        });
        if (!_skip) then {
            _descriptions = _descriptions apply {
                (/*toLower*/ _x) splitstring " "
            };
            if (count (units _group) > 1) then {
                private _common = _descriptions select 0;
                {
                    // Ensure common is not more tokens than the present description.
                    _common resize ((count _x) min (count _common));
                    for "_idx2" from 0 to (count _common -1) do {
                        // diag_log str [_idx2, "c", _common, "d", _descriptions];
                        if (_common select _idx2 != _x select _idx2) exitwith {
                            _common resize _idx2;
                        }
                    };
                } forEach _descriptions;
                // diag_log str ["group", _common, "d", _descriptions];
                // _common = _common apply {
                    /*toUpper*/ (_x select [0, 1]) + (_x select [1])
                };
                if (count _common == 0) then {
                    // No common part.
                    _outputgroups pushBackUnique _group;
                };
            };
        };
    } forEach _groups;
    
    if (count _outputgroups > 0) then {
        _output pushBack [1, "Some groups do not have a slotting screen name:"];
        private _string = "";
        {
            _string = _string + ((side _x) call BIS_fnc_sidename) + " - " + groupid _x + ", ";
        } forEach _outputgroups;
        _output pushBack [1, format ["groups (%1): %2", count _outputgroups, _string]];
    };
} else {
    private _units = (playableunits + [player]);
    {
        private _desc = (_x get3DENAttribute "description") # 0;
        
        if (_desc isEqualto "") then {
            _output pushBack [1, format ["Unit lacks role description: %1", _x]];
        } else {
            if !("@" in _desc) then {
                _output pushBack [1, format ["Unit lacks slotting group name: %1 (should be: %1@group name)", _desc]];
            };
        };
    } forEach (playableunits + [player]);
};

_output