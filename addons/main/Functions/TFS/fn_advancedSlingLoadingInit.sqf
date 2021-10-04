/*
The MIT License (MIT)

Copyright (c) 2016 seth Duda

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", withOUT WARRANTY OF ANY KinD, expRESS or IMPLIED, inCLUDinG BUT not LIMITED to THE WARRANTIES OF MERCHANTABILITY, FITNESS for A PARTICULAR PURPOSE and NONinFRinGEMENT. in NO EVENT SHALL THE AUTHORS or COPYRIGHT HOLDERS BE LIABLE for ANY CLAIM, damageS or OTHER LIABILITY, WHETHER in AN action OF CONTRACT, torT or OTHERWISE, ARIsinG from, OUT OF or in CONNECTION with THE SOFTWARE or THE USE or OTHER DEALinGS in THE SOFTWARE.
*/

ASL_Advanced_Sling_loading_install = {
    // Prevent advanced sling loading from installing twice
    if (!isnil "ASL_ROPE_inIT") exitwith {};
    ASL_ROPE_inIT = true;
    
    diag_log "Advanced Sling loading loading...";
    
    ASL_Rope_Get_Lift_Capability = {
        params ["_vehicle"];
        private ["_slingloadmaxCargoMass"];
        _slingloadmaxCargoMass = getNumber (configFile >> "Cfgvehicles" >> typeOf _vehicle >> "slingloadmaxCargoMass");
        if (_slingloadmaxCargoMass <= 0) then {
            _slingloadmaxCargoMass = 4000;
        };
        _slingloadmaxCargoMass;
    };
    
    ASL_SLinG_load_POinT_CLASS_HEIGHT_OFFset = [
        ["All", [-0.05, -0.05, -0.05]],
        ["CUP_CH47F_base", [-0.05, -2, -0.05]],
        ["CUP_AW159_Unarmed_Base", [-0.05, -0.06, -0.05]],
        ["RHS_CH_47F", [-0.75, -2.6, -0.75]],
        ["rhsusf_CH53E_USMC", [-0.8, -1, -1.1]],
        ["rhsusf_CH53E_USMC_D", [-0.8, -1, -1.1]]
    ];
    
    ASL_Get_Sling_load_Points = {
        params ["_vehicle"];
        private ["_slingloadPointsArray", "_cornerPoints", "_rearCenterPoint", "_vehicleUnitvectorUp"];
        private ["_slingloadPoints", "_modelPoint", "_modelPointASL", "_surfaceintersectStartASL", "_surfaceintersectEndASL", "_surfaces", "_intersectionASL", "_intersectionObject"];
        _slingloadPointsArray = [];
        _cornerPoints = [_vehicle] call ASL_Get_Corner_Points;
        _frontCenterPoint = (((_cornerPoints select 2) vectorDiff (_cornerPoints select 3)) vectorMultiply 0.5) vectorAdd (_cornerPoints select 3);
        _rearCenterPoint = (((_cornerPoints select 0) vectorDiff (_cornerPoints select 1)) vectorMultiply 0.5) vectorAdd (_cornerPoints select 1);
        _rearCenterPoint = ((_frontCenterPoint vectorDiff _rearCenterPoint) vectorMultiply 0.2) vectorAdd _rearCenterPoint;
        _frontCenterPoint = ((_rearCenterPoint vectorDiff _frontCenterPoint) vectorMultiply 0.2) vectorAdd _frontCenterPoint;
        _middleCenterPoint = ((_frontCenterPoint vectorDiff _rearCenterPoint) vectorMultiply 0.5) vectorAdd _rearCenterPoint;
        _vehicleUnitvectorUp = vectorNormalized (vectorUp _vehicle);
        
        _slingloadPointHeightoffset = 0;
        {
            if (_vehicle isKindOf (_x select 0)) then {
                _slingloadPointHeightoffset = (_x select 1);
            };
        } forEach ASL_SLinG_load_POinT_CLASS_HEIGHT_OFFset;
        
        _slingloadPoints = [];
        {
            _modelPoint = _x;
            _modelPointASL = AGLtoASL (_vehicle modeltoWorldVisual _modelPoint);
            _surfaceintersectStartASL = _modelPointASL vectorAdd (_vehicleUnitvectorUp vectorMultiply -5);
            _surfaceintersectEndASL = _modelPointASL vectorAdd (_vehicleUnitvectorUp vectorMultiply 5);
            
            // Determine if the surface intersection line crosses below ground level
            // if if does, move surfaceintersectStartASL above ground level (lineIntersectsSurfaces
            // doesn't work if starting below ground level for some reason
            // See: https://en.wikipedia.org/wiki/Line%E2%80%93plane_intersection
            
            _la = ASLtoAGL _surfaceintersectStartASL;
            _lb = ASLtoAGL _surfaceintersectEndASL;
            
            if (_la select 2 < 0 && _lb select 2 > 0) then {
                _n = [0, 0, 1];
                _p0 = [0, 0, 0.1];
                _l = (_la vectorFromTo _lb);
                if ((_l vectorDotProduct _n) != 0) then {
                    _d = (( _p0 vectorAdd ( _la vectorMultiply -1 ) ) vectorDotProduct _n ) / (_l vectorDotProduct _n);
                    _surfaceintersectStartASL = AGLtoASL ((_l vectorMultiply _d) vectorAdd _la);
                };
            };
            
            _surfaces = lineIntersectsSurfaces [_surfaceintersectStartASL, _surfaceintersectEndASL, objNull, objNull, true, 100];
            _intersectionASL = [];
            {
                _intersectionObject = _x select 2;
                if (_intersectionObject == _vehicle) exitwith {
                    _intersectionASL = _x select 0;
                };
            } forEach _surfaces;
            if (count _intersectionASL > 0) then {
                _intersectionASL = _intersectionASL vectorAdd (( _surfaceintersectStartASL vectorFromTo _surfaceintersectEndASL ) vectorMultiply (_slingloadPointHeightoffset select (count _slingloadPoints)));
                _slingloadPoints pushBack (_vehicle worldToModelVisual (ASLtoAGL _intersectionASL));
            } else {
                _slingloadPoints pushBack [];
            };
        } forEach [_frontCenterPoint, _middleCenterPoint, _rearCenterPoint];
        
        if (count (_slingloadPoints select 1) > 0) then {
            _slingloadPointsArray pushBack [_slingloadPoints select 1];
            if (count (_slingloadPoints select 0) > 0 && count (_slingloadPoints select 2) > 0) then {
                if (((_slingloadPoints select 0) distance (_slingloadPoints select 2)) > 3) then {
                    _slingloadPointsArray pushBack [_slingloadPoints select 0, _slingloadPoints select 2];
                    if (((_slingloadPoints select 0) distance (_slingloadPoints select 1)) > 3) then {
                        _slingloadPointsArray pushBack [_slingloadPoints select 0, _slingloadPoints select 1, _slingloadPoints select 2];
                    };
                };
            };
        };
        _slingloadPointsArray;
    };
    
    ASL_Rope_set_Mass = {
        private ["_obj", "_mass"];
        _obj = [_this, 0] call BIS_fnc_param;
        _mass = [_this, 1] call BIS_fnc_param;
        _obj setMass _mass;
    };
    
    ASL_Rope_Adjust_Mass = {
        params ["_obj", "_heli", ["_ropes", []]];
        private ["_mass", "_lift", "_originalMass", "_heavyLiftminLift"];
        _lift = [_heli] call ASL_Rope_Get_Lift_Capability;
        _originalMass = getMass _obj;
        _heavyLiftminLift = missionnamespace getVariable ["ASL_HEAVY_LifTinG_min_LifT_OVERRIDE", 5000];
        if (_originalMass >= ((_lift)*0.8) && _lift >= _heavyLiftminLift) then {
            private ["_originalMassset", "_ends", "_enddistance", "_ropeLength"];
            _originalMassset = (getMass _obj) == _originalMass;
            while {_obj in (ropeAttachedObjects _heli) && _originalMassset} do {
                {
                    _ends = ropeEndPosition _x;
                    _enddistance = (_ends select 0) distance (_ends select 1);
                    _ropeLength = ropeLength _x;
                    if ((_ropeLength - 2) <= _enddistance && ((position _heli) select 2) > 0) then {
                        [[_obj, ((_lift)*0.8)], "ASL_Rope_set_Mass", _obj, true] call ASL_remoteExec;
                        _originalMassset = false;
                    };
                } forEach _ropes;
                sleep 0.1;
            };
            while {_obj in (ropeAttachedObjects _heli)} do {
                sleep 0.5;
            };
            [[_obj, _originalMass], "ASL_Rope_set_Mass", _obj, true] call ASL_remoteExec;
        };
    };
    
    /*
    Constructs an array of all active rope indexes and position labels (e.g. [[rope index, "Front"], [rope index, "Rear"]])
    for a specified vehicle
    */
    ASL_Get_Active_ropes = {
        params ["_vehicle"];
        private ["_activeropes", "_existingropes", "_ropeLabelsets", "_ropeindex", "_totalExistingropes", "_ropeLabels"];
        _activeropes = [];
        _existingropes = _vehicle getVariable ["ASL_ropes", []];
        _ropeLabelsets = [["Center"], ["Front", "Rear"], ["Front", "Center", "Rear"]];
        _ropeindex = 0;
        _totalExistingropes = count _existingropes;
        {
            if (count _x > 0) then {
                _ropeLabels = _ropeLabelsets select (_totalExistingropes - 1);
                _activeropes pushBack [_ropeindex, _ropeLabels select _ropeindex];
            };
            _ropeindex = _ropeindex + 1;
        } forEach _existingropes;
        _activeropes;
    };
    
    /*
    Constructs an array of all inactive rope indexes and position labels (e.g. [[rope index, "Front"], [rope index, "Rear"]])
    for a specified vehicle
    */
    ASL_Get_inactive_ropes = {
        params ["_vehicle"];
        private ["_inactiveropes", "_existingropes", "_ropeLabelsets", "_ropeindex", "_totalExistingropes", "_ropeLabels"];
        _inactiveropes = [];
        _existingropes = _vehicle getVariable ["ASL_ropes", []];
        _ropeLabelsets = [["Center"], ["Front", "Rear"], ["Front", "Center", "Rear"]];
        _ropeindex = 0;
        _totalExistingropes = count _existingropes;
        {
            if (count _x == 0) then {
                _ropeLabels = _ropeLabelsets select (_totalExistingropes - 1);
                _inactiveropes pushBack [_ropeindex, _ropeLabels select _ropeindex];
            };
            _ropeindex = _ropeindex + 1;
        } forEach _existingropes;
        _inactiveropes;
    };
    
    ASL_Get_Active_ropes_with_Cargo = {
        params ["_vehicle"];
        private ["_activeropeswithCargo", "_existingCargo", "_activeropes", "_cargo"];
        _activeropeswithCargo = [];
        _existingCargo = _vehicle getVariable ["ASL_Cargo", []];
        _activeropes = _this call ASL_Get_Active_ropes;
        {
            _cargo = _existingCargo select (_x select 0);
            if (!isNull _cargo) then {
                _activeropeswithCargo pushBack _x;
            };
        } forEach _activeropes;
        _activeropeswithCargo;
    };
    
    ASL_Get_Active_ropes_without_Cargo = {
        params ["_vehicle"];
        private ["_activeropeswithoutCargo", "_existingCargo", "_activeropes", "_cargo"];
        _activeropeswithoutCargo = [];
        _existingCargo = _vehicle getVariable ["ASL_Cargo", []];
        _activeropes = _this call ASL_Get_Active_ropes;
        {
            _cargo = _existingCargo select (_x select 0);
            if (isNull _cargo) then {
                _activeropeswithoutCargo pushBack _x;
            };
        } forEach _activeropes;
        _activeropeswithoutCargo;
    };
    
    ASL_Get_ropes = {
        params ["_vehicle", "_ropeindex"];
        private ["_allropes", "_selectedropes"];
        _selectedropes = [];
        _allropes = _vehicle getVariable ["ASL_ropes", []];
        if (count _allropes > _ropeindex) then {
            _selectedropes = _allropes select _ropeindex;
        };
        _selectedropes;
    };
    
    ASL_Get_ropes_count = {
        params ["_vehicle"];
        count (_vehicle getVariable ["ASL_ropes", []]);
    };
    
    ASL_Get_Cargo = {
        params ["_vehicle", "_ropeindex"];
        private ["_allCargo", "_selectedCargo"];
        _selectedCargo = objNull;
        _allCargo = _vehicle getVariable ["ASL_Cargo", []];
        if (count _allCargo > _ropeindex) then {
            _selectedCargo = _allCargo select _ropeindex;
        };
        _selectedCargo;
    };
    
    ASL_Get_ropes_and_Cargo = {
        params ["_vehicle", "_ropeindex"];
        private ["_selectedCargo", "_selectedropes"];
        _selectedCargo = (_this call ASL_Get_Cargo);
        _selectedropes = (_this call ASL_Get_ropes);
        [_selectedropes, _selectedCargo];
    };
    
    ASL_Show_select_ropes_Menu = {
        params ["_title", "_functionname", "_ropesindexandLabelArray", ["_ropesLabel", "ropes"]];
        ASL_Show_select_ropes_Menu_Array = [[_title, false]];
        {
            ASL_Show_select_ropes_Menu_Array pushBack [ (_x select 1) + " " + _ropesLabel, [0], "", -5, [["expression", "["+(str (_x select 0))+"] call " + _functionname]], "1", "1"];
        } forEach _ropesindexandLabelArray;
        ASL_Show_select_ropes_Menu_Array pushBack ["All " + _ropesLabel, [0], "", -5, [["expression", "{
            [_x] call " + _functionname + "
        } forEach [0, 1, 2];
    "]], "1", "1"];
    showCommandingMenu "";
    showCommandingMenu "#USER:ASL_Show_select_ropes_Menu_Array";
};

ASL_Extend_ropes = {
    params ["_vehicle", "_player", ["_ropeindex", 0]];
    if (local _vehicle) then {
        private ["_existingropes"];
        _existingropes = [_vehicle, _ropeindex] call ASL_Get_ropes;
        if (count _existingropes > 0) then {
            _ropeLength = ropeLength (_existingropes select 0);
            if (_ropeLength <= 100) then {
                {
                    ropeUnwind [_x, 3, 5, true];
                } forEach _existingropes;
            };
        };
    } else {
        [_this, "ASL_Extend_ropes", _vehicle, true] call ASL_remoteExec;
    };
};

ASL_Extend_ropes_action = {
    private ["_vehicle"];
    _vehicle = vehicle player;
    if ([_vehicle] call ASL_Can_Extend_ropes) then {
        private ["_activeropes"];
        _activeropes = [_vehicle] call ASL_Get_Active_ropes;
        if (count _activeropes > 1) then {
            player setVariable ["ASL_Extend_index_vehicle", _vehicle];
            ["Extend Cargo ropes", "ASL_Extend_ropes_index_action", _activeropes] call ASL_Show_select_ropes_Menu;
        } else {
            if (count _activeropes == 1) then {
                [_vehicle, player, (_activeropes select 0) select 0] call ASL_Extend_ropes;
            };
        };
    };
};

ASL_Extend_ropes_index_action = {
    params ["_ropeindex"];
    private ["_vehicle", "_candeployropes"];
    _vehicle = player getVariable ["ASL_Extend_index_vehicle", objNull];
    if (_ropeindex >= 0 && !isNull _vehicle && [_vehicle] call ASL_Can_Extend_ropes) then {
        [_vehicle, player, _ropeindex] call ASL_Extend_ropes;
    };
};

ASL_Extend_ropes_action_Check = {
    if (vehicle player == player) exitwith {
        false
    };
    [vehicle player] call ASL_Can_Extend_ropes;
};

ASL_Can_Extend_ropes = {
    params ["_vehicle"];
    private ["_existingropes", "_activeropes"];
    if (player distance _vehicle > 10) exitwith {
        false
    };
    if!([_vehicle] call ASL_Is_Supported_vehicle) exitwith {
        false
    };
    _existingropes = _vehicle getVariable ["ASL_ropes", []];
    if ((count _existingropes) == 0) exitwith {
        false
    };
    _activeropes = [_vehicle] call ASL_Get_Active_ropes;
    if ((count _activeropes) == 0) exitwith {
        false
    };
    true;
};

ASL_Shorten_ropes = {
    params ["_vehicle", "_player", ["_ropeindex", 0]];
    if (local _vehicle) then {
        private ["_existingropes"];
        _existingropes = [_vehicle, _ropeindex] call ASL_Get_ropes;
        if (count _existingropes > 0) then {
            _ropeLength = ropeLength (_existingropes select 0);
            if (_ropeLength <= 2) then {
                _this call ASL_Release_Cargo;
            } else {
                {
                    if (_ropeLength >= 10) then {
                        ropeUnwind [_x, 3, -5, true];
                    } else {
                        ropeUnwind [_x, 3, -1, true];
                    };
                } forEach _existingropes;
            };
        };
    } else {
        [_this, "ASL_Shorten_ropes", _vehicle, true] call ASL_remoteExec;
    };
};

ASL_Shorten_ropes_action = {
    private ["_vehicle"];
    _vehicle = vehicle player;
    if ([_vehicle] call ASL_Can_Shorten_ropes) then {
        private ["_activeropes"];
        _activeropes = [_vehicle] call ASL_Get_Active_ropes;
        if (count _activeropes > 1) then {
            player setVariable ["ASL_Shorten_index_vehicle", _vehicle];
            ["Shorten Cargo ropes", "ASL_Shorten_ropes_index_action", _activeropes] call ASL_Show_select_ropes_Menu;
        } else {
            if (count _activeropes == 1) then {
                [_vehicle, player, (_activeropes select 0) select 0] call ASL_Shorten_ropes;
            };
        };
    };
};

ASL_Shorten_ropes_index_action = {
    params ["_ropeindex"];
    private ["_vehicle"];
    _vehicle = player getVariable ["ASL_Shorten_index_vehicle", objNull];
    if (_ropeindex >= 0 && !isNull _vehicle && [_vehicle] call ASL_Can_Shorten_ropes) then {
        [_vehicle, player, _ropeindex] call ASL_Shorten_ropes;
    };
};

ASL_Shorten_ropes_action_Check = {
    if (vehicle player == player) exitwith {
        false
    };
    [vehicle player] call ASL_Can_Shorten_ropes;
};

ASL_Can_Shorten_ropes = {
    params ["_vehicle"];
    private ["_existingropes", "_activeropes"];
    if (player distance _vehicle > 10) exitwith {
        false
    };
    if!([_vehicle] call ASL_Is_Supported_vehicle) exitwith {
        false
    };
    _existingropes = _vehicle getVariable ["ASL_ropes", []];
    if ((count _existingropes) == 0) exitwith {
        false
    };
    _activeropes = [_vehicle] call ASL_Get_Active_ropes;
    if ((count _activeropes) == 0) exitwith {
        false
    };
    true;
};

ASL_Release_Cargo = {
    params ["_vehicle", "_player", ["_ropeindex", 0]];
    if (local _vehicle) then {
        private ["_existingropesandCargo", "_existingropes", "_existingCargo", "_allCargo"];
        _existingropesandCargo = [_vehicle, _ropeindex] call ASL_Get_ropes_and_Cargo;
        _existingropes = _existingropesandCargo select 0;
        _existingCargo = _existingropesandCargo select 1;
        {
            _existingCargo ropeDetach _x;
        } forEach _existingropes;
        _allCargo = _vehicle getVariable ["ASL_Cargo", []];
        _allCargo set [_ropeindex, objNull];
        _vehicle setVariable ["ASL_Cargo", _allCargo, true];
        _this call ASL_Retract_ropes;
    } else {
        [_this, "ASL_Release_Cargo", _vehicle, true] call ASL_remoteExec;
    };
};

ASL_Release_Cargo_action = {
    private ["_vehicle"];
    _vehicle = vehicle player;
    if ([_vehicle] call ASL_Can_Release_Cargo) then {
        private ["_activeropes"];
        _activeropes = [_vehicle] call ASL_Get_Active_ropes_with_Cargo;
        if (count _activeropes > 1) then {
            player setVariable ["ASL_Release_Cargo_index_vehicle", _vehicle];
            ["Release Cargo", "ASL_Release_Cargo_index_action", _activeropes, "Cargo"] call ASL_Show_select_ropes_Menu;
        } else {
            if (count _activeropes == 1) then {
                [_vehicle, player, (_activeropes select 0) select 0] call ASL_Release_Cargo;
            };
        };
    };
};

ASL_Release_Cargo_index_action = {
    params ["_ropesindex"];
    private ["_vehicle"];
    _vehicle = player getVariable ["ASL_Release_Cargo_index_vehicle", objNull];
    if (_ropesindex >= 0 && !isNull _vehicle && [_vehicle] call ASL_Can_Release_Cargo) then {
        [_vehicle, player, _ropesindex] call ASL_Release_Cargo;
    };
};

ASL_Release_Cargo_action_Check = {
    if (vehicle player == player) exitwith {
        false
    };
    [vehicle player] call ASL_Can_Release_Cargo;
};

ASL_Can_Release_Cargo = {
    params ["_vehicle"];
    private ["_existingropes", "_activeropes"];
    if (player distance _vehicle > 10) exitwith {
        false
    };
    if!([_vehicle] call ASL_Is_Supported_vehicle) exitwith {
        false
    };
    _existingropes = _vehicle getVariable ["ASL_ropes", []];
    if ((count _existingropes) == 0) exitwith {
        false
    };
    _activeropes = [_vehicle] call ASL_Get_Active_ropes_with_Cargo;
    if ((count _activeropes) == 0) exitwith {
        false
    };
    true;
};

ASL_Retract_ropes = {
    params ["_vehicle", "_player", ["_ropeindex", 0]];
    if (local _vehicle) then {
        private ["_existingropesandCargo", "_existingropes", "_existingCargo", "_allropes", "_activeropes"];
        _existingropesandCargo = [_vehicle, _ropeindex] call ASL_Get_ropes_and_Cargo;
        _existingropes = _existingropesandCargo select 0;
        _existingCargo = _existingropesandCargo select 1;
        if (isNull _existingCargo) then {
            _this call ASL_drop_ropes;
            {
                [_x, _vehicle] spawn {
                    params ["_rope", "_vehicle"];
                    private ["_count"];
                    _count = 0;
                    ropeUnwind [_rope, 3, 0];
                    while {(!ropeUnwound _rope) && _count < 20} do {
                        sleep 1;
                        _count = _count + 1;
                    };
                    ropeDestroy _rope;
                };
            } forEach _existingropes;
            _allropes = _vehicle getVariable ["ASL_ropes", []];
            _allropes set [_ropeindex, []];
            _vehicle setVariable ["ASL_ropes", _allropes, true];
        };
        _activeropes = [_vehicle] call ASL_Get_Active_ropes;
        if (count _activeropes == 0) then {
            _vehicle setVariable ["ASL_ropes", nil, true];
        };
    } else {
        [_this, "ASL_Retract_ropes", _vehicle, true] call ASL_remoteExec;
    };
};

ASL_Retract_ropes_action = {
    private ["_vehicle", "_canRetractropes"];
    if (vehicle player == player) then {
        _vehicle = cursortarget;
    } else {
        _vehicle = vehicle player;
    };
    if ([_vehicle] call ASL_Can_Retract_ropes) then {
        private ["_activeropes"];
        _activeropes = [_vehicle] call ASL_Get_Active_ropes_without_Cargo;
        if (count _activeropes > 1) then {
            player setVariable ["ASL_Retract_ropes_index_vehicle", _vehicle];
            ["Retract Cargo ropes", "ASL_Retract_ropes_index_action", _activeropes] call ASL_Show_select_ropes_Menu;
        } else {
            if (count _activeropes == 1) then {
                [_vehicle, player, (_activeropes select 0) select 0] call ASL_Retract_ropes;
            };
        };
    };
};

ASL_Retract_ropes_index_action = {
    params ["_ropesindex"];
    private ["_vehicle"];
    _vehicle = player getVariable ["ASL_Retract_ropes_index_vehicle", objNull];
    if (_ropesindex >= 0 && !isNull _vehicle && [_vehicle] call ASL_Can_Retract_ropes) then {
        [_vehicle, player, _ropesindex] call ASL_Retract_ropes;
    };
};

ASL_Retract_ropes_action_Check = {
    if (vehicle player == player) then {
        [cursortarget] call ASL_Can_Retract_ropes;
    } else {
        [vehicle player] call ASL_Can_Retract_ropes;
    };
};

ASL_Can_Retract_ropes = {
    params ["_vehicle"];
    private ["_existingropes", "_activeropes"];
    if (player distance _vehicle > 30) exitwith {
        false
    };
    if!([_vehicle] call ASL_Is_Supported_vehicle) exitwith {
        false
    };
    _existingropes = _vehicle getVariable ["ASL_ropes", []];
    if ((count _existingropes) == 0) exitwith {
        false
    };
    _activeropes = [_vehicle] call ASL_Get_Active_ropes_without_Cargo;
    if ((count _activeropes) == 0) exitwith {
        false
    };
    true;
};

ASL_Deploy_ropes = {
    params ["_vehicle", "_player", ["_cargocount", 1], ["_ropeLength", 15]];
    if (local _vehicle) then {
        private ["_existingropes", "_cargoropes", "_startLength", "_slingloadPoints"];
        _slingloadPoints = [_vehicle] call ASL_Get_Sling_load_Points;
        _existingropes = _vehicle getVariable ["ASL_ropes", []];
        if (count _existingropes == 0) then {
            if (count _slingloadPoints == 0) exitwith {
                [["vehicle doesn't support cargo ropes", false], "ASL_hint", _player] call ASL_remoteExec;
            };
            if (count _slingloadPoints < _cargocount) exitwith {
                [["vehicle doesn't support " + _cargocount + " cargo ropes", false], "ASL_hint", _player] call ASL_remoteExec;
            };
            _cargoropes = [];
            _cargo = [];
            for "_i" from 0 to (_cargocount-1) do
            {
                _cargoropes pushBack [];
                _cargo pushBack objNull;
            };
            _vehicle setVariable ["ASL_ropes", _cargoropes, true];
            _vehicle setVariable ["ASL_Cargo", _cargo, true];
            for "_i" from 0 to (_cargocount-1) do
            {
                [_vehicle, _player, _i] call ASL_Deploy_ropes_index;
            };
        } else {
            [["vehicle already has cargo ropes deployed", false], "ASL_hint", _player] call ASL_remoteExec;
        };
    } else {
        [_this, "ASL_Deploy_ropes", _vehicle, true] call ASL_remoteExec;
    };
};

ASL_Deploy_ropes_index = {
    params ["_vehicle", "_player", ["_ropesindex", 0], ["_ropeLength", 15]];
    if (local _vehicle) then {
        private ["_existingropes", "_existingropescount", "_allropes"];
        _existingropes = [_vehicle, _ropesindex] call ASL_Get_ropes;
        _existingropescount = [_vehicle] call ASL_Get_ropes_count;
        if (count _existingropes == 0) then {
            _slingloadPoints = [_vehicle] call ASL_Get_Sling_load_Points;
            _cargoropes = [];
            _cargoropes pushBack ropeCreate [_vehicle, (_slingloadPoints select (_existingropescount - 1)) select _ropesindex, 0];
            _cargoropes pushBack ropeCreate [_vehicle, (_slingloadPoints select (_existingropescount - 1)) select _ropesindex, 0];
            _cargoropes pushBack ropeCreate [_vehicle, (_slingloadPoints select (_existingropescount - 1)) select _ropesindex, 0];
            _cargoropes pushBack ropeCreate [_vehicle, (_slingloadPoints select (_existingropescount - 1)) select _ropesindex, 0];
            {
                ropeUnwind [_x, 5, _ropeLength];
            } forEach _cargoropes;
            _allropes = _vehicle getVariable ["ASL_ropes", []];
            _allropes set [_ropesindex, _cargoropes];
            _vehicle setVariable ["ASL_ropes", _allropes, true];
        };
    } else {
        [_this, "ASL_Deploy_ropes_index", _vehicle, true] call ASL_remoteExec;
    };
};

ASL_Deploy_ropes_action = {
    private ["_vehicle", "_candeployropes"];
    if (vehicle player == player) then {
        _vehicle = cursortarget;
    } else {
        _vehicle = vehicle player;
    };
    if ([_vehicle] call ASL_Can_Deploy_ropes) then {
        _candeployropes = true;
        
        if!(missionnamespace getVariable ["ASL_locked_vehicles_ENABLED", false]) then {
            if (locked _vehicle > 1) then {
                ["Cannot deploy cargo ropes from locked vehicle", false] call ASL_hint;
                _candeployropes = false;
            };
        };
        
        if (_candeployropes) then {
            _inactiveropes = [_vehicle] call ASL_Get_inactive_ropes;
            
            if (count _inactiveropes > 0) then {
                if (count _inactiveropes > 1) then {
                    player setVariable ["ASL_Deploy_ropes_index_vehicle", _vehicle];
                    ["Deploy Cargo ropes", "ASL_Deploy_ropes_index_action", _inactiveropes] call ASL_Show_select_ropes_Menu;
                } else {
                    [_vehicle, player, (_inactiveropes select 0) select 0] call ASL_Deploy_ropes_index;
                };
            } else {
                _slingloadPoints = [_vehicle] call ASL_Get_Sling_load_Points;
                if (count _slingloadPoints > 1) then {
                    player setVariable ["ASL_Deploy_count_vehicle", _vehicle];
                    ASL_Deploy_ropes_count_Menu = [
                        ["Deploy ropes", false]
                    ];
                    ASL_Deploy_ropes_count_Menu pushBack ["for single Cargo", [0], "", -5, [["expression", "[1] call ASL_Deploy_ropes_count_action"]], "1", "1"];
                    if ((count _slingloadPoints) > 1) then {
                        ASL_Deploy_ropes_count_Menu pushBack ["for double Cargo", [0], "", -5, [["expression", "[2] call ASL_Deploy_ropes_count_action"]], "1", "1"];
                    };
                    if ((count _slingloadPoints) > 2) then {
                        ASL_Deploy_ropes_count_Menu pushBack ["for Triple Cargo", [0], "", -5, [["expression", "[3] call ASL_Deploy_ropes_count_action"]], "1", "1"];
                    };
                    showCommandingMenu "";
                    showCommandingMenu "#USER:ASL_Deploy_ropes_count_Menu";
                } else {
                    [_vehicle, player] call ASL_Deploy_ropes;
                };
            };
        };
    };
};

ASL_Deploy_ropes_index_action = {
    params ["_ropesindex"];
    private ["_vehicle"];
    _vehicle = player getVariable ["ASL_Deploy_ropes_index_vehicle", objNull];
    if (_ropesindex >= 0 && !isNull _vehicle && [_vehicle] call ASL_Can_Deploy_ropes) then {
        [_vehicle, player, _ropesindex] call ASL_Deploy_ropes_index;
    };
};

ASL_Deploy_ropes_count_action = {
    params ["_count"];
    private ["_vehicle", "_candeployropes"];
    _vehicle = player getVariable ["ASL_Deploy_count_vehicle", objNull];
    if (_count > 0 && !isNull _vehicle && [_vehicle] call ASL_Can_Deploy_ropes) then {
        [_vehicle, player, _count] call ASL_Deploy_ropes;
    };
};

ASL_Deploy_ropes_action_Check = {
    if (vehicle player == player) then {
        [cursortarget] call ASL_Can_Deploy_ropes;
    } else {
        [vehicle player] call ASL_Can_Deploy_ropes;
    };
};

ASL_Can_Deploy_ropes = {
    params ["_vehicle"];
    private ["_existingropes", "_activeropes"];
    if (player distance _vehicle > 10) exitwith {
        false
    };
    if!([_vehicle] call ASL_Is_Supported_vehicle) exitwith {
        false
    };
    _existingvehicle = player getVariable ["ASL_ropes_vehicle", []];
    if (count _existingvehicle > 0) exitwith {
        false
    };
    _existingropes = _vehicle getVariable ["ASL_ropes", []];
    if ((count _existingropes) == 0) exitwith {
        true
    };
    _activeropes = [_vehicle] call ASL_Get_Active_ropes;
    if ((count _existingropes) > 0 && (count _existingropes) == (count _activeropes)) exitwith {
        false
    };
    true;
};

ASL_Get_Corner_Points = {
    params ["_vehicle"];
    private ["_centerOfMass", "_bbr", "_p1", "_p2", "_rearCorner", "_rearCorner2", "_frontCorner", "_frontCorner2"];
    private ["_maxWidth", "_widthOffset", "_maxLength", "_lengthOffset", "_widthFactor", "_lengthFactor", "_maxHeight", "_heightoffset"];
    
    // Correct width and length factor for air
    _widthFactor = 0.5;
    _lengthFactor = 0.5;
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
    _maxHeight = abs ((_p2 select 2) - (_p1 select 2));
    _heightoffset = _maxHeight/6;
    
    _rearCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) - _lengthOffset, (_centerOfMass select 2)+_heightoffset];
    _rearCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) - _lengthOffset, (_centerOfMass select 2)+_heightoffset];
    _frontCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) + _lengthOffset, (_centerOfMass select 2)+_heightoffset];
    _frontCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) + _lengthOffset, (_centerOfMass select 2)+_heightoffset];
    
    [_rearCorner, _rearCorner2, _frontCorner, _frontCorner2];
};

ASL_Attach_ropes = {
    params ["_cargo", "_player"];
    _vehiclewithindex = _player getVariable ["ASL_ropes_vehicle", [objNull, 0]];
    _vehicle = _vehiclewithindex select 0;
    if (!isNull _vehicle) then {
        if (local _vehicle) then {
            private ["_ropes", "_attachmentPoints", "_objdistance", "_ropeLength", "_allCargo"];
            _ropes = [_vehicle, (_vehiclewithindex select 1)] call ASL_Get_ropes;
            if (count _ropes == 4) then {
                _attachmentPoints = [_cargo] call ASL_Get_Corner_Points;
                _ropeLength = (ropeLength (_ropes select 0));
                _objdistance = (_cargo distance _vehicle) + 2;
                if (_objdistance > _ropeLength) then {
                    [["The cargo ropes are too short. move vehicle closer.", false], "ASL_hint", _player] call ASL_remoteExec;
                } else {
                    [_vehicle, _player] call ASL_drop_ropes;
                    [_cargo, _attachmentPoints select 0, [0, 0, -1]] ropeAttachto (_ropes select 0);
                    [_cargo, _attachmentPoints select 1, [0, 0, -1]] ropeAttachto (_ropes select 1);
                    [_cargo, _attachmentPoints select 2, [0, 0, -1]] ropeAttachto (_ropes select 2);
                    [_cargo, _attachmentPoints select 3, [0, 0, -1]] ropeAttachto (_ropes select 3);
                    _allCargo = _vehicle getVariable ["ASL_Cargo", []];
                    _allCargo set [(_vehiclewithindex select 1), _cargo];
                    _vehicle setVariable ["ASL_Cargo", _allCargo, true];
                    if (missionnamespace getVariable ["ASL_HEAVY_LifTinG_ENABLED", true]) then {
                        [_cargo, _vehicle, _ropes] spawn ASL_Rope_Adjust_Mass;
                    };
                };
            };
        } else {
            [_this, "ASL_Attach_ropes", _vehicle, true] call ASL_remoteExec;
        };
    };
};

ASL_Attach_ropes_action = {
    private ["_vehicle", "_cargo", "_canBeAttached"];
    _cargo = cursortarget;
    _vehicle = (player getVariable ["ASL_ropes_vehicle", [objNull, 0]]) select 0;
    if ([_vehicle, _cargo] call ASL_Can_Attach_ropes) then {
        _canBeAttached = true;
        
        if!(missionnamespace getVariable ["ASL_locked_vehicles_ENABLED", false]) then {
            if (locked _cargo > 1) then {
                ["Cannot attach cargo ropes to locked vehicle", false] call ASL_hint;
                _canBeAttached = false;
            };
        };
        
        if!(missionnamespace getVariable ["ASL_EXILE_SAFEZONE_ENABLED", false]) then {
            if (!isnil "ExileplayerinSafezone") then {
                if (ExileplayerinSafezone) then {
                    ["Cannot attach cargo ropes in safe zone", false] call ASL_hint;
                    _canBeAttached = false;
                };
            };
        };
        
        if (_canBeAttached) then {
            [_cargo, player] call ASL_Attach_ropes;
        };
    };
};

ASL_Attach_ropes_action_Check = {
    private ["_vehiclewithindex", "_cargo"];
    _vehiclewithindex = player getVariable ["ASL_ropes_vehicle", [objNull, 0]];
    _cargo = cursortarget;
    [_vehiclewithindex select 0, _cargo] call ASL_Can_Attach_ropes;
};

ASL_Can_Attach_ropes = {
    params ["_vehicle", "_cargo"];
    if (!isNull _vehicle && !isNull _cargo) then {
        [_vehicle, _cargo] call ASL_Is_Supported_Cargo && vehicle player == player && player distance _cargo < 10 && _vehicle != _cargo;
    } else {
        false;
    };
};

ASL_drop_ropes = {
    params ["_vehicle", "_player", ["_ropesindex", 0]];
    if (local _vehicle) then {
        private ["_helper", "_existingropes"];
        _helper = (_player getVariable ["ASL_ropes_pick_Up_Helper", objNull]);
        if (!isNull _helper) then {
            _existingropes = [_vehicle, _ropesindex] call ASL_Get_ropes;
            {
                _helper ropeDetach _x;
            } forEach _existingropes;
            detach _helper;
            deletevehicle _helper;
        };
        _player setVariable ["ASL_ropes_vehicle", nil, true];
        _player setVariable ["ASL_ropes_pick_Up_Helper", nil, true];
    } else {
        [_this, "ASL_drop_ropes", _vehicle, true] call ASL_remoteExec;
    };
};

ASL_drop_ropes_action = {
    private ["_vehicleandindex"];
    if ([] call ASL_Can_drop_ropes) then {
        _vehicleandindex = player getVariable ["ASL_ropes_vehicle", []];
        if (count _vehicleandindex == 2) then {
            [_vehicleandindex select 0, player, _vehicleandindex select 1] call ASL_drop_ropes;
        };
    };
};

ASL_drop_ropes_action_Check = {
    [] call ASL_Can_drop_ropes;
};

ASL_Can_drop_ropes = {
    count (player getVariable ["ASL_ropes_vehicle", []]) > 0 && vehicle player == player;
};

ASL_Get_Closest_Rope = {
    private ["_nearbyvehicles", "_closestvehicle", "_closestropeindex", "_closestdistance"];
    private ["_vehicle", "_activeRope", "_ropes", "_ends"];
    private ["_end1", "_end2", "_minEnddistance"];
    _nearbyvehicles = missionnamespace getVariable ["ASL_Nearby_vehicles", []];
    _closestvehicle = objNull;
    _closestropeindex = 0;
    _closestdistance = -1;
    {
        _vehicle = _x;
        {
            _activeRope = _x;
            _ropes = [_vehicle, (_activeRope select 0)] call ASL_Get_ropes;
            {
                _ends = ropeEndPosition _x;
                if (count _ends == 2) then {
                    _end1 = _ends select 0;
                    _end2 = _ends select 1;
                    _minEnddistance = ((position player) distance _end1) min ((position player) distance _end2);
                    if (_closestdistance == -1 || _closestdistance > _minEnddistance) then {
                        _closestdistance = _minEnddistance;
                        _closestropeindex = (_activeRope select 0);
                        _closestvehicle = _vehicle;
                    };
                };
            } forEach _ropes;
        } forEach ([_vehicle] call ASL_Get_Active_ropes);
    } forEach _nearbyvehicles;
    [_closestvehicle, _closestropeindex];
};

ASL_pickup_ropes = {
    params ["_vehicle", "_player", ["_ropesindex", 0]];
    if (local _vehicle) then {
        private ["_existingropesandCargo", "_existingropes", "_existingCargo", "_helper", "_allCargo"];
        _existingropesandCargo = [_vehicle, _ropesindex] call ASL_Get_ropes_and_Cargo;
        _existingropes = _existingropesandCargo select 0;
        _existingCargo = _existingropesandCargo select 1;
        if (!isNull _existingCargo) then {
            {
                _existingCargo ropeDetach _x;
            } forEach _existingropes;
            _allCargo = _vehicle getVariable ["ASL_Cargo", []];
            _allCargo set [_ropesindex, objNull];
            _vehicle setVariable ["ASL_Cargo", _allCargo, true];
        };
        _helper = "land_Can_V2_F" createvehicle position _player;
        {
            [_helper, [0, 0, 0], [0, 0, -1]] ropeAttachto _x;
            _helper attachto [_player, [-0.1, 0.1, 0.15], "Pelvis"];
        } forEach _existingropes;
        hideObject _helper;
        [[_helper], "ASL_Hide_Object_Global"] call ASL_remoteExecServer;
        _player setVariable ["ASL_ropes_vehicle", [_vehicle, _ropesindex], true];
        _player setVariable ["ASL_ropes_pick_Up_Helper", _helper, true];
    } else {
        [_this, "ASL_pickup_ropes", _vehicle, true] call ASL_remoteExec;
    };
};

ASL_pickup_ropes_action = {
    private ["_nearbyvehicles", "_canpickupropes", "_closestrope"];
    _nearbyvehicles = missionnamespace getVariable ["ASL_Nearby_vehicles", []];
    if ([] call ASL_Can_pickup_ropes) then {
        _closestrope = [] call ASL_Get_Closest_Rope;
        if (!isNull (_closestrope select 0)) then {
            _canpickupropes = true;
            if!(missionnamespace getVariable ["ASL_locked_vehicles_ENABLED", false]) then {
                if (locked (_closestrope select 0) > 1) then {
                    ["Cannot pick up cargo ropes from locked vehicle", false] call ASL_hint;
                    _canpickupropes = false;
                };
            };
            if (_canpickupropes) then {
                [(_closestrope select 0), player, (_closestrope select 1)] call ASL_pickup_ropes;
            };
        };
    };
};

ASL_pickup_ropes_action_Check = {
    [] call ASL_Can_pickup_ropes;
};

ASL_Can_pickup_ropes = {
    count (player getVariable ["ASL_ropes_vehicle", []]) == 0 && count (missionnamespace getVariable ["ASL_Nearby_vehicles", []]) > 0 && vehicle player == player;
};

ASL_SUPPorTED_vehicles = [
    "Helicopter",
    "VtoL_Base_F"
];

ASL_Is_Supported_vehicle = {
    params ["_vehicle", "_isSupported"];
    _isSupported = false;
    if (not isNull _vehicle) then {
        {
            if (_vehicle isKindOf _x) then {
                _isSupported = true;
            };
        } forEach (missionnamespace getVariable ["ASL_SUPPorTED_vehicles_OVERRIDE", ASL_SUPPorTED_vehicles]);
    };
    _isSupported;
};

ASL_SLinG_RULES = [
    ["All", "CAN_SLinG", "All"]
];

ASL_Is_Supported_Cargo = {
    params ["_vehicle", "_cargo"];
    private ["_canSling"];
    _canSling = false;
    if (not isNull _vehicle && not isNull _cargo) then {
        {
            if (_vehicle isKindOf (_x select 0)) then {
                if (_cargo isKindOf (_x select 2)) then {
                    if ((toUpper (_x select 1)) == "CAN_SLinG") then {
                        _canSling = true;
                    } else {
                        _canSling = false;
                    };
                };
            };
        } forEach (missionnamespace getVariable ["ASL_SLinG_RULES_OVERRIDE", ASL_SLinG_RULES]);
    };
    _canSling;
};

ASL_hint = {
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

ASL_Hide_Object_Global = {
    params ["_obj"];
    if (_obj isKindOf "land_Can_V2_F") then {
        hideObjectglobal _obj;
    };
};

ASL_find_Nearby_vehicles = {
    private ["_nearvehicles", "_nearvehicleswithropes", "_vehicle", "_ends", "_end1", "_end2", "_playerPosAGL"];
    _nearvehicles = [];
    {
        _nearvehicles append (player nearObjects [_x, 30]);
    } forEach (missionnamespace getVariable ["ASL_SUPPorTED_vehicles_OVERRIDE", ASL_SUPPorTED_vehicles]);
    _nearvehicleswithropes = [];
    {
        _vehicle = _x;
        {
            _ropes = _vehicle getVariable ["ASL_ropes", []];
            if (count _ropes > (_x select 0)) then {
                _ropes = _ropes select (_x select 0);
                {
                    _ends = ropeEndPosition _x;
                    if (count _ends == 2) then {
                        _end1 = _ends select 0;
                        _end2 = _ends select 1;
                        _playerPosAGL = ASLtoAGL getPosASL player;
                        if ((_playerPosAGL distance _end1) < 5 || (_playerPosAGL distance _end2) < 5) then {
                            _nearvehicleswithropes = _nearvehicleswithropes + [_vehicle];
                        }
                    };
                } forEach _ropes;
            };
        } forEach ([_vehicle] call ASL_Get_Active_ropes);
    } forEach _nearvehicles;
    _nearvehicleswithropes;
};

ASL_Add_player_actions = {
    player addAction ["Extend Cargo ropes", {
        [] call ASL_Extend_ropes_action;
    }, nil, 0, false, true, "", "call ASL_Extend_ropes_action_Check"];
    
    player addAction ["Shorten Cargo ropes", {
        [] call ASL_Shorten_ropes_action;
    }, nil, 0, false, true, "", "call ASL_Shorten_ropes_action_Check"];
    
    player addAction ["Release Cargo", {
        [] call ASL_Release_Cargo_action;
    }, nil, 0, false, true, "", "call ASL_Release_Cargo_action_Check"];
    
    player addAction ["Retract Cargo ropes", {
        [] call ASL_Retract_ropes_action;
    }, nil, 0, false, true, "", "call ASL_Retract_ropes_action_Check"];
    
    player addAction ["Deploy Cargo ropes", {
        [] call ASL_Deploy_ropes_action;
    }, nil, 0, false, true, "", "call ASL_Deploy_ropes_action_Check"];
    
    player addAction ["Attach to Cargo ropes", {
        [] call ASL_Attach_ropes_action;
    }, nil, 0, false, true, "", "call ASL_Attach_ropes_action_Check"];
    
    player addAction ["drop Cargo ropes", {
        [] call ASL_drop_ropes_action;
    }, nil, 0, false, true, "", "call ASL_drop_ropes_action_Check"];
    
    player addAction ["pickup Cargo ropes", {
        [] call ASL_pickup_ropes_action;
    }, nil, 0, false, true, "", "call ASL_pickup_ropes_action_Check"];
    
    player addEventHandler ["Respawn", {
        player setVariable ["ASL_actions_loaded", false];
    }];
};

if (!isDedicated) then {
    [] spawn {
        while {true} do {
            if (!isNull player && isplayer player) then {
                if!(player getVariable ["ASL_actions_loaded", false]) then {
                    [] call ASL_Add_player_actions;
                    player setVariable ["ASL_actions_loaded", true];
                };
            };
            missionnamespace setVariable ["ASL_Nearby_vehicles", (call ASL_find_Nearby_vehicles)];
            sleep 2;
        };
    };
};

ASL_remoteExec = {
    params ["_params", "_functionname", "_target", ["_iscall", false]];
    if (!isnil "ExileClient_system_network_send") then {
        ["AdvancedSlingloadingremoteExecClient", [_params, _functionname, _target, _iscall]] call ExileClient_system_network_send;
    } else {
        if (_iscall) then {
            _params remoteExecCall [_functionname, _target];
        } else {
            _params remoteExec [_functionname, _target];
        };
    };
};

ASL_remoteExecServer = {
    params ["_params", "_functionname", ["_iscall", false]];
    if (!isnil "ExileClient_system_network_send") then {
        ["AdvancedSlingloadingremoteExecServer", [_params, _functionname, _iscall]] call ExileClient_system_network_send;
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
    
    ASL_SUPPorTED_remoteExecSERVER_FUNCTIONS = ["ASL_Hide_Object_Global"];
    
    ExileServer_AdvancedSlingloading_network_AdvancedSlingloadingremoteExecServer = {
        params ["_sessionId", "_messageparameters", ["_iscall", false]];
        _messageparameters params ["_params", "_functionname"];
        if (_functionname in ASL_SUPPorTED_remoteExecSERVER_FUNCTIONS) then {
            if (_iscall) then {
                _params call (missionnamespace getVariable [_functionname, {}]);
            } else {
                _params spawn (missionnamespace getVariable [_functionname, {}]);
            };
        };
    };
    
    ASL_SUPPorTED_remoteExecCLIENT_FUNCTIONS = ["ASL_pickup_ropes", "ASL_Deploy_ropes_index", "ASL_Rope_set_Mass", "ASL_Extend_ropes", "ASL_Shorten_ropes", "ASL_Release_Cargo", "ASL_Retract_ropes", "ASL_Deploy_ropes", "ASL_hint", "ASL_Attach_ropes", "ASL_drop_ropes"];
    
    ExileServer_AdvancedSlingloading_network_AdvancedSlingloadingremoteExecClient = {
        params ["_sessionId", "_messageparameters"];
        _messageparameters params ["_params", "_functionname", "_target", ["_iscall", false]];
        if (_functionname in ASL_SUPPorTED_remoteExecCLIENT_FUNCTIONS) then {
            if (_iscall) then {
                _params remoteExecCall [_functionname, _target];
            } else {
                _params remoteExec [_functionname, _target];
            };
        };
    };
    
    // install Advanced Sling loading on all clients (plus JIP) //
    
    publicVariable "ASL_Advanced_Sling_loading_install";
    remoteExecCall ["ASL_Advanced_Sling_loading_install", -2, true];
};

// Disable Old Script Version on SA Server
SA_Rope_action_Check = {
    false
};
SA_Rope_pickup_Rope_action_Check = {
    false
};
SA_Rope_drop_Rope_action_Check = {
    false
};
SA_Rope_Attach_Rope_action_Check = {
    false
};

diag_log "Advanced Sling loading loaded";
};

if (isServer) then {
    [] call ASL_Advanced_Sling_loading_install;
};