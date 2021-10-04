#include "script_component.hpp"

class CfgPatches
{
    class TFS_Medical
    {
        author = AUTHor;
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

class CfgFunctions
{
    #include "cfgFunctions.hpp"
};

class Cfgvehicles
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
    #include "Medicalmodule.hpp"
};