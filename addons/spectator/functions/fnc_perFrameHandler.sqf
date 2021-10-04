#include "\z\tfs\addons\spectator\script_component.hpp"

disableSerialization;
private _isOpen = [] call FUNC(isOpen);
if (!_isOpen) exitwith {
    {
        ctrlDelete _x
    } forEach GVAR(controls);
    GVAR(controls) = [];
};
ctrlsetFocus (uiNamespace getVariable QGVAR(unitlist));

// Cleanup - unused controls.
private _newIdx = ((count GVAR(controls) - 1) min (GVAR(lastControlindex)+10));
for "_idx" from GVAR(lastControlindex) to _newIdx do {
    private _control = GVAR(controls) select _idx;
    private _thing = _control getVariable [QGVAR(attached), objNull];
    if (_thing isEqualtype objNull) then {
        if (!alive _thing) then {
            /* alive also does a isNull check */
            ctrlDelete _control;
        };
    } else {
        if (isNull _thing) then {
            ctrlDelete _control;
        };
    };
};
if (GVAR(lastControlindex) >= (count GVAR(controls) - 1)) then {
    GVAR(lastControlindex) = 0;
} else {
    GVAR(lastControlindex) = _newIdx;
};

// update compass
private _dirArray = GVAR(compassValues);
private _leftDir = ([(getDir GVAR(camera))-45] call FUNC(getCardinal));
private _idx = _dirArray find _leftDir;
_dirArray = [_leftDir, _dirArray select (_idx + 1), _dirArray select (_idx + 2)];
(uiNamespace getVariable QGVAR(compass)) params ["_compassL", "_compass", "_compassR"];

if (!(_dirArray isEqualto GVAR(lastCompassValue))) then {
    _compassL ctrlsettext (_dirArray select 0);
    _compass ctrlsettext (_dirArray select 1);
    _compassR ctrlsettext (_dirArray select 2);
    GVAR(lastCompassValue) = _dirArray;
};

// update something horrible (alive also checks for isNull)

if(GVAR(mode) != FREECAM && !isnil QGVAR(target) && {
    alive GVAR(target)
} ) then {
    (uiNamespace getVariable QGVAR(unitlabel)) ctrlsettext (name GVAR(target));
} else {
    (uiNamespace getVariable QGVAR(unitlabel)) ctrlsettext "";
};

if (GVAR(killlist_update) >= time || GVAR(killlist_forceUpdate)) then {
    if (count GVAR(killedunits) > 0) then {
        GVAR(killlist_update) = time - ((GVAR(killedunits) select 0) select 1);
        // next update
    };
    [] call FUNC(updateKilllist);
};

{
    _x params ["_object", "_posArray", "_last", "_time", "_type"];
    
    if(!isNull _object && {
        diag_frameNo > (_last+1)
    } && {
        (speed _object) > 0
    } && {
        GVAR(bulletTrails) || _type != 0
    }) then {
        private _pos = (getPosATLVisual _object);
        if (surfaceIsWater _pos) then {
            _pos = getPosASLVisual _object;
        };
        _posArray pushBack (_pos);
        GVAR(rounds) set [_forEachindex, [_object, _posArray, diag_frameNo, _time, _type]];
    };
    if( _type > 0 && {
        isNull _object
    } || _type == 0 && {
        (time - _time) > 5
    } ) then {
        GVAR(rounds) set [_forEachindex, 0];
    };
} forEach GVAR(rounds);

GVAR(rounds) = GVAR(rounds) - [0];