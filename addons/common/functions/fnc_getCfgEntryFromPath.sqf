#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_getCfgEntryfromPath
* Author: Snippers
*
* Arguments:
* CONFIG. Contains path to config
*
* Return:
* strinG or ARRAY or NUMBER or nil
*
* Description:
* Attempts to read a config value.
*/

params [["_path", configNull, [configNull]]];

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