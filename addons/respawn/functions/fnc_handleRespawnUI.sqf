#include "\z\tfs\addons\respawn\script_component.hpp"

disableSerialization;
params["_input", ["_params", []]];

#define REspawn_DISPLAY (findDisplay 26893)

private _ctrlDeadlistBox = (REspawn_DISPLAY displayCtrl 26891);
private _ctrlgrouplistBox = (REspawn_DISPLAY displayCtrl 26892);

switch _input do {
    case "onload": {
        GVAR(deadplayerlist) = [];
        GVAR(selectedRespawngroup) = [];
        if (isnil QGVAR(lastfactionselection)) then {
            GVAR(lastfactionselection) = [0, 0];
        };
        // GVAR(selectedRespawngroup) format
        // rank: int (0-6), Object: player, Role: int (0 -> count respawnMenuRoles)
        
        // Propogate the list of dead players.
        if (!isMultiplayer) then {
            {
                GVAR(deadplayerlist) pushBack _x;
            } forEach allunits;
        } else {
            {
                if (isplayer _x) then {
                    // not all of them will be players.
                    GVAR(deadplayerlist) pushBack _x;
                };
            } forEach ([0, 0, 0] nearEntities ["TFS_spectator_unit", 500]);
            {
                if (!alive _x) then {
                    // not all of them will be players.
                    GVAR(deadplayerlist) pushBackUnique _x;
                };
            } forEach allplayers;
        };
        
        private _control = (REspawn_DISPLAY displayCtrl 26894);
        /* respawnMenufactionCategoryCombo */
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
        } forEach (_factionCategories);
        
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
            ["factionCategoryChanged"] call FUNC(handleRespawnUI);
        }];
        
        private _lastindex = GVAR(lastfactionselection) select 1;
        // Store this before executing below code, otherwise it will override.
        
        /* Fill faction files respawnMenufactionCombo */
        _control = (REspawn_DISPLAY displayCtrl 26928);
        /* respawnMenufactionCombo */
        _control ctrlAddEventHandler ["LBSelChanged", {
            ["factionChanged"] call FUNC(handleRespawnUI);
        }];
        ["refreshfactionCategoryChanged"] call FUNC(handleRespawnUI);
        
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
        
        // _control = (REspawn_DISPLAY displayCtrl 26896);
        /* Role control */
        
        ["factionChanged"] call FUNC(handleRespawnUI);
        
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
        
        _control = (REspawn_DISPLAY displayCtrl 26929);
        /* side control */
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
        _control = (REspawn_DISPLAY displayCtrl 26897);
        
        {
            _control lbAdd _x;
        } forEach ["Pvt.", "Cpl.", "Sgt.", "Lt.", "Cpt.", "Mjr.", "Col."];
        
        {
            _control lbsetpicture [_forEachindex, "\A3\Ui_f\data\GUI\Cfg\ranks\" + _x];
        } forEach ["private_gs.paa", "corporal_gs.paa", "sergeant_gs.paa", "lieutenant_gs.paa", "captain_gs.paa", "major_gs.paa", "colonel_gs.paa"];
        
        _control lbsetCurSel 0;
        
        (REspawn_DISPLAY displayCtrl 26895) ctrlsettext format["players in Spectator: %1", count GVAR(deadplayerlist)];
        
        // Marker type
        _control = (REspawn_DISPLAY displayCtrl 26900);
        {
            private _idx = _control lbAdd (_x select 1);
            _markerImg = (_x select 0);
            if (_markerImg != "") then {
                _control lbsetpicture[_idx, _markerImg];
                _control lbsetColor[_idx, [1, 1, 1, 1]];
            };
        } forEach GVAR(respawnMenuMarkers);
        _control ctrlAddEventHandler ["LBSelChanged", {
            GVAR(MarkerIdx) = (_this select 1);
        }];
        if (!isnil QGVAR(MarkerIdx)) then {
            _control lbsetCurSel GVAR(MarkerIdx);
        } else {
            _control lbsetCurSel 0;
        };
        
        // Marker Colours
        _control = (REspawn_DISPLAY displayCtrl 26901);
        {
            private _idx = _control lbAdd (_x select 1);
            _control lbsetColor [_idx, (_x select 0)];
        } forEach GVAR(respawnMenuMarkerColours);
        
        _control ctrlAddEventHandler ["LBSelChanged", {
            GVAR(MarkerColour) = (_this select 1);
        }];
        if (!isnil QGVAR(MarkerColour)) then {
            _control lbsetCurSel GVAR(MarkerColour);
        } else {
            _control lbsetCurSel 0;
        };
        
        // group ID
        _control = (REspawn_DISPLAY displayCtrl 26898);
        if (isnil QGVAR(groupname)) then {
            GVAR(groupname) = "inSERT_group_name";
        } else {
            _control ctrlsettext GVAR(groupname);
        };
        _control ctrlAddEventHandler ["KeyUp", {
            GVAR(groupname) = ctrltext (_this select 0);
        }];
        
        // Marker name
        _control = (REspawn_DISPLAY displayCtrl 26899);
        if (isnil QGVAR(markername)) then {
            GVAR(markername) = "inSERT_MARKER_name";
        } else {
            _control ctrlsettext GVAR(markername);
        };
        _control ctrlAddEventHandler ["KeyUp", {
            GVAR(markername) = ctrltext (_this select 0);
        }];
        
        if (!isnil QGVAR(respawngroupMarkerCheckBoxVal)) then {
            (REspawn_DISPLAY displayCtrl 26903) cbsetChecked GVAR(respawngroupMarkerCheckBoxVal);
        } else {
            GVAR(respawngroupMarkerCheckBoxVal) = false;
        };
        
        ["refreshDeadlistBox"] call FUNC(handleRespawnUI);
        
        // Use PFH to keep the lists updated;
        0
        [{
            params["_input", "_pfhID"];
            _input params ["_oldSpectlist"];
            _display = findDisplay 26893;
            if (isNull (findDisplay 26893)) exitwith {
                [_pfhID] call CBA_fnc_removePerFrameHandler;
            };
            
            // Recompute who is alive and Dead.
            
            private _deadlist = [];
            if ((!isMultiplayer) or (isMultiplayer and isServer)) then {
                {
                    _deadlist pushBack _x;
                } forEach allunits;
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
                _x in GVAR(deadplayerlist)
            } count _deadlist) == count _deadlist) exitwith {};
            
            GVAR(deadplayerlist) = _deadlist;
            _input set [0, _deadlist];
            
            (REspawn_DISPLAY displayCtrl 26895) ctrlsettext format["players in Spectator: %1", count GVAR(deadplayerlist)];
            
            // CHeck specatator list4
            ["refreshDeadlistBox"] call FUNC(handleRespawnUI);
            ["refreshalivelistBox"] call FUNC(handleRespawnUI);
        }, 0.4, []] call CBA_fnc_addPerFrameHandler;
    };
    case "factionCategoryChanged": {
        private _control = (REspawn_DISPLAY displayCtrl 26894);
        /* respawnMenufactionCategoryCombo */
        private _newIdx = (lbCurSel _control);
        GVAR(currentfactionCategory) = _control lbData _newIdx;
        GVAR(lastfactionselection) set [0, _newIdx];
        ["refreshfactionCategoryChanged"] call FUNC(handleRespawnUI);
    };
    case "refreshfactionCategoryChanged": {
        private _control = (REspawn_DISPLAY displayCtrl 26928);
        // faction list control (for given category)
        lbClear _control;
        private _activefactionCategory = GVAR(currentfactionCategory);
        
        private _factions = [];
        
        /* Fill faction categories */
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
        
        if (_activefactionCategory == "mission") then {
            // use missionConfigFile
            {
                private _factionname = (toLower(configname _x));
                _factions pushBackUnique [gettext(_x >> "displayname"), _factionname];
            } forEach (configProperties [missionConfigFile >> "Cfgloadouts", "isClass _x"]);
        } else {
            // then configFile
            {
                private _category = toLower (gettext (_x >> "category"));
                if (_category == "") then {
                    _category = "Other";
                };
                if (_activefactionCategory == _category) then {
                    private _factionname = (toLower(configname _x));
                    _factions pushBackUnique [gettext(_x >> "displayname"), _factionname];
                };
            } forEach (configProperties [configFile >> "Cfgloadouts", "isClass _x"]);
        };
        
        // Alphabetical sort.
        _factions sort true;
        
        {
            _x params ["_displayname", "_configname"];
            private _players = 0;
            // Mission factioni class overrides so show 0 if configFile class is of same name.
            if (_activefactionCategory != "mission" && {
                isClass (missionConfigFile >> "Cfgloadouts" >> _configname)
            }) then {
                _players = 0;
            } else {
                if ([_playerfactions, _configname] call CBA_fnc_hashHasKey) then {
                    _players = [_playerfactions, _configname] call CBA_fnc_hashGet;
                };
            };
            private _text = _displayname;
            if (_players > 0) then {
                _text = format ["%1 (%2p)", _displayname, _players];
            };
            private _index = _control lbAdd _text;
            _control lbsetData [_index, _configname];
        } forEach _factions;
        // missionConfigFile first, only add unique factions now
        
        if (lbsize _control > 0) then {
            _control lbsetCurSel 0;
            // set to first element.
        };
    };
    case "factionChanged": {
        private _control = (REspawn_DISPLAY displayCtrl 26928);
        /* faction Control */
        private _faction = _control lbData (lbCurSel _control);
        GVAR(lastfactionselection) set [1, lbCurSel _control];
        private _classes = [];
        
        // missionConfigFile overrides.
        call {
            if (isClass (missionConfigFile >> "Cfgloadouts" >> _faction)) exitwith {
                _classes = configProperties [missionConfigFile >> "Cfgloadouts" >> _faction, "isClass _x"];
            };
            if (isClass (configFile >> "Cfgloadouts" >> _faction) && count _classes <= 0) exitwith {
                _classes = configProperties [configFile >> "Cfgloadouts" >> _faction, "isClass _x"];
            };
        };
        
        private _control = (REspawn_DISPLAY displayCtrl 26896);
        /* Role control */
        lbClear _control;
        respawnMenuRoles = [];
        {
            private _displayname = gettext(_x >> "displayname");
            private _index = _control lbAdd _displayname;
            private _configname = (configname _x);
            respawnMenuRoles pushBack [_configname, _displayname];
            _control lbsetData [_index, _configname];
        } forEach _classes;
        if (count _classes > 0) then {
            _control lbsetCurSel 0;
        };
        
        GVAR(selectedRespawngroup) = [];
        ["refreshDeadlistBox"] call FUNC(handleRespawnUI);
        ["refreshalivelistBox"] call FUNC(handleRespawnUI);
    };
    case "refreshDeadlistBox": {
        lbClear _ctrlDeadlistBox;
        {
            private _found = false;
            private _deadplayer = _x;
            // Check if already selected and thus in the selected respawn listBox.
            {
                if (_deadplayer == (_x select 1)) exitwith {
                    _found = true;
                };
            } forEach GVAR(selectedRespawngroup);
            
            if (!_found) then {
                private _name = _deadplayer getVariable ["TFS_spectator_name", name _deadplayer];
                private _idx = _ctrlDeadlistBox lbAdd _name;
                _ctrlDeadlistBox lbsetData[_idx, _name];
            };
        } forEach GVAR(deadplayerlist);
    };
    case "refreshalivelistBox": {
        lbClear _ctrlgrouplistBox;
        {
            _x params ["_rankIdx", "_obj", "_roleIdx"];
            private _name = _obj getVariable ["TFS_spectator_name", name _obj];
            private _idx = _ctrlgrouplistBox lbAdd format["%1 - %2", _name, (respawnMenuRoles select _roleIdx) select 1];
            // set image based on rank
            switch (_rankIdx) do {
                case 0 : {
                    _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\private_gs.paa"];
                };
                case 1 : {
                    _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\corporal_gs.paa"];
                };
                case 2 : {
                    _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\sergeant_gs.paa"];
                };
                case 3 : {
                    _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\lieutenant_gs.paa"];
                };
                case 4 : {
                    _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\captain_gs.paa"];
                };
                case 5 : {
                    _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\major_gs.paa"];
                };
                case 6 : {
                    _ctrlgrouplistBox lbsetpicture[_idx, "\A3\Ui_f\data\GUI\Cfg\ranks\colonel_gs.paa"];
                };
                default {};
            };
            _ctrlgrouplistBox lbsetColor [_idx, [1, 1, 1, 1]];
            _ctrlgrouplistBox lbsetpictureColor [_idx, [1, 1, 1, 0.7]];
            _ctrlgrouplistBox lbsetpictureColorselected [_idx, [1, 1, 1, 1]];
        } forEach GVAR(selectedRespawngroup);
    };
    case "respawnmenuAddAction" : {
        private _selection = _ctrlDeadlistBox lbtext (lbCurSel _ctrlDeadlistBox);
        
        private _obj = objNull;
        {
            private _name = _x getVariable ["TFS_spectator_name", name _x];
            if (_selection == _name) exitwith {
                _obj = _x;
            };
        } forEach GVAR(deadplayerlist);
        
        if (!(isNull _obj)) then {
            private _role = lbCurSel (REspawn_DISPLAY displayCtrl 26896);
            // Role
            private _rank = lbCurSel (REspawn_DISPLAY displayCtrl 26897);
            // rank
            
            GVAR(selectedRespawngroup) pushBack [_rank, _obj, _role];
        };
        
        ["refreshDeadlistBox"] call FUNC(handleRespawnUI);
        ["refreshalivelistBox"] call FUNC(handleRespawnUI);
    };
    case "respawnMenuremoveAction": {
        private _ctrlgrouplistBox = (REspawn_DISPLAY displayCtrl 26892);
        
        GVAR(selectedRespawngroup) deleteAt (lbCurSel _ctrlgrouplistBox);
        
        ["refreshDeadlistBox"] call FUNC(handleRespawnUI);
        ["refreshalivelistBox"] call FUNC(handleRespawnUI);
    };
    case "respawnMenuChangeRoleaction": {
        private _selection = (lbCurSel _ctrlgrouplistBox);
        if (_selection isEqualto -1) exitwith {};
        
        private _entry = (GVAR(selectedRespawngroup) select _selection);
        _entry set [2, ((_entry select 2)+1)%(count respawnMenuRoles)];
        GVAR(selectedRespawngroup) set [_selection, _entry];
        
        ["refreshalivelistBox"] call FUNC(handleRespawnUI);
    };
    case "respawnMenuChangerankaction": {
        private _selection = (lbCurSel _ctrlgrouplistBox);
        if (_selection isEqualto -1) exitwith {};
        
        private _entry = (GVAR(selectedRespawngroup) select _selection);
        _entry set [0, ((_entry select 0)+1)%7];
        GVAR(selectedRespawngroup) set [_selection, _entry];
        
        ["refreshalivelistBox"] call FUNC(handleRespawnUI);
    };
    case "respawnMenutogglegroupCheckbox": {
        GVAR(respawngroupMarkerCheckBoxVal) = !GVAR(respawngroupMarkerCheckBoxVal);
    };
    case "respawnMenuRespawnaction": {
        // respawn button
        if (count GVAR(selectedRespawngroup) < 1) exitwith {
            hint "No players selected";
        };
        
        private _groupname = ctrltext (REspawn_DISPLAY displayCtrl 26898);
        
        // respawnMenufactions control.
        private _control = (REspawn_DISPLAY displayCtrl 26928);
        private _faction = _control lbData (lbCurSel _control);
        
        private _markername = ctrltext (REspawn_DISPLAY displayCtrl 26899);
        private _markertype = lbCurSel (REspawn_DISPLAY displayCtrl 26900);
        // type == -1 if no spawn marker
        private _markerColor =lbCurSel (REspawn_DISPLAY displayCtrl 26901);
        if (!GVAR(respawngroupMarkerCheckBoxVal)) then {
            _markertype = -1;
        };
        
        // Hand over control to the map dialog.
        closedialog 26893;
        createdialog "respawnMenuMapdialog";
        
        GVAR(respawnGuiparameters) = [_faction, _groupname, _markertype, _markerColor, _markername];
    };
    case "respawnMaploaded": {
        private _mapCtrl = ((findDisplay 26950) displayCtrl 26902);
        // _this select 0;//
        private _pos = [0, 0, 0];
        if (alive player && !(player isKindOf "TFS_spectator_unit")) then {
            _pos = getPos player;
        } else {
            if (count playableunits > 0) then {
                _pos = getPos (playableunits select 0);
            } else {
                if (count allunits > 0) then {
                    _pos = getPos (allunits select 0);
                };
            };
        };
        _mapCtrl ctrlmapAnimAdd [0, 0.1, _pos];
        ctrlmapAnimCommit _mapCtrl;
        GVAR(respawnMousePos) = -1;
        GVAR(respawnHalo) = false;
        hint "Click on the map or click on respawn location to draft a position. Hit enter to confirm. Spacebar toggles HALO option (only for user defined point).";
    };
    /* case "toggleSpectator": {
        if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {
            private _isSpectator = [player] call acre_api_fnc_isSpectator;
            [!_isSpectator] call acre_api_fnc_setSpectator;
            if (_isSpectator) then {
                hint "ACRE: Spectator mode de-activated";
            } else {
                hint "ACRE: Spectator mode activated";
            };
        };
    };
    */
    case "respawnMap_onMouseButtondown": {
        _params params["_fullmapwindow", "_type", "_x", "_y"];
        
        if (_type == 0) then {
            // left click
            private _i = 1;
            private _found = false;
            private _var = missionnamespace getVariable[format["TFS_respawnPoint%1", _i], objNull];
            while {!(isNull _var)} do {
                private _pos = (position _var);
                if (([_x, _y] distance (_fullmapwindow posworldToScreen _pos)) < 0.1) then {
                    GVAR(respawnMousePos) = _i;
                    _found = true;
                };
                _i = _i + 1;
                _var = missionnamespace getVariable[format["TFS_respawnPoint%1", _i], objNull];
            };
            if (!_found) then {
                GVAR(respawnMousePos) = _fullmapwindow posscreentoWorld [_x, _y];
            };
        };
    };
    case "respawnMap_keyUp": {
        _params params["", "_type"];
        // 28 = enter key
        if (_type == 28) then {
            if (GVAR(respawnMousePos) isEqualto -1) then {
                hint "No position selected for respawn. Click on a position then hit enter.";
            } else {
                private _position = [0, 0, 0];
                private _halo = false;
                if (GVAR(respawnMousePos) isEqualtype []) then {
                    _position = GVAR(respawnMousePos);
                    _halo = GVAR(respawnHalo);
                } else {
                    private _var = missionnamespace getVariable[format["TFS_respawnPoint%1", GVAR(respawnMousePos)], objNull];
                    if (!isNull _var) then {
                        _position = position _var;
                    };
                };
                if (_halo) then {
                    hint "group created as HALO group.";
                } else {
                    hint "group created on ground.";
                };
                
                GVAR(respawnGuiparameters) params ["_faction", "_groupname", "_markertype", "_markerColor", "_markername"];
                
                {
                    _x params ["_rankIdx", "_obj", "_roleIdx"];
                    _x set [2, (respawnMenuRoles select _roleIdx) select 0];
                } forEach GVAR(selectedRespawngroup);
                
                [[_groupname, _position, _faction, GVAR(selectedRespawngroup), _markertype, _markerColor, _markername, _halo, GVAR(selectedside)], QFUNC(respawnwaveserver), false] call BIS_fnc_MP;
                GVAR(selectedRespawngroup) = [];
                
                // Close the Map
                ((findDisplay 26950) displayCtrl 26902) ctrlShow false;
                ((findDisplay 26950) displayCtrl 26902) mapCenterOnCamera false;
                closedialog 26950;
            };
        };
        // SPACEBAR (HALO toGGLE)
        if (_type == 57) then {
            GVAR(respawnHalo) = !GVAR(respawnHalo);
        };
    };
};