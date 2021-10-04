#include "script_component.hpp"

private ["_param", "_switch", "_result"];
_param = _this select 0;
_result = false;
_switch = _param call BIS_fnc_getparamValue;

switch (_switch) do {
    case 0: {
        _result = false
    };
    case 1: {
        _result = true
    };
    default {
        hint format ["Error: parameter %1 must be 0 or 1", _param]
    };
};

_result;