#include "script_component.hpp"

// switch cargo locality to helicopter if possible
["Helicopter", "init", {
    params ["_heli"];
    
    _heli addEventHandler ["RopeAttach", {
        params ["_heli", "", "_cargo"];
        
        // Only transfer if cargo empty to avoid RPT warnings from 'setowner'
        // Transfer actually works in all cases except if driver is present,
        // but "Script command setowner cannot be used for object 'B_MRAP_01_F'.
        // Use setgroupOwner instead." is printed in RPT either way (BI T136908)
        if ((fullCrew _cargo) isEqualto []) then {
            private _heliowner = owner _heli;
            if (_heliowner != owner _cargo) then {
                _cargo setowner _heliowner;
            };
        };
    }];
}, true, [], true] call CBA_fnc_addClassEventHandler;