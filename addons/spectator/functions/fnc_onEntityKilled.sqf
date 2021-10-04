#include "\z\tfs\addons\spectator\script_component.hpp"
params ["_deadMan", "_killer", "_instigator"];

if (isNull _instigator) then {
    _instigator = UAVControl vehicle _killer select 0
};
// UAV/UGV player operated road kill
if (isNull _instigator) then {
    _instigator = _killer
};
// player driven vehicle road kill

if (count (_deadMan getVariable [QGVAR(tagControl), []]) > 0) then {
    ctrlDelete ((_deadMan getVariable [QGVAR(tagControl), [controlnull]]) select 0);
};

if (!(side _deadMan in [blufor, opfor, independent, civilian]) || !(_deadMan isKindOf "CAManBase" || _deadMan isKindOf "Allvehicles")) exitwith {};
if (isNull _instigator || _instigator == _deadMan) then {
    _instigator = _deadMan getVariable [QGVAR(lastdamage), objNull];
};

private _kname = "";
private _dname = "";
private _isplayer = isplayer _deadMan;
if (_isplayer) then {
    _dname = name (_deadMan);
};
if (isplayer _instigator) then {
    _kname = name (_instigator);
};
if (_dname == "") then {
    _dname = gettext (configFile >> "Cfgvehicles" >> typeOf _deadMan >> "displayname");
};
if (_kname == "") then {
    _kname = gettext (configFile >> "Cfgvehicles" >> typeOf _instigator >> "displayname");
};
private _weapon = gettext (configFile >> "Cfgweapons" >> currentWeapon _instigator >> "displayname");
if (!isNull (objectParent _instigator)) then {
    _weapon = gettext (configFile >> "Cfgvehicles" >> typeOf (vehicle _instigator) >> "displayname");
};
GVAR(killlist_forceUpdate) = true;
GVAR(killedunits) pushBack [_deadMan, time, _instigator, side group _deadMan, side group _instigator, _dname, _kname, _weapon, _isplayer];