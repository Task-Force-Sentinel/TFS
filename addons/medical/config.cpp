#include "script_component.hpp"

class CfgPatches
{
    class TFS_Medical
    {
        author = AUTHER;
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
    #include "CfgFunctions.hpp"
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
            class moduleDescription;
            class Units;
        };
        
        class moduleDescription
        {
            class AnyBrain;
        };
    };
    #include "MedicalModule.hpp"
};