#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_mouseKeyUp
* Author: Nick
*
* Arguments:
* None
*
* Return:
* nil
*
* Description:
* Left mouse button up behaviour for drag to garrison
*
*/
#define MANOBJECTS ((get3DENselected "object") select {
    _x isKindOf "CAManBase"
})

// exit conditions
if ((_this select 0) != 0) exitwith {};
if (!GVAR(Garrison)) exitwith {};
if (current3DENOperation != "moveitems") exitwith {};

// Delay execution
0 = [] spawn {
    // See if we have a suitable object
    private _building = GVAR(edenMouseObjects);
    if isnil "_building" exitwith {};
    _building = _building select {
        !(_x in (get3DENselected "Object"))
    };
    if (count _building == 0) exitwith {};
    if (count GVAR(posIdxs) == 0) exitwith {};
    _building = _building select 0;
    do3DENAction "Undo";
    // Undo movement
    collect3DENHistory {
        // Easy CtrlZ undo
        {
            if (_forEachindex > (count GVAR(posIdxs))) exitwith {};
            private _pos = (_building buildingPos (GVAR(posIdxs) select _forEachindex));
            _x set3DENAttribute ["position", _pos];
            do3DENAction "SnaptoSurface";
        } forEach MANOBJECTS;
    };
    GVAR(posIdxs) = [];
};