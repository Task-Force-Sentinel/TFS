/*
 * File: \CfgGroups.hpp
 * Project: main
 * Github: https://github.com/TFS/ARMA_Mod
 * Created Date: Monday, May 11th 2020, 1:03:52 am
 * Author: YonV at <yonvclaw@gmail.com>
 * -----
 * Last Modified: Tue May 19 2020
 * Modified By: YonV
 * -----
 * Copyright (c) 2020 TFS
 *
 * Arma Public License Share Alike (APL-SA),
 * All shall be well and all shall be well and all manner of things shall be well.
 * Nope...we're doomed!
 * -----
 * HISTORY:
 * Date      	By	Comments
 * -----------------------------------------------------------------
 */


class CfgGroups {
    /* class WEST {
        class PREFIX {
            class TFS_infantry_squad {
                name = "Headhunter";
                faction = QUOTE(PREFIX);
                side = 1;
                icon = "\A3\ui_f\data\map\markers\nato\b_recon.paa";
                rarityGroup = 0.5;

                class Unit0 {
                    side = 1;
                    vehicle = QCLASS(platoon_leader);
                    rank = "LIEUTENANT";
                    position[] = {0,5,0};
                };
                class Unit1 {
                    side = 1;
                    vehicle = QCLASS(platoon_sgt);
                    rank = "SERGEANT";
                    position[] = {-5,0,0};
                };
                class Unit2 {
                    side = 1;
                    vehicle = QCLASS(platoon_rto),;
                    rank = "CORPORAL";
                    position[] = {3,0,0};
                };
                class Unit3 {
                    side = 1;
                    vehicle = QCLASS(platoon_medic);
                    rank = "CORPORAL";
                    position[] = {5,0,0};
                };
                class Unit4 {
                    side = 1;
                    vehicle = QCLASS(squad_leader);
                    rank = "SERGEANT";
                    position[] = {7,0,0};
                };
                class Unit5 {
                    side = 1;
                    vehicle = QCLASS(squad_medic);
                    rank = "PRIVATE";
                    position[] = {9,0,0};
                };
                class Unit6 {
                    side = 1;
                    vehicle = QCLASS(teamleader);
                    rank = "CORPORAL";
                    position[] = {11,0,0};
                };
                class Unit7 {
                    side = 1;
                    vehicle = QCLASS(autorifleman);
                    rank = "PRIVATE";
                    position[] = {13,0,0};
                };
                class Unit8 {
                    side = 1;
                    vehicle = QCLASS(grenadier);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit9 {
                    side = 1;
                    vehicle = QCLASS(rifleman);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit10 {
                    side = 1;
                    vehicle = QCLASS(teamleader);
                    rank = "CORPORAL";
                    position[] = {11,0,0};
                };
                class Unit11 {
                    side = 1;
                    vehicle = QCLASS(autorifleman);
                    rank = "PRIVATE";
                    position[] = {13,0,0};
                };
                class Unit12 {
                    side = 1;
                    vehicle = QCLASS(grenadier);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit13 {
                    side = 1;
                    vehicle = QCLASS(rifleman);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit14 {
                    side = 1;
                    vehicle = QCLASS(squad_leader);
                    rank = "SERGEANT";
                    position[] = {7,0,0};
                };
                class Unit15 {
                    side = 1;
                    vehicle = QCLASS(squad_medic);
                    rank = "PRIVATE";
                    position[] = {9,0,0};
                };
                class Unit16 {
                    side = 1;
                    vehicle = QCLASS(teamleader);
                    rank = "CORPORAL";
                    position[] = {11,0,0};
                };
                class Unit17 {
                    side = 1;
                    vehicle = QCLASS(autorifleman);
                    rank = "PRIVATE";
                    position[] = {13,0,0};
                };
                class Unit18 {
                    side = 1;
                    vehicle = QCLASS(grenadier);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit19 {
                    side = 1;
                    vehicle = QCLASS(rifleman);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit20 {
                    side = 1;
                    vehicle = QCLASS(teamleader);
                    rank = "CORPORAL";
                    position[] = {11,0,0};
                };
                class Unit21 {
                    side = 1;
                    vehicle = QCLASS(autorifleman);
                    rank = "PRIVATE";
                    position[] = {13,0,0};
                };
                class Unit22 {
                    side = 1;
                    vehicle = QCLASS(grenadier);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit23 {
                    side = 1;
                    vehicle = QCLASS(rifleman);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit24 {
                    side = 1;
                    vehicle = QCLASS(squad_leader);
                    rank = "SERGEANT";
                    position[] = {7,0,0};
                };
                class Unit25 {
                    side = 1;
                    vehicle = QCLASS(squad_medic);
                    rank = "PRIVATE";
                    position[] = {9,0,0};
                };
                class Unit26 {
                    side = 1;
                    vehicle = QCLASS(teamleader);
                    rank = "CORPORAL";
                    position[] = {11,0,0};
                };
                class Unit27 {
                    side = 1;
                    vehicle = QCLASS(autorifleman);
                    rank = "PRIVATE";
                    position[] = {13,0,0};
                };
                class Unit28 {
                    side = 1;
                    vehicle = QCLASS(grenadier);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit29 {
                    side = 1;
                    vehicle = QCLASS(rifleman);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };

                class Unit30 {
                    side = 1;
                    vehicle = QCLASS(teamleader);
                    rank = "CORPORAL";
                    position[] = {11,0,0};
                };
                class Unit31 {
                    side = 1;
                    vehicle = QCLASS(autorifleman);
                    rank = "PRIVATE";
                    position[] = {13,0,0};
                };
                class Unit32 {
                    side = 1;
                    vehicle = QCLASS(grenadier);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
                class Unit33 {
                    side = 1;
                    vehicle = QCLASS(rifleman);
                    rank = "PRIVATE";
                    position[] = {15,0,0};
                };
            };
        }; 
    }; */
};

