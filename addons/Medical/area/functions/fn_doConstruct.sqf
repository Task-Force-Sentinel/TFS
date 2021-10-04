/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\medical\area\functions\fn_doConstruct.sqf
*	by Ojemineh
*
*	construct a medical area (dressing station)
*
*	Arguments:
*	0: unit - <OBJECT>
*
*	Return:
*	nothing
*
*	Example:
*	[player] call TFS_medical_area_fnc_doConstruct;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitwith {
    false
};

// -------------------------------------------------------------------------------------------------

[_unit] spawn {
    params ["_unit"];
    
    _unit playAction "MedicStart";
    
    [_unit, "TFS_Medical_Area_Construct_1", [], 50, 1000] call TFS_fnc_play3dSound;
    
    private _isinBuilding = [_unit] call TFS_fnc_isinBuilding;
    private _isOnWater = (surfaceIsWater (getPosASL _unit));
    
    private _pos = getPosASL _unit;
    private _dir = getDir _unit;
    private _objects = [];
    
    private _direction = 0;
    private _distance = 1.5;
    private _heading = (_dir + _direction) mod 360;
    private _newX = (_pos select 0) + (sin _heading * _distance);
    private _newY = (_pos select 1) + (cos _heading * _distance);
    private _newPos = [0, 0, 0];
    if (!_isinBuilding && !_isOnWater) then {
        _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
    } else {
        _newPos = [_newX, _newY, (_pos select 2)];
    };
    
    private _medArea = createvehicle ["Item_Medikit", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _medArea setDir _dir;
    _medArea setPosASL _newPos;
    if (!_isinBuilding && !_isOnWater) then {
        _medArea setvectorUp surfaceNormal position _medArea;
    } else {
        _medArea setvectorUp [0, 0, 1];
    };
    _medArea setDamage 1;
    
    if (!_isinBuilding && !_isOnWater) then {
        private _cltPos = +_newPos;
        _cltPos set [2, 0];
        private _cutter = createvehicle ["land_ClutterCutter_medium_F", _cltPos, [], 0, "CAN_COLLIDE"];
        _objects pushBack _cutter;
    };
    
    private _medHpad = createvehicle ["land_HelipadEmpty_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _medHpad setDir _dir;
    _medHpad setPosASL _newPos;
    if (!_isinBuilding && !_isOnWater) then {
        _medHpad setvectorUp surfaceNormal position _medHpad;
    } else {
        _medHpad setvectorUp [0, 0, 1];
    };
    _objects pushBack _medHpad;
    
    private _medMenu = "Sign_Sphere10cm_F" createvehicle [0, 0, 0];
    _medMenu setDir _dir;
    _medMenu setPosASL (AGLtoASL (_medArea modeltoWorld [0, 0, -0.5]));
    _medMenu setobjecttextureGlobal [0, "#(argb, 8, 8, 3)color(1.0, 0.6, 0.1, 0, ca)"];
    _objects pushBack _medMenu;
    
    _medArea setVariable ["TFS_MedicalArea_Objects", _objects, true];
    
    TFS_MEDICAL_AREA_CONstrUCT_SUCCESS = false;
    TFS_MEDICAL_AREA_CONstrUCT_FAILURE = false;
    
    private _construct_time = round (missionnamespace getVariable ["tfs_medical_area_constuct_time", 20]);
    if (_construct_time < 3) then {
        _construct_time = 3;
    };
    private _section_time = (_construct_time / 8);
    
    [
        _construct_time,
        [],
        {
            TFS_MEDICAL_AREA_CONstrUCT_SUCCESS = true;
        },
        {
            TFS_MEDICAL_AREA_CONstrUCT_FAILURE = true;
        },
        localize "str_TFS_Medical_Area_Progress_Construct",
        {
            true
        },
        ["isnotinside", "isnotSitting", "isnotSwimming"]
    ] call ACE_common_fnc_progressBar;
    
    [_unit, _isinBuilding, _isOnWater, _pos, _dir, _objects, _medArea, _construct_time, _section_time] spawn {
        params ["_unit", "_isinBuilding", "_isOnWater", "_pos", "_dir", "_objects", "_medArea", "_construct_time", "_section_time"];
        
        private ["_direction", "_distance", "_heading", "_newX", "_newY", "_newPos"];
        
        if (not TFS_MEDICAL_AREA_CONstrUCT_FAILURE) then {
            sleep (2 * _section_time);
        };
        
        if (not TFS_MEDICAL_AREA_CONstrUCT_FAILURE) then {
            private _tarp1 = objNull;
            
            if (!_isinBuilding) then {
                _direction = 330;
                _distance = 1.9;
                _heading = (_dir + _direction) mod 360;
                _newX = (_pos select 0) + (sin _heading * _distance);
                _newY = (_pos select 1) + (cos _heading * _distance);
                if (!_isOnWater) then {
                    _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
                } else {
                    _newPos = [_newX, _newY, (_pos select 2) + 0.00];
                };
                _tarp1 = createSimpleObject ["Tarp_01_Small_Green_F", [0, 0, 0]];
                _tarp1 setDir (_dir + 0);
                _tarp1 setPosASL _newPos;
                if (!_isOnWater) then {
                    _tarp1 setvectorUp surfaceNormal position _tarp1;
                } else {
                    _tarp1 setvectorUp [0, 0, 1];
                };
            };
            
            _objects pushBack _tarp1;
            
            if (!_isinBuilding && !_isOnWater) then {
                private _cltPos = +_newPos;
                _cltPos set [2, 0];
                private _cutter = createvehicle ["land_ClutterCutter_medium_F", _cltPos, [], 0, "CAN_COLLIDE"];
                _objects pushBack _cutter;
            };
            
            _medArea setVariable ["TFS_MedicalArea_Objects", _objects, true];
            sleep _section_time;
        };
        
        if (not TFS_MEDICAL_AREA_CONstrUCT_FAILURE) then {
            private _bodybag1 = objNull;
            
            if (!_isinBuilding) then {
                _direction = 330;
                _distance = 1.9;
                _heading = (_dir + _direction) mod 360;
                _newX = (_pos select 0) + (sin _heading * _distance);
                _newY = (_pos select 1) + (cos _heading * _distance);
                if (!_isOnWater) then {
                    _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
                } else {
                    _newPos = [_newX, _newY, (_pos select 2) + 0.005];
                };
                _bodybag1 = createSimpleObject ["land_sleeping_bag_blue_F", [0, 0, 0]];
                _bodybag1 setDir (_dir + 180);
                _bodybag1 setPosASL _newPos;
                if (!_isOnWater) then {
                    _bodybag1 setvectorUp surfaceNormal position _bodybag1;
                } else {
                    _bodybag1 setvectorUp [0, 0, 1];
                };
            };
            
            _objects pushBack _bodybag1;
            
            _medArea setVariable ["TFS_MedicalArea_Objects", _objects, true];
            sleep _section_time;
        };
        
        if (not TFS_MEDICAL_AREA_CONstrUCT_FAILURE) then {
            private _tarp2 = objNull;
            
            if (!_isinBuilding) then {
                _direction = 030;
                _distance = 1.9;
                _heading = (_dir + _direction) mod 360;
                _newX = (_pos select 0) + (sin _heading * _distance);
                _newY = (_pos select 1) + (cos _heading * _distance);
                if (!_isOnWater) then {
                    _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
                } else {
                    _newPos = [_newX, _newY, (_pos select 2) + 0.005];
                };
                _tarp2 = createSimpleObject ["Tarp_01_Small_Green_F", [0, 0, 0]];
                _tarp2 setDir (_dir + 0);
                _tarp2 setPosASL _newPos;
                if (!_isOnWater) then {
                    _tarp2 setvectorUp surfaceNormal position _tarp2;
                } else {
                    _tarp2 setvectorUp [0, 0, 1];
                };
            };
            
            _objects pushBack _tarp2;
            
            if (!_isinBuilding && !_isOnWater) then {
                private _cltPos = +_newPos;
                _cltPos set [2, 0];
                private _cutter = createvehicle ["land_ClutterCutter_medium_F", _cltPos, [], 0, "CAN_COLLIDE"];
                _objects pushBack _cutter;
            };
            
            _medArea setVariable ["TFS_MedicalArea_Objects", _objects, true];
            sleep _section_time;
        };
        
        if (not TFS_MEDICAL_AREA_CONstrUCT_FAILURE) then {
            private _bodybag2 = objNull;
            
            if (!_isinBuilding) then {
                _direction = 030;
                _distance = 1.9;
                _heading = (_dir + _direction) mod 360;
                _newX = (_pos select 0) + (sin _heading * _distance);
                _newY = (_pos select 1) + (cos _heading * _distance);
                if (!_isOnWater) then {
                    _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
                } else {
                    _newPos = [_newX, _newY, (_pos select 2) + 0.012];
                };
                _bodybag2 = createSimpleObject ["land_sleeping_bag_blue_F", [0, 0, 0]];
                _bodybag2 setDir (_dir + 0);
                _bodybag2 setPosASL _newPos;
                if (!_isOnWater) then {
                    _bodybag2 setvectorUp surfaceNormal position _bodybag2;
                } else {
                    _bodybag2 setvectorUp [0, 0, 1];
                };
            };
            
            _objects pushBack _bodybag2;
            
            _medArea setVariable ["TFS_MedicalArea_Objects", _objects, true];
            sleep _section_time;
        };
        
        if (not TFS_MEDICAL_AREA_CONstrUCT_FAILURE) then {
            _direction = 0;
            _distance = 2.2;
            _heading = (_dir + _direction) mod 360;
            _newX = (_pos select 0) + (sin _heading * _distance);
            _newY = (_pos select 1) + (cos _heading * _distance);
            if (!_isinBuilding && !_isOnWater) then {
                _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
            } else {
                _newPos = [_newX, _newY, (_pos select 2) + 0.00];
            };
            private _firstaid = createSimpleObject ["land_FirstAidKit_01_open_F", [0, 0, 0]];
            _firstaid setDir (_dir + 50);
            _firstaid setPosASL _newPos;
            if (!_isinBuilding && !_isOnWater) then {
                _firstaid setvectorUp surfaceNormal position _firstaid;
            } else {
                _firstaid setvectorUp [0, 0, 1];
            };
            _objects pushBack _firstaid;
            
            _medArea setVariable ["TFS_MedicalArea_Objects", _objects, true];
            sleep _section_time;
        };
        
        if (not TFS_MEDICAL_AREA_CONstrUCT_FAILURE) then {
            _direction = 10;
            _distance = 1.0;
            _heading = (_dir + _direction) mod 360;
            _newX = (_pos select 0) + (sin _heading * _distance);
            _newY = (_pos select 1) + (cos _heading * _distance);
            if (!_isinBuilding && !_isOnWater) then {
                _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
            } else {
                _newPos = [_newX, _newY, (_pos select 2) + 0.000];
            };
            private _defibrillator = objNull;
            if ((["adv_aceCPR"] call TFS_fnc_isAddon) && (missionnamespace getVariable ["tfs_medical_area_enable_defibrillator", false])) then {
                _defibrillator = createvehicle ["land_Defibrillator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
                _defibrillator setDir (_dir + 60);
                _defibrillator setPosASL (AGLtoASL (_medArea modeltoWorld [0.10, -0.55, -0.30]));
                [_defibrillator, false] call ACE_dragging_fnc_setCarryable;
            } else {
                _defibrillator = createSimpleObject ["land_Defibrillator_F", [0, 0, 0]];
                _defibrillator setDir (_dir + 60);
                _defibrillator setPosASL _newPos;
                if (!_isinBuilding && !_isOnWater) then {
                    _defibrillator setvectorUp surfaceNormal position _defibrillator;
                } else {
                    _defibrillator setvectorUp [0, 0, 1];
                };
            };
            _objects pushBack _defibrillator;
            
            _medArea setVariable ["TFS_MedicalArea_Objects", _objects, true];
            sleep _section_time;
        };
        
        if (not TFS_MEDICAL_AREA_CONstrUCT_FAILURE) then {
            _direction = 350;
            _distance = 1.15;
            _heading = (_dir + _direction) mod 360;
            _newX = (_pos select 0) + (sin _heading * _distance);
            _newY = (_pos select 1) + (cos _heading * _distance);
            if (!_isinBuilding && !_isOnWater) then {
                _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
            } else {
                _newPos = [_newX, _newY, (_pos select 2) + 0.00];
            };
            private _bloodbag = createSimpleObject ["land_BloodBag_F", [0, 0, 0]];
            _bloodbag setDir (_dir + 110);
            _bloodbag setPosASL _newPos;
            if (!_isinBuilding && !_isOnWater) then {
                _bloodbag setvectorUp surfaceNormal position _bloodbag;
            } else {
                _bloodbag setvectorUp [0, 0, 1];
            };
            _objects pushBack _bloodbag;
            
            _direction = 355;
            _distance = 1.8;
            _heading = (_dir + _direction) mod 360;
            _newX = (_pos select 0) + (sin _heading * _distance);
            _newY = (_pos select 1) + (cos _heading * _distance);
            if (!_isinBuilding && !_isOnWater) then {
                _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
            } else {
                _newPos = [_newX, _newY, (_pos select 2) + 0.00];
            };
            private _gloves = createSimpleObject ["MedicalGarbage_01_Gloves_F", [0, 0, 0]];
            _gloves setDir (_dir + 270);
            _gloves setPosASL _newPos;
            if (!_isinBuilding && !_isOnWater) then {
                _gloves setvectorUp surfaceNormal position _gloves;
            } else {
                _gloves setvectorUp [0, 0, 1];
            };
            _objects pushBack _gloves;
            
            _direction = 355;
            _distance = 1.25;
            _heading = (_dir + _direction) mod 360;
            _newX = (_pos select 0) + (sin _heading * _distance);
            _newY = (_pos select 1) + (cos _heading * _distance);
            if (!_isinBuilding && !_isOnWater) then {
                _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
            } else {
                _newPos = [_newX, _newY, (_pos select 2) + 0.00];
            };
            private _bandage1 = createSimpleObject ["land_Bandage_F", [0, 0, 0]];
            _bandage1 setDir (_dir + 180);
            _bandage1 setPosASL _newPos;
            if (!_isinBuilding && !_isOnWater) then {
                _bandage1 setvectorUp surfaceNormal position _bandage1;
            } else {
                _bandage1 setvectorUp [0, 0, 1];
            };
            _objects pushBack _bandage1;
            
            _direction = 0;
            _distance = 1.30;
            _heading = (_dir + _direction) mod 360;
            _newX = (_pos select 0) + (sin _heading * _distance);
            _newY = (_pos select 1) + (cos _heading * _distance);
            if (!_isinBuilding && !_isOnWater) then {
                _newPos = [_newX, _newY, (getTerrainHeightASL [_newX, _newY])];
            } else {
                _newPos = [_newX, _newY, (_pos select 2) + 0.00];
            };
            private _bandage2 = createSimpleObject ["land_Bandage_F", [0, 0, 0]];
            _bandage2 setDir (_dir + 60);
            _bandage2 setPosASL _newPos;
            if (!_isinBuilding && !_isOnWater) then {
                _bandage2 setvectorUp surfaceNormal position _bandage2;
            } else {
                _bandage2 setvectorUp [0, 0, 1];
            };
            _objects pushBack _bandage2;
            
            _medArea setVariable ["TFS_MedicalArea_Objects", _objects, true];
            sleep _section_time;
        };
    };
    
    waitUntil {
        if ((TFS_MEDICAL_AREA_CONstrUCT_SUCCESS) || (TFS_MEDICAL_AREA_CONstrUCT_FAILURE)) exitwith {
            true
        };
        false
    };
    
    if (TFS_MEDICAL_AREA_CONstrUCT_SUCCESS) exitwith {
        [_medArea, _medMenu] remoteExec ["TFS_medical_area_fnc_createactions", 0];
        _medHpad setVariable ["ace_medical_isMedicalFacility", true, true];
        
        _unit removeItem "TFS_MedicArea";
        _unit playActionNow "Medicstop";
        
        [_unit, "TFS_Medical_Area_Construct_1"] call TFS_fnc_stop3dSound;
        
        ["tfs_medical_area_constructed", [_unit, _medArea]] call CBA_fnc_globalEvent;
    };
    
    if (TFS_MEDICAL_AREA_CONstrUCT_FAILURE) exitwith {
        private _delObjects = +_objects;
        reverse _delObjects;
        
        {
            deletevehicle _x;
            sleep 0.15;
        } forEach _delObjects;
        
        deletevehicle _medArea;
        
        _unit playActionNow "Medicstop";
        
        [_unit, "TFS_Medical_Area_Construct_1"] call TFS_fnc_stop3dSound;
    };
};