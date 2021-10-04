#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

params ["_ctrlCombofaction", "_index"];
private _faction = _ctrlCombofaction lbData _index;

private _factionConfig = configNull;
if ((_ctrlCombofaction lbValue _index) isEqualto 1) then {
    _factionConfig = (missionConfigFile >> "Cfgloadouts" >> _faction);
} else {
    _factionConfig = (configFile >> "Cfgloadouts" >> _faction);
};

private _roles = ("true" configClasses _factionConfig) apply {
    [format ["%1 [%2]", gettext (_x >> "displayname"), configname _x], toLower configname _x]
};
_roles sort true;
private _rolesSimple = _roles apply {
    _x select 1
};
private _tickCheckbox = false;

{
    (_x getVariable [QGVAR(association), [objNull, controlnull]]) params ["_player", "_ctrlComborole"];
    
    private _playerRole = toLower (_player getVariable [QEGVAR(assigngear, role), ""]);
    if (_playerRole isEqualto "" || !(_playerRole in _rolesSimple)) then {
        _playerRole = "r";
        _tickCheckbox = true;
    };
    
    while {(count _roles) < (lbsize _ctrlComborole)} do {
        _ctrlComborole lbDelete ((lbsize _ctrlComborole) - 1);
    };
    
    {
        if (_forEachindex >= (lbsize _ctrlComborole)) then {
            _ctrlComborole lbAdd (_x select 0);
        } else {
            _ctrlComborole lbsettext [_forEachindex, _x select 0];
        };
        
        _ctrlComborole lbsetData [_forEachindex, _x select 1];
        if ((_x select 1) isEqualto _playerRole) then {
            _ctrlComborole lbsetCurSel _forEachindex;
        };
    } forEach _roles;
    
    if (_tickCheckbox) then {
        _x cbsetChecked true;
        _tickCheckbox = false;
    };
} forEach GVAR(utility_assigngear_rolectrls);