_textBoxCtrl = [_this, 0, controlnull, [0, controlnull]] call BIS_fnc_param;
_varstring = [_this, 1, "", [""]] call BIS_fnc_param;
// type of variable to use: foot/car/air
_sliderCtrl = [_this, 2, controlnull, [0, controlnull]] call BIS_fnc_param;
_slidertextboxCtrl = [_this, 3, controlnull, [0, controlnull]] call BIS_fnc_param;

_inputValue = [ctrltext _textBoxCtrl, "0123456789"] call BIS_fnc_filterstring;
_inputValue = if (_inputValue == "") then {
    1
} else {
    call compile _inputValue min 100 max 1
};

ctrlsettext [_textBoxCtrl, (str _inputValue + "%")];

_percentageVar = "CHVD_" + _varstring + "SyncPercentage";
_percentage = _inputValue / 100;
call compile format ["%1 = %2", _percentageVar, _percentage];
call compile format ["profileNamespace setVariable ['%1', %1]", _percentageVar];

_viewDistVar = "CHVD_" + _varstring;
_viewDist = call compile _viewDistVar;
_objVDVar = "CHVD_" + _varstring + "Obj";
_objVD = _viewDist * _percentage min TFS_Main_viewDistancemaxObjectdistance;

sliderSetPosition [_sliderCtrl, _objVD];
ctrlsettext [_slidertextboxCtrl, str round _objVD];

call compile format ["%1 = %2", _objVDVar, _objVD];
call compile format ["profileNamespace setVariable ['%1', %1]", _objVDVar];

[2] call CHVD_fnc_updatesettings;