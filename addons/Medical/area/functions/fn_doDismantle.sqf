/*
* ARMA EXTENDED ENVIRONMENT
* \z\tfs\addons\medical\area\functions\fn_doDismantle.sqf
* by Ojemineh
*
* dismantle a existing medical area
*
* Arguments:
* 0: unit - <OBJECT>
* 1: medical area - <OBJECT>
*
* Return:
* nothing
*
* Example:
* [player, area1] call TFS_medical_area_fnc_doDismantle;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit", "_area"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_area = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {
    false
};
if (isNull _area) exitwith {
    false
};

// -------------------------------------------------------------------------------------------------

[_unit, _area] spawn {
    params ["_unit", "_area"];
    
    _area setVariable ["TFS_MedicalArea_DismantleinProgress", true, true];
    _unit playAction "MedicStart";
    
    [_unit, "TFS_Medical_Area_Dismantle_1", [], 50, 1000] call TFS_fnc_play3dSound;
    
    private _objects = _area getVariable ["TFS_MedicalArea_Objects", []];
    private _lights = _area getVariable ["TFS_MedicalArea_Lights", []];
    private _hpad = (_objects select 0);
    
    TFS_MEDICAL_AREA_DISMANTLE_SUCCESS = false;
    TFS_MEDICAL_AREA_DISMANTLE_FAILURE = false;
    
    private _dismantle_time = round (missionnamespace getVariable ["tfs_medical_area_dismantle_time", 20]);
    if (_dismantle_time < 3) then {
        _dismantle_time = 3;
    };
    private _section_time = (_dismantle_time / 5);
    
    [
        _dismantle_time,
        [],
        {
            TFS_MEDICAL_AREA_DISMANTLE_SUCCESS = true;
        },
        {
            TFS_MEDICAL_AREA_DISMANTLE_FAILURE = true;
        },
        localize "str_TFS_Medical_Area_Progress_Dismantle",
        {
            true
        },
        ["isnotinside", "isnotSitting", "isnotSwimming"]
    ] call ACE_common_fnc_progressBar;
    
    waitUntil {
        if ((TFS_MEDICAL_AREA_DISMANTLE_SUCCESS) || (TFS_MEDICAL_AREA_DISMANTLE_FAILURE)) exitwith {
            true
        };
        false
    };
    
    if (TFS_MEDICAL_AREA_DISMANTLE_SUCCESS) exitwith {
        _hpad setVariable ["ACE_medical_isMedicalFacility", false, true];
        
        [_unit, _area, _objects, _lights] spawn {
            params ["_unit", "_area", "_objects", "_lights"];
            
            if (count _lights > 0) then {
                {
                    deletevehicle _x;
                } forEach _lights;
            };
            
            private _delObjects = +_objects;
            reverse _delObjects;
            {
                deletevehicle _x;
                sleep 0.15;
            } forEach _delObjects;
            
            _area setVariable ["TFS_MedicalArea_DismantleinProgress", nil, true];
            _area setVariable ["TFS_MedicalArea_Objects", nil, true];
            _area setVariable ["TFS_MedicalArea_Lights", nil, true];
            sleep 0.15;
            deletevehicle _area;
            
            [_unit, "TFS_MedicArea", 1, [3, 2, 1], true] call TFS_fnc_addItem;
            
            ["tfs_medical_area_dismantled", [_unit]] call CBA_fnc_globalEvent;
        };
        
        _unit playActionNow "Medicstop";
        
        [_unit, "TFS_Medical_Area_Dismantle_1"] call TFS_fnc_stop3dSound;
    };
    
    if (TFS_MEDICAL_AREA_DISMANTLE_FAILURE) exitwith {
        _area setVariable ["TFS_MedicalArea_DismantleinProgress", nil, true];
        _unit playActionNow "Medicstop";
        
        [_unit, "TFS_Medical_Area_Dismantle_1"] call TFS_fnc_stop3dSound;
    };
};