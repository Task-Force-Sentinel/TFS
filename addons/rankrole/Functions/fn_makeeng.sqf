
if (isDedicated) exitWith {};

if (hasInterface) then {
    player setVariable ["canUseSSScas",false,true];
    player setVariable ["canUseSSStrans",false,true];
    player setVariable ["canUseSSSarty",false,true];
    player setUnitTrait ["UAVHacker",false];
    player setVariable ["ace_medical_medicclass",0, true];

    player setVariable ["ACE_isEOD",true, true];
    player setVariable ["ace_isEngineer",1, true];


    player setUnitTrait ["LoadCoef",.6];
    player setVariable ["ace_advanced_fatigue_performanceFactor",1.75, true];

    player setVariable["draWhitelisted",FALSE,TRUE];
    daoWhitelisted=false;

};
[ format [hint_tfs_default, "Engineer"] ] call tfs_fnc_hint;

