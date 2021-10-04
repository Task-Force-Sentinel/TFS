private ["_textValue"];
_vartype = [_this, 0, "", [""]] call BIS_fnc_param;
_textCtrl = [_this, 1, controlnull, [0, controlnull]] call BIS_fnc_param;
_listbox = [_this, 2, controlnull, [0, controlnull]] call BIS_fnc_param;

_textValue = [ctrltext _textCtrl, "0123456789."] call BIS_fnc_filterstring;
_textValue = if (_textValue == "") then {
    50
} else {
    call compile _textValue min 50 max 3.125
};

if (!TFS_Main_viewDistanceNoGrass) then {
    _textValue = _textValue min 48.99;
};

// update listbox
_listboxCtrl = (findDisplay 2900) displayCtrl _listbox;
// remove EH not to cause huge lag
_listboxCtrl ctrlremoveAllEventHandlers "LBSelChanged";
_sel = [_textValue] call CHVD_fnc_selTerrainQuality;
if (TFS_Main_viewDistanceNoGrass) then {
    _listboxCtrl lbsetCurSel _sel;
} else {
    _listboxCtrl lbsetCurSel (_sel - 1);
};
// add EH again
_listboxCtrl ctrlsetEventHandler ["LBSelChanged",
    format ["[_this select 1, '%1', %2] call CHVD_fnc_onLBSelChanged", _vartype, _textCtrl]
];

// ctrlsettext [_textCtrl, str _textValue];
call compile format ["%1 = %2", _vartype, _textValue];
call compile format ["profileNamespace setVariable ['%1', %1]", _vartype];

[] call CHVD_fnc_updateTerrain;