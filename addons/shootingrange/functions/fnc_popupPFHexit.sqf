#include "script_component.hpp"
/*
* Author: Jonpas
* Handles target pop-ups.
*
* Arguments:
* 0: Per-Frame Handler ID <NUMBER>
* 1: Controller <OBJECT>
* 2: Controllers <ARRAY>
* 3: name <strinG>
* 4: targets <ARRAY>
* 5: invalid targets <ARRAY>
* 6: mode (1 = time, 2 = Hit (time Limited), 3 = Hit (Target Limited), 4 = Trigger) <NUMBER>
* 7: Success <BOOL>
* 8: Current score <NUMBER> (default: 0)
* 9: maximum score <NUMBER> (default: 0)
* 10: time Elapsed <NUMBER> (default: 0)
* 11: Triggers <ARRAY> (default: [])
*
* Return Value:
* None
*
* Example:
* [idPFH, controller, [controller1, controller2], "range", [target1, target2], [invalidTarget1, invalidTarget2], 1, true] call TFS_shootingrange_fnc_popupPFHexit;
*
* Public: No
*/

params ["_idPFH", "_controller", "_controllers", "_name", "_targets", "_targetsinvalid", "_mode", "_success", ["_currentscore", 0], ["_maxscore", 0], ["_timeElapsed", 0], ["_triggers", []] ];

// Remove PFH
[_idPFH] call CBA_fnc_removePerFrameHandler;

// Finish or stop
[_controller, _controllers, _name, _targets, _targetsinvalid, _success, _currentscore, _maxscore, _timeElapsed] call FUNC(stop);

// Cleanup variables
GVAR(targetNumber) = nil;
GVAR(currentscore) = nil;
GVAR(maxscore) = nil;
GVAR(firstrun) = nil;
GVAR(nextTarget) = nil;
GVAR(targetUp) = nil;

// Remove fired EH if needed
if (_mode > 1) then {
    if (_mode < 5) then {
        ACE_player removeEventHandler ["fired", GVAR(firedEHid)];
        GVAR(firedEHid) = nil;
    };
    
    if (_mode == 4) then {
        {
            _x enableSimulation false;
        } forEach _triggers;
        
        GVAR(targetgroup) = nil;
        GVAR(targetgroupindex) = nil;
    };
} else {
    GVAR(lastPausetime) = nil;
};