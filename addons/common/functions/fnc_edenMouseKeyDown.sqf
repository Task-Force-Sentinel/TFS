#include "\z\tfs\addons\common\script_component.hpp"
/*
* name: TFS_common_fnc_mouseKeydown
* Author: Nick
*
* Arguments:
* None
*
* Return:
* nil
*
* Description:
* Left mouse button down behaviour for drag to garrison
*
*/
#define MANOBJECTS ((get3DENselected "Object") select {
    _x isKindOf "CAManBase"
})

// select building from mouseOvers
private _building = GVAR(edenMouseObjects);
_building = _building select {
    !(_x in (get3DENselected "Object"))
};
if (count _building == 0) exitwith {};
_building = _building select 0;
private _positions = _building buildingPos -1;
if (count _positions < 1) exitwith {};

// Draw boundingBox
if (!(typeOf _building isEqualto "") && {
    count (_building buildingPos -1) > 0
}) then {
    private _fn_bbox = {
        params ["_pos1", "_pos2"];
        private _bbx = [_pos1 select 0, _pos2 select 0];
        private _bby = [_pos1 select 1, _pos2 select 1];
        private _bbz = [_pos1 select 2, _pos2 select 2];
        private _ret = [];
        {
            private _y = _x;
            {
                private _z = _x;
                {
                    _ret pushBack (_building modeltoWorldVisual [_x, _y, _z]);
                } forEach _bbx;
            } forEach _bbz;
            reverse _bbz;
        } forEach _bby;
        _ret pushBack (_ret select 0);
        _ret pushBack (_ret select 1);
        _ret
    };
    private _box = ((boundingBoxReal _building) call _fn_bbox);
    
    for "_i" from 0 to 7 step 2 do {
        drawLine3D [_box select _i, _box select (_i+2), [0, 1, 0, 1]];
        drawLine3D [_box select (_i + 2), _box select (_i + 3), [0, 1, 0, 1]];
        drawLine3D [_box select (_i + 3), _box select (_i + 1), [0, 1, 0, 1]];
    };
};

private _validIdxs = _building getVariable [QGVAR(validIdxs), []];
if ((count _validIdxs == 0) || {
    diag_frameno % 15 == 0
}) then {
    // Also recalc every 15 frames, also seems to randomize order?
    _validIdxs = [];
    {
        // Check for obstruction //todo Zsorting?
        // Care about nearby objects except the building itself and the currently selected eden objects.
        // Lags for buildings with >10 positions
        private _nearObjects = (_x nearObjects ["Static", 2]) + (_x nearObjects ["ThingX", 2]) + (_x nearObjects ["Allvehicles", 2]) - [_building];
        if (current3DENOperation == "moveitems") then {
            _nearObjects = _nearObjects - MANOBJECTS
        };
        if (count _nearObjects == 0) then {
            _validIdxs pushBack _forEachindex;
        };
    } forEach _positions;
    _building setVariable [QGVAR(validIdxs), _validIdxs];
};

// set global Idx array variable if it doesn't exist or is wrong size
if (GVAR(posIdxs) isEqualto [] || {
    (count GVAR(posIdxs)) != count (_validIdxs)
}) then {
    private _A =+ _validIdxs;
    private _B = [];
    while {count _A > 0} do {
        _B pushBack (_A deleteAt floor random count _A)
    };
    GVAR(posIdxs) = +_B;
};

// Draw positions.
if (0 in GVAR(mouseKeysPressed) && (current3DENOperation == "moveitems")) then {
    // if dragging group
    {
        private _color = if !(_forEachindex in _validIdxs) then {
            [0.75, 0.75, 0.75, 0.75]
        } else {
            [1, 1, 1, 1]
        };
        if (((GVAR(posIdxs) find _forEachindex) <= (count MANOBJECTS - 1)) && {
            (GVAR(posIdxs) find _forEachindex) != -1
        }) then {
            _color = [1, 0.15, 0.15, 1]
        };
        drawIcon3D ["\a3\ui_f\data\map\Markers\Military\dot_ca.paa", _color, _x, 1, 1, 0, str _forEachindex, 2]
    } forEach _positions;
} else {
    {
        private _color = if !(_forEachindex in _validIdxs) then {
            [0.75, 0.75, 0.75, 0.75]
        } else {
            [1, 1, 1, 1]
        };
        drawIcon3D ["\a3\ui_f\data\map\Markers\Military\dot_ca.paa", _color, _x, 1, 1, 0, str _forEachindex, 2]
    } forEach _positions;
};