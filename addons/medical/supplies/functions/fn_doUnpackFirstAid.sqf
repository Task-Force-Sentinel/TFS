/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\medical\supplies\functions\fn_doUnpackFirstAid.sqf
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
* [player] call TFS_medical_supplies_fnc_doUnpackFirstAid;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {};

// -------------------------------------------------------------------------------------------------

[_unit] spawn {
    params ["_unit"];
    
    _unit playAction "Gear";
    
    if (vehicle _unit != _unit) then {
        playSound "TFS_Medical_FirstAid_Open_1";
    } else {
        private _pitch = random [0.6, 1, 1.4];
        [_unit, "TFS_Medical_FirstAid_Open_1", [], 30, 1000, -1, _pitch] call TFS_fnc_play3dSound;
    };
    
    TFS_MEDICAL_SUPPLIES_UNPACK_SUCCESS = false;
    TFS_MEDICAL_SUPPLIES_UNPACK_FAILURE = false;
    
    [
        2,
        [],
        {TFS_MEDICAL_SUPPLIES_UNPACK_SUCCESS = true; },
        {TFS_MEDICAL_SUPPLIES_UNPACK_FAILURE = true; },
        localize "str_TFS_Supplies_Progress_FirstAid",
        {
            true
        },
        ["isnotinside", "isnotSitting", "isnotSwimming"]
    ] call ACE_common_fnc_progressBar;
    
    waitUntil {
        if ((TFS_MEDICAL_SUPPLIES_UNPACK_SUCCESS) || (TFS_MEDICAL_SUPPLIES_UNPACK_FAILURE)) exitwith {
            true
        };
        false
    };
    
    if (TFS_MEDICAL_SUPPLIES_UNPACK_SUCCESS) exitwith {
        _unit removeItem "TFS_FirstAid";
        
        private _order = [1, 2, 3];
        private _overflow = true;
        
        if ((missionnamespace getVariable ["ace_medical_level", 0]) >= 2) then {
            [_unit, "ACE_fieldDressing", 8, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_elasticBandage", 5, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_packingBandage", 5, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_quikClot", 5, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_salineIV_500", 2, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_epinephrine", 5, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_morphine", 5, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_tourniquet", 4, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_Painkiller", 2, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_adenosine", 1, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_atropine", 1, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_chestSeal", 1, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_larynx", 1, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_guedel", 1, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_splint", 1, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_aatKit", 1, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "KAT_Empty_bloodIV_500", 1, _order, _overflow] call TFS_fnc_addItem;
        } else {
            [_unit, "ACE_fieldDressing", 4, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_Painkiller", 1, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_tourniquet", 4, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_EarPlugs", 1, _order, _overflow] call TFS_fnc_addItem;
        };
        
        // [_unit, "MedicalGarbage_01_FirstAidKit_F"] call TFS_fnc_createLitter;
        
        _unit playActionNow "Stand";
    };
    
    if (TFS_MEDICAL_SUPPLIES_UNPACK_FAILURE) exitwith {
        [_unit, "TFS_Medical_FirstAid_Open_1"] call TFS_fnc_stop3dSound;
        
        _unit playActionNow "Stand";
    };
};