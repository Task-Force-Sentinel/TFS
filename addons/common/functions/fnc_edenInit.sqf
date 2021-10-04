#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_edeninit
* Author: Nick
*
* Arguments:
* None
*
* Return:
* nil
*
* Description:
* set up the needed EH
*
*/

if !is3DEN exitwith {};

call FUNC(edenDisplayfactionIcons);

// Add mouseOver EH
private _idx = missionnamespace getVariable [QGVAR(edenDrawIdx), -1];
if !(_idx == -1) then {
    removeMissionEventHandler ["Draw3D", _idx];
};

_idx = addMissionEventHandler ["Draw3D", FUNC(edenDraw)];

GVAR(Garrison) = missionnamespace getVariable [QGVAR(Garrison), false];
// Will be set on UI onload
(uiNamespace getVariable [QGVAR(GarrisonControl), controlnull]) cbsetChecked GVAR(Garrison);
// Reset garrison toggle.
GVAR(edenDrawIdx) = _idx;
GVAR(edenMouseObjects) = [];
GVAR(mouseKeysPressed) = [];
GVAR(posIdxs) = [];

// do stuff with mouseOver EH
// Keydown
GVAR(edenMouseKeydownIdx) = ((findDisplay 313) displayAddEventHandler ["mouseButtondown", {
    GVAR(mouseKeysPressed) pushBackUnique (_this select 1);
}]);
// EDEN IDC 313
// KeyUp
GVAR(edenMouseKeyUpidx) = ((findDisplay 313) displayAddEventHandler ["mouseButtonUp", {
    [_this select 1] call FUNC(edenMouseKeyUp);
    GVAR(mouseKeysPressed) = GVAR(mouseKeysPressed) - [(_this select 1)];
}]);
// MouseZchanged
GVAR(edenMouseZchangedIdx) = ((findDisplay 313) displayAddEventHandler ["mouseZchanged", {
    if (GVAR(Garrison)) then {
        private _A =+ GVAR(posIdxs);
        private _B = [];
        while {count _A > 0} do {
            _B pushBack (_A deleteAt floor random count _A)
        };
        GVAR(posIdxs) = +_B;
    };
}]);

// Some stuff for hiding map objects
{
    {
        _x hideObjectglobal false
    } forEach (_x getVariable [QGVAR(intersections), []]);
    
    private _ints = [];
    _ints append lineIntersectsObjs [AGLtoASL(_x modeltoWorld [-2, 0, 0]), AGLtoASL(_x modeltoWorld [2, 0, 0]), objNull, _x, true, 32];
    _ints append lineIntersectsObjs [AGLtoASL(_x modeltoWorld [0, -2, 0]), AGLtoASL(_x modeltoWorld [0, 2, 0]), objNull, _x, true, 32];
    _ints append lineIntersectsObjs [AGLtoASL(_x modeltoWorld [0, 0, -2]), AGLtoASL(_x modeltoWorld [0, 0, 2]), objNull, _x, true, 32];
    
    _ints = _ints select {
        !(_x in (all3DENentities select 0))
    };
    _ints = _ints arrayintersect _ints;
    
    _x setVariable [QGVAR(intersections), _ints];
    {
        _x hideObjectglobal true
    } forEach _ints;
} forEach ((all3DENentities select 3) select {
    _x isKindOf QGVAR(hideMapObjects)
});

add3DENEventHandler ["OnMissionPreviewEnd", {
    // Cheat to get OnMissionPreviewEnd working
    0 = [] spawn {
        uiSleep 0.5;
        {
            {
                _x hideObjectglobal false
            } forEach (_x getVariable [QGVAR(intersections), []]);
            
            private _ints = [];
            _ints append lineIntersectsObjs [AGLtoASL(_x modeltoWorld [-2, 0, 0]), AGLtoASL(_x modeltoWorld [2, 0, 0]), objNull, _x, true, 32];
            _ints append lineIntersectsObjs [AGLtoASL(_x modeltoWorld [0, -2, 0]), AGLtoASL(_x modeltoWorld [0, 2, 0]), objNull, _x, true, 32];
            _ints append lineIntersectsObjs [AGLtoASL(_x modeltoWorld [0, 0, -2]), AGLtoASL(_x modeltoWorld [0, 0, 2]), objNull, _x, true, 32];
            
            _ints = _ints select {
                !(_x in (all3DENentities select 0))
            };
            _ints = _ints arrayintersect _ints;
            
            _x setVariable [QGVAR(intersections), _ints];
            {
                _x hideObjectglobal true
            } forEach _ints;
        } forEach ((all3DENentities select 3) select {
            _x isKindOf QGVAR(hideMapObjects)
        });
    };
}];