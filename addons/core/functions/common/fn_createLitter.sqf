/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\core\functions\common\fn_createLitter.sqf
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
* [player, "MedicalGarbage_01_FirstAidKit_F"] call TFS_fnc_createLitter;
*
*/

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

// -------------------------------------------------------------------------------------------------

if (missionnamespace getVariable ["ace_medical_allowLitterCreation", false]) then {
    [_unit, _classname, _offset] remoteExecCall ["TFS_fnc_createLitterServer", 2];
};