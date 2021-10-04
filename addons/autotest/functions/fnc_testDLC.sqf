#include "\z\tfs\addons\autotest\script_component.hpp"
/* ----------------------------------------------------------------------------
internal Function: TFS_autotest_fnc_testDLC

Description:
Checks units/vehicles DLC usage

Returns:
Warning array [Array of Warnings]

Author:
Freddo
---------------------------------------------------------------------------- */

log("Running DLC tests");
private _warnings = [];
private _ignoredDLC = getArray (_test >> "ignoredDLC");
private _dlcHash = uiNamespace getVariable QGVAR(dlcHash);
private _allunits = (playableunits + [player]);
private _unitsDLCinfo = _allunits apply {
    _x setUnitLoadout getUnitloadout _x;
    // Needed to properly register DLC usage
    [_x, getPersonUsedDLCs _x]
};
private _missionSummary = "Multiplayer" get3DENMissionAttribute "intelOverviewtext";

// World DLC flags all objects, so add it as a separate warning.
private _worldDLC = getNumber (configFile >> "CfgWorlds" >> worldName >> "appiD");
if (_worldDLC != 0 && !(_worldDLC in _ignoredDLC)) then {
    _ignoredDLC pushBack _worldDLC;
    /*_warnings pushBack [
        1,
        format ["Mission uses DLC terrain: %1", [_dlcHash, _worldDLC] call CBA_fnc_hashGet]
    ];
    */
};

// Check units for DLC
private _problemunits = [];
{
    _x params ["_unit", "_dlcArr"];
    TRACE_2("Checking unit for DLC", _unit, _dlcArr);
    
    // Get DLC short names from preStart hash
    _dlcArr = _dlcArr - _ignoredDLC;
    _dlcArr = _dlcArr apply {
        [_dlcHash, _x] call CBA_fnc_hashGet
    };
    
    private _roleDescription = (_unit get3DENAttribute "description") select 0;
    _dlcArr = _dlcArr select {
        !([_x, _roleDescription] call BIS_fnc_instring) && // DLC usage mentioned in role description
        !([_x, _missionSummary] call BIS_fnc_instring) // DLC usage mentioned in mission summary
    };
    
    if !(_dlcArr isEqualto []) then {
        TRACE_2("Unit has unlisted DLC", _unit, _dlcArr);
        _problemunits pushBack [_unit, _dlcArr];
    };
} forEach (_unitsDLCinfo select {
    !(_x # 1 isEqualto [])
});

if !(_problemunits isEqualto []) then {
    // Avoid cluttering autotest too much
    if (count _problemunits > 5) then {
        _problemunits = _problemunits select [0, 5];
        _warnings pushBack [0, "More than five playable units require notices for DLC:"];
    } else {
        _warnings pushBack [1, "One or more playable units require notices for DLC:"];
    };
    
    {
        _x params ["_unit", "_dlc"];
        
        private _rolestr = "";
        if (_unit getVariable [QEGVAR(assigngear, done), false]) then {
            _rolestr = format [" (%1)", _unit getVariable QEGVAR(assigngear, role)];
        };
        
        _warnings pushBack [
            1,
            format ["| %1%2 : %3", _unit, _rolestr, _dlc]
        ];
    } forEach _problemunits;
};

// Check placed vehicles for DLC
// Filter only enterable and unlocked vehicles
private _vehicles = vehicles select {
    [typeOf _x, true] call BIS_fnc_crewcount > 0 &&
    ((_x get3DENAttribute "enableSimulation") # 0) &&
    ((_x get3DENAttribute "lock") # 0) <= 1 &&
    !((_x get3DENAttribute "objectIsSimple") # 0)
};
private _vehicleDLCinfo = _vehicles apply {
    [_x, getobjectDLC _x]
};
private _roleDescriptions = _allunits apply {
    (_x get3DENAttribute "description") select 0
};
private _searchtexts = [_missionSummary] + _roleDescriptions;
private _problemVehs = [];
{
    _x params ["_veh", "_dlc"];
    TRACE_2("Checking vehicle for DLC", _veh, _dlc);
    
    // Get DLC short names from preStart hash
    if !(_dlc in _ignoredDLC) then {
        _dlc = [_dlcHash, _dlc] call CBA_fnc_hashGet;
        
        private _index = _searchtexts findif {
            [_dlc, _x] call BIS_fnc_instring
        };
        
        if (_index == -1) then {
            TRACE_2("vehicle found using unlisted DLC", _veh, _dlc);
            _problemVehs pushBack [_veh, _dlc];
        };
    };
} forEach (_vehicleDLCinfo select {
    !isnil {
        (_x # 1)
    }
});

if !(_problemVehs isEqualto []) then {
    // Avoid cluttering autotest too much
    if (count _problemVehs > 5) then {
        _problemVehs = _problemVehs select [0, 5];
        _warnings pushBack [0, "More than five unlocked vehicles require DLC notices:"];
    } else {
        _warnings pushBack [1, "One or more unlocked vehicles require DLC notices:"];
    };
    
    {
        _x params ["_veh", "_dlc"];
        _warnings pushBack [
            1,
            format ["| %1 (%2) : '%3'", _veh, (configFile >> "Cfgvehicles">> typeOf _veh) call BIS_fnc_displayname, _dlc]
        ];
    } forEach _problemVehs;
};

_warnings pushBack [
    if (_warnings isEqualto []) then [{
        -1
    }, {
        1
    }],
    "DLC Checks finished"
];

log_1("Finished DLC Tests: %1", _warnings);

_warnings