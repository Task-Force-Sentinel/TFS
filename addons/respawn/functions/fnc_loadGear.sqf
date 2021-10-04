#include "\z\tfs\addons\respawn\script_component.hpp"
/*
* name = TFS_respawn_fnc_loadGear
* Author = Nick
*
* Arguments:
* 0: Number. Numeric value of side of unit
*
* Return:
* 0: Array.
*
* Description:
* UI function do not use
*/
params ["_side"];
_side = toLower([_side] call CFUNC(sidetype));
private _return = [];
private _factions = [];
private _classes = [];

{
    private _faction = toLower(configname _x);
    private _name = gettext(_x >> "displayname");
    _factions pushBack [_faction, _name];
} forEach (configProperties [configFile >> "Cfgloadouts" >> _side, "isClass _x"]);

{
    private _faction = toLower(configname _x);
    private _name = gettext(_x >> "displayname");
    _factions pushBackUnique [_faction, _name];
} forEach (configProperties [missionConfigFile >> "Cfgloadouts" >> _side, "isClass _x"]);

{
    _x params ["_faction", "_name"];
    private _roles = [];
    if (isClass (missionConfigFile >> "Cfgloadouts" >> _side >> _faction)) then {
        _roles = configProperties [missionConfigFile >> "Cfgloadouts" >> _side >> _faction, "isClass _x"];
    } else {
        _roles = configProperties [configFile >> "Cfgloadouts" >> _side >> _faction, "isClass _x"];
    };
    // turn roles cfg into string names
    {
        _roles set [_forEachindex, [configname _x, gettext(_x >> "displayname")]]
    } forEach _roles;
    _classes pushBack _roles;
} forEach _factions;

{
    _return pushBack [_x, _classes select _forEachindex]
} forEach _factions;

_return