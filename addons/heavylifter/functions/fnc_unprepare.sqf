#include "script_component.hpp"
/*
* Author: DaC, Jonpas
* sets the vehicle back to operational state.
*
* Arguments:
* 0: Target vehicle <OBJECT>
*
* Return Value:
* None
*
* Example:
* [heli] call tac_heavylifter_fnc_unprepare
*
* Public: No
*/

params ["_targetvehicle"];

// Get vehicle and helper object objects
(_targetvehicle getVariable QGVAR(prepared)) params ["_vehicle", "_helper"];

// Prevent damage on vehicle
[_vehicle, "blockdamage", QUOTE(ADdoN), true] call ACEFUNC(common, statusEffect_set);
_vehicle enableSimulationGlobal false;

// Remove the helper object
deletevehicle _helper;

// Enable damage on vehicle
[_vehicle, "blockEngine", QUOTE(ADdoN), false] call ACEFUNC(common, statusEffect_set);
[_vehicle, "blockdamage", QUOTE(ADdoN), false] call ACEFUNC(common, statusEffect_set);
_vehicle enableSimulationGlobal true;

// Fix floating
[QACEGVAR(common, fixFloating), _vehicle, _vehicle] call CBA_fnc_targetEvent;

// Remove variable
_vehicle setVariable [QGVAR(prepared), nil, true];

// Show ACE hint
[localize LstrinG(detached), QPATHtoF(UI\detach_ca.paa)] call ACEFUNC(common, displaytextpicture);