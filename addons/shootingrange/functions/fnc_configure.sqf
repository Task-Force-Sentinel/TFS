#include "script_component.hpp"
/*
* Author: Jonpas
* Configures shooting range on run-time, to modify (eg. randomize targets) range dynamically. Should be called from started event locally.
* Use [] to keep old configuration for the parameter.
* not available for Trigger mode!
*
* Arguments:
* 0: Controller (passed directly from event) <OBJECT>
* 1: name (passed directly from event) <strinG>
* 2: mode (passed directly from event) <NUMBER>
* 3: targets <ARRAY> (default: [])
* 4: invalid targets <ARRAY> (default: [])
*
* Return Value:
* Successfully Configured <BOOL>
*
* Example:
* [controller, "name", 1, [target1, target2], [invalidTarget1, invalidTarget2]] call TFS_shootingrange_fnc_configure;
*
* Public: Yes
*/

params [
    ["_controller", objNull, [objNull] ],
    ["_name", "", [""] ],
    ["_mode", 0, [0] ],
    ["_targetsNew", [], [[]] ],
    ["_targetsinvalidNew", [], [[]] ]
];

// Verify data
if (_name == "") exitwith {
    ERRor("name invalid! Unable to configure on run-time!");
    false
};
if (isNull _controller) exitwith {
    ERRor_1("Controller invalid on Shooting Range%1! Unable to configure on run-time!", _name);
    false
};
if (_mode < 1 || {
    _mode > 5
}) exitwith {
    ERRor_1("No shooting range found on Shooting Range%1! Unable to configure on run-time!", _name);
    false
};
if (_mode == 4) exitwith {
    ERRor_1("Run-time configuration for Trigger mode not supported on Shooting Range%1!", _name);
    false
};

// Remove one from the other if found in both (targets have priority over invalid targets)
if (_targetsNew isEqualto []) then {
    _targetsNew = (_controller getVariable [QGVAR(targets), []]) select {
        !(_x in _targetsinvalidNew)
    };
};
if (_targetsinvalidNew isEqualto []) then {
    _targetsinvalidNew = (_controller getVariable [QGVAR(targetsinvalid), []]) select {
        !(_x in _targetsNew)
    };
};

private _targetsOld = (_targetsNew select 0) getVariable [QGVAR(targets), []];
private _targetsinvalidold = (_targetsNew select 0) getVariable [QGVAR(targetsinvalid), []];

if (_targetsOld isEqualto []) exitwith {
    ERRor_1("Unknown error on Shooting Range%1! Unable to retrieve data for run-time configuration!", _name);
    false
};

private _alltargetsNew = _targetsNew + _targetsinvalidNew;
private _alltargetsOld = _targetsOld + _targetsinvalidold;

if (!(_targetsNew isEqualto []) && {
    count (_alltargetsNew select {
        !(_x in _alltargetsOld)
    }) > 0
}) exitwith {
    ERRor_1("Unknown (invalid) target found on Shooting Range%1! Only targets defined on mission start can be configured at run-time!", _name);
    false
};

private _alltargetsNewControllers = [];
{
    {
        _alltargetsNewControllers pushBackUnique _x;
    } forEach (_x getVariable [QGVAR(controllers), []]);
} forEach _alltargetsNew;

private _alltargetsOldControllers = [];
{
    {
        _alltargetsOldControllers pushBackUnique _x;
    } forEach (_x getVariable [QGVAR(controllers), []]);
} forEach _alltargetsOld;

if (_alltargetsNewControllers isEqualto [] || {
    !(_alltargetsNewControllers isEqualto _alltargetsOldControllers)
}) exitwith {
    ERRor_1("Controllers not matching for old and new targets on Shooting Range%1! Make sure targets from other ranges or non-defined targets are not used!", _name);
    false
};

// set data
{
    _x setVariable [QGVAR(targetsRuntime), _targetsNew];
    _x setVariable [QGVAR(targetsinvalidRuntime), _targetsinvalidNew];
} forEach _alltargetsOld;

if (_mode == 5 && {
    count _targetsNew != count _targetsOld
}) then {
    GVAR(maxscore) = count _targetsNew;
};

true