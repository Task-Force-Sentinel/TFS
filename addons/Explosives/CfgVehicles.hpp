class CfgVehicles
{
    class logic;
    class module_F: logic
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
            class Anyplayer;
            class AnyBrain;
            class EmptyDetector;
        };
    };
    
    #include "MakeIEDmodule.hpp"
};