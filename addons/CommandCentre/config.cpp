#include "script_component.hpp"

class CfgPatches
{
    class TFS_CommandCentre
    {
        author = AUTHOR;
        name = name;
        url = URL;
        units[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_UI_F", "cba_main", "cba_xeh"
        };
        version = VERSION;
        authors[] = {
            "MitchJC", "Mokka"
        };
        weapons[] = {};
    };
};

class CfgVehicles
{
    class logic;
    class module_F : logic
    {
        class AttributesBase
        {
            class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
			class Units;
        };
        
        class moduleDescription
        {
            class AnyBrain;
        };
    };

    #include "ModuleCommsTower.hpp"
	#include "ModuleSingleScreen.hpp"
	#include "ModuleMultiScreen.hpp"
	#include "ModuleStationaryRadio.hpp"
	#include "ModuleVehicleCam.hpp"
};

class CfgfactionClasses
{
    class NO_CATEGORY;
    class TFS_CommandCentre : NO_CATEGORY
    {
        displayname = "TF Sentinel Command Center";
    };
};

#include "GUI\defines.hpp"
#include "GUI\DialogStationaryRadio.hpp"
#include "GUI\DialogScreen.hpp"

class CfgFunctions
{
    #include "CfgFunctions.hpp"
};