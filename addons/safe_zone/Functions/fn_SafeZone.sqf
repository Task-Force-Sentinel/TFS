/*
Function: TFS_fnc_SafeZone

Description:
Create a safezone where shooting is prohibited around given position. Duration of the
safezone can be set.

Arguments:
_SafeZonesize - size of the safezone in metres <SCALAR>
_SafeZoneDuration - Duration in seconds for how long the safezone shall be active <SCALAR>
_SafeZoneLocation - position of the safezone <position 3D>

Return Value:
None

Example:
nothing to see here

Author:
MitchJC
*/

params [
    "_SafeZonesize",
    "_SafeZoneDuration",
    "_SafeZoneLocation"
];

// compile code from boilerplate string with the applicable values (pos, area) hardcoded by replacing the %x
_ehCode = compileFinal format [
    "params [""_unit"", ""_weapon"", ""_muzzle"", ""_mode"", ""_ammo"", ""_mag"", ""_projectile"", ""_veh""];
    if (_weapon in [""CMFlareLauncher"", ""CMFlareLauncher_singles"", ""CMFlareLauncher_Triples"", ""UK3CB_BAF_CMFlareLauncher"", ""UK3CB_BAF_IRJammer"", ""rhsusf_weap_CMFlareLauncher""]) exitwith {
        true
    };
    if !(cameraOn isEqualto (vehicle player)) exitwith {
        true
    };
    _checkObject = [_veh, _unit] select isNull _veh;
    if (_checkObject distance2D %1 < %2) exitwith {
        deletevehicle _projectile;
        hintC ""Denied."";
        playSound ""Denied"";
    }",
    _SafeZoneLocation,
    _SafeZonesize
];

// Just use this code in the eh
private _SafeZoneEHID = player addEventHandler [
    "firedMan", _ehCode
];

// SafeZone Duration Check

[{
    params ["_args", "_pfhID"];
    _args params ["_SafeZoneDuration", "_SafeZoneEHID"];
    
    if (_SafeZoneDuration <= 0) then {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    } else {
        if (servertime > (_SafeZoneDuration * 60)) then {
            player removeEventHandler ["firedMan", _SafeZoneEHID];
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        };
    };
}, 60, [_SafeZoneDuration, _SafeZoneEHID]] call CBA_fnc_addPerFrameHandler;