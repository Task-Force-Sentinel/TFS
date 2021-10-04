#include "script_component.hpp"
/*
* Author: NemesisRE
* initiliases the database named missionname + date + time
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
private ["_datetime", "_datetimestr", "_joinedmissionname", "_databasename"];

if !(isDedicated) exitwith {};

_datetime = missionStart;
_datetimestr = format ["_%1-%2-%3_%4-%5",
    _datetime select 0,
    _datetime select 1,
    _datetime select 2,
    _datetime select 3,
    _datetime select 4
];
_joinedmissionname = missionname splitstring " " joinstring "_";
_databasename = _joinedmissionname + _datetimestr;

GVAR(iniDB) = ["new", _databasename] call OO_inIDBI;