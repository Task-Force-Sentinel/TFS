#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function reads all properties of all properties of given config (excludes subclasses)
* and saves to namespace for easier access
* (and ability to easily create default value if property doesn't exits)
*
* Arguments:
* 0: Config to read from <CONFIG>
* 1: namespace to save data to <CBA_nameSPACE>
* 2: Should saved data be global <BOOL>
*
* Return Value:
* 0: Filled/created namespace <CBA_nameSPACE>
*
* Example:
* None
*
* Public: No
*/

params [
    ["_config", nil, [configNull]],
    ["_namespace", objNull, [objNull, locationNull]],
    ["_public", false, [true]]
];

if (_namespace isEqualto objNull) then {
    _namespace = _public call CBA_fnc_createnamespace;
};

// Get item properties
// Read config values for found properties
{
    private _value = switch (true) do {
        case (isNumber _x): {
            getNumber _x
        };
        case (istext _x): {
            gettext _x
        };
        case (isArray _x): {
            getArray _x
        };
    };
    // When it is location it does not support third param
    if (_namespace isEqualtype objNull) then {
        _namespace setVariable [configname _x, _value, _public];
    } else {
        _namespace setVariable [configname _x, _value];
    };
} forEach (configProperties [_config, "!(isClass _x)", true]);

_namespace