#include "\z\tfs\addons\teleport\script_component.hpp"
params["_unit", "_pos"];
_unit setPos _pos;
[{
    (getPos (_this select 0) select 2) < 200
}, {
    params ["_unit"];
    _chute = createvehicle ["Steerable_Parachute_F", position _unit, [], direction _unit, 'FLY'];
    _chute setPos (getPos _unit);
    _unit assignAsdriver _chute;
    _unit moveInDriver _chute;
}, _this] call CBA_fnc_waitUntilandexecute;