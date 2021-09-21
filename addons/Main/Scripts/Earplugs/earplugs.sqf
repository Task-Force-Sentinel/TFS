// not documented: action handler

params ["_target", "_caller", "_id", "_arguments"];

// Don't load if ACE is detected - it contains plugs
if (isClass(configFile >> "CfgPatches" >> "ace_main")) exitWith {};

// We default to plugs out
if(isNil "YAINA_F_PlugsIn") then { YAINA_F_PlugsIn = false; };

if (YAINA_F_PlugsIn isEqualTo true) then {

    ([2, 0] select isNil "_target") fadeSound 0.2;
	_ID =[
        
		player,
		"<t color='#FF0000'>Remove Earplugs</t>",
		"z\tfsrhs\addons\Main\Scripts\Earplugs\plugs_out.paa",
		"z\tfsrhs\addons\Main\Scripts\Earplugs\plugs_out.paa",
		"_target == _this",
		"true",
		{},
		{},
		{   
            YAINA_F_PlugsIn = false;
            [] execVM "z\tfsrhs\addons\Main\Scripts\Earplugs\earplugs.sqf";
            ["<img image='z\tfsrhs\addons\Main\Scripts\Earplugs\plugs_out.paa' /><br/><t valign='middle' align='center' size='.4'>Earplugs Removed</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;
        },
		{},
		[],
		0.5,
		-91,
		true,
		false
	] call BIS_fnc_holdActionAdd;
};

if (YAINA_F_PlugsIn isEqualTo false) then {

    ([2, 0] select isNil "_target") fadeSound 1;
	[
        
		player,
		"<t color='#00FF00'>Insert Earplugs</t>",
		"z\tfsrhs\addons\Main\Scripts\Earplugs\plugs_in.paa",
		"z\tfsrhs\addons\Main\Scripts\Earplugs\plugs_in.paa",
		"_target == _this",
		"true",
		{},
		{},
		{   
            YAINA_F_PlugsIn = true;
            [] execVM "z\tfsrhs\addons\Main\Scripts\Earplugs\earplugs.sqf";
            ["<img image='z\tfsrhs\addons\Main\Scripts\Earplugs\plugs_in.paa' /><br/><t valign='middle' align='center' size='.4'>Earplugs Fitted</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;
        },
		{},
		[],
		0.5,
		-91,
		true,
		false
	] call BIS_fnc_holdActionAdd;
};