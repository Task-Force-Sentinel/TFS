#include "script_component.hpp"

class CfgPatches
{
    class TFS_SafeZone
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
            "MitchJC"
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
            class default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class moduleDescription;
            class units;
        };
        
        class moduleDescription
        {
            class AnyBrain;
        };
    };
    #include "SafeZonemodule.hpp"
};

class CfgFunctions
{
    #include "cfgFunctions.hpp"
};