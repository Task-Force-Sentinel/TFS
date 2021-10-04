private ["_ret"];
_minviewDistance = [_this, 0, 0, [0]] call BIS_fnc_param;
_ret = _minviewDistance;

_zoom = call CHVD_fnc_trueZoom;
if (_zoom >= 1) then {
    _ret = _minviewDistance + ((12000 / 74) * (_zoom - 1)) min viewDistance;
};

// systemChat str _ret;
_ret