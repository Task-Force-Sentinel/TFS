/*
The MIT License (MIT)

Copyright (c) 2016 seth Duda

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", withOUT WARRANTY OF ANY KinD, expRESS or IMPLIED, inCLUDinG BUT not LIMITED to THE WARRANTIES OF MERCHANTABILITY, FITNESS for A PARTICULAR PURPOSE and NONinFRinGEMENT. in NO EVENT SHALL THE AUTHORS or COPYRIGHT HOLDERS BE LIABLE for ANY CLAIM, damageS or OTHER LIABILITY, WHETHER in AN action OF CONTRACT, torT or OTHERWISE, ARIsinG from, OUT OF or in CONNECTION with THE SOFTWARE or THE USE or OTHER DEALinGS in THE SOFTWARE.
*/

#define SA_find_Surface_ASL_Under_position(_object, _positionAGL, _returnSurfaceASL, _canFloat) \
_objectASL = AGLtoASL (_object modeltoWorldVisual (getCenterOfMass _object));
\
_surfaceintersectStartASL = [_positionAGL select 0, _positionAGL select 1, (_objectASL select 2) + 1];
\
_surfaceintersectEndASL = [_positionAGL select 0, _positionAGL select 1, (_objectASL select 2) - 5];
\
_surfaces = lineIntersectsSurfaces [_surfaceintersectStartASL, _surfaceintersectEndASL, _object, objNull, true, 5];
\
_returnSurfaceASL = AGLtoASL _positionAGL;
\
{
    \
    scopeName "surfaceLoop";
    \
    if (isNull (_x select 2)) then {
        \
        _returnSurfaceASL = _x select 0;
        \
        breakOut "surfaceLoop";
        \
    } else {
        \
        if!((_x select 2) isKindOf "ropesegment") then {
            \
            _objectFilename = str (_x select 2);
            \
            if ((_objectFilename find " t_") == -1 && (_objectFilename find " b_") == -1) then {
                \
                _returnSurfaceASL = _x select 0;
                \
                breakOut "surfaceLoop";
                \
            };
            \
        };
        \
    };
    \
} forEach _surfaces;
\
if (_canFloat && (_returnSurfaceASL select 2) < 0) then {
    \
    _returnSurfaceASL set [2, 0];
    \
};
\

#define SA_find_Surface_ASL_Under_model(_object, _modelOffset, _returnSurfaceASL, _canFloat) \
SA_find_Surface_ASL_Under_position(_object, (_object modeltoWorldVisual _modelOffset), _returnSurfaceASL, _canFloat);

#define SA_find_Surface_AGL_Under_model(_object, _modelOffset, _returnSurfaceAGL, _canFloat) \
SA_find_Surface_ASL_Under_model(_object, _modelOffset, _returnSurfaceAGL, _canFloat);
\
_returnSurfaceAGL = ASLtoAGL _returnSurfaceAGL;

#define SA_Get_Cargo(_vehicle, _cargo) \
if (count (ropeAttachedObjects _vehicle) == 0) then {
    \
    _cargo = objNull;
    \
} else {
    \
    _cargo = ((ropeAttachedObjects _vehicle) select 0) getVariable ["SA_Cargo", objNull];
    \
};

SA_Advanced_towing_install = {
    // Prevent advanced towing from installing twice
    if (!isnil "SA_toW_inIT") exitwith {};
    SA_toW_inIT = true;
    
    diag_log "Advanced towing loading...";
    
    SA_Simulate_towing_speed = {
        params ["_vehicle"];
        
        private ["_runSimulation", "_currentCargo", "_maxvehiclespeed", "_maxtowedvehicles", "_vehicleMass"];
        
        _maxvehiclespeed = getNumber (configFile >> "Cfgvehicles" >> typeOf _vehicle >> "maxspeed");
        _vehicleMass = 1000 max (getMass _vehicle);
        _maxtowedCargo = missionnamespace getVariable ["SA_max_toWED_CARGO", 2];
        _runSimulation = true;
        
        private ["_currentvehicle", "_totalCargoMass", "_totalCargocount", "_findNextCargo", "_towropes", "_ropeLength"];
        private ["_ends", "_endsdistance", "_currentmaxspeed", "_newmaxspeed"];
        
        while {_runSimulation} do {
            // Calculate total mass and count of cargo being towed (only takes into account
            // cargo that's actively being towed (e.g. there's no slack in the rope)
            
            _currentvehicle = _vehicle;
            _totalCargoMass = 0;
            _totalCargocount = 0;
            _findNextCargo = true;
            while {_findNextCargo} do {
                _findNextCargo = false;
                SA_Get_Cargo(_currentvehicle, _currentCargo);
                if (!isNull _currentCargo) then {
                    _towropes = _currentvehicle getVariable ["SA_tow_ropes", []];
                    if (count _towropes > 0) then {
                        _ropeLength = ropeLength (_towropes select 0);
                        _ends = ropeEndPosition (_towropes select 0);
                        _endsdistance = (_ends select 0) distance (_ends select 1);
                        if (_endsdistance >= _ropeLength - 2) then {
                            _totalCargoMass = _totalCargoMass + (1000 max (getMass _currentCargo));
                            _totalCargocount = _totalCargocount + 1;
                            _currentvehicle = _currentCargo;
                            _findNextCargo = true;
                        };
                    };
                };
            };
            
            _newmaxspeed = _maxvehiclespeed / (1 max ((_totalCargoMass / _vehicleMass) * 2));
            _newmaxspeed = (_maxvehiclespeed * 0.75) min _newmaxspeed;
            
            // Prevent vehicle from moving if trying to move more cargo than pre-defined max
            if (_totalCargocount > _maxtowedCargo) then {
                _newmaxspeed = 0;
            };
            
            _currentmaxspeed = _vehicle getVariable ["SA_max_tow_speed", _maxvehiclespeed];
            
            if (_currentmaxspeed != _newmaxspeed) then {
                _vehicle setVariable ["SA_max_tow_speed", _newmaxspeed];
            };
            
            sleep 0.1;
        };
    };
    
    SA_Simulate_towing = {
        params ["_vehicle", "_vehicleHitchmodelPos", "_cargo", "_cargoHitchmodelPos", "_ropeLength"];
        
        private ["_lastCargoHitchposition", "_lastCargovectorDir", "_cargoLength", "_maxdistancetoCargo", "_lastmovedCargoposition", "_cargoHitchPoints"];
        private ["_vehicleHitchposition", "_cargoHitchposition", "_newCargoHitchposition", "_cargoVector", "_movedCargoVector", "_attachedobjects", "_currentCargo"];
        private ["_newCargoDir", "_lastCargovectorDir", "_newCargoposition", "_doexit", "_cargoposition", "_vehicleposition", "_maxvehiclespeed", "_vehicleMass", "_cargoMass", "_cargoCanFloat"];
        private ["_cargoCorner1AGL", "_cargoCorner1ASL", "_cargoCorner2AGL", "_cargoCorner2ASL", "_cargoCorner3AGL", "_cargoCorner3ASL", "_cargoCorner4AGL", "_cargoCorner4ASL", "_surfaceNormal1", "_surfaceNormal2", "_surfaceNormal"];
        private ["_cargoCenterASL", "_surfaceHeight", "_surfaceHeight2", "_maxSurfaceHeight"];
        
        _maxvehiclespeed = getNumber (configFile >> "Cfgvehicles" >> typeOf _vehicle >> "maxspeed");
        _cargoCanFloat = if (getNumber (configFile >> "Cfgvehicles" >> typeOf _cargo >> "canFloat") == 1) then {
            true
        } else {
            false
        };
        
        private ["_cargoCenterOfMassAGL", "_cargomodelCenterGroundposition"];
        SA_find_Surface_AGL_Under_model(_cargo, getCenterOfMass _cargo, _cargoCenterOfMassAGL, _cargoCanFloat);
        _cargomodelCenterGroundposition = _cargo worldToModelVisual _cargoCenterOfMassAGL;
        _cargomodelCenterGroundposition set [0, 0];
        _cargomodelCenterGroundposition set [1, 0];
        _cargomodelCenterGroundposition set [2, (_cargomodelCenterGroundposition select 2) - 0.05];
        // Adjust height so that it doesn't ride directly on ground
        
        // Calculate cargo model corner points
        private ["_cargoCornerPoints"];
        _cargoCornerPoints = [_cargo] call SA_Get_Corner_Points;
        _corner1 = _cargoCornerPoints select 0;
        _corner2 = _cargoCornerPoints select 1;
        _corner3 = _cargoCornerPoints select 2;
        _corner4 = _cargoCornerPoints select 3;
        
        // try to set cargo owner if the towing client doesn't own the cargo
        if (local _vehicle && !local _cargo) then {
            [[_cargo, clientowner], "SA_set_owner"] call SA_remoteExecServer;
        };
        
        _vehicleHitchmodelPos set [2, 0];
        _cargoHitchmodelPos set [2, 0];
        
        _lastCargoHitchposition = _cargo modeltoWorld _cargoHitchmodelPos;
        _lastCargovectorDir = vectorDir _cargo;
        _lastmovedCargoposition = getPos _cargo;
        
        _cargoHitchPoints = [_cargo] call SA_Get_Hitch_Points;
        _cargoLength = (_cargoHitchPoints select 0) distance (_cargoHitchPoints select 1);
        
        _vehicleMass = 1 max (getMass _vehicle);
        _cargoMass = getMass _cargo;
        if (_cargoMass == 0) then {
            _cargoMass = _vehicleMass;
        };
        
        _maxdistancetoCargo = _ropeLength;
        
        _doexit = false;
        
        // Start vehicle speed simulation
        [_vehicle] spawn SA_Simulate_towing_speed;
        
        while {!_doexit} do {
            _vehicleHitchposition = _vehicle modeltoWorld _vehicleHitchmodelPos;
            _vehicleHitchposition set [2, 0];
            _cargoHitchposition = _lastCargoHitchposition;
            _cargoHitchposition set [2, 0];
            
            _cargoposition = getPos _cargo;
            _vehicleposition = getPos _vehicle;
            
            if (_vehicleHitchposition distance _cargoHitchposition > _maxdistancetoCargo) then {
                // Calculated simulated towing position + direction
                _newCargoHitchposition = _vehicleHitchposition vectorAdd ((_vehicleHitchposition vectorFromTo _cargoHitchposition) vectorMultiply _ropeLength);
                _cargoVector = _lastCargovectorDir vectorMultiply _cargoLength;
                _movedCargoVector = _newCargoHitchposition vectorDiff _lastCargoHitchposition;
                _newCargoDir = vectorNormalized (_cargoVector vectorAdd _movedCargoVector);
                // if (_isRearCargoHitch) then {
                    // _newCargoDir = _newCargoDir vectorMultiply -1;
                // };
                _lastCargovectorDir = _newCargoDir;
                _newCargoposition = _newCargoHitchposition vectorAdd (_newCargoDir vectorMultiply -(vectorMagnitude (_cargoHitchmodelPos)));
                
                SA_find_Surface_ASL_Under_position(_cargo, _newCargoposition, _newCargoposition, _cargoCanFloat);
                
                // Calculate surface normal (up) (more realistic than surfaceNormal function)
                SA_find_Surface_ASL_Under_model(_cargo, _corner1, _cargoCorner1ASL, _cargoCanFloat);
                SA_find_Surface_ASL_Under_model(_cargo, _corner2, _cargoCorner2ASL, _cargoCanFloat);
                SA_find_Surface_ASL_Under_model(_cargo, _corner3, _cargoCorner3ASL, _cargoCanFloat);
                SA_find_Surface_ASL_Under_model(_cargo, _corner4, _cargoCorner4ASL, _cargoCanFloat);
                _surfaceNormal1 = (_cargoCorner1ASL vectorFromTo _cargoCorner3ASL) vectorCrossProduct (_cargoCorner1ASL vectorFromTo _cargoCorner2ASL);
                _surfaceNormal2 = (_cargoCorner4ASL vectorFromTo _cargoCorner2ASL) vectorCrossProduct (_cargoCorner4ASL vectorFromTo _cargoCorner3ASL);
                _surfaceNormal = _surfaceNormal1 vectorAdd _surfaceNormal2;
                
                if (missionnamespace getVariable ["SA_toW_DEBUG_ENABLED", false]) then {
                    if (isnil "sa_tow_debug_arrow_1") then {
                        sa_tow_debug_arrow_1 = "Sign_Arrow_F" createvehiclelocal [0, 0, 0];
                        sa_tow_debug_arrow_2 = "Sign_Arrow_F" createvehiclelocal [0, 0, 0];
                        sa_tow_debug_arrow_3 = "Sign_Arrow_F" createvehiclelocal [0, 0, 0];
                        sa_tow_debug_arrow_4 = "Sign_Arrow_F" createvehiclelocal [0, 0, 0];
                    };
                    sa_tow_debug_arrow_1 setPosASL _cargoCorner1ASL;
                    sa_tow_debug_arrow_1 setvectorUp _surfaceNormal;
                    sa_tow_debug_arrow_2 setPosASL _cargoCorner2ASL;
                    sa_tow_debug_arrow_2 setvectorUp _surfaceNormal;
                    sa_tow_debug_arrow_3 setPosASL _cargoCorner3ASL;
                    sa_tow_debug_arrow_3 setvectorUp _surfaceNormal;
                    sa_tow_debug_arrow_4 setPosASL _cargoCorner4ASL;
                    sa_tow_debug_arrow_4 setvectorUp _surfaceNormal;
                };
                
                // Calculate adjusted surface height based on surface normal (prevents vehicle from clipping into ground)
                _cargoCenterASL = AGLtoASL (_cargo modeltoWorldVisual [0, 0, 0]);
                _cargoCenterASL set [2, 0];
                _surfaceHeight = ((_cargoCorner1ASL vectorAdd ( _cargoCenterASL vectorMultiply -1)) vectorDotProduct _surfaceNormal1) / ([0, 0, 1] vectorDotProduct _surfaceNormal1);
                _surfaceHeight2 = ((_cargoCorner1ASL vectorAdd ( _cargoCenterASL vectorMultiply -1)) vectorDotProduct _surfaceNormal2) / ([0, 0, 1] vectorDotProduct _surfaceNormal2);
                _maxSurfaceHeight = (_newCargoposition select 2) max _surfaceHeight max _surfaceHeight2;
                _newCargoposition set [2, _maxSurfaceHeight ];
                
                _newCargoposition = _newCargoposition vectorAdd (_cargomodelCenterGroundposition vectorMultiply -1);
                
                _cargo setvectorDir _newCargoDir;
                _cargo setvectorUp _surfaceNormal;
                _cargo setPosWorld _newCargoposition;
                
                _lastCargoHitchposition = _newCargoHitchposition;
                _maxdistancetoCargo = _vehicleHitchposition distance _newCargoHitchposition;
                _lastmovedCargoposition = _cargoposition;
                
                _massAdjustedmaxspeed = _vehicle getVariable ["SA_max_tow_speed", _maxvehiclespeed];
                if (speed _vehicle > (_massAdjustedmaxspeed)+0.1) then {
                    _vehicle setvelocity ((vectorNormalized (velocity _vehicle)) vectorMultiply (_massAdjustedmaxspeed/3.6));
                };
            } else {
                if (_lastmovedCargoposition distance _cargoposition > 2) then {
                    _lastCargoHitchposition = _cargo modeltoWorld _cargoHitchmodelPos;
                    _lastCargovectorDir = vectorDir _cargo;
                };
            };
            
            // if vehicle isn't local to the client, switch client running towing simulation
            if (!local _vehicle) then {
                [_this, "SA_Simulate_towing", _vehicle] call SA_remoteExec;
                _doexit = true;
            };
            
            // if the vehicle isn't towing anything, stop the towing simulation
            SA_Get_Cargo(_vehicle, _currentCargo);
            if (isNull _currentCargo) then {
                _doexit = true;
            };
            
            sleep 0.01;
        };
    };
    
    SA_Get_Corner_Points = {
        params ["_vehicle"];
        private ["_centerOfMass", "_bbr", "_p1", "_p2", "_rearCorner", "_rearCorner2", "_frontCorner", "_frontCorner2"];
        private ["_maxWidth", "_widthOffset", "_maxLength", "_lengthOffset", "_widthFactor", "_lengthFactor"];
        
        // Correct width and length factor for air
        _widthFactor = 0.75;
        _lengthFactor = 0.75;
        if (_vehicle isKindOf "Air") then {
            _widthFactor = 0.3;
        };
        if (_vehicle isKindOf "Helicopter") then {
            _widthFactor = 0.2;
            _lengthFactor = 0.45;
        };
        
        _centerOfMass = getCenterOfMass _vehicle;
        _bbr = boundingBoxReal _vehicle;
        _p1 = _bbr select 0;
        _p2 = _bbr select 1;
        _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
        _widthOffset = ((_maxWidth / 2) - abs ( _centerOfMass select 0 )) * _widthFactor;
        _maxLength = abs ((_p2 select 1) - (_p1 select 1));
        _lengthOffset = ((_maxLength / 2) - abs (_centerOfMass select 1 )) * _lengthFactor;
        _rearCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) - _lengthOffset, _centerOfMass select 2];
        _rearCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) - _lengthOffset, _centerOfMass select 2];
        _frontCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) + _lengthOffset, _centerOfMass select 2];
        _frontCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) + _lengthOffset, _centerOfMass select 2];
        
        if (missionnamespace getVariable ["SA_toW_DEBUG_ENABLED", false]) then {
            if (isnil "sa_tow_debug_arrow_1") then {
                sa_tow_debug_arrow_1 = "Sign_Arrow_F" createvehiclelocal [0, 0, 0];
                sa_tow_debug_arrow_2 = "Sign_Arrow_F" createvehiclelocal [0, 0, 0];
                sa_tow_debug_arrow_3 = "Sign_Arrow_F" createvehiclelocal [0, 0, 0];
                sa_tow_debug_arrow_4 = "Sign_Arrow_F" createvehiclelocal [0, 0, 0];
            };
            sa_tow_debug_arrow_1 setPosASL AGLtoASL (_vehicle modeltoWorldVisual _rearCorner);
            sa_tow_debug_arrow_2 setPosASL AGLtoASL (_vehicle modeltoWorldVisual _rearCorner2);
            sa_tow_debug_arrow_3 setPosASL AGLtoASL (_vehicle modeltoWorldVisual _frontCorner);
            sa_tow_debug_arrow_4 setPosASL AGLtoASL (_vehicle modeltoWorldVisual _frontCorner2);
        };
        
        [_rearCorner, _rearCorner2, _frontCorner, _frontCorner2];
    };
    
    SA_Get_Hitch_Points = {
        params ["_vehicle"];
        private ["_cornerPoints", "_rearCorner", "_rearCorner2", "_frontCorner", "_frontCorner2", "_rearHitchPoint"];
        private ["_frontHitchPoint", "_sideLeftPoint", "_sideRightPoint"];
        _cornerPoints = [_vehicle] call SA_Get_Corner_Points;
        _rearCorner = _cornerPoints select 0;
        _rearCorner2 = _cornerPoints select 1;
        _frontCorner = _cornerPoints select 2;
        _frontCorner2 = _cornerPoints select 3;
        _rearHitchPoint = ((_rearCorner vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd _rearCorner2;
        _frontHitchPoint = ((_frontCorner vectorDiff _frontCorner2) vectorMultiply 0.5) vectorAdd _frontCorner2;
        // _sideLeftPoint = ((_frontCorner vectorDiff _rearCorner) vectorMultiply 0.5) vectorAdd _frontCorner;
        // _sideRightPoint = ((_frontCorner2 vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd _frontCorner2;
        [_frontHitchPoint, _rearHitchPoint];
    };
    
    SA_Attach_tow_ropes = {
        params ["_cargo", "_player"];
        _vehicle = _player getVariable ["SA_tow_ropes_vehicle", objNull];
        if (!isNull _vehicle) then {
            if (local _vehicle) then {
                private ["_towropes", "_vehicleHitch", "_cargoHitch", "_objdistance", "_ropeLength"];
                _towropes = _vehicle getVariable ["SA_tow_ropes", []];
                if (count _towropes == 1) then {
                    /*
                    private ["_cargoHitchPoints", "_distancetoFrontHitch", "_distancetorearHitch", "_isRearCargoHitch"];
                    _cargoHitchPoints = [_cargo] call SA_Get_Hitch_Points;
                    _distancetoFrontHitch = player distance (_cargo modeltoWorld (_cargoHitchPoints select 0));
                    _distancetorearHitch = player distance (_cargo modeltoWorld (_cargoHitchPoints select 1));
                    if (_distancetoFrontHitch < _distancetorearHitch) then {
                        _cargoHitch = _cargoHitchPoints select 0;
                        _isRearCargoHitch = false;
                    } else {
                        _cargoHitch = _cargoHitchPoints select 1;
                        _isRearCargoHitch = true;
                    };
                    */
                    
                    _cargoHitch = ([_cargo] call SA_Get_Hitch_Points) select 0;
                    
                    _vehicleHitch = ([_vehicle] call SA_Get_Hitch_Points) select 1;
                    _ropeLength = (ropeLength (_towropes select 0));
                    _objdistance = ((_vehicle modeltoWorld _vehicleHitch) distance (_cargo modeltoWorld _cargoHitch));
                    if (_objdistance > _ropeLength) then {
                        [["The tow ropes are too short. move vehicle closer.", false], "SA_hint", _player] call SA_remoteExec;
                    } else {
                        [_vehicle, _player] call SA_drop_tow_ropes;
                        _helper = "land_Can_V2_F" createvehicle position _cargo;
                        _helper attachto [_cargo, _cargoHitch];
                        _helper setVariable ["SA_Cargo", _cargo, true];
                        hideObject _helper;
                        [[_helper], "SA_Hide_Object_Global"] call SA_remoteExecServer;
                        [_helper, [0, 0, 0], [0, 0, -1]] ropeAttachto (_towropes select 0);
                        [_vehicle, _vehicleHitch, _cargo, _cargoHitch, _ropeLength] spawn SA_Simulate_towing;
                    };
                };
            } else {
                [_this, "SA_Attach_tow_ropes", _vehicle, true] call SA_remoteExec;
            };
        };
    };
    
    SA_Take_tow_ropes = {
        params ["_vehicle", "_player"];
        if (local _vehicle) then {
            diag_log format ["Take tow ropes called %1", _this];
            private ["_existingtowropes", "_hitchPoint", "_rope"];
            _existingtowropes = _vehicle getVariable ["SA_tow_ropes", []];
            if (count _existingtowropes == 0) then {
                _hitchPoint = [_vehicle] call SA_Get_Hitch_Points select 1;
                _rope = ropeCreate [_vehicle, _hitchPoint, 10];
                _vehicle setVariable ["SA_tow_ropes", [_rope], true];
                _this call SA_pickup_tow_ropes;
            };
        } else {
            [_this, "SA_Take_tow_ropes", _vehicle, true] call SA_remoteExec;
        };
    };
    
    SA_pickup_tow_ropes = {
        params ["_vehicle", "_player"];
        if (local _vehicle) then {
            private ["_attachedobj", "_helper"];
            {
                _attachedobj = _x;
                {
                    _attachedobj ropeDetach _x;
                } forEach (_vehicle getVariable ["SA_tow_ropes", []]);
                deletevehicle _attachedobj;
            } forEach ropeAttachedObjects _vehicle;
            _helper = "land_Can_V2_F" createvehicle position _player;
            {
                [_helper, [0, 0, 0], [0, 0, -1]] ropeAttachto _x;
                _helper attachto [_player, [-0.1, 0.1, 0.15], "Pelvis"];
            } forEach (_vehicle getVariable ["SA_tow_ropes", []]);
            hideObject _helper;
            [[_helper], "SA_Hide_Object_Global"] call SA_remoteExecServer;
            _player setVariable ["SA_tow_ropes_vehicle", _vehicle, true];
            _player setVariable ["SA_tow_ropes_pick_Up_Helper", _helper, true];
        } else {
            [_this, "SA_pickup_tow_ropes", _vehicle, true] call SA_remoteExec;
        };
    };
    
    SA_drop_tow_ropes = {
        params ["_vehicle", "_player"];
        if (local _vehicle) then {
            private ["_helper"];
            _helper = (_player getVariable ["SA_tow_ropes_pick_Up_Helper", objNull]);
            if (!isNull _helper) then {
                {
                    _helper ropeDetach _x;
                } forEach (_vehicle getVariable ["SA_tow_ropes", []]);
                detach _helper;
                deletevehicle _helper;
            };
            _player setVariable ["SA_tow_ropes_vehicle", nil, true];
            _player setVariable ["SA_tow_ropes_pick_Up_Helper", nil, true];
        } else {
            [_this, "SA_drop_tow_ropes", _vehicle, true] call SA_remoteExec;
        };
    };
    
    SA_Put_Away_tow_ropes = {
        params ["_vehicle", "_player"];
        if (local _vehicle) then {
            private ["_existingtowropes", "_hitchPoint", "_rope"];
            _existingtowropes = _vehicle getVariable ["SA_tow_ropes", []];
            if (count _existingtowropes > 0) then {
                _this call SA_pickup_tow_ropes;
                _this call SA_drop_tow_ropes;
                {
                    ropeDestroy _x;
                } forEach _existingtowropes;
                _vehicle setVariable ["SA_tow_ropes", nil, true];
            };
        } else {
            [_this, "SA_Put_Away_tow_ropes", _vehicle, true] call SA_remoteExec;
        };
    };
    
    SA_Attach_tow_ropes_action = {
        private ["_vehicle", "_cargo", "_canBetowed"];
        _cargo = cursortarget;
        _vehicle = player getVariable ["SA_tow_ropes_vehicle", objNull];
        if ([_vehicle, _cargo] call SA_Can_Attach_tow_ropes) then {
            _canBetowed = true;
            
            if!(missionnamespace getVariable ["SA_toW_locked_vehicles_ENABLED", false]) then {
                if (locked _cargo > 1) then {
                    ["Cannot attach tow ropes to locked vehicle", false] call SA_hint;
                    _canBetowed = false;
                };
            };
            
            if!(missionnamespace getVariable ["SA_toW_in_EXILE_SAFEZONE_ENABLED", false]) then {
                if (!isnil "ExileplayerinSafezone") then {
                    if (ExileplayerinSafezone) then {
                        ["Cannot attach tow ropes in safe zone", false] call SA_hint;
                        _canBetowed = false;
                    };
                };
            };
            
            if (_canBetowed) then {
                [_cargo, player] call SA_Attach_tow_ropes;
            };
        };
    };
    
    SA_Attach_tow_ropes_action_Check = {
        private ["_vehicle", "_cargo"];
        _vehicle = player getVariable ["SA_tow_ropes_vehicle", objNull];
        _cargo = cursortarget;
        [_vehicle, _cargo] call SA_Can_Attach_tow_ropes;
    };
    
    SA_Can_Attach_tow_ropes = {
        params ["_vehicle", "_cargo"];
        if (!isNull _vehicle && !isNull _cargo) then {
            [_vehicle, _cargo] call SA_Is_Supported_Cargo && vehicle player == player && player distance _cargo < 10 && _vehicle != _cargo;
        } else {
            false;
        };
    };
    
    SA_Take_tow_ropes_action = {
        private ["_vehicle", "_canTaketowropes"];
        _vehicle = cursortarget;
        if ([_vehicle] call SA_Can_Take_tow_ropes) then {
            _canTaketowropes = true;
            
            if!(missionnamespace getVariable ["SA_toW_locked_vehicles_ENABLED", false]) then {
                if (locked _vehicle > 1) then {
                    ["Cannot take tow ropes from locked vehicle", false] call SA_hint;
                    _canTaketowropes = false;
                };
            };
            
            if!(missionnamespace getVariable ["SA_toW_in_EXILE_SAFEZONE_ENABLED", false]) then {
                if (!isnil "ExileplayerinSafezone") then {
                    if (ExileplayerinSafezone) then {
                        ["Cannot take tow ropes in safe zone", false] call SA_hint;
                        _canTaketowropes = false;
                    };
                };
            };
            
            if (_canTaketowropes) then {
                [_vehicle, player] call SA_Take_tow_ropes;
            };
        };
    };
    
    SA_Take_tow_ropes_action_Check = {
        [cursortarget] call SA_Can_Take_tow_ropes;
    };
    
    SA_Can_Take_tow_ropes = {
        params ["_vehicle"];
        if ([_vehicle] call SA_Is_Supported_vehicle) then {
            private ["_existingvehicle", "_existingtowropes"];
            _existingtowropes = _vehicle getVariable ["SA_tow_ropes", []];
            _existingvehicle = player getVariable ["SA_tow_ropes_vehicle", objNull];
            vehicle player == player && player distance _vehicle < 10 && (count _existingtowropes) == 0 && isNull _existingvehicle;
        } else {
            false;
        };
    };
    
    SA_Put_Away_tow_ropes_action = {
        private ["_vehicle", "_canPutAwaytowropes"];
        _vehicle = cursortarget;
        if ([_vehicle] call SA_Can_Put_Away_tow_ropes) then {
            _canPutAwaytowropes = true;
            
            if!(missionnamespace getVariable ["SA_toW_locked_vehicles_ENABLED", false]) then {
                if (locked _vehicle > 1) then {
                    ["Cannot put away tow ropes in locked vehicle", false] call SA_hint;
                    _canPutAwaytowropes = false;
                };
            };
            
            if!(missionnamespace getVariable ["SA_toW_in_EXILE_SAFEZONE_ENABLED", false]) then {
                if (!isnil "ExileplayerinSafezone") then {
                    if (ExileplayerinSafezone) then {
                        ["Cannot put away tow ropes in safe zone", false] call SA_hint;
                        _canPutAwaytowropes = false;
                    };
                };
            };
            
            if (_canPutAwaytowropes) then {
                [_vehicle, player] call SA_Put_Away_tow_ropes;
            };
        };
    };
    
    SA_Put_Away_tow_ropes_action_Check = {
        [cursortarget] call SA_Can_Put_Away_tow_ropes;
    };
    
    SA_Can_Put_Away_tow_ropes = {
        params ["_vehicle"];
        private ["_existingtowropes"];
        if ([_vehicle] call SA_Is_Supported_vehicle) then {
            _existingtowropes = _vehicle getVariable ["SA_tow_ropes", []];
            vehicle player == player && player distance _vehicle < 10 && (count _existingtowropes) > 0;
        } else {
            false;
        };
    };
    
    SA_drop_tow_ropes_action = {
        private ["_vehicle"];
        _vehicle = player getVariable ["SA_tow_ropes_vehicle", objNull];
        if ([] call SA_Can_drop_tow_ropes) then {
            [_vehicle, player] call SA_drop_tow_ropes;
        };
    };
    
    SA_drop_tow_ropes_action_Check = {
        [] call SA_Can_drop_tow_ropes;
    };
    
    SA_Can_drop_tow_ropes = {
        !isNull (player getVariable ["SA_tow_ropes_vehicle", objNull]) && vehicle player == player;
    };
    
    SA_pickup_tow_ropes_action = {
        private ["_nearbytowvehicles", "_canpickuptowropes", "_vehicle"];
        _nearbytowvehicles = missionnamespace getVariable ["SA_Nearby_tow_vehicles", []];
        if ([] call SA_Can_pickup_tow_ropes) then {
            _vehicle = _nearbytowvehicles select 0;
            _canpickuptowropes = true;
            
            if!(missionnamespace getVariable ["SA_toW_locked_vehicles_ENABLED", false]) then {
                if (locked _vehicle > 1) then {
                    ["Cannot pick up tow ropes from locked vehicle", false] call SA_hint;
                    _canpickuptowropes = false;
                };
            };
            
            if!(missionnamespace getVariable ["SA_toW_in_EXILE_SAFEZONE_ENABLED", false]) then {
                if (!isnil "ExileplayerinSafezone") then {
                    if (ExileplayerinSafezone) then {
                        ["Cannot pick up tow ropes in safe zone", false] call SA_hint;
                        _canpickuptowropes = false;
                    };
                };
            };
            
            if (_canpickuptowropes) then {
                [_nearbytowvehicles select 0, player] call SA_pickup_tow_ropes;
            };
        };
    };
    
    SA_pickup_tow_ropes_action_Check = {
        [] call SA_Can_pickup_tow_ropes;
    };
    
    SA_Can_pickup_tow_ropes = {
        isNull (player getVariable ["SA_tow_ropes_vehicle", objNull]) && count (missionnamespace getVariable ["SA_Nearby_tow_vehicles", []]) > 0 && vehicle player == player;
    };
    
    SA_toW_SUPPorTED_vehicles = [
        "tank", "Car", "Ship"
    ];
    
    SA_Is_Supported_vehicle = {
        params ["_vehicle", "_isSupported"];
        _isSupported = false;
        if (not isNull _vehicle) then {
            {
                if (_vehicle isKindOf _x) then {
                    _isSupported = true;
                };
            } forEach (missionnamespace getVariable ["SA_toW_SUPPorTED_vehicles_OVERRIDE", SA_toW_SUPPorTED_vehicles]);
        };
        _isSupported;
    };
    
    SA_toW_RULES = [
        ["tank", "CAN_toW", "tank"],
        ["tank", "CAN_toW", "Car"],
        ["tank", "CAN_toW", "Ship"],
        ["tank", "CAN_toW", "Air"],
        ["Car", "CAN_toW", "tank"],
        ["Car", "CAN_toW", "Car"],
        ["Car", "CAN_toW", "Ship"],
        ["Car", "CAN_toW", "Air"],
        ["Ship", "CAN_toW", "Ship"]
    ];
    
    SA_Is_Supported_Cargo = {
        params ["_vehicle", "_cargo"];
        private ["_cantow"];
        _cantow = false;
        if (not isNull _vehicle && not isNull _cargo) then {
            {
                if (_vehicle isKindOf (_x select 0)) then {
                    if (_cargo isKindOf (_x select 2)) then {
                        if ((toUpper (_x select 1)) == "CAN_toW") then {
                            _cantow = true;
                        } else {
                            _cantow = false;
                        };
                    };
                };
            } forEach (missionnamespace getVariable ["SA_toW_RULES_OVERRIDE", SA_toW_RULES]);
        };
        _cantow;
    };
    
    SA_hint = {
        params ["_msg", ["_isSuccess", true]];
        if (!isnil "ExileClient_gui_notification_event_addnotification") then {
            if (_isSuccess) then {
                ["Success", [_msg]] call ExileClient_gui_notification_event_addnotification;
            } else {
                ["Whoops", [_msg]] call ExileClient_gui_notification_event_addnotification;
            };
        } else {
            hint _msg;
        };
    };
    
    SA_Hide_Object_Global = {
        params ["_obj"];
        if (_obj isKindOf "land_Can_V2_F") then {
            hideObjectglobal _obj;
        };
    };
    
    SA_set_owner = {
        params ["_obj", "_client"];
        _obj setowner _client;
    };
    
    SA_Add_player_tow_actions = {
        player addAction ["Deploy tow ropes", {
            [] call SA_Take_tow_ropes_action;
        }, nil, 0, false, true, "", "call SA_Take_tow_ropes_action_Check"];
        
        player addAction ["Put Away tow ropes", {
            [] call SA_Put_Away_tow_ropes_action;
        }, nil, 0, false, true, "", "call SA_Put_Away_tow_ropes_action_Check"];
        
        player addAction ["Attach to tow ropes", {
            [] call SA_Attach_tow_ropes_action;
        }, nil, 0, false, true, "", "call SA_Attach_tow_ropes_action_Check"];
        
        player addAction ["drop tow ropes", {
            [] call SA_drop_tow_ropes_action;
        }, nil, 0, false, true, "", "call SA_drop_tow_ropes_action_Check"];
        
        player addAction ["pickup tow ropes", {
            [] call SA_pickup_tow_ropes_action;
        }, nil, 0, false, true, "", "call SA_pickup_tow_ropes_action_Check"];
        
        player addEventHandler ["Respawn", {
            player setVariable ["SA_tow_actions_loaded", false];
        }];
    };
    
    SA_find_Nearby_tow_vehicles = {
        private ["_nearvehicles", "_nearvehicleswithtowropes", "_vehicle", "_ends", "_end1", "_end2"];
        _nearvehicles = [];
        {
            _nearvehicles append (position player nearObjects [_x, 30]);
        } forEach (missionnamespace getVariable ["SA_toW_SUPPorTED_vehicles_OVERRIDE", SA_toW_SUPPorTED_vehicles]);
        _nearvehicleswithtowropes = [];
        {
            _vehicle = _x;
            {
                _ends = ropeEndPosition _x;
                if (count _ends == 2) then {
                    _end1 = _ends select 0;
                    _end2 = _ends select 1;
                    if (((position player) distance _end1) < 5 || ((position player) distance _end2) < 5) then {
                        _nearvehicleswithtowropes pushBack _vehicle;
                    }
                };
            } forEach (_vehicle getVariable ["SA_tow_ropes", []]);
        } forEach _nearvehicles;
        _nearvehicleswithtowropes;
    };
    
    if (!isDedicated) then {
        [] spawn {
            while {true} do {
                if (!isNull player && isplayer player) then {
                    if!(player getVariable ["SA_tow_actions_loaded", false]) then {
                        [] call SA_Add_player_tow_actions;
                        player setVariable ["SA_tow_actions_loaded", true];
                    };
                };
                missionnamespace setVariable ["SA_Nearby_tow_vehicles", (call SA_find_Nearby_tow_vehicles)];
                sleep 2;
            };
        };
    };
    
    SA_remoteExec = {
        params ["_params", "_functionname", "_target", ["_iscall", false]];
        if (!isnil "ExileClient_system_network_send") then {
            ["AdvancedtowingremoteExecClient", [_params, _functionname, _target, _iscall]] call ExileClient_system_network_send;
        } else {
            if (_iscall) then {
                _params remoteExecCall [_functionname, _target];
            } else {
                _params remoteExec [_functionname, _target];
            };
        };
    };
    
    SA_remoteExecServer = {
        params ["_params", "_functionname", ["_iscall", false]];
        if (!isnil "ExileClient_system_network_send") then {
            ["AdvancedtowingremoteExecServer", [_params, _functionname, _iscall]] call ExileClient_system_network_send;
        } else {
            if (_iscall) then {
                _params remoteExecCall [_functionname, 2];
            } else {
                _params remoteExec [_functionname, 2];
            };
        };
    };
    
    if (isServer) then {
        // Adds support for exile network calls (Only used when running exile) //
        
        SA_SUPPorTED_remoteExecSERVER_FUNCTIONS = ["SA_set_owner", "SA_Hide_Object_Global"];
        
        ExileServer_Advancedtowing_network_AdvancedtowingremoteExecServer = {
            params ["_sessionId", "_messageparameters", ["_iscall", false]];
            _messageparameters params ["_params", "_functionname"];
            if (_functionname in SA_SUPPorTED_remoteExecSERVER_FUNCTIONS) then {
                if (_iscall) then {
                    _params call (missionnamespace getVariable [_functionname, {}]);
                } else {
                    _params spawn (missionnamespace getVariable [_functionname, {}]);
                };
            };
        };
        
        SA_SUPPorTED_remoteExecCLIENT_FUNCTIONS = ["SA_Simulate_towing", "SA_Attach_tow_ropes", "SA_Take_tow_ropes", "SA_Put_Away_tow_ropes", "SA_pickup_tow_ropes", "SA_drop_tow_ropes", "SA_hint"];
        
        ExileServer_Advancedtowing_network_AdvancedtowingremoteExecClient = {
            params ["_sessionId", "_messageparameters"];
            _messageparameters params ["_params", "_functionname", "_target", ["_iscall", false]];
            if (_functionname in SA_SUPPorTED_remoteExecCLIENT_FUNCTIONS) then {
                if (_iscall) then {
                    _params remoteExecCall [_functionname, _target];
                } else {
                    _params remoteExec [_functionname, _target];
                };
            };
        };
        
        // install Advanced towing on all clients (plus JIP) //
        
        publicVariable "SA_Advanced_towing_install";
        remoteExecCall ["SA_Advanced_towing_install", -2, true];
    };
    
    diag_log "Advanced towing loaded";
};

if (isServer) then {
    [] call SA_Advanced_towing_install;
};