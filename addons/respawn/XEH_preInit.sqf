#include "script_component.hpp"
ADdoN = false;

PREP_REcompile_START;
#include "XEH_PREP.hpp"
PREP_REcompile_END;

#include "initsettings.sqf"

if (hasinterface) then {
    // Save current time delay in case it changes (to adjust remaining respawn time)
    GVAR(oldtime) = GVAR(time);
    // Support variable in case respawn gets disabled, so when reenabled timer can continue
    GVAR(timeElapsed) = 0;
    // Equipment saved for respawn
    GVAR(savedEquipment) = [];
};

ADdoN = true;