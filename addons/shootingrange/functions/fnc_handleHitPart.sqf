#include "script_component.hpp"
/*
* Author: Jonpas
* Handles hit part event handler.
* incorporated vanilla handlers from "a3\structures_f\training\data\scripts".
*
* Arguments:
* 0: Target <OBJECT>
* 1: Shooter <OBJECT>
* 2: Bullet <OBJECT> (unused)
* 3: Impact position (position, ASL) <ARRAY> (unused)
* 4: Bullet velocity (Vector) <ARRAY> (unused)
* 5: Impact selections <ARRAY>
* 6: ammo information <ARRAY> (unused)
* 7: Impact direction (Vector) <ARRAY> (unused)
* 8: Impact radius <NUMBER> (unused)
* 9: Impact Surface <strinG> (unused)
* 10: Direct Hit <BOOL>
*
* Return Value:
* None
*
* Example:
* [target, shooter, nil, [0, 0, 0], nil, ["target"], nil, nil, nil, nil, true] call TFS_shootingrange_fnc_handleHitPart;
*
* Public: No
*/

params ["_target", "_shooter", "", "", "", "_impactselections", "", "", "", "", "_directHit"];

// exit if target in "down" animation
if (_target call FUNC(isTargetdown)) exitwith {};

// exit if target is not actually hit (eg. stand is hit)
if !("target" in _impactselections || {
    "pole_bottom" in _impactselections
}) exitwith {};

private _controller = (_target getVariable [QGVAR(controllers), nil]) select 0;

// exit with vanilla-like handling if not part of a range or not running
if (isnil "_controller" || {
    !(_controller getVariable [QGVAR(running), false])
}) exitwith {
    [_target, 1] call FUNC(animateTarget);
    // down
    
    if ((!isnil "nopop" && {
        nopop
    }) || {
        _target getVariable [QGVAR(staydown), false]
    }) exitwith {};
    
    [{
        _this setDamage 0;
        [_this, 0] call FUNC(animateTarget);
        // Up
    }, _target, 3] call CBA_fnc_waitandexecute;
};

private _targets = _target getVariable [QGVAR(targets), []];
// Use targets set by Api on runtime if they exist
private _targetsRuntime = _target getVariable [QGVAR(targetsRuntime), []];
_targets = [_targetsRuntime, _targets] select (_targetsRuntime isEqualto []);

// exit if invalid target hit and set variable checked in PFH
if !(_target in _targets) exitwith {
    GVAR(invalidTargetHit) = true;
};

// exit if not direct hit (does not seem to count bullet bouncing)
if (!_directHit) exitwith {
    hint "[TFS] Debug: indirect Hit";
};

// exit if hit by someone else
private _starter = _controller getVariable [QGVAR(starter), nil];
if (_shooter != _starter) exitwith {
    private _shootername = [_shooter, true] call ACEFUNC(common, getname);
    private _text = format ["%1<br/><br/>%2:<br/>%3", localize LstrinG(Warning), localize LstrinG(TargetHitBy), _shootername];
    [QACEGVAR(common, displaytextstructured), [_text, 3], [_starter, _shooter]] call CBA_fnc_targetEvent;
};

// Mark target as hit
_target setVariable [QGVAR(hit), true];
// for trigger popup
[_controller, "Beep_Target"] call FUNC(playSoundSignal);
GVAR(currentscore) = GVAR(currentscore) + 1;
[_target, 1] call FUNC(animateTarget);
// down

// set next target
GVAR(targetNumber) = GVAR(targetNumber) + 1;

private _mode = _controller getVariable [QGVAR(mode), 0];

// Handle random pop-ups in hit-based (exit if last target in hit-based with target limit)
if (_mode == 2 || {
    _mode == 3 && {
        GVAR(targetNumber) < _controller getVariable [QGVAR(targetAmount), 0]
    }
}) then {
    GVAR(nextTarget) = selectRandom (_targets - [_target]);
    
    // Mark target as not yet hit
    GVAR(nextTarget) setVariable [QGVAR(hit), false];
    
    // animate target
    _target setDamage 0;
    [GVAR(nextTarget), 0] call FUNC(animateTarget);
    // Up
};

// Handle pop-ups in trigger based
if (_mode == 4) then {
    // set next target group index
    GVAR(targetgroupindex) = GVAR(targetgroupindex) + 1;
    
    // set next target group if it's last target in group and not last target overall
    if ((GVAR(targetgroupindex) >= count GVAR(targetgroup)) && {
        GVAR(targetNumber) <= count _targets
    }) then {
        GVAR(targetgroup) = (_targets select GVAR(targetNumber)) getVariable [QGVAR(targetgroup), nil];
        GVAR(targetgroupindex) = 0;
    };
    TRACE_2("Trigger Hit", GVAR(targetgroupindex), GVAR(targetgroup));
};