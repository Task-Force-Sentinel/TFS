#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_display"];

GVAR(spectatorlist) = [];
GVAR(selectedRespawngroup) = [];
GVAR(respawn_rank) = 0;
// initialize

if (isnil QGVAR(lastfactionselection)) then {
    GVAR(lastfactionselection) = [0, 0];
};
// GVAR(selectedRespawngroup) format
// rank: int (0-6), Object: player, Role: int (0 -> count respawnMenuRoles)

// Propogate the list of dead players.
if (!isMultiplayer) then {
    GVAR(spectatorlist) append allunits;
} else {
    {
        if (isplayer _x) then {
            // not all of them will be players.
            GVAR(spectatorlist) pushBack _x;
        };
    } forEach ([0, 0, 0] nearEntities ["TFS_spectator_unit", 500]);
    {
        if (!alive _x) then {
            // not all of them will be players.
            GVAR(spectatorlist) pushBackUnique _x;
        };
    } forEach allplayers;
};

private _control = (_display displayCtrl IDC_TFS_adminMENU_RESP_factionCATEGorY);
/* respawnMenufactionCategoryCombo */
lbClear _control;
private _missionConfig = (configProperties [missionConfigFile >> "Cfgloadouts", "isClass _x"]);
private _index = -1;

// Handle all the factions

// Build up a pool of who is using what faction from assign gear.
private _playerfactions = [] call CBA_fnc_hashCreate;
{
    private _faction = _x getVariable ["TFS_assignGear_faction", ""];
    if (_faction != "") then {
        if ([_playerfactions, _faction] call CBA_fnc_hashHasKey) then {
            private _value = [_playerfactions, _faction] call CBA_fnc_hashGet;
            [_playerfactions, _faction, _value + 1] call CBA_fnc_hashset;
        } else {
            [_playerfactions, _faction, 1] call CBA_fnc_hashset;
        };
    };
} forEach (allplayers);

if (count _missionConfig > 0) then {
    private _players = 0;
    {
        private _factionname = (toLower(configname _x));
        if ([_playerfactions, _factionname] call CBA_fnc_hashHasKey) then {
            _players = _players + ([_playerfactions, _factionname] call CBA_fnc_hashGet);
        };
    } forEach _missionConfig;
    
    private _text = "from Mission File";
    if (_players > 0) then {
        _text = format ["from Mission File (%1p)", _players];
    };
    private _index = _control lbAdd _text;
    _control lbsetData [_index, "mission"];
};

private _factionCategories = [];
private _factionCategoryplayercounts = [];
{
    private _category = gettext (_x >> "category");
    if (_category isEqualto "") then {
        _category = "Other";
    };
    private _configname = toLower (configname _x);
    private _players = 0;
    // Mission faction class overrides so show 0 if configFile class is of same name.
    if (!isClass (missionConfigFile >> "Cfgloadouts" >> _configname)) then {
        if ([_playerfactions, _configname] call CBA_fnc_hashHasKey) then {
            _players = [_playerfactions, _configname] call CBA_fnc_hashGet;
        };
    };
    
    private _idx = _factionCategories find _category;
    if (_idx == -1) then {
        _idx = _factionCategories pushBack _category;
        _factionCategoryplayercounts set [_idx, _players];
    } else {
        _factionCategoryplayercounts set [_idx, (_factionCategoryplayercounts select _idx) + _players];
    };
} forEach (configProperties [configFile >> "Cfgloadouts", "isClass _x"]);

// Combine array for sorting.
{
    _factionCategories set [_forEachindex, [_x, _factionCategoryplayercounts select _forEachindex]]
} forEach _factionCategories;

// sort Alphabetically.
_factionCategories sort true;

{
    _x params ["_factionname", "_players"];
    private _displaytext = _factionname;
    if (_players > 0) then {
        _displaytext = format ["%1 (%2p)", _displaytext, _players];
    };
    private _index = _control lbAdd _displaytext;
    _control lbsetData [_index, _factionname];
} forEach _factionCategories;

GVAR(currentfactionCategory) = "";
if (lbsize _control > 0) then {
    private _lastindex = GVAR(lastfactionselection) select 0;
    if (lbsize _control <= _lastindex) then {
        _lastindex = 0;
    };
    _control lbsetCurSel _lastindex;
    // set to previously used element.
    GVAR(currentfactionCategory) = _control lbData _lastindex;
    GVAR(lastfactionselection) set [0, _lastindex];
};
_control ctrlAddEventHandler ["LBSelChanged", {
    [ctrlParent (param [0])] call FUNC(respawn_factionCategoryChanged);
}];

// faction selector Control
private _lastindex = GVAR(lastfactionselection) select 1;
// Store this before executing below code, otherwise it will override.

_control = (_display displayCtrl IDC_TFS_adminMENU_RESP_faction);
/* respawnMenufactionCombo */
lbClear _control;
_control ctrlAddEventHandler ["LBSelChanged", {
    [ctrlParent (param [0])] call FUNC(respawn_factionChanged);
}];

[_display] call FUNC(respawn_factionCategoryChanged);

if (lbsize _control > 0) then {
    private _newIdx = lbCurSel _control;
    if (lbsize _control > _lastindex) then {
        _control lbsetCurSel _lastindex;
        // set to previously used element.
        _newIdx = _lastindex;
    };
    GVAR(lastfactionselection) set [1, _newIdx];
};
/* Fill Roles */

// _control = (_display displayCtrl 26896);
/* Role control */

[_display] call FUNC(respawn_factionChanged);

/* Fill side selection */

private _west = 0;
private _east = 0; private _resistance = 0; private _civilian = 0;
{
    switch (side _x) do {
        case blufor: {
            _west = _west + 1;
        };
        case opfor: {
            _east = _east + 1;
        };
        case independent: {
            _resistance = _resistance + 1;
        };
        case civilian: {
            _civilian = _civilian + 1;
        };
    };
} forEach (allplayers select {
    alive _x
});

_control = (_display displayCtrl IDC_TFS_adminMENU_RESP_side);
/* side control */
lbClear _control;

private _idx = _control lbAdd format["blufor (%1p)", _west];
_control lbsetValue [_idx, 1];
_control lbsetColor [_idx, (west) call EFUNC(common, sidetoColor)];
private _idx = _control lbAdd format["opfor (%1p)", _east];
_control lbsetValue [_idx, 0];
_control lbsetColor [_idx, (east) call EFUNC(common, sidetoColor)];
private _idx = _control lbAdd format["GREENfor (%1p)", _resistance];
_control lbsetValue [_idx, 2];
_control lbsetColor [_idx, (independent) call EFUNC(common, sidetoColor)];
private _idx = _control lbAdd format["civilian (%1p)", _civilian];
_control lbsetValue [_idx, 3];
if (!isnil QGVAR(selectedside)) then {
    _control lbsetCurSel ([1, 0, 2, 3] find GVAR(selectedside));
} else {
    _control lbsetCurSel 0;
    GVAR(selectedside) = 1;
};
_control ctrlAddEventHandler ["LBSelChanged", {
    GVAR(selectedside) = (_this select 0) lbValue (_this select 1);
}];

// default rank listbox
// _control = (_display displayCtrl 26897);

// {
    // _control lbAdd _x;
// } forEach ["Pvt.", "Cpl.", "Sgt.", "Lt.", "Cpt.", "Mjr.", "Col."];

// {
    // _control lbsetpicture [_forEachindex, "\A3\Ui_f\data\GUI\Cfg\ranks\" + _x];
// } forEach ["private_gs.paa", "corporal_gs.paa", "sergeant_gs.paa", "lieutenant_gs.paa", "captain_gs.paa", "major_gs.paa", "colonel_gs.paa"];

// _control lbsetCurSel 0;

(_display displayCtrl IDC_TFS_adminMENU_RESP_SPECTAtortext) ctrlsettext format["players in Spectator: %1", count GVAR(spectatorlist) ];

// Marker type
_control = (_display displayCtrl IDC_TFS_adminMENU_RESP_markertype);
lbClear _control;
{
    private _idx = _control lbAdd (_x select 1);
    _markerImg = (_x select 0);
    if (_markerImg != "") then {
        _control lbsetpicture[_idx, _markerImg];
        _control lbsetColor[_idx, [1, 1, 1, 1]];
    };
    } forEach [
        ["\A3\ui_f\data\map\markers\nato\b_hq.paa", "HQ", "hq"],
        ["\A3\ui_f\data\map\markers\nato\b_inf.paa", "infantry", "inf"],
        ["\A3\ui_f\data\map\markers\nato\b_support.paa", "MG Team", "mg_m"],
        ["\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", "Missle (AT/AA) Team", "antitank"],
        ["\A3\ui_f\data\map\markers\nato\b_recon.paa", "Sniper", "recon"],
        ["\A3\ui_f\data\map\markers\nato\b_mortar.paa", "Mortar Team", "mortar"],
        ["\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", "APC/ifV", "inf_mech"],
        ["\A3\ui_f\data\map\markers\nato\b_armor.paa", "Armour", "armor"],
        ["\A3\ui_f\data\map\markers\nato\b_air.paa", "Heli", "helo_cargo"],
        ["\A3\ui_f\data\map\markers\nato\b_plane.paa", "Airplane/Jet", "fixedwing"]
    ];
    
    _control ctrlAddEventHandler ["LBSelChanged", {
        GVAR(MarkerIdx) = (_this select 1);
    }];
    if (!isnil QGVAR(MarkerIdx)) then {
        _control lbsetCurSel GVAR(MarkerIdx);
    } else {
        _control lbsetCurSel 0;
    };
    
    // Marker Colours
    _control = (_display displayCtrl IDC_TFS_adminMENU_RESP_MARKERCOLOUR);
    lbClear _control;
    {
        private _idx = _control lbAdd (_x select 1);
        _control lbsetColor [_idx, (_x select 0)];
        } forEach [
            [[1, 0, 0, 1], "Red", "red"],
            [[0, 0, 1, 1], "Blue", "blue"],
            [[0, 1, 0, 1], "Green", "green"],
            [[1, 1, 0, 1], "Yellow", "yellow"]
        ];
        
        _control ctrlAddEventHandler ["LBSelChanged", {
            GVAR(MarkerColour) = (_this select 1);
        }];
        if (!isnil QGVAR(MarkerColour)) then {
            _control lbsetCurSel GVAR(MarkerColour);
        } else {
            _control lbsetCurSel 0;
        };
        
        // group ID
        _control = (_display displayCtrl IDC_TFS_adminMENU_RESP_groupname);
        if (isnil QGVAR(groupname)) then {
            GVAR(groupname) = "inSERT_group_name";
        } else {
            _control ctrlsettext GVAR(groupname);
        };
        _control ctrlAddEventHandler ["KeyUp", {
            GVAR(groupname) = ctrltext (_this select 0);
        }];
        
        // Marker name
        _control = (_display displayCtrl IDC_TFS_adminMENU_RESP_groupMARKERname);
        if (isnil QGVAR(markername)) then {
            GVAR(markername) = "inSERT_MARKER_name";
        } else {
            _control ctrlsettext GVAR(markername);
        };
        _control ctrlAddEventHandler ["KeyUp", {
            GVAR(markername) = ctrltext (_this select 0);
        }];
        
        if (!isnil QGVAR(respawngroupMarkerCheckBoxVal)) then {
            (_display displayCtrl IDC_TFS_adminMENU_RESP_groupMARKERCHECKBOX) cbsetChecked GVAR(respawngroupMarkerCheckBoxVal);
        } else {
            GVAR(respawngroupMarkerCheckBoxVal) = false;
        };
        
        [_display] call FUNC(respawn_refreshSpectatorlist);
        
        // Use PFH to keep the lists updated;
        0
        [{
            params["_input", "_pfhID"];
            _input params ["_oldSpectlist"];
            _display = findDisplay IDD_TFS_adminMENU;
            if (isNull (findDisplay IDD_TFS_adminMENU)) exitwith {
                [_pfhID] call CBA_fnc_removePerFrameHandler;
            };
            
            // Recompute who is alive and Dead.
            
            private _deadlist = [];
            if (!isMultiplayer) then {
                _deadlist append allunits;
            } else {
                {
                    if (isplayer _x) then {
                        // not all of them will be players.
                        _deadlist pushBack _x;
                    };
                } forEach ([0, 0, 0] nearEntities ["TFS_spectator_unit", 500]);
                {
                    if (!alive _x) then {
                        // not all of them will be players.
                        _deadlist pushBackUnique _x;
                    };
                } forEach allplayers;
            };
            
            if (({
                _x in GVAR(spectatorlist)
            } count _deadlist) == count _deadlist) exitwith {};
            
            GVAR(spectatorlist) = _deadlist;
            _input set [0, _deadlist];
            
            (_display displayCtrl IDC_TFS_adminMENU_RESP_SPECTAtortext) ctrlsettext format["players in Spectator: %1", count GVAR(spectatorlist) ];
            
            // CHeck specatator list
            [_display] call FUNC(respawn_refreshSpectatorlist);
            [_display] call FUNC(respawn_refreshgroupBox);
        }, 0.4, []] call CBA_fnc_addPerFrameHandler;