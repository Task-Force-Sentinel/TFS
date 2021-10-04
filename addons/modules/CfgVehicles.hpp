class CfgVehicles {
    // modULES
    
    class logic;
    class module_F: logic {
        class AttributesBase {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class moduleDescription;
        };
        class moduleDescription {
            class AnyBrain;
        };
    };
    
    #include "modules\ambientSound.hpp"
    #include "modules\triggerSound.hpp"
    #include "modules\globalSpeech.hpp"
    #include "modules\triggerSpeech.hpp"
};