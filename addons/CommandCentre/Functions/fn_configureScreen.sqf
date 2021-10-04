disableSerialization;

params ["_object", "_selection", "_args"];
_args params ["_allowCam", "_allowDrone", "_allowSat", "_allowMap"];

TFS_CC_currentScreenObject = _object;
TFS_CC_currentScreenselection = _selection;

if !(createdialog "ScreenConfigdialog") exitwith {
    systemChat "Couldn't create dialog!"
};

private _display = findDisplay 21822;

// set up button event handlers
(_display displayCtrl 2400) ctrlsetEventHandler ["ButtonClick", "[] call TFS_fnc_viewHelmetCam"];
(_display displayCtrl 2401) ctrlsetEventHandler ["ButtonClick", "[0] call TFS_fnc_viewDroneCam"];
(_display displayCtrl 2402) ctrlsetEventHandler ["ButtonClick", "[] call TFS_fnc_viewSatimage"];
(_display displayCtrl 2403) ctrlsetEventHandler ["ButtonClick", "[1] call TFS_fnc_viewDroneCam"];
(_display displayCtrl 1101) ctrlsetEventHandler ["ButtonClick", "closedialog 2;
"];

// set up allowed actions
// hcams
ctrlEnable [2400, _allowCam];
ctrlEnable [2100, _allowCam];

// dcams
ctrlEnable [2401, _allowDrone];
ctrlEnable [2402, _allowDrone];
ctrlEnable [2101, _allowDrone];

// sat
ctrlEnable [2403, _allowSat];
ctrlEnable [2102, _allowSat];

// set title
private _screenmode = _object getVariable [format ["TFS_CC_screen_%1_mode", _selection], ""];
private _screenTarget = _object getVariable [format ["TFS_CC_screen_%1_target", _selection], ""];
private "_modename";

if ((!(_screenmode isEqualto "")) && (!(_screenTarget isEqualto ""))) then {
    switch (_screenmode) do {
        case "HCAM": {
            _modename = "Viewing Helmet Cam";
        };
        case "DCAM": {
            _modename = "Viewing Drone Cam";
        };
        case "SAT": {
            _modename = "Viewing Satellite Footage";
        };
        default {
            _modename = "Error, invalid mode!";
        };
    };
    
    ctrlsettext [1000, format["Configure Screen - %1: %2", _modename, _screenTarget]];
};

// populate the list boxes
// helmet cams
call cTab_fnc_updatelists;

_hCamlist = _display displayCtrl 2100;

lbClear _hCamlist;
_hCamlist lbsetCurSel -1;
{
    private _name = "";
    private _section = _x getVariable "TFS_Section";
    
    if (isnil "_section") then {
        _name = format ["%1:%2 (%3)", groupid group _x, [_x] call CBA_fnc_getgroupindex, name _x];
    } else {
        _name = format ["%1:%2 (%3)", _section, [_x] call CBA_fnc_getgroupindex, name _x];
    };
    
    _index = _hCamlist lbAdd _name;
    _hCamlist lbsetData [_index, str _x];
} forEach cTabHcamlist;

{
    private _name = format ["vehicle: %1", gettext (configFile >> "cfgvehicles" >> typeOf _x >> "displayname")];
    
    _index = _hCamlist lbAdd _name;
    _hCamlist lbsetData [_index, str _x];
} forEach TFS_CC_vehicleCamlist;

lbsort [_hCamlist, "ASC"];
_hCamlist lbsetCurSel 0;

// drone cams
_dCamlist = _display displayCtrl 2101;

lbClear _dCamlist;
_dCamlist lbsetCurSel -1;
{
    _index = _dCamlist lbAdd format ["%1:%2 (%3)", groupid group _x, [_x] call CBA_fnc_getgroupindex, gettext (configFile >> "cfgvehicles" >> typeOf _x >> "displayname")];
    _dCamlist lbsetData [_index, str _x];
} forEach cTabUAVlist;
lbsort [_dCamlist, "ASC"];
_dCamlist lbsetCurSel 0;

// sat view
_satlist = _display displayCtrl 2102;

lbClear _satlist;
_satlist lbsetCurSel -1;
{
    private _name = "";
    private _section = _x getVariable "TFS_Section";
    
    if (isnil "_section") then {
        _name = format ["%1:%2 (%3)", groupid group _x, [_x] call CBA_fnc_getgroupindex, name _x];
    } else {
        _name = format ["%1:%2 (%3)", _section, [_x] call CBA_fnc_getgroupindex, name _x];
    };
    
    _index = _satlist lbAdd _name;
    _satlist lbsetData [_index, str _x];
} forEach cTabHcamlist;

{
    private _name = format ["vehicle: %1", gettext (configFile >> "cfgvehicles" >> typeOf _x >> "displayname")];
    
    _index = _satlist lbAdd _name;
    _satlist lbsetData [_index, str _x];
} forEach TFS_CC_vehicleCamlist;

lbsort [_satlist, "ASC"];
_satlist lbsetCurSel 0;