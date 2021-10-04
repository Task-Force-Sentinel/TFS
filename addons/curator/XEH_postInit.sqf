#include "script_component.hpp"

if (hasinterface) then {
    [QGVAR(objectAdd), player] call CBA_fnc_serverEvent;
    [["Zeus", "Give yourself Zeus functinality"], {
        params ["_button"];
        
        player call FUNC(assignZeus);
        
        _button ctrlEnable false;
        [{
            _this ctrlEnable true
        }, _button, 5] call CBA_fnc_waitandexecute;
    }] call EFUNC(debug_console, addButton);
};