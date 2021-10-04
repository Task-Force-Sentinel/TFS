#include "script_component.hpp"

class CfgPatches
{
    class TFS_CommandCentre
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
            "MitchJC", "Mokka"
        };
        weapons[] = {};
    };
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
    
    #include "moduleCommstower.hpp"
    #include "modulesingleScreen.hpp"
    #include "moduleMultiScreen.hpp"
    #include "moduleStationaryradio.hpp"
    #include "modulevehicleCam.hpp"
};

class CfgfactionClasses
{
    class NO_CATEGorY;
    class TFS_CommandCentre : NO_CATEGorY
    {
        displayname = "TF Sentinel Command Center";
    };
};

#include "GUI\defines.hpp"
#include "GUI\dialogStationaryradio.hpp"
#include "GUI\dialogScreen.hpp"

class CfgFunctions
{
    #include "cfgFunctions.hpp"
};