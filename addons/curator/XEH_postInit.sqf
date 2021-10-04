#include "script_component.hpp"

if (hasInterface) then {
    [QGVAR(objectAdd), player] call CBA_fnc_serverEvent;
    [["Zeus", "Give yourself Zeus functinality"], {
        params ["_button"];

        player call FUNC(assignZeus);

        _button ctrlEnable false;
        [{_this ctrlEnable true}, _button, 5]  call CBA_fnc_waitAndExecute;
    }] call EFUNC(debug_console,addButton);
};
