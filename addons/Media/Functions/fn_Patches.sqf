/*
Function: TFSRHS_fnc_Patches

Description:
	Apply Section Patches to Players/Vehicles

Arguments:
	_unit - Player the Patch is applied to. <OBJECT>
	_Section - The Section the Player is in. <STRING>

Examples:
	(begin example)
		[this, "1Section"] call tfsrhs_fnc_Patches;
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
	if (_Section == "ds990") exitwith {_PatchClass = "ds990";};
	if (_Section == "da991") exitwith {_PatchClass = "da991";};
	if (_Section == "da992") exitwith {_PatchClass = "da992";};
	if (_Section == "da993") exitwith {_PatchClass = "da993";};
	if (_Section == "da994") exitwith {_PatchClass = "da994";};
	if (_Section == "da995") exitwith {_PatchClass = "da995";};
	if (_Section == "da996") exitwith {_PatchClass = "da996";};
	if (_Section == "da997") exitwith {_PatchClass = "da997";};
	if (_Section == "da998") exitwith {_PatchClass = "da998";};
	if (_Section == "ds999") exitwith {_PatchClass = "ds999";};
	_PatchClass = "bolo";
};

// ===== Apply the Patch to player.

[BIS_fnc_setUnitInsignia, [_unit,_PatchClass], 5] call CBA_fnc_waitAndExecute;

// ======= When Player Repsawns, apply the patch they had when they died.
_unit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_OldPatch = _corpse call BIS_fnc_getUnitInsignia;

	[_unit, ""] call BIS_fnc_setUnitInsignia;
	[BIS_fnc_setUnitInsignia, [_unit,_OldPatch], 5] call CBA_fnc_waitAndExecute;
}];
