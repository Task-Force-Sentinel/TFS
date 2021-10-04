/*
Function: TFS_fnc_ammobox

Description:
Used to configure basic container ammo state.

Arguments:
_container - Container the setup is applied to. <OBJECT>
_type - Equipment setup to add. <strinG>

Examples:
(begin example)
[this] call TFS_fnc_ammobox;
[this, "Aegis"] call TFS_fnc_ammobox;
(end)

Author:
MitchJC
*/
if (!isServer) exitwith {};

params [
    "_container",
    ["_type", "None"]
];

private _type = _container getVariable ["TFS_Limitedammoselect", -1];

if ((_type isEqualto -1) || (_type isEqualto "None")) exitwith {};

call {
    if (_type isEqualto 0) exitwith {
        _type = "SMA-SPS"
    };
    if (_type isEqualto 1) exitwith {
        _type = "Winter"
    };
    if (_type isEqualto 2) exitwith {
        _type = "NI"
    };
    if (_type isEqualto 3) exitwith {
        _type = "CUP"
    };
    if (_type isEqualto 3) exitwith {
        _type = "RHS"
    };
};

private ["_Containeritems"];

call {
    if (_type isEqualto "Vanilla") exitwith {
        _Containeritems = [
            ["200Rnd_556x45_Box_Tracer_Red_F", 10],
            ["200Rnd_65x39_cased_Box_Tracer", 10],
            ["20Rnd_762x51_Mag", 10],
            ["30Rnd_9x21_Mag_SMG_02_Tracer_Red", 10],
            ["HandGrenade", 10],
            ["SmokeShell", 10],
            ["3Rnd_HE_Grenade_shell", 6],
            ["Titan_AT", 4]
        ];
    };
    if (_type isEqualto "Aegis") exitwith {
        _Containeritems = [
            ["UKAegis_BAF_AT4_CS_AT_Launcher", 4],
            ["UKAegis_BAF_762_L42A1_20Rnd_T", 10],
            ["UKAegis_BAF_556_30Rnd_T", 24],
            ["UKAegis_BAF_556_200Rnd_T", 10],
            ["UKAegis_BAF_1Rnd_HEDP_Grenade_Shell", 6],
            ["UKAegis_BAF_9_17Rnd", 8],
            ["UKAegis_BAF_SmokeShell", 10],
            ["HandGrenade", 8]
        ];
    };
    if (_type isEqualto "RHS") exitwith {
        _Containeritems = [
            ["rhs_weap_M136_hedp", 4],
            ["rhsusf_mag_6Rnd_M441_HE", 6],
            ["rhs_mag_m67", 8],
            ["rhs_mag_an_m8hc", 10],
            ["30Rnd_556x45_Stanag_Tracer_Red", 10],
            ["rhsusf_20Rnd_762x51_m118_special_Mag", 24],
            ["rhs_200rnd_556x45_M_SAW", 10],
            ["rhsusf_100Rnd_762x51", 6],
            ["rhsusf_m112_mag", 8]
        ];
    };
};

{
    _container additemCargoGlobal _x
} forEach _Containeritems;