/*
 * ARMA EXTENDED ENVIRONMENT
 * \z\tfs\addons\medical\area\functions\fn_canConstruct.sqf
 * by Ojemineh
 * 
 * check if medical area can be constructed
 * 
 * Arguments:
 * 0: unit - <OBJECT>
 * 
 * Return:
 * <BOOLEAN>
 * 
 * Example:
 * [player] call TFS_medical_area_fnc_canConstruct;
 * 
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {false};

// -------------------------------------------------------------------------------------------------

private _return = false;

_return = (
 ("TFS_MedicArea" in items _unit) && 
 (alive _unit) && 
 !(_unit getVariable ["ace_captives_isSurrendering", false]) && 
 !(_unit getVariable ["ace_captives_isHandcuffed", false]) && 
 !(_unit getVariable ["ace_isUnconscious", false]) && 
 (isNull (objectParent _unit)) && 
 (
  ( (surfaceIsWater (getPosASL _unit)) && (isTouchingGround _unit)) && (((getPosASL _unit) select 2) > 1) || 
  (!(surfaceIsWater (getPosASL _unit)) && (isTouchingGround _unit)) 
 ) && 
 !(visibleMap)
);

_return;