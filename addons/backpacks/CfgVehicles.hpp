class CfgVehicles {
    class B_AssaultPack_Kerry;
    class CLASS(Backpack_AssaultExpanded_Black): B_AssaultPack_Kerry {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "BadHabitz, Jonpas, Rory";
        displayname = CSTRING(Backpack_AssaultExpanded_Black);
        picture = QPATHTOF(UI\backpack_assaultexpanded_black_ca.paa);
        hiddenSelectionsTextures[] = {
            "\a3\weapons_f\ammoboxes\bags\data\backpack_compact_blk_co.paa",
            QPATHTOEF(vests,data\vest_platecarrier_black_co.paa) // Expanded part - vest texture
        };
        maximumLoad = 200;
    };
    class CLASS(Backpack_AssaultExpanded_Green): B_AssaultPack_Kerry {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "BadHabitz, Jonpas, Rory";
        displayname = CSTRING(Backpack_AssaultExpanded_Green);
        picture = QPATHTOF(UI\backpack_assaultexpanded_green_ca.paa);
        hiddenSelectionsTextures[] = {
            "\a3\weapons_f\ammoboxes\bags\data\backpack_compact_rgr_co.paa",
            QPATHTOEF(vests,data\vest_platecarrier_green_co.paa) // Expanded part - vest texture
        };
        maximumLoad = 200;
    };
    class CLASS(Backpack_AssaultExpanded_Tan): B_AssaultPack_Kerry {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "BadHabitz, Jonpas, Rory";
        displayname = CSTRING(Backpack_AssaultExpanded_Tan);
        picture = QPATHTOF(UI\backpack_assaultexpanded_tan_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_assaultexpanded_tan_co.paa),
            QPATHTOEF(vests,data\vest_platecarrier_coyote_co.paa) // Expanded part - vest texture
        };
        maximumLoad = 200;
    };
    class CLASS(Backpack_AssaultExpanded_White): B_AssaultPack_Kerry {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "BadHabitz, Rory, Kresky";
        displayname = CSTRING(Backpack_AssaultExpanded_White);
        picture = QPATHTOF(UI\backpack_assaultexpanded_white_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_assaultexpanded_white_co.paa),
            QPATHTOEF(vests,data\vest_platecarrier_white_co.paa) // Expanded part - vest texture
        };
        maximumLoad = 200;
    };
    class CLASS(Backpack_AssaultExpanded_RGR): B_AssaultPack_Kerry {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "BadHabitz, Jonpas, Rory, JoramD, GilleeDoo";
        displayname = CSTRING(Backpack_AssaultExpanded_RGR);
        picture = QPATHTOF(UI\backpack_assaultexpanded_rgr_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_assaultexpanded_rgr_co.paa),
            QPATHTOEF(vests,data\vest_platecarrier_rgr_co.paa) // Expanded part - vest texture
        };
        maximumLoad = 200;
    };

    class B_AssaultPack_Base;
    class CLASS(Backpack_AssaultPack_RGR): B_AssaultPack_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "BadHabitz, Jonpas, Rory, JoramD, GilleeDoo";
        displayname = CSTRING(Backpack_AssaultPack_RGR);
        picture = QPATHTOF(UI\backpack_assaultpack_rgr_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_assaultexpanded_rgr_co.paa)
        };
        maximumLoad = 180;
    };

    class B_Carryall_Base;
    class CLASS(Backpack_Carryall_DarkBlack): B_Carryall_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, BadHabitz, Jonpas";
        displayName = CSTRING(Backpack_Carryall_DarkBlack);
        picture = "\a3\Weapons_F\Ammoboxes\Bags\data\UI\icon_B_C_Tortila_blk.paa";
        hiddenSelectionsTextures[] = {"\a3\weapons_f\ammoboxes\bags\data\backpack_tortila_blk_co.paa"};
        maximumLoad = 300;
    };

    class B_Kitbag_Base;
    class CLASS(Backpack_Kitbag_DarkBlack): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, BadHabitz, Jonpas";
        displayName = CSTRING(Backpack_Kitbag_DarkBlack);
        picture = QPATHTOF(UI\backpack_kitbag_darkblack_ca.paa);
        hiddenSelectionsTextures[] = {"\a3\weapons_f\ammoboxes\bags\data\backpack_fast_blk_co.paa"};
        maximumLoad = 300;
    };

    class CLASS(Backpack_Kitbag_White): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, JoramD";
        displayName = CSTRING(Backpack_Kitbag_White);
        picture = QPATHTOF(UI\backpack_kitbag_white_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_white_co.paa)
        };
        maximumLoad = 300;
    };

    class CLASS(Backpack_Kitbag_RGR): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, Tyrone";
        displayName = CSTRING(Backpack_Kitbag_RGR);
        picture = QPATHTOF(UI\backpack_kitbag_rgr_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_rgr_co.paa)
        };
        maximumLoad = 300;
    };

    class CLASS(Backpack_Kitbag_Medic_White): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, JoramD";
        displayName = CSTRING(Backpack_Kitbag_Medic_White);
        picture = QPATHTOF(UI\backpack_kitbag_medic_white_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_medic_white_co.paa)
        };
        maximumLoad = 320;
    };

    class CLASS(Backpack_Kitbag_Medic_Black): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, JoramD";
        displayName = CSTRING(Backpack_Kitbag_Medic_Black);
        picture = QPATHTOF(UI\backpack_kitbag_medic_black_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_medic_black_co.paa)
        };
        maximumLoad = 320;
    };

    class CLASS(Backpack_Kitbag_Medic_Coyote): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, JoramD";
        displayName = CSTRING(Backpack_Kitbag_Medic_Coyote);
        picture = QPATHTOF(UI\backpack_kitbag_medic_coyote_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_medic_coyote_co.paa)
        };
        maximumLoad = 320;
    };

    class CLASS(Backpack_Kitbag_Medic_Digital): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, JoramD";
        displayName = CSTRING(Backpack_Kitbag_Medic_Digital);
        picture = QPATHTOF(UI\backpack_kitbag_medic_digital_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_medic_digital_co.paa)
        };
        maximumLoad = 320;
    };

    class CLASS(Backpack_Kitbag_Medic_MTP): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, JoramD";
        displayName = CSTRING(Backpack_Kitbag_Medic_MTP);
        picture = QPATHTOF(UI\backpack_kitbag_medic_mtp_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_medic_mtp_co.paa)
        };
        maximumLoad = 320;
    };

    class CLASS(Backpack_Kitbag_Medic_Green): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, JoramD";
        displayName = CSTRING(Backpack_Kitbag_Medic_Green);
        picture = QPATHTOF(UI\backpack_kitbag_medic_green_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_medic_green_co.paa)
        };
        maximumLoad = 320;
    };

    class CLASS(Backpack_Kitbag_Medic_Sage): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, JoramD";
        displayName = CSTRING(Backpack_Kitbag_Medic_Sage);
        picture = QPATHTOF(UI\backpack_kitbag_medic_sage_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_medic_sage_co.paa)
        };
        maximumLoad = 320;
    };

    class CLASS(Backpack_Kitbag_Medic_Tan): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, JoramD";
        displayName = CSTRING(Backpack_Kitbag_Medic_Tan);
        picture = QPATHTOF(UI\backpack_kitbag_medic_tan_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_medic_tan_co.paa)
        };
        maximumLoad = 320;
    };

    class CLASS(Backpack_Kitbag_Medic_RGR): B_Kitbag_Base {
        dlc = QUOTE(PREFIX);
        scope = 2;
        author = "Bohemia Interactive, GilleeDoo, Tyrone";
        displayName = CSTRING(Backpack_Kitbag_Medic_RGR);
        picture = QPATHTOF(UI\backpack_kitbag_medic_rgr_ca.paa);
        hiddenSelectionsTextures[] = {
            QPATHTOF(data\backpack_kitbag_medic_rgr_co.paa)
        };
        maximumLoad = 320;
    };
};
