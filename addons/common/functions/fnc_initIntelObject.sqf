#include "script_component.hpp"
/*
 * Author: NemesisRE
 * create intel object based on bis_fnc_initIntelObject
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Caller <OBJECT>
 * 2: Data <ARRAY>
 * 3: delete Object <BOOL>
 * 4: mode <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object,unit,data,false] call TFSRHS_common_fnc_initIntelObject;
 *
 */

params ["_object","_caller",["_data",[]],["_deleteObject",false],["_mode", "init"],"_diaryVar"];
private ["_scriptName"];

_scriptName = "TFSRHS_common_fnc_initIntelObject";

switch _mode do {
    case "init": {
        private ["_var","_callerName","_marker","_title","_text","_texture","_recipients","_state"];
        _var = (_scriptName + str _object) call bis_fnc_filterString;
        ////////////////////////////////////////////////////////////////////////////
        // Benachrichtigung an alle Zeus Module wer die intel gefunden hat
        {
            _x addCuratorEditableObjects [
                [_object],
                false
            ];
            [
                _x,
                "IntelObjectFound",
                {
                    params[ "", "_foundBy" ];
                    private _msg = format[ "Intel wurde von %1 entdeckt", name _foundBy ];
                    hint _msg
                }
            ] call BIS_fnc_addScriptedEventHandler;
        } forEach allCurators;

        ////////////////////////////////////////////////////////////////////////////
        // Benachrichtigung an alle Spieler wer die intel gefunden hat
        [
            _object,
            "IntelObjectFound",
            {
                params[ "", "_foundBy" ];
                private _msg = format[ "Intel wurde von %1 entdeckt", name _foundBy ];
                _msg remoteExec["hint"];
            }
        ] call BIS_fnc_addScriptedEventHandler;

        _callerName = if (_caller == TFSRHS_unit) then {profilename} else {name _caller};

        //--- Create marker to which diary link is pointed
        _marker = createmarker [_var,position _object];

        _title = _data param [0, "Intel",[""]];
        _text = _data param [1, "None",[""]];
        _texture =  _data param [2, "\a3\ui_f\data\igui\cfg\simpletasks\types\intel_ca.paa",[""]];
        _recipients = _data param [3, west];

        //--- Save intel data to server (clients will get them on request)
        [nil,_var,[_title,_text,_texture,_marker,_callerName]] call bis_fnc_setServerVariable;

        //--- Call scripted event handlers
        {
            [[_x,"intelObjectFound",[_x,_caller,_object]],"bis_fnc_callscriptedeventhandler",_x] call bis_fnc_mp;
        } foreach (objectcurators _object);

        [_object,"intelObjectFound",[_object,_caller]] call bis_fnc_callscriptedeventhandler;

        if (_deleteObject) then {
            //--- Play taking animation and delete the object afterwards
            _caller playaction "putdown";
            for "_i" from 0 to 1 do {
                _state = animationstate _caller;
                waituntil {_state != animationstate _caller};
            };
            deletevehicle _object;
        };

        [[nil,nil,nil,nil,"diary",_var],_scriptName,_recipients,true] call bis_fnc_mp;
    };
    case "diary": {
        private ["_data","_title","_text","_texture","_marker","_callerName"];
        _data = [nil,_diaryVar] call bis_fnc_getServerVariable;
        _title = _data param [0,"",[""]];
        _text = _data param [1,"",[""]];
        _texture = _data param [2,"",[""]];
        _marker = _data param [3,"",[""]];
        _callerName = _data param [4,"",[""]];

        if (_texture == "") then {
            _texture = "mil_warning" call bis_fnc_textureMarker;
        };

        //--- Compose text
        _text = format [
            "<font color='#99ffffff' face='PuristaLight'>" + localize "STR_A3_BIS_fnc_initIntelObject_found" + "</font><br />",
            format ["<marker name='%1'>%2</marker>",_marker,(markerpos _marker )call bis_fnc_locationDescription],
            _callerName
        ] + _text;

        if (_texture != "") then {
            _text = _text + format ["<br /><img image='%1' height='200px' />",_texture];
        };

        ["intelAdded",[_title,_texture]] call bis_fnc_showNotification;

        if !(TFSRHS_unit diarysubjectexists _scriptName) then {
            TFSRHS_unit creatediarysubject [_scriptName,localize "STR_A3_BIS_fnc_initIntelObject_intel"];
        };

        TFSRHS_unit creatediaryrecord [_scriptName,[_title,_text]];

        waituntil {_scriptName call bis_fnc_selectDiarySubject;};
    };
};
