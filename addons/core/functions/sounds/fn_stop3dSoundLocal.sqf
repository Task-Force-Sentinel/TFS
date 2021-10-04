/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\sounds\fn_stop3dSoundlocal.sqf
* by Ojemineh
*
* stop 3d sound
*
* Arguments:
* 0: object - <OBJECT>
* 1: soundClass - <strinG>
*
* Return:
* nothing
*
* Example:
* [player, "AlarmBell"] call TFS_fnc_stop3dSoundlocal;
*
*/

// -------------------------------------------------------------------------------------------------

if (not hasinterface) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_object", "_soundClass"];

_object = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_soundClass = [_this, 1, "", [""]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _object) exitwith {};

// -------------------------------------------------------------------------------------------------

private _soundArray = _object getVariable ["tfs_sound3d", []];
private _soundinUse = false;
private _soundobject = objNull;

// -------------------------------------------------------------------------------------------------

if (_soundClass != "") then {
    if (count _soundArray > 0) then {
        {
            if ((_x select 0) == _soundClass) then {
                _soundobject = (_x select 1);
                _soundinUse = true;
            };
        } forEach _soundArray;
    };
    
    if (_soundinUse) then {
        private _index = _soundArray find [_soundClass, _soundobject];
        
        if (_index >= 0) then {
            _soundArray deleteAt _index;
            _object setVariable ["tfs_sound3d", _soundArray];
            if (not isNull _soundobject) then {
                deletevehicle _soundobject;
            };
        };
    };
} else {
    if (count _soundArray > 0) then {
        {
            private _sndClass = (_x select 0);
            private _sndobject = (_x select 1);
            
            if (not isNull _sndobject) then {
                deletevehicle _sndobject;
            };
        } forEach _soundArray;
    };
    
    _object setVariable ["tfs_sound3d", []];
};