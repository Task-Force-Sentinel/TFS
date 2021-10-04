class CfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class ArgumentsBaseUnits
        {
            class Units;
        };
        class ModuleDescription
        {
            class AnyBrain;
            class AnyPlayer;
            class EmptyDetector;
        };
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
    };
    #include "modules\area.hpp"
    #include "modules\waveSpawner.hpp"
    #include "modules\huntModule.hpp"
    #include "modules\rearm.hpp"
    #include "modules\garrison.hpp"
    #include "modules\arty.hpp"
    #include "modules\AISpawnsEastModule.hpp"
    #include "modules\AISpawnsIndependentModule.hpp"
    #include "modules\AISpawnsWestModule.hpp"
    #include "modules\CivilianSpawnsModule.hpp"
};
