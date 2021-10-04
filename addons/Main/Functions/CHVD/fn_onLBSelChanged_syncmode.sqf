private ["_varstring"];
_mode = _this select 0;
_varstring = [_this, 1, "", [""]] call BIS_fnc_param;
// type of variable to use: foot/car/air
_textBoxCtrl = [_this, 2, controlnull, [0, controlnull]] call BIS_fnc_param;
_sliderCtrl = [_this, 3, controlnull, [0, controlnull]] call BIS_fnc_param;
_slidertextboxCtrl = [_this, 4, controlnull, [0, controlnull]] call BIS_fnc_param;

switch (_mode) do {
    case 1: {
        ctrlEnable [_textBoxCtrl, true];
        _percentageVar = "CHVD_" + _varstring + "SyncPercentage";
        _percentage = call compile _percentageVar;
        ctrlsettext [_textBoxCtrl, format ["%1", _percentage * 100] + "%"];
        
        _viewDistVar = "CHVD_" + _varstring;
        _viewDist = call compile _viewDistVar;
        _objVDVar = "CHVD_" + _varstring + "Obj";
        _objVD = _viewDist * _percentage min TFS_Main_viewDistancemaxObjectdistance;
        
        // disable VD slider and textbox because they are not in use
        ctrlEnable [_sliderCtrl, false];
        sliderSetPosition [_sliderCtrl, _objVD];
        ctrlEnable [_slidertextboxCtrl, false];
        ctrlsettext [_slidertextboxCtrl, str round _objVD];
        
        call compile format ["%1 = %2", _objVDVar, _objVD];
        call compile format ["profileNamespace setVariable ['%1', %1]", _objVDVar];
    };
    default {
        ctrlEnable [_textBoxCtrl, false];
        ctrlsettext [_textBoxCtrl, ""];
        
        // enable VD slider and textbox in case they are disabled
        ctrlEnable [_sliderCtrl, true];
        ctrlEnable [_slidertextboxCtrl, true];
    };
};

_modeVar = "CHVD_" + _varstring + "Syncmode";
call compile format ["%1 = %2", _modeVar, _mode];
call compile format ["profileNamespace setVariable ['%1', %1]", _modeVar];

[2] call CHVD_fnc_updatesettings;