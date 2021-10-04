// not documented: action handler

params ["_target", "_caller", "_id", "_arguments"];

// don't load if ACE is detected - it contains plugs
if (isClass(configFile >> "CfgPatches" >> "ace_main")) exitwith {};

// We default to plugs out
if (isnil "YAinA_F_Plugsin") then {
    YAinA_F_Plugsin = false;
};

if (YAinA_F_Plugsin isEqualto true) then {
    ([2, 0] select isnil "_target") fadeSound 0.2;
    _ID =[
        player,
        "<t color='#FF0000'>Remove Earplugs</t>",
        "z\tfs\addons\Main\Scripts\Earplugs\plugs_out.paa",
        "z\tfs\addons\Main\Scripts\Earplugs\plugs_out.paa",
        "_target == _this",
        "true",
        {},
        {},
        {
            YAinA_F_Plugsin = false;
            [] execVM "z\tfs\addons\Main\Scripts\Earplugs\earplugs.sqf";
            ["<img image='z\tfs\addons\Main\Scripts\Earplugs\plugs_out.paa' /><br/><t valign='middle' align='center' size='.4'>Earplugs Removed</t>", -1, -1, 4, 1, 0, 789] spawn BIS_fnc_dynamictext;
        },
        {},
        [],
        0.5,
        -91,
        true,
        false
    ] call BIS_fnc_holdactionAdd;
};

if (YAinA_F_Plugsin isEqualto false) then {
    ([2, 0] select isnil "_target") fadeSound 1;
    [
        player,
        "<t color='#00FF00'>insert Earplugs</t>",
        "z\tfs\addons\Main\Scripts\Earplugs\plugs_in.paa",
        "z\tfs\addons\Main\Scripts\Earplugs\plugs_in.paa",
        "_target == _this",
        "true",
        {},
        {},
        {
            YAinA_F_Plugsin = true;
            [] execVM "z\tfs\addons\Main\Scripts\Earplugs\earplugs.sqf";
            ["<img image='z\tfs\addons\Main\Scripts\Earplugs\plugs_in.paa' /><br/><t valign='middle' align='center' size='.4'>Earplugs Fitted</t>", -1, -1, 4, 1, 0, 789] spawn BIS_fnc_dynamictext;
        },
        {},
        [],
        0.5,
        -91,
        true,
        false
    ] call BIS_fnc_holdactionAdd;
};