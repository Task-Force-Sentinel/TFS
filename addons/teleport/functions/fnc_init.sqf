#include "\z\tfs\addons\teleport\script_component.hpp"
[{
    time > 0
}, {
    _this spawn FUNC(serverinit)
}, _this] call CBA_fnc_waitUntilandexecute;