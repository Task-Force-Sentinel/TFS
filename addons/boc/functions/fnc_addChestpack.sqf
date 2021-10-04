#include "script_component.hpp"
/*
* Author: DerZade
* Adds a chestpack to a unit. if a unit already has one, the old chestpack will be ignored and will be deleted completely.
*
* Arguments:
* 0: Unit <OBJECT>
* 1: backpack classname <strinG>
*
* Return Value:
* nothing
*
* Example:
* [player, "B_Kitbag_rgr"] call TFS_boc_fnc_addChestpack;
*
* Public: No
*/
params [ ["_unit", objNull, [objNull]], ["_chestpackClass", "", [""]] ];
private ["_getinID", "_getoutID", "_animID", "_killedID", "_weaponHolder"];

if (isNull _unit || {
    _chestpackClass isEqualto ""
}) exitwith {};

// add HandleDisconnect-EH on server if not done yet
if !(missionnamespace getVariable [QGVAR(HDCEHadded), false]) then {
    ["HandleDisconnect", FUNC(EHHandleDisconnect)] remoteExecCall ["addMissionEventHandler", 2];
    GVAR(HDCEHadded) = true;
    publicVariable QGVAR(HDCEHadded);
};

// delete existing chestpack, if there is one
if !([_unit] call FUNC(chestpack) isEqualto "") then {
    [_unit] call FUNC(removeChestpack);
};

// add EHs
_getinID = _unit addEventHandler ["GetinMan", FUNC(EHGetin)];
_getoutID = _unit addEventHandler ["GetoutMan", FUNC(EHGetout)];
_animID = _unit addEventHandler ["Animdone", FUNC(EHAnimdone)];
_killedID = _unit addEventHandler ["Killed", FUNC(EHKilled)];
_weaponHolder = createvehicle [QGVAR(weaponHolder), getPos _unit, [], 0, "CAN_COLLIDE"];
_weaponHolder addbackpackCargoGlobal [_chestpackClass, 1];

if (GVAR(forceWalk)) then {
    [_unit, "forceWalk", QGVAR(forcemovementspeed), true] call ace_common_fnc_statusEffect_set;
} else {
    [_unit, "blockSprint", QGVAR(forcemovementspeed), true] call ace_common_fnc_statusEffect_set;
};

_unit setVariable [QGVAR(preventProne), true, true];

_unit setVariable [QGVAR(chestpack), [[_chestpackClass, _weaponHolder], [_getinID, _getoutID, _animID, _killedID], []], true];

// execute vehicle shit
if !(vehicle _unit isEqualto _unit) then {
    [_unit, "", vehicle _unit] call FUNC(EHGetin);
} else {
    [_unit, "", objNull] call FUNC(EHGetout);
};