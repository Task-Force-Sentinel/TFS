[
    QGVAR(destroyChance),
    "SLIDER",
    ["Item Destroy Chance", "Destroy chance of each item when placing a unit into a bodybag."],
    format ["TFS %1", localize "str_a3_rscdisplaywelcome_expa_parc_list6_title"],
    [0, 100, DESTROY_CHANCE_DEFAULT, 0],
    true
] call CBA_fnc_addSetting;
