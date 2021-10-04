class CfgVehicles {
    class ReammoBox;
    class GVAR(weaponHolder): ReammoBox {
        scope = 1;
        author = "DerZade";
        _generalMacro = QGVAR(weaponHolder);
        scopeCurator = 0;
        model = QPATHtoF(model.p3d);
        accuracy = 0.2;
        mapsize = 1.39;
        class Transportmagazines {};
        forceSupply = 0;
        memoryPointSupply = "";
        supplyradius = 0;
        showweaponCargo = 1;
        transportmaxmagazines = 1e+009;
        transportmaxweapons = 1e+009;
        displayname = "backpackOnChest WH";
        destrtype = "DestructNo";
        transportmaxbackpacks = 0;
        isGround = 0;
        icon = "iconObject_1x1";
    };
    
    class logic;
    class module_F: logic {
        class ArgumentsBaseunits {
            class Units;
        };
        class moduleDescription {
            class AnyBrain;
        };
    };
    
    class GVAR(moduleAdd): module_F {
        scope = 2;
        displayname = $STR_TFS_boc_moduleAdddisp;
        icon = QPATHtoF(data\moduleAdd.paa);
        category = "TFS_boc";
        function = QFUNC(moduleAdd);
        functionpriority = 0;
        isGlobal = 0;
        istriggerActivated = 1;
        isDisposable = 0;
        is3DEN = 0;
        author = "DerZade";
        class Arguments : ArgumentsBaseunits {
            class units: units {};
            class classname {
                displayname = "Chestpack classname"; // Argument label
                description = "classname of the disered chestpack"; // tooltip description
                typeName = "STRING"; // Value type, can be "NUMBER", "strinG" or "BOOL"
                defaultValue = "B_Carryall_cbr";
            };
            class items {
                displayname = "Chestpack items";
                description = "items (includes mags, weapons, ...) which should be contained in the chestpack. items sperated by a ', '. Item can either be just a classname (for a single) or an array [classname, amount].";
                typeName = "STRING";
                defaultValue = "[""FirstAidKit"", 3], ""hgun_P07_F"", [""16Rnd_9x21_Mag"", 2]";
            };
            class mags {
                displayname = "Chestpack magazines";
                description = "Just for adding partially loaded mags. Mags seperated by a ', '. Syntax of single mag.: [magazine, ammo count]";
                typeName = "STRING";
                defaultValue = "[""30Rnd_65x39_caseless_mag"", 20], [""30Rnd_65x39_caseless_mag_Tracer"", 10]";
            };
            class code {
                displayname = "Additional code";
                description = "Any addition code to modify the chestpack. '_this' referes to the chestpack itself."; // Argument label
                typeName = "STRING"; // Value type, can be "NUMBER", "strinG" or "BOOL"
                defaultValue = "_this setObjectTextureGlobal [0, ""#(rgb,8,8,3)color(0,0,1,1)""];";
            };
        };
        class moduleDescription : moduleDescription {
            sync[]={"AnyPerson1","AnyPerson2"};
            description = $STR_TFS_boc_moduleAdddesc;
            class AnyPerson1 {
                description = "Short description";
                displayname = "Any blufor unit"; // Custom name
                icon = "iconMan"; // Custom icon (can be file path or CfgvehicleIcons entry)
                side = 1; // Custom side (will determine icon color)
            };
            class AnyPerson2 : AnyPerson1 {};
        };
    };
    
    class GVAR(moduleOnChest): module_F {
        scope = 2;
        displayname = $STR_TFS_boc_moduleOnChestdisp;
        icon = QPATHtoF(data\moduleOnChest.paa);
        category = "TFS_boc";
        function = QFUNC(moduleOnChest);
        functionpriority = 0;
        isGlobal = 0;
        istriggerActivated = 1;
        isDisposable = 0;
        is3DEN = 0;
        author = "DerZade";
        class Arguments : ArgumentsBaseunits {
            class units: units {};
            class classname {
                displayname = "backpack classname"; // Argument label
                description = "classname of the backpack which should be added after putting the backpack on chest."; // tooltip description
                typeName = "STRING"; // Value type, can be "NUMBER", "strinG" or "BOOL"
                defaultValue = "B_Parachute";
            };
            class delay {
                displayname = "Delay"; // Argument label
                description = ""; // tooltip description
                typeName = "NUMBER"; // Value type, can be "NUMBER", "strinG" or "BOOL"
                defaultValue = 0;
            };
        };
        class moduleDescription : moduleDescription {
            sync[]={"AnyPerson1","AnyPerson2"};
            description = $STR_TFS_boc_moduleOnChestdesc;
            class AnyPerson1 {
                description = "Short description";
                displayname = "Any blufor unit"; // Custom name
                icon = "iconMan"; // Custom icon (can be file path or CfgvehicleIcons entry)
                side = 1; // Custom side (will determine icon color)
            };
            class AnyPerson2 : AnyPerson1 {};
        };
    };
    
    class Man;
    class CAManBase: Man {
        class ACE_Selfactions {
            class ACE_Equipment {
                #include "ACE_SelfActions.hpp"
            };
        };
    };
};