/*
Function: TFS_fnc_MedicalSupplies

Description:
Used to configure basic container medical state.

Arguments:
_container - Container the setup is applied to. <OBJECT>
_type - Equipment setup to add. <strinG>
_purge - Clear the container's inventory before adding supplies? <BOOLEAN>

Examples:
(begin example)
[this] call TFS_fnc_MedicalSupplies;
[this, "MERT", true] call TFS_fnc_MedicalSupplies;
(end)

Author:
MitchJC
*/
if (!isServer) exitwith {};

params [
    "_container",
    ["_type", "NONE"],
    ["_purge", false]
];

private _Vartype = _container getVariable ["TFS_Equipment_select", -1];

call {
    if (_Vartype isEqualto 0) exitwith {
        _type = "Limited"
    };
    if (_Vartype isEqualto 1) exitwith {
        _type = "Standard"
    };
    if (_Vartype isEqualto 2) exitwith {
        _type = "MERT"
    };
};

if (_type isEqualto "NONE") exitwith {};

private ["_Containeritems"];

call {
    if (_type isEqualto "Limited") exitwith {
        if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
            _Containeritems = [
                ["TFS_FirstAid", 4],
                ["ACE_EarPlugs", 4],
                ["ACE_Flashlight_MX991", 1],
                ["toolKit", 1],
                ["Chemlight_blue", 1],
                ["Chemlight_green", 1],
                ["Chemlight_red", 1]
            ];
        } else {
            _Containeritems = [
                ["FirstAidKit", 20]
            ];
        };
    };
    if (_type isEqualto "Standard") exitwith {
        if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
            _Containeritems = [
                ["TFS_FirstAid", 4],
                ["TFS_DuctTape", 1],
                ["ACE_EarPlugs", 4],
                ["TFS_fireExtinguisher", 1],
                ["ACE_Flashlight_MX991", 1],
                ["toolKit", 1],
                ["Chemlight_blue", 1],
                ["Chemlight_green", 1],
                ["Chemlight_red", 1]
            ];
        } else {
            _Containeritems = [
                ["FirstAidKit", 30],
                ["Medikit", 2]
            ];
        };
    };
    if (_type isEqualto "MERT") exitwith {
        if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
            _Containeritems = [
                ["TFS_FirstAid", 4],
                ["TFS_DuctTape", 1],
                ["ACE_EarPlugs", 4],
                ["TFS_fireExtinguisher", 1],
                ["ACE_Flashlight_MX991", 1],
                ["toolKit", 1],
                ["Chemlight_blue", 1],
                ["Chemlight_green", 1],
                ["Chemlight_red", 1],
                ["kat_accuvac", 2],
                ["kat_X_AED", 2],
                ["kat_AED", 2],
                ["kat_aatKit", 8],
                ["ACE_bodyBag", 8],
                ["TFS_MedicArea", 1],
                ["TFS_MedicKit", 8],
                ["ACE_tourniquet", 20],
                ["ACE_surgicalKit", 2],
                ["TFS_Stethoscope", 2],
                ["ACE_splint", 20],
                ["ACE_salineIV", 20],
                ["ACE_plasmaIV", 20],
                ["ACE_personalAidKit", 4],
                ["ACE_morphine", 20],
                ["kat_guedel", 20],
                ["ACE_epinephrine", 20],
                ["ACE_EarPlugs", 20],
                ["kat_chestSeal", 20],
                ["kat_bloodIV_B", 20],
                ["kat_bloodIV_AB", 20],
                ["kat_bloodIV_A", 20],
                ["kat_bloodIV_O", 20],
                ["ACE_fieldDressing", 20],
                ["ACE_elasticBandage", 20],
                ["ACE_packingBandage", 20],
                ["ACE_quikclot", 20],
                ["ACE_adenosine", 20],
                ["ACE_personalAidKit", 4]
            ];
        } else {
            _Containeritems = [
                ["FirstAidKit", 50],
                ["Medikit", 2]
            ];
        };
    };
};

if (_purge) then {
    clearitemCargoGlobal _container;
};

{
    _container additemCargoGlobal _x
} forEach _Containeritems