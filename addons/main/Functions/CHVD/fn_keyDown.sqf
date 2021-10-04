if (CHVD_keydown) exitwith {};
CHVD_keydown = true;

private ["_vehtypestring"];
_updatetype = [_this, 0, 0, [0]] call BIS_fnc_param;
// 0 - decrease VD, 1 - increase VD
_updateValue = if (_updatetype isEqualto 0) then {
    -500
} else {
    500
};

if (!isNull (findDisplay 2900)) then {
    call CHVD_fnc_opendialog
};

switch (CHVD_vehtype) do {
    case 1: {
        _vehtypestring = "car";
    };
    case 2: {
        _vehtypestring = "air";
    };
    default {
        _vehtypestring = "foot";
    };
};

_updatemode = call compile ("CHVD_" + _vehtypestring + "Syncmode");
_viewDistVar = "CHVD_" + _vehtypestring;
_viewDist = call compile _viewDistVar;
_objViewDistVar = "CHVD_" + _vehtypestring + "Obj";
_objViewDist = call compile _objViewDistVar;
_vdDiff = _viewDist - _objViewDist;

switch (_updatemode) do {
    case 1: {
        _viewDistValue = _viewDist + _updateValue min TFS_Main_viewDistancemaxdistance max 500;
        
        _percentVar = "CHVD_" + _vehtypestring + "SyncPercentage";
        _percentValue = call compile _percentVar;
        
        _objViewDistValue = _viewDistValue * _percentValue min TFS_Main_viewDistancemaxObjectdistance;
        
        if (_objViewDistValue >= 500) then {
            call compile format ["%1 = %2", _viewDistVar, _viewDistValue];
            call compile format ["profileNamespace setVariable ['%1', %1]", _viewDistVar];
            call compile format ["%1 = %2", _objViewDistVar, _objViewDistValue];
            call compile format ["profileNamespace setVariable ['%1', %1]", _objViewDistVar];
            
            [3] call CHVD_fnc_updatesettings;
        };
    };
    case 2: {
        _objViewDistValue = _objViewDist + _updateValue min _viewDist min TFS_Main_viewDistancemaxObjectdistance max 500;
        call compile format ["%1 = %2", _objViewDistVar, _objViewDistValue];
        call compile format ["profileNamespace setVariable ['%1', %1]", _objViewDistVar];
        
        [4] call CHVD_fnc_updatesettings;
    };
    default {
        _viewDistValue = _viewDist + _updateValue min TFS_Main_viewDistancemaxdistance max (500 + _vdDiff);
        _objViewDistValue = _objViewDist + _updateValue min (_viewDistValue - _vdDiff) min TFS_Main_viewDistancemaxObjectdistance max 500;
        call compile format ["%1 = %2", _viewDistVar, _viewDistValue];
        call compile format ["profileNamespace setVariable ['%1', %1]", _viewDistVar];
        
        call compile format ["%1 = %2", _objViewDistVar, _objViewDistValue];
        call compile format ["profileNamespace setVariable ['%1', %1]", _objViewDistVar];
        
        [3] call CHVD_fnc_updatesettings;
    };
};

_vdstring = "";
for "_i" from 1 to (35) step 1 do {
    if ((call compile _viewDistVar) < TFS_Main_viewDistancemaxdistance / 35 * _i) then {
        _vdstring = _vdstring + "·";
    } else {
        _vdstring = _vdstring + "I";
    };
};

_ovdstring = "";
for "_i" from 1 to (35) step 1 do {
    if ((call compile _objViewDistVar) < TFS_Main_viewDistancemaxObjectdistance / 35 * _i) then {
        _ovdstring = _ovdstring + "·";
    } else {
        _ovdstring = _ovdstring + "I";
    };
};

_textviewDistance = if (islocalized "str_chvd_viewDistance") then {
    localize "str_chvd_viewDistance"
} else {
    "View distance"
};
_textobjviewDistance = if (islocalized "str_chvd_objviewDistance") then {
    localize "str_chvd_objviewDistance"
} else {
    "View distance"
};

hintSilent parsetext format ["<t align='left' size='1.33'>
    %2:	<t align='right'>%3</t>
    <br />
    <t size='2' shadow='0' color='%1'>%4</t>
    <br />
    %5: <t align='right'>%6</t>
    <br />
    <t size='2' shadow='0' color='%1'>%7</t>
    </t>",
    [profileNamespace getVariable ['GUI_BCG_RGB_R', 0.3843], profileNamespace getVariable ['GUI_BCG_RGB_G', 0.7019], profileNamespace getVariable ['GUI_BCG_RGB_B', 0.8862], profileNamespace getVariable ['GUI_BCG_RGB_A', 0.7]] call BIS_fnc_colorRGBAtoHTML,
    _textviewDistance,
    call compile _viewDistVar,
    _vdstring,
    _textobjviewDistance,
    call compile _objViewDistVar,
    _ovdstring
];

terminate (missionnamespace getVariable ["CHVD_hintHandle", scriptNull]);
CHVD_hintHandle = [] spawn {
    uiSleep 2;
    hintSilent "";
};

[] spawn {
    uiSleep 0.05;
    CHVD_keydown = false;
};