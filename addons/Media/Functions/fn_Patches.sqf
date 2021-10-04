/*
Function: TFS_fnc_Patches

Description:
apply Section Patches to players/vehicles

Arguments:
_unit - player the Patch is applied to. <OBJECT>
_Section - The Section the player is in. <strinG>

Examples:
(begin example)
[this, "1Section"] call tfs_fnc_Patches;
(end)

Author:
MitchJC
*/

params [
    "_unit",
    ["_Section", "Support"]
];

private ["_PatchClass"];
call {
    if (_Section == "HeadhunterHHC") exitwith {
        _PatchClass = "logo";
    };
    if (_Section == "Headhunter1") exitwith {
        _PatchClass = "logo";
    };
    if (_Section == "Headhunter2") exitwith {
        _PatchClass = "logo";
    };
    if (_Section == "Headhunter3") exitwith {
        _PatchClass = "logo";
    };
    if (_Section == "Arrow") exitwith {
        _PatchClass = "logo";
    };
    if (_Section == "Outlaw") exitwith {
        _PatchClass = "logo";
    };
    if (_Section == "Sentinel") exitwith {
        _PatchClass = "logo";
    };
    _PatchClass = "bolo";
};

// ===== apply the Patch to player.

[BIS_fnc_setUnitinsignia, [_unit, _PatchClass], 5] call CBA_fnc_waitandexecute;

// ======= When player Repsawns, apply the patch they had when they died.
_unit addEventHandler ["Respawn", {
    params ["_unit", "_corpse"];
    _OldPatch = _corpse call BIS_fnc_getUnitinsignia;
    
    [_unit, ""] call BIS_fnc_setUnitinsignia;
    [BIS_fnc_setUnitinsignia, [_unit, _OldPatch], 5] call CBA_fnc_waitandexecute;
}];