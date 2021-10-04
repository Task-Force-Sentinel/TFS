// Updates the text on the end mission screen.

#include "\z\tfs\addons\common\script_component.hpp"
disableSerialization;
params ["_display"];

if (!isnil QGVAR(endMissiontext)) then {
    [{
        disableSerialization;
        params ["_display"];
        GVAR(endMissiontext) params [["_titleText", ""], ["_subtitleText", ""]];
        private _titleCtrl = _display displayCtrl 20600;
        private _subtitleCtrl = _display displayCtrl 20601;
        _titleCtrl ctrlsettext toUpper _titleText;
        
        if (_subtitleText != "") then {
            if (ctrltext _subtitleCtrl == "") then {
                // if Hidden we need to emulate the effect.
                private _subtitlePosFinal = ctrlposition _subtitleCtrl;
                private _subtitlePosStart = +_subtitlePosFinal;
                _subtitlePosStart set [0, (_subtitlePosStart select 0) + (_subtitlePosStart select 2) / 2];
                _subtitlePosStart set [2, 0];
                _subtitleCtrl ctrlsetPosition _subtitlePosStart;
                _subtitleCtrl ctrlsetFade 0;
                _subtitleCtrl ctrlCommit 0;
                _subtitleCtrl ctrlShow false;
                [_subtitleCtrl, _subtitlePosFinal] spawn {
                    disableSerialization;
                    params ["_subtitleCtrl", "_subtitlePosFinal"];
                    sleep 2;
                    _subtitleCtrl ctrlShow true;
                    _subtitleCtrl ctrlsetPosition _subtitlePosFinal;
                    _subtitleCtrl ctrlCommit 0.4;
                };
            };
            // Update the text.
            _subtitleCtrl ctrlsettext toUpper _subtitleText;
        } else {
            _subtitleCtrl ctrlsetFade 1;
            _subtitleCtrl ctrlCommit 0;
            _subtitleCtrl ctrlShow false;
        };
    }, [_display]] call CBA_fnc_execNextFrame;
};