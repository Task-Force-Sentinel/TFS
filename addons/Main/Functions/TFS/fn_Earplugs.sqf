// not documented: postinit

if !(hasinterface) exitwith {};
if (isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

if (isnil {
    player getVariable "EarplugsAdded";
} ) then {
    player addEventHandler ["Respawn", {
        params ["_unit", "_corpse"];
        [] execVM "z\tfs\addons\main\Scripts\Earplugs\earplugs.sqf";
    }];
    player setVariable ["EarplugsAdded", true];
};