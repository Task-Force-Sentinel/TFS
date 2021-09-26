#include "script_component.hpp"
/*
 * Author: NemesisRE
 * initiliases the database named missionName + Date + Time
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call TFS_common_fnc_initDB;
 *
 */
private ["_dateTime","_dateTimeStr","_joinedMissionName","_databasename"];

if !(isDedicated) exitWith {};

_dateTime = missionStart;
_dateTimeStr = format ["_%1-%2-%3_%4-%5",
    _dateTime select 0,
    _dateTime select 1,
    _dateTime select 2,
    _dateTime select 3,
    _dateTime select 4
];
_joinedMissionName = missionName splitString " " joinString "_";
_databasename = _joinedMissionName + _dateTimeStr;

GVAR(iniDB) = ["new", _databasename] call OO_INIDBI;
