#include "script_component.hpp"
/*
* Author: NemesisRE
* create intel object based on bis_fnc_initintelObject
*
* Arguments:
* 0: Object <OBJECT>
* 1: caller <OBJECT>
* 2: Data <ARRAY>
* 3: delete Object <BOOL>
* 4: mode <strinG>
*
* Return Value:
* None
*
* Example:
* [object, unit, data, false] call TFS_common_fnc_initintelObject;
*
*/

params ["_object", "_caller", ["_data", []], ["_deleteObject", false], ["_mode", "init"], "_diaryVar"];
private ["_scriptName"];

_scriptName = "TFS_common_fnc_initintelObject";

switch _mode do {
    case "init": {
        private ["_var", "_callername", "_marker", "_title", "_text", "_texture", "_recipients", "_state"];
        _var = (_scriptName + str _object) call bis_fnc_filterstring;
        
        // Benachrichtigung an alle Zeus module wer die intel gefunden hat
        {
            _x addcuratorEditableObjects [
                [_object],
                false
            ];
            [
                _x,
                "intelObjectFound",
                {
                    params[ "", "_foundBy" ];
                    private _msg = format[ "intel wurde von %1 entdeckt", name _foundBy ];
                    hint _msg
                }
            ] call BIS_fnc_addScriptedEventHandler;
        } forEach allCurators;
        
        // Benachrichtigung an alle Spieler wer die intel gefunden hat
        [
            _object,
            "intelObjectFound",
            {
                params[ "", "_foundBy" ];
                private _msg = format[ "intel wurde von %1 entdeckt", name _foundBy ];
                _msg remoteExec["hint"];
            }
        ] call BIS_fnc_addScriptedEventHandler;
        
        _callername = if (_caller == TFS_unit) then {
            profileName
        } else {
            name _caller
        };
        
        // --- Create marker to which diary link is pointed
        _marker = createMarker [_var, position _object];
        
        _title = _data param [0, "intel", [""]];
        _text = _data param [1, "None", [""]];
        _texture = _data param [2, "\a3\ui_f\data\igui\cfg\simpleTasks\types\intel_ca.paa", [""]];
        _recipients = _data param [3, west];
        
        // --- Save intel data to server (clients will get them on request)
        [nil, _var, [_title, _text, _texture, _marker, _callername]] call bis_fnc_setServerVariable;
        
        // --- call scripted event handlers
        {
            [[_x, "intelObjectFound", [_x, _caller, _object]], "bis_fnc_callscriptedeventhandler", _x] call bis_fnc_mp;
        } forEach (objectCurators _object);
        
        [_object, "intelObjectFound", [_object, _caller]] call bis_fnc_callscriptedeventhandler;
        
        if (_deleteObject) then {
            // --- Play taking animation and delete the object afterwards
            _caller playAction "putdown";
            for "_i" from 0 to 1 do {
                _state = animationState _caller;
                waitUntil {
                    _state != animationState _caller
                };
            };
            deletevehicle _object;
        };
        
        [[nil, nil, nil, nil, "diary", _var], _scriptName, _recipients, true] call bis_fnc_mp;
    };
    case "diary": {
        private ["_data", "_title", "_text", "_texture", "_marker", "_callername"];
        _data = [nil, _diaryVar] call bis_fnc_getServerVariable;
        _title = _data param [0, "", [""]];
        _text = _data param [1, "", [""]];
        _texture = _data param [2, "", [""]];
        _marker = _data param [3, "", [""]];
        _callername = _data param [4, "", [""]];
        
        if (_texture == "") then {
            _texture = "mil_warning" call bis_fnc_textureMarker;
        };
        
        // --- Compose text
        _text = format [
            "<font color='#99ffffff' face='PuristaLight'>" + localize "str_A3_BIS_fnc_initintelObject_found" + "</font><br />",
            format ["<marker name='%1'>%2</marker>", _marker, (markerPos _marker)call bis_fnc_locationDescription],
            _callername
        ] + _text;
        
        if (_texture != "") then {
            _text = _text + format ["<br /><img image='%1' height='200px' />", _texture];
        };
        
        ["intelAdded", [_title, _texture]] call bis_fnc_shownotification;
        
        if !(TFS_unit diarySubjectExists _scriptName) then {
            TFS_unit createDiarySubject [_scriptName, localize "str_A3_BIS_fnc_initintelObject_intel"];
        };
        
        TFS_unit createDiaryRecord [_scriptName, [_title, _text]];
        
        waitUntil {
            _scriptName call bis_fnc_selectDiarySubject;
        };
    };
};