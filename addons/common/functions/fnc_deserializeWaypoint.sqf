/*
* name: TFS_common_fnc_deserializeWaypoint
* Author: Head
*
* Arguments:
* _group: group
* _wpindex: number
* _wpData: array
*
* Return:
* created waypoint
*
*/
params ['_group', '_wpindex', '_wpData'];

_wpData params [
    '_name',
    '_pos',
    '_type',
    '_behaviour',
    '_combatmode',
    '_description',
    '_formation',
    '_houseposition',
    '_script',
    '_speed',
    '_timeout',
    '_visible',
    '_radius',
    '_statements',
    '_attachedobject',
    '_attachedvehicle'
];
_wp = _group addWaypoint [_pos, -1, _wpindex, _name];
_wp setwaypointType _type;
_wp setwaypointBehaviour _behaviour;
_wp setwaypointCombatMode _combatmode;
_wp setwaypointDescription _description;
_wp setwaypointFormation _formation;
_wp setwaypointHousePosition _houseposition;
_wp setwaypointScript _script;
_wp setwaypointSpeed _speed;
_wp setwaypointTimeout _timeout;
_wp setwaypointVisible _visible;
_wp setwaypointCompletionRadius _radius;
_wp setwaypointStatements _statements;
_wp waypointAttachObject _attachedobject;
_wp waypointAttachVehicle _attachedvehicle;

_wp