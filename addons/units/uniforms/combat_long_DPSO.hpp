// Naming pattern: SleeveType_Camo_Pattern
// Combat TFSRHS - Long Sleeves
class CLASS(Uniform_Combat_LS_TFSRHS_ATX): CLASS(Uniform_Base) {
    scope = 2;
    author = "Tibernius, Tyrone";
    displayName = CSTRING(Uniform_Combat_LS_TFSRHS_ATX);
    picture = QPATHTOF(UI\uniform_combat_ls_TFSRHS_atx.paa);

    class ItemInfo: ItemInfo {
        uniformClass = QCLASS(Unit_Combat_LS_TFSRHS_ATX);
    };
};
class CLASS(Uniform_Combat_LS_TFSRHS_AUX): CLASS(Uniform_Base) {
    scope = 2;
    author = "Tibernius, Tyrone";
    displayName = CSTRING(Uniform_Combat_LS_TFSRHS_AUX);
    picture = QPATHTOF(UI\uniform_combat_ls_TFSRHS_aux.paa);

    class ItemInfo: ItemInfo {
        uniformClass = QCLASS(Unit_Combat_LS_TFSRHS_AUX);
    };
};
class CLASS(Uniform_Combat_LS_TFSRHS_IX): CLASS(Uniform_Base) {
    scope = 2;
    author = "Tibernius, Tyrone";
    displayName = CSTRING(Uniform_Combat_LS_TFSRHS_IX);
    picture = QPATHTOF(UI\uniform_combat_ls_TFSRHS_ix.paa);

    class ItemInfo: ItemInfo {
        uniformClass = QCLASS(Unit_Combat_LS_TFSRHS_IX);
    };
};
class CLASS(Uniform_Combat_LS_TFSRHS_LEX): CLASS(Uniform_Base) {
    scope = 2;
    author = "Tibernius, Tyrone";
    displayName = CSTRING(Uniform_Combat_LS_TFSRHS_LEX);
    picture = QPATHTOF(UI\uniform_combat_ls_TFSRHS_lex.paa);

    class ItemInfo: ItemInfo {
        uniformClass = QCLASS(Unit_Combat_LS_TFSRHS_LEX);
    };
};
