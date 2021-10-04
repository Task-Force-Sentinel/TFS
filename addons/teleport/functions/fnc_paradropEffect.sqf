#include "\z\tfs\addons\teleport\script_component.hpp"
params ["_unit", "_pos"];

if (!local _unit) exitwith {};

if (_unit == player) then {
    [QGVAR(parachute), false] call BIS_fnc_blackOut;
};
_chute = createvehicle ["Steerable_Parachute_F", _pos, [], random 360, 'NONE'];
_chute setPos _pos;
_unit assignAsdriver _chute;
_unit setPos [0, 0, 0];
_unit moveInDriver _chute;
if (_unit == player) then {
    [QGVAR(parachute), true, 1] call BIS_fnc_blackin;
};