/*
Function: TFS_fnc_CivBreakPatrol

Description:
Helper function to handle civilians breaking away from their patrol if under fire.

Arguments:
_group - leader of the group that is to break patrol

Return Values:
nothing.

Examples:
nothing to see here

Author:
Mokka
*/

params ["_unit"];

_group = group _unit;

_group setBehaviour "COMBAT";
_group setspeedMode "NorMAL";

if ((side _unit) == civilian) then {
    _idx = currentWaypoint _group;
    deleteWaypoint [_group, _idx];
    _group allowfleeing 1;
} else {
    deleteWaypoint [_group, _idx];
};

_unit removeAllEventHandlers "firedNear";