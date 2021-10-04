#include "script_component.hpp"
ADdoN = false;

PREP_REcompile_START;
#include "XEH_PREP.hpp"
PREP_REcompile_END;

GVAR(curators) = [];

["moduleCurator_F", "initPost", {
    params ["_curator"];
    _curator addEventHandler ["CuratorObjectPlaced", {
        params ["", "_object"];
        [QGVAR(objectAdd), _object] call CBA_fnc_serverEvent;
    }];
    _curator addEventHandler ["CuratorgroupPlaced", {
        params ["", "_group"];
        [QGVAR(groupAdd), _group] call CBA_fnc_serverEvent;
    }];
}] call CBA_fnc_addClassEventHandler;

if (isServer) then {
    ["moduleCurator_F", "initPost", {
        params ["_curator"];
        {
            [QGVAR(objectAdd), _x] call CBA_fnc_localEvent;
        } forEach (allunits + vehicles);
    }] call CBA_fnc_addClassEventHandler;
    
    [QGVAR(objectAdd), {
        params ["_object"];
        {
            _x addcuratorEditableObjects [[_object], true];
        } forEach allCurators;
    }] call CBA_fnc_addEventHandler;
    
    [QGVAR(groupAdd), {
        params ["_group"];
        {
            [QGVAR(objectAdd), _x] call CBA_fnc_localEvent;
        } forEach units _group;
    }] call CBA_fnc_addEventHandler;
    
    // Create curator on demand
    [QGVAR(zeusAssign), {
        params ["_unit"];
        if !(isplayer _unit) exitwith {};
        
        inFO_1("Assigning Zeus to '%1'", _unit);
        
        private _curatormodule = [_unit] call FUNC(getFreeCuratormodule);
        unassignCurator getAssignedCuratorlogic _unit;
        
        // Curator unassign can take a moment, add delay
        [{}, {}, [_unit, _curatormodule], 5, {
            params ["_unit", "_curatormodule"];
            
            _unit assignCurator _curatormodule;
            
            [QGVAR(zeusAssigned), _curatormodule, _unit] call CBA_fnc_targetEvent;
        }] call CBA_fnc_waitUntilandexecute;
    }] call CBA_fnc_addEventHandler;
    
    // Unassign curator on demand
    [QGVAR(zeusUnassign), {
        params ["_unit"];
        if !(isplayer _unit) exitwith {};
        
        inFO_1("Unassigning Zeus from '%1'", _unit);
        
        private _curatormodule = getAssignedCuratorlogic _unit;
        if (_curatormodule isEqualto objNull) exitwith {};
        unassignCurator _curatormodule;
    }] call CBA_fnc_addEventHandler;
    
    // Activate Zeus addons
    [QGVAR(zeusactivateAddons), {
        params ["_curatormodule", "_addons"];
        
        inFO_1("Activating curator addons - '%1'", _curatormodule);
        
        _curatormodule addcuratoraddons _addons;
    }] call CBA_fnc_addEventHandler;
};

if (hasinterface) then {
    [QGVAR(zeusAssigned), {
        params ["_curatormodule"];
        
        inFO_1("Assigned Curator '%1'", _curatormodule);
        
        private _allAddons = ("true" configClasses (configFile >> "CfgPatches")) apply {
            configname _x
        };
        [QGVAR(zeusactivateAddons), [_curatormodule, _allAddons]] call CBA_fnc_serverEvent;
        
        if !(_curatormodule getVariable [QGVAR(drawCuratorLocations), false]) then {
            _curatormodule setVariable [QGVAR(drawCuratorLocations), true];
            [_curatormodule] call BIS_fnc_drawCuratorLocations;
        };
    }] call CBA_fnc_addEventHandler;
};

ADdoN = true;