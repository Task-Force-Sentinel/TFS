class CfgVehicles {
    class Logic;

    class Module_F : Logic {
        class ModuleDescription {
            class AnyPlayer;
        };
    };

    // EO Animals Module - Extended
    // https://forums.bohemia.net/forums/topic/218801-sullen-skies-ambient-animals-animals-module-extended/
    class ModuleAnimals_F : Module_F {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ModuleAnimals_F";
        scope = 2;
        isGlobal = 0;
        isTriggerActivated = 1;
        displayName = "$STR_A3_CfgVehicles_ModuleAnimals_F";
        function = "BIS_fnc_moduleAnimals";
        icon = "\a3\Modules_F_Curator\Data\iconAnimals_ca.paa";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";

        class Arguments {
            class Type {
                displayName = "$STR_A3_CfgVehicles_ModuleAnimals_F_Arguments_Type";

                class values {
                    class Sheep {
                        name = "$STR_A3_CfgVehicles_ModuleAnimalsSheep_F";
                        value = "Sheep_random_F";
                        default = 1;
                    };

                    class Goats {
                        name = "$STR_A3_CfgVehicles_ModuleAnimalsGoats_F";
                        value = "Goat_random_F";
                    };

                    class Poultry {
                        name = "$STR_A3_CfgVehicles_ModuleAnimalsPoultry_F";
                        value = "Hen_random_F";
                    };

                    class Seagulls {
                        name = "$STR_A3_CfgVehicles_ModuleAnimalsSeagulls_F";
                        value = "Seagull";
                    };

                    class Butterflies {
                        name = "$STR_A3_CfgVehicles_ModuleAnimalsButterflies_F";
                        value = "ButterFly_random";
                    };

                    class Crows {
                        name = "Crows";
                        value = "Crowe";
                    };

                    class Eagles {
                        name = "Eagles";
                        value = "Eagle_F";
                    };

                    class Kestrels {
                        name = "Kestrels";
                        value = "Kestrel_random_F";
                    };

                    class Bees {
                        name = "Bees";
                        value = "HoneyBee";
                    };

                    class Dragonflies {
                        name = "Dragonflies";
                        value = "DragonFly";
                    };

                    class Fireflies {
                        name = "Fireflies";
                        value = "FireFly";
                    };

                    class Mosquitoes {
                        name = "Mosquitoes";
                        value = "Mosquito";
                    };

                    class Houseflies {
                        name = "Houseflies";
                        value = "HouseFly";
                    };

                    class Rabbits {
                        name = "Rabbits";
                        value = "Rabbit_F";
                    };

                    class Dogs {
                        name = "Dogs";
                        value = "Alsatian_Random_F";
                    };

                    class Cocks {
                        name = "Cocks";
                        value = "Cock_random_F";
                    };

                    class Turtles {
                        name = "Turtles";
                        value = "Turtle_F";
                    };

                    class Snakes {
                        name = "Snakes";
                        value = "Snake_random_F";
                    };

                    class Catsharks {
                        name = "Catsharks";
                        value = "CatShark_F";
                    };

                    class Mackerel {
                        name = "Mackerel";
                        value = "Mackerel_F";
                    };

                    class Mullet {
                        name = "Mullet";
                        value = "Mullet_F";
                    };

                    class Ornate {
                        name = "Ornate";
                        value = "Ornat_random_F";
                    };

                    class Salema {
                        name = "Salema";
                        value = "Salema_F";
                    };

                    class Tuna {
                        name = "Tuna";
                        value = "Tuna_F";
                    };
                };
            };

            class Count {
                displayName = "$STR_A3_CfgVehicles_ModuleAnimals_F_Arguments_Count";
                typeName = NUMBER;
                defaultValue = 10;
            };
        };

        class ModuleDescription : ModuleDescription {
            description = "$STR_A3_CfgVehicles_ModuleAnimals_F_ModuleDescription";
            position = 1;
        };
    };

    class ModuleAnimalsSheep_F : ModuleAnimals_F {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ModuleAnimalsSheep_F";
        scope = 1;
        scopeCurator = 2;
        displayName = "$STR_A3_CfgVehicles_ModuleAnimalsSheep_F";
        category = "Animals";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsSheep_ca.paa";
        animalType = "Sheep_random_F";
    };

    class ModuleAnimalsGoats_F : ModuleAnimalsSheep_F {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ModuleAnimalsGoats_F";
        displayName = "$STR_A3_CfgVehicles_ModuleAnimalsGoats_F";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsGoats_ca.paa";
        animalType = "Goat_random_F";
    };

    class ModuleAnimalsPoultry_F : ModuleAnimalsSheep_F {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ModuleAnimalsPoultry_F";
        displayName = "$STR_A3_CfgVehicles_ModuleAnimalsPoultry_F";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsPoultry_ca.paa";
        animalType = "Hen_random_F";
    };

    class ModuleAnimalsSeagulls_F : ModuleAnimalsSheep_F {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ModuleAnimalsSeagulls_F";
        displayName = "$STR_A3_CfgVehicles_ModuleAnimalsSeagulls_F";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsSeagulls_ca.paa";
        animalType = "Seagull";
        animalSound = "moduleSeagulls";
    };

    class ModuleAnimalsButterflies_F : ModuleAnimalsSheep_F {
        author = "$STR_A3_Bohemia_Interactive";
        _generalMacro = "ModuleAnimalsButterflies_F";
        displayName = "$STR_A3_CfgVehicles_ModuleAnimalsButterflies_F";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsButterflies_ca.paa";
        animalType = "ButterFly_random";
    };

    class ModuleAnimalsCrows_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsCrows_F";
        displayName = "Crows";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsSeagulls_ca.paa";
        animalType = "Crowe";
        animalSound = "A3\Animals_F\Seagull\Data\crowe";
    };

    class ModuleAnimalsEagles_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsEagles_F";
        displayName = "Eagles";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsSeagulls_ca.paa";
        animalType = "Eagle_F";
        animalSound = "A3\data_f_curator\sound\cfgNonAiVehicles\eagle_f_3";
    };

    class ModuleAnimalsKestrels_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsKestrels_F";
        displayName = "Kestrels";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsSeagulls_ca.paa";
        animalType = "Kestrel_random_F";
        animalSound = "A3\data_f_curator\sound\cfgNonAiVehicles\eagle_f_3";
    };

    class ModuleAnimalsBees_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsBees_F";
        displayName = "Bees";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsButterflies_ca.paa";
        animalType = "HoneyBee";
        animalSound = "A3\sounds_f\dummysound";
    };

    class ModuleAnimalsDragonflies_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsDragonflies_F";
        displayName = "Dragonflies";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsButterflies_ca.paa";
        animalType = "DragonFly";
        animalSound = "A3\sounds_f\dummysound";
    };

    class ModuleAnimalsFireflies_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsFireflies_F";
        displayName = "Fireflies";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsButterflies_ca.paa";
        animalType = "FireFly";
        animalSound = "A3\sounds_f\dummysound";
    };

    class ModuleAnimalsMosquitoes_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsMosquitoes_F";
        displayName = "Mosquitoes";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsButterflies_ca.paa";
        animalType = "Mosquito";
        animalSound = "A3\sounds_f\dummysound";
    };

    class ModuleAnimalsHouseflies_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsHouseflies_F";
        displayName = "Houseflies";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsButterflies_ca.paa";
        animalType = "HouseFly";
        animalSound = "A3\sounds_f\dummysound";
    };

    class ModuleAnimalsRabbits_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsRabbits_F";
        displayName = "Rabbits";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Rabbit_F";
        animalSound = "A3\sounds_f\dummysound";
    };

    class ModuleAnimalsDogs_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsDogs_F";
        displayName = "Dogs";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Alsatian_Random_F";
        animalSound = "A3\sounds_f\dummysound";
    };

    class ModuleAnimalsCock_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsCock_F";
        displayName = "Cocks";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimalsPoultry_ca.paa";
        animalType = "Cock_random_F";
    };

    class ModuleAnimalsTurtles_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsTurtles_F";
        displayName = "Turtles";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Turtle_F";
    };

    class ModuleAnimalsSnakes_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsSnakes_F";
        displayName = "Snakes";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Snake_random_F";
    };

    class ModuleAnimalsCatSharks_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsCatSharks_F";
        displayName = "CatSharks";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Catshark_F";
    };

    class ModuleAnimalsMackerel_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsMackerel_F";
        displayName = "Mackerel";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Mackerel_F";
    };

    class ModuleAnimalsMullet_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsMullet_F";
        displayName = "Mullet";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Mullet_F";
    };

    class ModuleAnimalsOrnate_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsOrnate_F";
        displayName = "Ornate";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Ornate_random_F";
    };

    class ModuleAnimalsSalema_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsSalema_F";
        displayName = "Salema";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Salema_F";
    };

    class ModuleAnimalsTuna_F : ModuleAnimalsSheep_F {
        author = "EO";
        _generalMacro = "ModuleAnimalsTuna_F";
        displayName = "Salema";
        portrait = "\a3\Modules_F_Curator\Data\portraitAnimals_ca.paa";
        animalType = "Tuna_F";
    };

    // EO Enhanced Tents
    // https://forums.bohemia.net/forums/topic/225055-enhanced-tents/
    class NonStrategic;
    class Camping_base_F: NonStrategic {
        author="$STR_A3_Bohemia_Interactive";
        scope=0;
        scopeCurator=0;
        displayName="";
        model="\A3\Weapons_F\empty.p3d";
        icon="iconObject";
        editorCategory="EdCat_Things";
        editorSubcategory="EdSubcat_Camping";
        vehicleClass="Tents";
        destrType="DestructTent";
        maximumLoad=2000;
        mass=10;
        transportMaxWeapons=10;
        transportMaxMagazines=50;
        transportMaxBackpacks=5;
        transportAmmo=0;
        transportRepair=0;
        transportFuel=0;
        supplyRadius=1.5;
        cost=0;
        class DestructionEffects {
        };

        class TransportItems {
            class _xx_FirstAidKit {
                name="FirstAidKit";
                count=2;
            };
            class _xx_ItemCompass {
                name="ItemCompass";
                count=1;
            };
            class _xx_ItemMap {
                name="ItemMap";
                count=1;
            };
        };
        class SimpleObject {
            eden=1;
            animate[]={};
            hide[]={};
            verticalOffset=0.61900002;
            verticalOffsetWorld=0;
            init="''";
        };
    };
};
