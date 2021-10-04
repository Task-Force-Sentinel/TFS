#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

private _control = (_display displayCtrl IDC_TFS_adminMENU_RESP_faction);
lbClear _control;

private _activefactionCategory = GVAR(currentfactionCategory);

private _factions = [];

/* Fill faction categories */
private _playerfactions = [] call CBA_fnc_hashCreate;
{
    private _faction = _x getVariable ["TFS_assignGear_faction", ""];
    if (_faction != "") then {
        if ([_playerfactions, _faction] call CBA_fnc_hashHasKey) then {
            private _value = [_playerfactions, _faction] call CBA_fnc_hashGet;
            [_playerfactions, _faction, _value + 1] call CBA_fnc_hashset;
        } else {
            [_playerfactions, _faction, 1] call CBA_fnc_hashset;
        };
    };
} forEach allplayers;

if (_activefactionCategory == "mission") then {
    // use missionConfigFile
    {
        private _factionname = (toLower(configname _x));
        _factions pushBackUnique [gettext(_x >> "displayname"), _factionname];
    } forEach (configProperties [missionConfigFile >> "Cfgloadouts", "isClass _x"]);
} else {
    // then configFile
    {
        private _category = toLower (gettext (_x >> "category"));
        if (_category == "") then {
            _category = "Other";
        };
        if (_activefactionCategory == _category) then {
            private _factionname = (toLower(configname _x));
            _factions pushBackUnique [gettext(_x >> "displayname"), _factionname];
        };
    } forEach (configProperties [configFile >> "Cfgloadouts", "isClass _x"]);
};

// Alphabetical sort.
_factions sort true;

{
    _x params ["_displayname", "_configname"];
    private _players = 0;
    // Mission factioni class overrides so show 0 if configFile class is of same name.
    if (_activefactionCategory != "mission" && {
        isClass (missionConfigFile >> "Cfgloadouts" >> _configname)
    }) then {
        _players = 0;
    } else {
        if ([_playerfactions, _configname] call CBA_fnc_hashHasKey) then {
            _players = [_playerfactions, _configname] call CBA_fnc_hashGet;
        };
    };
    private _text = _displayname;
    if (_players > 0) then {
        _text = format ["%1 (%2p)", _displayname, _players];
    };
    private _index = _control lbAdd _text;
    _control lbsetData [_index, _configname];
} forEach _factions;
// missionConfigFile first, only add unique factions now

if (lbsize _control > 0) then {
    _control lbsetCurSel 0;
    // set to first element.
};