/*
Function: TFS_fnc_spawnCivZeusWrapper

Description:
Wraps calls to TFS_fnc_spawncivilians for use with the Zeus modules.

Arguments:
_pos - position of the module <ARRAY/POS3D>

Return Values:
None

Examples:
nothing to see here

Author:
Mokka
*/

#define CIV_factionS ["default civilians (Altis)", "@3CB factions - civilians (Chernarus)", "@3CB factions - civilians (Takistan)", "@CFP - civilians (Afghanistan)", "@CFP - civilians (African Christian)", "@CFP - civilians (African Islamic)", "@CFP - civilians (Asian)", "@CUP - civilians (Chernarus)", "@CUP - civilians (Middle eastern)", "@CUP - civilians (Russian)", "@CUP - civilians (Takistan)"]
#define CIV_factionS_LOOKUP ["CIV_F", "UK3CB_CHC_C", "UK3CB_TKC_C", "CFP_C_AFG", "CFP_C_AFRCHRISTIAN", "CFP_C_AFRISLAMIC", "CFP_C_ASIA", "CUP_C_CHERNARUS", "CUP_C_SAHRANI", "CUP_C_RU", "CUP_C_TK"]

params [["_pos", [0, 0, 0]]];

if (_pos isEqualto [0, 0, 0]) exitwith {
    ["Couldn't process wrapper call", "Errorlog"] call YAinA_F_fnc_log;
};

// Holds the array of factions that are available for selection, based on side
_prettynames = CIV_factionS;

// Is used to match the selected faction with the the internal name, by index
_lookup = CIV_factionS_LOOKUP;

private _dialogResult = [
    "spawn AI - civilian",
    [
        ["EDIT", "Objective name", ["Objective Alpha"]],
        ["COMBO", "faction", [_lookup, _prettynames, 0]],
        ["COMBO", "side", [[civilian/*, west, east, independent*/], ["civilian"/*, "blufor", "opfor", "independent"*/], 0]], // todo: fix this someday
        ["EDIT", "Garrison radius", ["100"]],
        ["EDIT", "min. Garrisoned units", ["0"]],
        ["EDIT", "max. Garrisoned units", ["0"]],
        ["EDIT", "spawn radius", ["500"]],
        ["EDIT", "min. Pedestrian Patrols", ["0"]],
        ["EDIT", "max. Pedestrian Patrols", ["0"]],
        ["EDIT", "min. vehicle Patrols", ["0"]],
        ["EDIT", "max. vehicle Patrols", ["0"]],
        ["EDIT", "min. Parked vehicles", ["0"]],
        ["EDIT", "max. Parked vehicles", ["0"]]
    ],
    {
        params ["_results", "_args"];
        
        _args params ["_pos"];
        
        _procResults = [];
        
        {
            _value = _x;
            
            // Process number inputs and make sure they're integers
            if (_forEachindex > 2) then {
                _value = round (parseNumber _x);
            };
            
            _procResults pushBack _value;
        } forEach _results;
        
        _procResults params [
            "_grpPrefix",
            "_faction",
            "_side",
            "_garrradius",
            "_garrisonsmin", "_garrisonsmax",
            "_radius",
            "_pedmin", "_pedmax",
            "_vehPatrolsmin", "_vehPatrolsmax",
            "_vehParkedmin", "_vehParkedmax"
        ];
        
        // Actually call spawncivilians, do it remotely so the server has the units and takes care of them c:
        [
            _pos,
            _grpPrefix,
            _faction,
            _side,
            _Garrradius,
            [_garrisonsmin, _garrisonsmax],
            _radius,
            [_pedmin, _pedmax],
            [_vehPatrolsmin, _vehPatrolsmax],
            [_vehParkedmin, _vehParkedmax]
        ] remoteExec ["TFS_fnc_spawncivilians", 2];
    },
    {},
    [_pos]
] call zen_dialog_fnc_create;

if !(_dialogResult) exitwith {
    ["Failed to create zen dialog!", "Errorlog"] call YAinA_F_fnc_log;
};