/*
File: objectMapper.sqf
Author: Joris-Jan van 't land
modified by: Mokka

Description:
Takes an array of data about a dynamic object template and creates the objects.

parameter(s):
_this select 0: position of the template - Array [X, Y, Z]
_this select 1: azimuth of the template in degrees - Number
_this select 2: objects for the template - Array / composition class - string / tag list - Array
_this select 3: (optional) randomizer value (how much chance each object has of being created. 0.0 is 100% chance) - Number
_this select 4: (optional) create as simple objects - Boolean

Returns:
Created objects (Array)
*/

private ["_pos", "_azi", "_objs", "_rdm"];

params [
    ["_pos", [0, 0], [[]]],
    ["_azi", 0, [-1]],
    "_objs",
    ["_rdm", 0],
    ["_simple", false]
];

// Validate parameters
if (!((typeName _objs) in [(typeName ""), (typeName [])])) exitwith {
    debuglog "log: [BIS_fnc_objectMapper] Template objects (2) must be a string or Array!";
    []
};
if ((typeName _rdm) != (typeName 0)) exitwith {
    debuglog "log: [BIS_fnc_objectMapper] randomizer value (3) must be a Number!";
    []
};
if ((_rdm < 0.0) || (_rdm > 1.0)) exitwith {
    debuglog "log: [BIS_fnc_objectMapper] randomizer value (3) must be a Number between 0.0 and 1.0!";
    []
};

private ["_newObjs"];

// See if an object array, specific composition class or tag array was given
private ["_cfgObjectComps", "_script"];
_cfgObjectComps = configFile >> "CfgObjectCompositions";

if ((typeName _objs) == (typeName "")) then {
    // Composition class was given
    _script = gettext(_cfgObjectComps >> _objs >> "objectScript");
    _objs = [];
} else {
    private ["_testSample"];
    _testSample = _objs select 0;
    if ((typeName _testSample) != (typeName [])) then {
        // Tag list was given
        private ["_queryTags"];
        _queryTags = +_objs;
        _objs = [];
        
        // Make a list of candidates which match all given tags
        private ["_candidates"];
        _candidates = [];
        
        for "_i" from 0 to ((count _cfgObjectComps) - 1) do
        {
            private ["_candidate", "_candidateTags"];
            _candidate = _cfgObjectComps select _i;
            _candidateTags = getArray(_candidate >> "tags");
            
            // Are all tags in this candidate?
            if (({
                _x in _candidateTags
            } count _queryTags) == (count _queryTags)) then
            {
                _candidates = _candidates + [gettext(_candidate >> "objectScript")];
            };
        };
        
        // select a random candidate
        _script = _candidates select (floor (random (count _candidates)));
    };
};

// if the object array is in a script, call it
if (!isnil "_script") then {
    _objs = call (compile (preprocessFileLineNumbers _script));
};

// Make sure there are definitions in the final object array
if ((count _objs) == 0) exitwith {
    debuglog "log: [BIS_fnc_objectMapper] No elements in the object composition array!";
    []
};

_newObjs = [];

private ["_posX", "_posY"];
_posX = _pos select 0;
_posY = _pos select 1;

// Function to multiply a [2, 2] matrix by a [2, 1] matrix
private ["_multiplyMatrixFunc"];
_multiplyMatrixFunc =
{
    private ["_array1", "_array2", "_result"];
    _array1 = _this select 0;
    _array2 = _this select 1;
    
    _result =
    [
        (((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
        (((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
    ];
    
    _result
};

{
    // Check randomizer for each object
    if ((random 1) > _rdm) then {
        private ["_type", "_relPos", "_azimuth", "_fuel", "_damage", "_orientation", "_varname", "_init", "_simulation", "_ASL", "_newObj"];
        _type = _x select 0;
        _relPos = _x select 1;
        _azimuth = _x select 2;
        
        // Optionally map certain features for backwards compatibility
        if ((count _x) > 3) then {
            _fuel = _x select 3
        };
        if ((count _x) > 4) then {
            _damage = _x select 4
        };
        if ((count _x) > 5) then {
            _orientation = _x select 5
        };
        if ((count _x) > 6) then {
            _varname = _x select 6
        };
        if ((count _x) > 7) then {
            _init = _x select 7
        };
        if ((count _x) > 8) then {
            _simulation = _x select 8
        };
        if ((count _x) > 9) then {
            _ASL = _x select 9
        };
        if (isnil "_ASL") then {
            _ASL = false;
        };
        
        // Rotate the relative position using a rotation matrix
        private ["_rotMatrix", "_newRelPos", "_newPos"];
        _rotMatrix =
        [
            [cos _azi, sin _azi],
            [-(sin _azi), cos _azi]
        ];
        _newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;
        
        // Backwards compatability causes for height to be optional
        private ["_z"];
        if ((count _relPos) > 2) then {
            _z = _relPos select 2
        } else {
            _z = 0
        };
        
        _newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];
        
        // Create the object and make sure it's in the correct location
        if (_simple) then {
            _newObj = createSimpleObject [_type, _newPos, true];
        } else {
            _newObj = _type createvehicle _newPos;
        };
        _newObj setDir (_azi + _azimuth);
        if (!_ASL) then {
            _newObj setPos _newPos;
        } else {
            _newObj setPosASL _newPos;
            _newObj setVariable ["BIS_DynO_ASL", true];
        };
        
        // if fuel and damage were grabbed, map them
        if (!isnil "_fuel") then {
            _newObj setFuel _fuel
        };
        if (!isnil "_damage") then {
            _newObj setDamage _damage;
        };
        if (!isnil "_orientation") then {
            if ((count _orientation) > 0) then {
                ([_newObj] + _orientation) call BIS_fnc_setPitchBank;
            };
        };
        if (!isnil "_varname") then {
            if (_varname != "") then {
                _newObj setvehicleVarName _varname;
                call (compile (_varname + " = _newObj;
                "));
            };
        };
        if (!isnil "_init") then {
            _newObj call (compile ("this = _this;
            " + _init));
        };
        // todo: remove defining this hotfix?
        if (!isnil "_simulation") then {
            _newObj enableSimulation _simulation;
            _newObj setVariable ["BIS_DynO_simulation", _simulation];
        };
        
        if (_simple) then {
            _newObj enableSimulation false;
            _newObj allowdamage false;
        };
        
        _newObjs = _newObjs + [_newObj];
    };
} forEach _objs;

_newObjs