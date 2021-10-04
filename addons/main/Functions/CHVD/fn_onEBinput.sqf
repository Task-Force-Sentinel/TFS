private ["_textValue", "_updatetype"];
_vartype1 = [_this, 0, "", [""]] call BIS_fnc_param;
_slider1 = [_this, 1, controlnull, [0, controlnull]] call BIS_fnc_param;
_text1 = [_this, 2, controlnull, [0, controlnull]] call BIS_fnc_param;
_vartype2 = [_this, 3, "", [""]] call BIS_fnc_param;
_slider2 = [_this, 4, controlnull, [0, controlnull]] call BIS_fnc_param;
_text2 = [_this, 5, controlnull, [0, controlnull]] call BIS_fnc_param;
_modeVar = [_this, 6, "", [""]] call BIS_fnc_param;
_percentVar = [_this, 7, "", [""]] call BIS_fnc_param;

if (count _this < 7) then {
    _updatetype = 2;
} else {
    _modeVar = call compile _modeVar;
    switch (_modeVar) do {
        case 1: {
            _updatetype = 3;
        };
        default {
            _updatetype = 1;
        };
    };
};

_textValue = [ctrltext _text1, "0123456789"] call BIS_fnc_filterstring;
_textValue = if (_textValue == "") then {
    1
} else {
    call compile _textValue min 12000 max 0
};

_viewDistValue = _textValue min TFS_Main_viewDistancemaxdistance;
_objViewDistValue = if (_modeVar isEqualto 1) then {
    _textValue * (call compile _percentVar) min TFS_Main_viewDistancemaxObjectdistance
} else {
    _textValue min TFS_Main_viewDistancemaxObjectdistance
};
// Check if percentage sync mode is used, if so use a percentage coefficient

switch (_updatetype) do {
    // 1 - VIEW, 2 - OBJ, 3 - BOTH, 0 - BOTH and TERrain
    case 1: {
        sliderSetPosition [_slider1, _viewDistValue];
        sliderSetRange [_slider2, 0, _viewDistValue];
        
        call compile format ["%1 = %2", _vartype1, _viewDistValue];
        call compile format ["profileNamespace setVariable ['%1', %1]", _vartype1];
        
        if ((call compile _vartype2) > _viewDistValue) then {
            // Update object VD slider and text so it doesn't stay at higher value than VD slider
            sliderSetPosition [_slider2, _objViewDistValue];
            ctrlsettext [_text2, str round _objViewDistValue];
            
            call compile format ["%1 = %2", _vartype2, _objViewDistValue];
            call compile format ["profileNamespace setVariable ['%1', %1]", _vartype2];
        };
        
        [_updatetype] call CHVD_fnc_updatesettings;
    };
    case 2: {
        sliderSetPosition [_slider1, _objViewDistValue];
        
        call compile format ["%1 = %2", _vartype1, _objViewDistValue];
        call compile format ["profileNamespace setVariable ['%1', %1]", _vartype1];
        
        [_updatetype] call CHVD_fnc_updatesettings;
    };
    case 3: {
        sliderSetPosition [_slider1, _viewDistValue];
        sliderSetRange [_slider2, 0, _viewDistValue];
        
        call compile format ["%1 = %2", _vartype1, _viewDistValue];
        call compile format ["profileNamespace setVariable ['%1', %1]", _vartype1];
        
        if ((call compile _vartype2) > _viewDistValue) then {
            // Update object VD slider and text so it doesn't stay at higher value than VD slider
            sliderSetPosition [_slider2, _objViewDistValue];
            ctrlsettext [_text2, str round _objViewDistValue];
            
            call compile format ["%1 = %2", _vartype2, _objViewDistValue];
            call compile format ["profileNamespace setVariable ['%1', %1]", _vartype2];
        };
        
        sliderSetPosition [_slider2, _objViewDistValue];
        ctrlsettext [_text2, str round _objViewDistValue];
        
        call compile format ["%1 = %2", _vartype2, _objViewDistValue];
        call compile format ["profileNamespace setVariable ['%1', %1]", _vartype2];
        
        [_updatetype] call CHVD_fnc_updatesettings;
    };
};