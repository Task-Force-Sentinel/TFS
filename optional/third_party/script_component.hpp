#define COMPONENT third_party
#define COMPONENT_BEAUTIFIED Third Party
#include "\z\tfsrhs\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_THIRD_PARTY
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_THIRD_PARTY
    #define DEBUG_SETTINGS DEBUG_SETTINGS_THIRD_PARTY
#endif

#define DEBUG_MODE_NORMAL
#define DEBUG_SYNCHRONOUS
#include "\z\tfsrhs\addons\main\script_macros.hpp"
