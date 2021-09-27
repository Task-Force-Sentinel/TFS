/*
Function: TFS_fnc_ConfigPlayer

name:
	Used to configure basic player attributes and equipment.

Arguments:
	_unit - Player the setup is applied to. <OBJECT>
	_Section - The Section the Player is in. <STRING>
	_Traits - Which Traits the player has, can be more than one. <ARRAY>
	_Loadout - Name of Loadout to call. Changes player equipment to Loadout from TFS Fundamentals. <STRING>

Examples:
	(begin example)
		[this] call TFS_fnc_ConfigPlayer;
		[this, "1 Section"] call TFS_fnc_ConfigPlayer;
		[this, "ds999", ["Pilot"]] call TFS_fnc_ConfigPlayer;
		[this, "ds990", ["Pilot", "Mission Maker"]] call TFS_fnc_ConfigPlayer;
		[this, "ds999", ["Pilot"], "3CB Pilot"] call TFS_fnc_ConfigPlayer;
	(end)

Author:
	MitchJC
*/

params [
	"_unit",
	["_Section", "Support"],
	["_Traits", []],
	["_Loadout", []]
];

if (_Section isEqualto -1) exitwith {};

/* call {
	if (_Section isEqualto 1) exitwith {_Section = "1"};
	if (_Section isEqualto 2) exitwith {_Section = "11"};
	if (_Section isEqualto 3) exitwith {_Section = "11a"};
	if (_Section isEqualto 4) exitwith {_Section = "11b"};
	if (_Section isEqualto 5) exitwith {_Section = "12"};
	if (_Section isEqualto 6) exitwith {_Section = "12a"};
	if (_Section isEqualto 7) exitwith {_Section = "12b"};
}; */

if (local _unit) then {

	//========== Section Config
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
				_ShortRange = ["100", "100.1", "100.2", "100.3","99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "11") exitwith {
				_ShortRange = ["100", "110", "110.1", "110.2", "99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "111") exitwith {
				_ShortRange = ["100", "111", "111.1", "111.2","99", "69","110"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "BLUE";
			};
			if (_Section == "112") exitwith {
				_ShortRange = ["100", "112", "112.1", "112.2","99", "69","110"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "YELLOW";
			};
			if (_Section == "12") exitwith {
				_ShortRange = ["100", "120", "120.1", "120.2", "99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "121") exitwith {
				_ShortRange = ["100", "121", "121.1", "121.2", "99", "69", "120"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "BLUE";
			};
			if (_Section == "122") exitwith {
				_ShortRange = ["100", "122", "122.1", "122.2","99", "69", "120"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "YELLOW";
			};
			if (_Section == "13") exitwith {
				_ShortRange = ["100", "130", "130.1", "130.2","99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "131") exitwith {
				_ShortRange = ["100", "131", "131.1", "131.2", "99", "69", "130"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "BLUE";
			};
			if (_Section == "132") exitwith {
				_ShortRange = ["100", "132", "132.1", "132.2", "99", "69", "130"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "YELLOW";
			};
			if (_Section == "2") exitwith {
				_ShortRange = ["200", "200.1", "200.2","200.3","99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "21") exitwith {
				_ShortRange = ["200", "210", "210.1", "210.2", "99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "211") exitwith {
				_ShortRange = ["200", "211", "211.1", "211.2","99", "69","210"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "BLUE";
			};
			if (_Section == "212") exitwith {
				_ShortRange = ["200", "212", "212.1", "212.2","99", "69","210"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "YELLOW";
			};
			if (_Section == "22") exitwith {
				_ShortRange = ["200", "220", "220.1", "220.2","99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "221") exitwith {
				_ShortRange = ["200", "221", "221.1", "221.2","99", "69", "220"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "BLUE";
			};
			if (_Section == "222") exitwith {
				_ShortRange = ["200", "222", "222.1", "222.2","99", "69", "220"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "YELLOW";
			};
			if (_Section == "23") exitwith {
				_ShortRange = ["200", "230", "230.1", "230.2","99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "231") exitwith {
				_ShortRange = ["200", "231", "231.1", "231.2","99", "69", "230"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "BLUE";
			};
			if (_Section == "232") exitwith {
				_ShortRange = ["200", "232", "232.1", "232.2","99", "69", "230"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "YELLOW";
			};
			if (_Section == "3") exitwith {
				_ShortRange = ["300", "300.1", "300.2","300.3", "99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "31") exitwith {
				_ShortRange = ["300", "310", "310.1", "310.2", "99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "311") exitwith {
				_ShortRange = ["300", "311", "311.1", "311.2", "99", "69","310"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "BLUE";
			};
			if (_Section == "312") exitwith {
				_ShortRange = ["300", "312", "312.1", "312.2", "99", "69","310"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "YELLOW";
			};
			if (_Section == "32") exitwith {
				_ShortRange = ["300", "320", "320.1", "320.2", "99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "321") exitwith {
				_ShortRange = ["300", "321", "321.1", "321.2", "99", "69", "320"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "BLUE";
			};
			if (_Section == "322") exitwith {
				_ShortRange = ["300", "322", "322.1", "322.2","99", "69", "320"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "YELLOW";
			};
			if (_Section == "33") exitwith {
				_ShortRange = ["300", "330", "330.1", "330.2","99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "331") exitwith {
				_ShortRange = ["300", "331", "331.1", "331.2", "99", "69", "330"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "BLUE";
			};
			if (_Section == "332") exitwith {
				_ShortRange = ["300", "332", "332.1", "332.2","99", "69", "330"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
				_color = "YELLOW";
			};
			if (_Section == "500") exitwith {
				_ShortRange = ["500", "500.1", "500.2","500.3", "99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "150") exitwith {
				_ShortRange = ["150", "151", "152", "153", "99", "69"];
				_LongRange = ["40", "50", "51", "52", "58", "59", "60", "69"];
			};
			if (_Section == "90") exitwith {
				_ShortRange = ["90", "90.1", "90.2", "90.3", "99", "69", "330"];
				_LongRange = ["40", "60", "61", "62", "63", "64", "65", "69"];
			};
		};

		// TFAR Beta and Legacy use different way to set the frequency, so we have to check which version
		// is loaded to support both
		if (_beta) then {
			_unit setVariable ["TFAR_freq_sr", _ShortRange, true];
			_unit setVariable ["TFAR_freq_lr", _LongRange, true];
			_unit assignTeam _color;
		} else {
			group _unit setVariable ["tf_sw_frequency", [0,9,_ShortRange,0,nil,-1,0,false], true];
			group _unit setVariable ["tf_TFS_frequency", [0,9,_LongRange,0,nil,-1,0,false], true];
			_unit assignTeam _color;
		};
	};
	//========== Trait Config
	private _TraitsArray = call {
		if ((typeName _Traits) isEqualTo "STRING") exitWith { [_Traits]};
		_Traits
	};

	if !(_TraitsArray isEqualTo []) then {
		{
			_unit setUnitTrait [_x, true, true];
		} forEach _TraitsArray;
	};
	//========ACE Player Traits
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {

		_unit setvariable ["ace_advanced_fatigue_performanceFactor",2.0,true];

		if (_unit getunittrait "Medic") then { _unit setVariable ["ace_medical_medicClass", 1, true]};
		if (_unit getunittrait "Doctor") then { _unit setVariable ["ace_medical_medicClass", 2, true]};
		if (_unit getunittrait "Engineer") then { _unit setVariable ["ace_isEngineer", 1, true]};
		if (_unit getunittrait "Adv Engineer") then { _unit setVariable ["ace_isEngineer", 2, true]};
	};

	//========== Loadout Config
	if !(_Loadout isEqualto []) then {
		[_unit, _Loadout] call TFS_fnc_Loadouts;
	};

	//=========== Patches
	// [_unit, _Section] call TFS_fnc_Patches;

	//=========== Set Section
	_unit setVariable ["TFS_Section", _Section, true];
};

//========== SideChat Config
if (hasinterface) then {
	if ((isClass (configFile >> "CfgPatches" >> "task_force_radio")) && (EnableSideChat)) then {
		if ((_Section == "Command") || (_Section == "90")) then {
			1 enablechannel [true, false];
		};
	};
};
