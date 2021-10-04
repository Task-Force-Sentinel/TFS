/*
Function: TFS_fnc_RoadPatrol

Description:
sets up a patrol plotted along roads, rather than random positions dotted around the AO.

Arguments:
_group - group to set up for patrol
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

_group setBehaviour (["AWARE", "SAFE"] select (random 1 > 0.5));
_group setspeedMode (["limited", "normal"] select (random 1 > 0.5));

for "_i" from 0 to _findWps do {
    _wp = selectRandom _waypoints;
    _wp = _group addWaypoint [_wp, 0];
    _wp setwaypointType "move";
    _wp setwaypointCompletionRadius 5;
    [_group, _i] setwaypointTimeout [0, 4, 10];
};

_wpc = _group addWaypoint [selectRandom _waypoints, 0];
_wpc setwaypointType "CYCLE";
_wpc setwaypointCompletionRadius 5;