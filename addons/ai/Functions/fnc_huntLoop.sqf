#include "\z\tfs\addons\ai\script_component.hpp"
// Must be scheduled enviorment (spawned)
params ["_hunters", "_targetside", "_position", "_range", ["_targets", []]];

private _continue = true;
while {_continue} do {
    _targets = (_targets select {
        alive _x
    }) - [objNull];
    {
        private _unit = _x;
        private _closestTarget = _unit findNearestEnemy _unit;
        
        if (isNull _closestTarget) then {
            // Use another target we know about.
            private _closestFloat = _range*3;
            {
                private _target = _x;
                private _distancetoTarget = _target distance _unit;
                if (_distancetoTarget < _closestFloat) then {
                    _closestTarget = _target;
                    _closestFloat = _distancetoTarget;
                };
            } forEach _targets;
            
            // SEARCH: if we still don't have a target search.
            if (isNull _closestTarget) then {
                if (_unit distance _position < _range) then {
                    private _dir = [_unit, _position] call BIS_fnc_dirto;
                    _dir = _dir + (((round (random 1)) - 0.5) * 2) * (random 1 * random 1 * 180);
                    // private _dir = random 360;
                    _unit domove (getPos (_unit) vectorAdd [(sin(_dir)*40), (cos(_dir)*40), 0]);
                } else {
                    // Outside move in.
                    _unit domove _position;
                };
            };
            /* CHEAT
            private _closestFloat = _range*3;
            {
                _target = _x;
                _distancetoTarget = _target distance _unit;
                if (_distancetoTarget < _closestFloat) then {
                    _closestTarget = _target;
                    _closestFloat = _distancetoTarget;
                };
            } forEach _ntargets;
            */
        } else {
            if ((_targets pushBackUnique _closestTarget) != -1) then {
                // Share this new contact with the rest of the group.
                {
                    _x reveal _closestTarget;
                } forEach _hunters;
            };
        };
        
        if (!isNull _closestTarget) then {
            _unit domove (getPosATL _closestTarget);
            // domove
        };
    } forEach _hunters;
    sleep 5;
    _hunters = _hunters select {
        alive _x
    };
    if (count _hunters == 0) exitwith {
        _continue = false;
    };
    sleep 10;
};