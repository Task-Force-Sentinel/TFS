class CfgVehicles
{
    class logic;
    class module_F: logic
    {
        class ArgumentsBaseunits
        {
            class units;
        };
        class moduleDescription
        {
            class AnyBrain;
            class Anyplayer;
            class EmptyDetector;
        };
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
    };
    #include "modules\area.hpp"
    #include "modules\wavespawner.hpp"
    #include "modules\huntmodule.hpp"
    #include "modules\rearm.hpp"
    #include "modules\garrison.hpp"
    #include "modules\arty.hpp"
    #include "modules\AIspawnseastmodule.hpp"
    #include "modules\AIspawnsindependentmodule.hpp"
    #include "modules\AIspawnswestmodule.hpp"
    #include "modules\civilianspawnsmodule.hpp"
};