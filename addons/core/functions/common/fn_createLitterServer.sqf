/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\common\fn_createLitterServer.sqf
* by Ojemineh
*
* create litter on ground
*
* Arguments:
* 0: unit - <OBJECT>
* 1: classname - <strinG>
* 2: offset - <ARRAY>
*
* Return:
* nothing
*
* Example:
* [player, "MedicalGarbage_01_FirstAidKit_F"] call TFS_fnc_createLitterServer;
*
*/

// -------------------------------------------------------------------------------------------------

if (!isServer) exitwith {};

// -------------------------------------------------------------------------------------------------

private ["_unit", "_classname", "_offset"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_classname = [_this, 1, "", [""]] call BIS_fnc_param;
_offset = [_this, 2, [], [[]]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};
if (_classname isEqualto "") exitwith {};
if (_offset isEqualto []) then {
    _offset = [0, 0, 0];
};

if (not (missionnamespace getVariable ["ace_medical_allowLitterCreation", false])) exitwith {};

// -------------------------------------------------------------------------------------------------

[_unit, _classname, _offset] spawn {
    params ["_unit", "_classname", "_offset"];
    
    private _posASL = AGLtoASL (_unit modeltoWorld _offset);
    private _litter = createSimpleObject [_classname, _posASL];
    
    _litter setDir (random 360);
    
    if ([_unit] call TFS_fnc_isinBuilding) then {
        _litter setvectorUp [0, 0, 1];
    } else {
        _litter setvectorUp surfaceNormal position _litter;
    };
    
    private _delay = round (missionnamespace getVariable ["ace_medical_litterCleanUpDelay", 120]);
    
    [{
        deletevehicle _this;
    }, _litter, _delay] call CBA_fnc_waitandexecute;
};