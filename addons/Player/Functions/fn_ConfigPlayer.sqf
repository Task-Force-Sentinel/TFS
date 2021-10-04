/*
Function: TFS_fnc_Configplayer

name:
Used to configure basic player attributes and equipment.

Arguments:
_unit - player the setup is applied to. <OBJECT>
_Section - The Section the player is in. <strinG>
_Traits - Which Traits the player has, can be more than one. <ARRAY>
_loadout - name of loadout to call. Changes player equipment to loadout from TFS Fundamentals. <strinG>

Examples:
(begin example)
[this] call TFS_fnc_Configplayer;
[this, "1 Section"] call TFS_fnc_Configplayer;
[this, "ds999", ["pilot"]] call TFS_fnc_Configplayer;
[this, "ds990", ["pilot", "Mission Maker"]] call TFS_fnc_Configplayer;
[this, "ds999", ["pilot"], "3CB pilot"] call TFS_fnc_Configplayer;
(end)

Author:
MitchJC
*/

params [
    "_unit",
    ["_Section", "Support"],
    ["_Traits", []],
    ["_loadout", []]
];

if (_Section isEqualto -1) exitwith {};

/* call {
    if (_Section isEqualto 1) exitwith {
        _Section = "1"
    };
    if (_Section isEqualto 2) exitwith {
        _Section = "11"
    };
    if (_Section isEqualto 3) exitwith {
        _Section = "11a"
    };
    if (_Section isEqualto 4) exitwith {
        _Section = "11b"
    };
    if (_Section isEqualto 5) exitwith {
        _Section = "12"
    };
    if (_Section isEqualto 6) exitwith {
        _Section = "12a"
    };
    if (_Section isEqualto 7) exitwith {
        _Section = "12b"
    };
};
*/

if (local _unit) then {
    // ========== Section Config
    // todo: replace this check with a check for tfar_core path if legacy TFAR reaches EOL
    // and gets fully deprecated
    if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {
        // TFAR Beta now uses tfar_core as its main patch, task_force_radio patch is only supplied
        // for legacy compatibility, so we can use this to check if the beta is currently loaded,
        // or not
        _beta = isClass (configFile >> "CfgPatches" >> "tfar_core");
        
        private ["_ShortRange", "_LongRange", "_color"];
        _color = "White"
        call {
            if (_Section == "1") exitwith {
                _ShortRange = ["100", "101", "102", "103", "104", "105", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "11") exitwith {
                _ShortRange = ["100", "110", "111", "112", "110.1", "110.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "111") exitwith {
                _ShortRange = ["100", "110", "111", "112", "110.1", "110.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "BLUE";
            };
            if (_Section == "112") exitwith {
                _ShortRange = ["100", "110", "111", "112", "110.1", "110.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "YELLOW";
            };
            if (_Section == "12") exitwith {
                _ShortRange = ["100", "120", "121", "122", "120.1", "120.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "121") exitwith {
                _ShortRange = ["100", "120", "121", "122", "120.1", "120.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "BLUE";
            };
            if (_Section == "122") exitwith {
                _ShortRange = ["100", "120", "121", "122", "120.1", "120.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "YELLOW";
            };
            if (_Section == "13") exitwith {
                _ShortRange = ["100", "130", "131", "132", "130.1", "130.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "131") exitwith {
                _ShortRange = ["100", "130", "131", "132", "130.1", "130.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "BLUE";
            };
            if (_Section == "132") exitwith {
                _ShortRange = ["100", "130", "131", "132", "130.1", "130.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "YELLOW";
            };
            if (_Section == "2") exitwith {
                _ShortRange = ["200", "201", "202", "203", "204", "205", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "21") exitwith {
                _ShortRange = ["200", "210", "211", "212", "210.1", "210.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "211") exitwith {
                _ShortRange = ["200", "210", "211", "212", "210.1", "210.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "BLUE";
            };
            if (_Section == "212") exitwith {
                _ShortRange = ["200", "210", "211", "212", "210.1", "210.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "YELLOW";
            };
            if (_Section == "22") exitwith {
                _ShortRange = ["200", "220", "221", "222", "220.1", "220.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "221") exitwith {
                _ShortRange = ["200", "220", "221", "222", "220.1", "220.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "BLUE";
            };
            if (_Section == "222") exitwith {
                _ShortRange = ["200", "220", "221", "222", "220.1", "220.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "YELLOW";
            };
            if (_Section == "23") exitwith {
                _ShortRange = ["200", "230", "232", "232", "230.1", "230.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "231") exitwith {
                _ShortRange = ["200", "230", "232", "232", "230.1", "230.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "BLUE";
            };
            if (_Section == "232") exitwith {
                _ShortRange = ["200", "230", "232", "232", "230.1", "230.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "YELLOW";
            };
            if (_Section == "3") exitwith {
                _ShortRange = ["300", "301", "302", "303", "304", "305", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "31") exitwith {
                _ShortRange = ["300", "310", "311", "312", "310.1", "310.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "311") exitwith {
                _ShortRange = ["300", "310", "311", "312", "310.1", "310.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "BLUE";
            };
            if (_Section == "312") exitwith {
                _ShortRange = ["300", "310", "311", "312", "310.1", "310.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "YELLOW";
            };
            if (_Section == "32") exitwith {
                _ShortRange = ["300", "320", "321", "322", "320.1", "320.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "321") exitwith {
                _ShortRange = ["300", "320", "321", "322", "320.1", "320.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "BLUE";
            };
            if (_Section == "322") exitwith {
                _ShortRange = ["300", "320", "321", "322", "320.1", "320.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "YELLOW";
            };
            if (_Section == "33") exitwith {
                _ShortRange = ["300", "330", "331", "332", "330.1", "330.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "331") exitwith {
                _ShortRange = ["300", "330", "331", "332", "330.1", "330.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "BLUE";
            };
            if (_Section == "332") exitwith {
                _ShortRange = ["300", "330", "331", "332", "330.1", "330.2", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
                _color = "YELLOW";
            };
            if (_Section == "500") exitwith {
                _ShortRange = ["500", "501", "502", "503", "504", "505", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "400") exitwith {
                _ShortRange = ["400", "401", "402", "403", "404", "405", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
            if (_Section == "60") exitwith {
                _ShortRange = ["60", "61", "62", "63", "64", "65", "99", "69"];
                _LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
            };
        };
        
        // TFAR Beta and Legacy use different way to set the frequency, so we have to check which version
        // is loaded to support both
        if (_beta) then {
            _unit setVariable ["TFAR_freq_sr", _ShortRange, true];
            _unit setVariable ["TFAR_freq_lr", _LongRange, true];
            _unit assignTeam _color;
        } else {
            group _unit setVariable ["tf_sw_frequency", [0, 9, _ShortRange, 0, nil, -1, 0, false], true];
            group _unit setVariable ["tf_TFS_frequency", [0, 9, _LongRange, 0, nil, -1, 0, false], true];
            _unit assignTeam _color;
        };
    };
    // ========== Trait Config
    private _TraitsArray = call {
        if ((typeName _Traits) isEqualto "strinG") exitwith {
            [_Traits]
        };
        _Traits
    };
    
    if !(_TraitsArray isEqualto []) then {
        {
            _unit setUnitTrait [_x, true, true];
        } forEach _TraitsArray;
    };
    // ========ACE player Traits
    if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
        _unit setVariable ["ace_advanced_fatigue_performanceFactor", 2.0, true];
        
        if (_unit getUnitTrait "Medic") then {
            _unit setVariable ["ace_medical_medicClass", 1, true]
        };
        if (_unit getUnitTrait "doctor") then {
            _unit setVariable ["ace_medical_medicClass", 2, true]
        };
        if (_unit getUnitTrait "Engineer") then {
            _unit setVariable ["ace_isEngineer", 1, true]
        };
        if (_unit getUnitTrait "Adv Engineer") then {
            _unit setVariable ["ace_isEngineer", 2, true]
        };
    };
    
    // ========== loadout Config
    if !(_loadout isEqualto []) then {
        [_unit, _loadout] call TFS_fnc_loadouts;
    };
    
    // =========== Patches
    // [_unit, _Section] call TFS_fnc_Patches;
    
    // =========== set Section
    _unit setVariable ["TFS_Section", _Section, true];
};

// ========== sideChat Config
if (hasinterface) then {
    if ((isClass (configFile >> "CfgPatches" >> "task_force_radio")) && (EnablesideChat)) then {
        if ((_Section == "Command") || (_Section == "90")) then {
            1 enableChannel [true, false];
        };
    };
};