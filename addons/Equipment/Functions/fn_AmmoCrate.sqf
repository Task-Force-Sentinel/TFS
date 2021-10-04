/*
Function name:TFS_fnc_TFS_fnc_ammoCrate;
Author: Mr H.
Description: this function gets all weapons currently present in all playable units' inventories and fills the box with fiting ammunition for these weapons, it includes handguns and launchers. The box receives an ace 3 interaction that allows players to refresh its contents.
Return value: None
Public: Yes
parameters:
0- <OBJECT> Box must be a container object
1- <NUMBER> ammount of items, per item.-Optional default 10
2- <BOOLEAN> Content is unlimited, if true the box will be refilled everytime its inventory is opened. -Optional default false
3- <BOOLEAN> Can be refreshed, if true the box's content can be refreshed useful if players change their weapons mid game. The box will receive an ACE 3 interaction action to refresh its contents. It makes the box's content unlimited. -optional, default false
Example(s):
[this, 10, true, true] call TFS_fnc_ammoCrate;
*/

params ["_box", ["_ammount", 10], ["_isUnlimited", false], ["_canBeRefreshed", false]];

if (_canBeReFreshed) then {
    _isUnlimited =true
};
_playableunits = [player];
if (isMultiplayer) then {
    _playableunits = playableunits
};
// get all weapons in all weapons slots for all playable units
_allplayerweapons = [];
{
    _mainWeapon = (getUnitloadout _x select 0) select 0;
    _launcher = (getUnitloadout _x select 1) select 0;
    _handGun = (getUnitloadout _x select 2) select 0;
    if (!isnil "_mainWeapon") then {
        _allplayerweapons pushBackUnique _mainWeapon
    };
    if (!isnil "_launcher") then {
        _allplayerweapons pushBackUnique _launcher
    };
    if (!isnil "_handGun") then {
        _allplayerweapons pushBackUnique _handGun
    };
} forEach _playableunits;

// get all fitting munitions for said weapons
_allmagazinestype = [];
{
    private ["_uniquemags", "_magazinetypeS"];
    
    // _uniquemags = [];
    _magazinetypeS = getArray (configFile >> "Cfgweapons" >> _x >>"magazines");
    
    {
        _uniquemags = _x;
        
        _allmagazinestype pushBackUnique _uniquemags;
    } forEach _magazinetypeS;
} forEach _allplayerweapons;

// Fills box with given content

// systemChat format ["Weps %1 Mags %2 Box %3", str _allplayerweapons, str _allmagazinestype, str _box];
{
    _do= _box addmagazineCargoGlobal [_x, _ammount];
    1
} forEach _allmagazinestype;

// if unlimited is set to true, the box will be refilled automatically

if (_isUnlimited) then {
    _box setVariable ["TFS_ammomagazines", _allmagazinestype];
    
    _handlerindex = _box addEventHandler
    ["ContainerOpened",
        {
            _box = _this select 0;
            _allmagazinestype = _box getVariable "TFS_ammomagazines";
            
            clearmagazineCargoGlobal _box;
            {
                _box addmagazineCargoGlobal [_x, 10];
            } forEach _allmagazinestype;
            _box additemCargoGlobal ["TFS_FirstAid", 1];
            _box additemCargoGlobal ["TFS_MedicKit", 1];
            _box additemCargoGlobal ["TFS_mopp", 1];
            _box additemCargoGlobal ["HandGrenade", 8];
            _box additemCargoGlobal ["SmokeShell", 8];
            _box additemCargoGlobal ["ACE_M84", 8];
        }
    ];
    _box setVariable ["TFS_ammoCrateEHindex", _handlerindex, true];
};

// Adds ace action to allow refresh of the box's contents midgame (useful if new weapons are given to players)

_params = [_box, _ammount, _isUnlimited, _canBeRefreshed];
_box setVariable ["TFS_ammoCrateparameters", _params, true];

if (_canBeRefreshed) then {
    _statement =
    {
        _box = _this select 0;
        _params = _box getVariable "TFS_ammoCrateparameters";
        [[_params],
            {
                params ["_params"];
                _box = _params select 0;
                _handlerindex = _box getVariable "TFS_ammoCrateEHindex";
                _box removeEventHandler ["ContainerOpened", _handlerindex];
                [_box, 0, ["ACE_Mainactions", "RefreshBoxContents"]] call ace_interact_menu_fnc_removeActionfromObject;
                _params call TFS_fnc_ammoCrate;
            }
        ] remoteExec ["spawn", 0, true];
        // _params call TFS_fnc_ammoCrate;
    };
    _action = ["RefreshBoxContents", "Refresh crate content", "", _statement, {
        true
    }, {}, [], [0, 0, 0], 5] call ace_interact_menu_fnc_createaction;
    [_box, 0, ["ACE_Mainactions"], _action] call ace_interact_menu_fnc_addActiontoObject;
};