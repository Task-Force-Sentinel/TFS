/*
 * ARMA EXTENDED ENVIRONMENT
 * \z\tfs\addons\medical\supplies\functions\fn_doUnpackMedicKit.sqf
 * by Ojemineh
 * 
 * unpack medical supplies
 * 
 * Arguments:
 * 0: unit - <OBJECT>
 * 
 * Return:
 * nothing
 * 
 * Example:
 * [player] call TFS_medical_supplies_fnc_doUnpackMedicKit;
 * 
 */

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

[_unit] spawn {
 
 params ["_unit"];
 
 _unit playAction "Gear";
 
 if (vehicle _unit != _unit) then {
  playSound "TFS_Medical_MedicKit_Open_1";
 } else {
  private _pitch = random [0.6, 1, 1.4];
  [_unit, "TFS_Medical_MedicKit_Open_1", [], 30, 1000, -1, _pitch] call TFS_fnc_play3dSound;
 };
 
 TFS_MEDICAL_SUPPLIES_UNPACK_SUCCESS = false;
 TFS_MEDICAL_SUPPLIES_UNPACK_FAILURE = false;
 
 [
  2,
  [],
  { TFS_MEDICAL_SUPPLIES_UNPACK_SUCCESS = true; },
  { TFS_MEDICAL_SUPPLIES_UNPACK_FAILURE = true; },
  localize "STR_TFS_Supplies_Progress_MedicKit",
  {true},
  ["isNotInside", "isNotSitting", "isNotSwimming"]
 ] call ACE_common_fnc_progressBar;
 
 waitUntil {if ((TFS_MEDICAL_SUPPLIES_UNPACK_SUCCESS) || (TFS_MEDICAL_SUPPLIES_UNPACK_FAILURE)) exitWith {true}; false};
 
 if (TFS_MEDICAL_SUPPLIES_UNPACK_SUCCESS) exitWith {
  
  _unit removeItem "TFS_MedicKit";
  
  private _order = [3,2,1];
  private _overflow = false;
  
  if ((missionNamespace getVariable ["ace_medical_level", 0]) >= 2) then {
   [_unit, "ACE_fieldDressing", 18, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_elasticBandage", 14, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_packingBandage", 14, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_quikClot",   14, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_salineIV_500",  08, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_epinephrine",  10, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_morphine",   10, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_tourniquet",  08, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "kat_Painkiller",  06, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_adenosine",  04, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_atropine",   04, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "kat_chestSeal",  04, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "kat_larynx",   06, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "kat_guedel",   06, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_splint",   08, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "kat_aatKit",   04, _order, _overflow] call TFS_fnc_addItem;

  } else {
   [_unit, "ACE_fieldDressing", 8, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "kat_Painkiller",  2, _order, _overflow] call TFS_fnc_addItem;
   [_unit, "ACE_tourniquet",  8, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_adenosine",  2, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_EarPlugs",   1, _order, _overflow] call TFS_fnc_addItem;
  };
  
  //[_unit, "Land_FirstAidKit_01_open_F"] call TFS_fnc_createLitter;
  
  _unit playActionNow "Stand";
  
 };
 
 if (TFS_MEDICAL_SUPPLIES_UNPACK_FAILURE) exitWith {
  
  [_unit, "TFS_Medical_MedicKit_Open_1"] call TFS_fnc_stop3dSound;
  
  _unit playActionNow "Stand";
  
 };
 
};
