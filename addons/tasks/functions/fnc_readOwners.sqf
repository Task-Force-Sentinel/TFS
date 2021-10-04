#include "script_component.hpp"
/*
* Author: 3Mydlo3
* Function reads task owners from supplied array and returns processed array.
*
* Arguments:
* 0: Task owners array <ARRAY>
*
* Return Value:
* 0: Processed task owners <ARRAY>
*
* Example:
* [["true", "west", "bob", "rob_group"]] call tfs_main_fnc_example
*
* Public: No
*/

params ["_taskownersRaw"];

private _taskowners = [];

{
    // if "All" keyword is used just return [true]
    if (_x isEqualto "All" || {
        _x isEqualto "true"
    }) exitwith {
        _taskowners = [true]
    };
    // Check if side was given
    private _side = call compile _x;
    if (!isnil "_side" && {
        _side in [west, east, independent, civilian]
    }) then {
        _taskowners pushBackUnique _side;
    } else {
        // try to reach object
        private _object = missionnamespace getVariable [_x, objNull];
        if (isNull _object) exitwith {
            WARNinG_1("Missing object '%1' for task owner", _x);
        };
        _taskowners pushBackUnique _object;
    };
} forEach _taskownersRaw;

// nothing eligible was found, show to everyone
if (_taskowners isEqualto []) exitwith {
    [true]
};

_taskowners