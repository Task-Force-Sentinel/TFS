/*
Function: TFS_fnc_civilianPatrol

Description:
sets up a patrol for civilians with appropriate reactions to getting shot at.

Arguments:
_group - group of civilians to set up for patrol
_waypoints - Array of waypoints (i.e. roads) to use for the patrol setup
_patrolLength - Length of the patrol path, array in format [min, max], default: [4, 8]

Return Values:
nothing.

Examples:
nothing to see here

Author:
Mokka
*/

params [
    "_group",
    "_waypoints",
    ["_patrolLength", [4, 8]]
];

_patrolLength params ["_patrolLengthmin", "_patrolLengthmax"];

_findWps = _patrolLengthmin + floor (random (_patrolLengthmax - _patrolLengthmin));

_group setBehaviour "SAFE";
_group setspeedMode "LIMITED";

_EHfiredNear = (leader _group) addEventHandler ["firedNear", {
    _this call TFS_fnc_CivBreakPatrol;
}];

for "_i" from 0 to _findWps do {
    _wp = selectRandom _waypoints;
    _wp = _group addWaypoint [_wp, 0];
    _wp setwaypointType "move";
    _wp setwaypointCompletionRadius 5;
    [_group, _i] setwaypointTimeout [0, 2, 4];
};

_wpc = _group addWaypoint [selectRandom _waypoints, 0];
_wpc setwaypointType "CYCLE";
_wpc setwaypointCompletionRadius 5;