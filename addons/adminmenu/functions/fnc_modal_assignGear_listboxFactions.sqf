#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

params ["_ctrlCheckBox", "_onlyPresent"];

private _factions = [];

if (_onlyPresent isEqualto 1) then {
    private _missionfactionsFound = [];
    {
        private _faction = _x getVariable [QEGVAR(assigngear, faction), ""];
        if !(_faction isEqualto "") then {
            _missionfactionsFound pushBackUnique toLower _faction;
        };
    } forEach allplayers;
    
    {
        private _displayname = gettext (missionConfigFile >> "Cfgloadouts" >> _x >> "displayname");
        private _fromMissionConfig = 1;
        if (_displayname isEqualto "") then {
            _displayname = gettext (configFile >> "Cfgloadouts" >> _x >> "displayname");
            _fromMissionConfig = 0;
        };
        
        _factions pushBack [_displayname, _x, _fromMissionConfig];
    } forEach _missionfactionsFound;
} else {
    private _missionConfigfactions = [];
    {
        _missionConfigfactions pushBack toLower configname _x;
        _factions pushBack [gettext (_x >> "displayname"), configname _x, 1];
    } forEach ("true" configClasses (missionConfigFile >> "Cfgloadouts"));
    
    {
        if !((toLower configname _x) in _missionConfigfactions) then {
            _factions pushBack [gettext (_x >> "displayname"), configname _x, 0];
        };
    } forEach ("true" configClasses (configFile >> "Cfgloadouts"));
};

_factions sort true;

private _ctrlCombofaction = _ctrlCheckBox getVariable [QGVAR(association), controlnull];
{
    _x params ["_displayname", "_classname", "_fromMissionConfig"];
    if (_fromMissionConfig isEqualto 1) then {
        _displayname = format ["%1 *", _displayname];
    };
    
    _ctrlCombofaction lbAdd _displayname;
    _ctrlCombofaction lbsetData [_forEachindex, _classname];
    _ctrlCombofaction lbsetValue [_forEachindex, _fromMissionConfig];
} forEach _factions;

private _numfactions = count _factions;
while {lbsize _ctrlCombofaction > _numfactions} do {
    _ctrlCombofaction lbDelete _numfactions;
};

if (_numfactions > 0 && ((lbCurSel _ctrlCombofaction) < 0 || (lbCurSel _ctrlCombofaction) >= _numfactions)) then {
    _ctrlCombofaction lbsetCurSel 0;
};