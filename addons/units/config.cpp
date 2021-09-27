#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QCLASS(platoon_leader),
            QCLASS(platoon_sgt),
            QCLASS(platoon_rto),
            QCLASS(platoon_medic),
            QCLASS(squad_leader),
            QCLASS(squad_medic),
            QCLASS(teamleader),
            QCLASS(rifleman),
            QCLASS(grenadier),
            QCLASS(autorifleman),
            QCLASS(helipilot),
            QCLASS(socom),
            QCLASS(officer),
            QCLASS(staff),
            QCLASS(Engineer),
            QCLASS(Marksman),

        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        author = AUTHOR;
        authors[] = {"YonV"};
        url = URL;
        VERSION_CONFIG;
    };
};
#include "CfgVehicles.hpp"
#include "CfgGroups.hpp"
