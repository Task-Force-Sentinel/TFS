#include "\z\tfs\addons\spectator\script_component.hpp"

[] call FUNC(handleUnitlist);
{
    [_x] call FUNC(updategroupCache);
} forEach allgroups;

GVAR(vehicles) = GVAR(vehicles) select {
    !isNull _x
};