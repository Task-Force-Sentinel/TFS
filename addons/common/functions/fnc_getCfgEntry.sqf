#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_getCfgEntry
* Author: Nick
*
* Arguments:
* ARRAY. Contains order of strings to look up.
*
* Return:
* strinG or ARRAY or NUMBER or nil
*
* Description:
* Reads config entries for the framework. First tries missionConfigFile, then configFile
*/
params [["_arr", [], [[]]]];

// Look up in missionConfigFile first
private _path = missionConfigFile;
{
    _path = _path >> _x
} forEach _this;

// if there was no corresponding entry in the missionConfig, try configFile
if (configname _path isEqualto "") then {
    _path = configFile;
    {
        _path = _path >> _x
    } forEach _this;
};

// Get value from path
private _return = switch (true) do {
    case (isNumber _path): {
        getNumber _path
    };
    case (istext _path): {
        gettext _path
    };
    case (isArray _path): {
        getArray _path
    };
    default {
        nil
    };
};

// Return value
if (isnil "_return") exitwith {
    nil
};
_return