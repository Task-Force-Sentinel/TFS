// not documented: postinit

if (!hasinterface) exitwith {};

[
    player,
    "<t color='#356789'>Repack Mags</t>",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_hack_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_hack_ca.paa",
    "_target == _this",
    "true",
    {},
    {},
    {
        player spawn TFS_fnc_clientRepackmagazines
    },
    {},
    [],
    1,
    -92,
    false,
    false
] call BIS_fnc_holdactionAdd;

player addEventHandler ["Respawn", {
    params ["_unit", "_corpse"];
    [
        player,
        "<t color='#356789'>Repack Mags</t>",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_hack_ca.paa",
        "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_hack_ca.paa",
        "_target == _this",
        "true",
        {},
        {},
        {
            player spawn TFS_fnc_clientRepackmagazines
        },
        {},
        [],
        1,
        -92,
        false,
        false
    ] call BIS_fnc_holdactionAdd;
}];