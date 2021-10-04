#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_hideMapObjectsinit
* Author: Nick
*
* Arguments:
* None
*
* Return:
* nil
*
* Description:
* init for map objects hider
*
*/
params ["_logic"];

if is3DEN exitwith {};

// Hide the intersected objects
private _ints = [];
_ints append lineIntersectsObjs [AGLtoASL(_logic modeltoWorld [-2, 0, 0]), AGLtoASL(_logic modeltoWorld [2, 0, 0]), objNull, _logic, true, 32];
_ints append lineIntersectsObjs [AGLtoASL(_logic modeltoWorld [0, -2, 0]), AGLtoASL(_logic modeltoWorld [0, 2, 0]), objNull, _logic, true, 32];
_ints append lineIntersectsObjs [AGLtoASL(_logic modeltoWorld [0, 0, -2]), AGLtoASL(_logic modeltoWorld [0, 0, 2]), objNull, _logic, true, 32];

_ints = _ints arrayintersect _ints;
_ints = _ints select {
    str(_x) find ".p3d" > 0
};
_ints = _ints arrayintersect (nearestTerrainObjects [_logic, [], 50, false]);
// Disable default sorting for increased speed

{
    if (isServer) then {
        _x hideObjectglobal true
    } else {
        _x hideObject true
    };
    _x allowdamage false;
    _x setPosATL ((getPosATL _x) vectorAdd [0, 0, -1000]);
} forEach _ints;

// Emergency: Hide any map objects the logic is inside of
((nearestTerrainObjects [_logic, [], 0]) select 0) hideObject true;