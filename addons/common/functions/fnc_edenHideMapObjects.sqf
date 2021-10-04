#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_edenHideMapObjects
* Author: Nick
*
* Arguments:
* None
*
* Return:
* nil
*
* Description:
* Visuals for the map objects remover logic
*
*/

#define RANGE 2
#define COLX [1, 0, 0, 1]
#define COLY [0, 1, 0, 1]
#define COLZ [0, 0, 1, 1]

#define X1 [ARR_3(-RANGE, 0, 0)]
#define X2 [ARR_3(RANGE, 0, 0)]
#define Y1 [ARR_3(0, -RANGE, 0)]
#define Y2 [ARR_3(0, RANGE, 0)]
#define Z1 [ARR_3(0, 0, -RANGE)]
#define Z2 [ARR_3(0, 0, RANGE)]

#define ICON "\a3\ui_f\data\map\Markers\Military\dot_ca.paa"
{
    drawLine3D [_x modeltoWorld X1, _x modeltoWorld X2, COLX];
    drawLine3D [_x modeltoWorld Y1, _x modeltoWorld Y2, COLY];
    drawLine3D [_x modeltoWorld Z1, _x modeltoWorld Z2, COLZ];
    
    drawIcon3D [ICON, COLX, _x modeltoWorld X1, 1, 1, 0];
    drawIcon3D [ICON, COLX, _x modeltoWorld X2, 1, 1, 0];
    drawIcon3D [ICON, COLY, _x modeltoWorld Y1, 1, 1, 0];
    drawIcon3D [ICON, COLY, _x modeltoWorld Y2, 1, 1, 0];
    drawIcon3D [ICON, COLZ, _x modeltoWorld Z1, 1, 1, 0];
    drawIcon3D [ICON, COLZ, _x modeltoWorld Z2, 1, 1, 0];
} forEach ((all3DENentities select 3) select {
    _x isKindOf QGVAR(hideMapObjects)
});

if (current3DENOperation == "moveitems" || current3DENOperation == "Rotateitems") then {
    {
        _x removeAllEventHandlers "UnregisteredfromWorld3DEN";
        _x addEventHandler ["UnregisteredfromWorld3DEN", {
            {
                _x hideObjectglobal false
            } forEach ((_this select 0) getVariable [QGVAR(intersections), []]);
        }];
        
        {
            _x hideObjectglobal false
        } forEach (_x getVariable [QGVAR(intersections), []]);
        
        private _ints = [];
        _ints append lineIntersectsObjs [AGLtoASL(_x modeltoWorld X1), AGLtoASL(_x modeltoWorld X2), objNull, _x, true, 32];
        _ints append lineIntersectsObjs [AGLtoASL(_x modeltoWorld Y1), AGLtoASL(_x modeltoWorld Y2), objNull, _x, true, 32];
        _ints append lineIntersectsObjs [AGLtoASL(_x modeltoWorld Z1), AGLtoASL(_x modeltoWorld Z2), objNull, _x, true, 32];
        
        _ints = _ints select {
            !(_x in (all3DENentities select 0))
        };
        _ints = _ints arrayintersect _ints;
        
        _x setVariable [QGVAR(intersections), _ints];
        {
            _x hideObjectglobal true
        } forEach _ints;
    } forEach ((get3DENselected "logic") select {
        _x isKindOf QGVAR(hideMapObjects)
    });
};