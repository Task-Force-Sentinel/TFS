/*
* name: TFS_common_fnc_serializewaypoints
* Author: Head
*
* Arguments:
* _group: group
*
* Return:
* array: of waypoint datagit
*
*/
params ["_group"];
#include "\z\tfs\addons\common\script_component.hpp"
private _waypoints = (waypoints _group) apply {
    _x call FUNC(serializeWaypoint)
};
_waypoints