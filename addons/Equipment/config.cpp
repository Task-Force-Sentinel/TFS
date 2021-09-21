#include "script_component.hpp"

class CfgPatches
{
	class TFSRHS_Equipment
	{
		author = AUTHOR;
        name = COMPONENT_NAME;
		url = URL;
		units[] = {
            "TFSRHS_Item_Vector_Designator",
            "TFSRHS_Item_optic_Nightstalker",
            "TFSRHS_Item_optic_AMS",
            "TFSRHS_Item_optic_AMS_khk",
            "TFSRHS_Item_optic_AMS_snd",
            "TFSRHS_Item_optic_AMSTI",
            "TFSRHS_Item_optic_AMSTI_khk",
            "TFSRHS_Item_optic_AMSTI_snd"
        };
        weapons[] = {
            "TFSRHS_Vector_Designator",
            "TFSRHS_optic_Nightstalker",
            "TFSRHS_optic_AMS_base",
            "TFSRHS_optic_AMS",
            "TFSRHS_optic_AMS_khk",
            "TFSRHS_optic_AMS_snd",
            "TFSRHS_optic_AMSTI_base",
            "TFSRHS_optic_AMSTI",
            "TFSRHS_optic_AMSTI_khk",
            "TFSRHS_optic_AMSTI_snd"
        };
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "A3_UI_F",
            "cba_main",
            "cba_xeh",
            "ace_vector",
            "A3_Weapons_F",
            "cba_jr"
        };
		version = VERSION;
		authors[] = {"MitchJC"};
	};
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
};

#include "cfg3Den.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "jr_classes.hpp"
#include "RscInGameUI.hpp"
#include "CfgEventHandlers.hpp"


class Extended_InitPost_EventHandlers {
    class ReammoBox_F {
        class Storage_MedicalSupplies {
            init = "[_this select 0] call TFSRHS_fnc_MedicalSupplies";
        };
        class Storage_Ammobox {
            init = "[_this select 0] call TFSRHS_fnc_Ammobox";
        };
    };
    class Car {
        class Car_MedicalSupplies {
            init = "[_this select 0] call TFSRHS_fnc_MedicalSupplies";
        };
        class Car_Ammobox {
            init = "[_this select 0] call TFSRHS_fnc_Ammobox";
        };
    };
    class Tank {
        class Tank_MedicalSupplies {
            init = "[_this select 0] call TFSRHS_fnc_MedicalSupplies";
        };
        class Tank_Ammobox {
            init = "[_this select 0] call TFSRHS_fnc_Ammobox";
        };
    };
    class Motorcycle {
        class Motorcycle_MedicalSupplies {
            init = "[_this select 0] call TFSRHS_fnc_MedicalSupplies";
        };
        class Motorcycle_Ammobox {
            init = "[_this select 0] call TFSRHS_fnc_Ammobox";
        };
    };
    class Helicopter {
        class Helicopter_MedicalSupplies {
            init = "[_this select 0] call TFSRHS_fnc_MedicalSupplies";
        };
        class Helicopter_Ammobox {
            init = "[_this select 0] call TFSRHS_fnc_Ammobox";
        };
    };
    class Plane {
        class Plane_MedicalSupplies {
            init = "[_this select 0] call TFSRHS_fnc_MedicalSupplies";
        };
        class Plane_Ammobox {
            init = "[_this select 0] call TFSRHS_fnc_Ammobox";
        };
    };
    class Ship_F {
        class Ship_MedicalSupplies {
            init = "[_this select 0] call TFSRHS_fnc_MedicalSupplies";
        };
        class Ship_Ammobox {
            init = "[_this select 0] call TFSRHS_fnc_Ammobox";
        };
    };
};
