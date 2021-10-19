if (isDedicated) exitWith {};

if (hasInterface) then {
    player setVariable ["canUseSSScas",false,true];
    player setVariable ["canUseSSStrans",false,true];
    player setVariable ["canUseSSSarty",false,true];
    player setUnitTrait ["UAVHacker",false];
    player setVariable ["ACE_isEOD",false, true];
    player setVariable ["ace_isEngineer",0, true];
    player setVariable ["ace_medical_medicclass",0, true];

    player setUnitTrait ["LoadCoef",.5];
    player setVariable ["ace_advanced_fatigue_performanceFactor",2, true];

    player setVariable["draWhitelisted",FALSE,TRUE];
    daoWhitelisted=false;

};

[ format [hint_tpl_default, "Weapons"] ] call tfs_fnc_hint;
