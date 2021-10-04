#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_mouseOver
* Author: Nick
*
* Arguments:
* None
*
* Return:
* nil
*
* Description:
* set tfs_common_edenMouseObjects and fires mouseOver events?
*
*/

// Get intersected objects, sort them by distance, and select the one closest to the camera.
private _intersects = lineIntersectsSurfaces [getPosASL get3DENCamera, ATLtoASL screentoWorld getMouseposition, objNull, objNull, true, 5, "fire", "GEOM"];
_intersects = _intersects apply {
    _x select 2
};
_intersects = _intersects select {
    !(isNull _x)
};
if !(current3DENOperation == "") then {
    _intersects = _intersects select {
        !(_x in (get3DENselected "object"))
    };
    // Remove selected objects if they're being dragged.
};

if !(GVAR(edenMouseObjects) isEqualto _intersects) then {
    GVAR(edenMouseObjects) = _intersects;
    [QGVAR(edenMouseOverChanged), GVAR(edenMouseObjects)] call CBA_fnc_localEvent;
} else {
    GVAR(edenMouseObjects) = _intersects;
};