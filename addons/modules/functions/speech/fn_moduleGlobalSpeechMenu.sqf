/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\modules\functions\speech\fn_moduleGlobalSpeechMenu.sqf
*	by Ojemineh
*
*	module function
*
*	Arguments:
*	0: logic	- <OBJECT>
*
*	Return:
*	nothing
*
*	Example:
*	[] call TFS_fnc_moduleGlobalSpeechMenu;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_logic"];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _logic) exitwith {};

// -------------------------------------------------------------------------------------------------

// VALIdate SOURCE

private _source = _logic getVariable ["source", ""];
if (_source isEqualto "") exitwith {};
if (isNull (missionnamespace getVariable [_source, objNull])) exitwith {};

private _unit = missionnamespace getVariable _source;
if !(_unit isKindOf "Man") exitwith {};

// -------------------------------------------------------------------------------------------------

private _unitname = [_unit] call ACE_common_fnc_getname;
private _holdtext = format [localize "str_TFS_module_GlobalSpeech_Holdaction", _unitname];
private _holdIcon = "\z\tfs\addons\modules\data\gui\holdaction_speech_ca.paa";

[
    _unit,
    _holdtext,
    _holdIcon,
    _holdIcon,
    "(_this distance _target < 2.5) && (alive _target) && !(_target getVariable ['ACE_isUnconscious', false]) && !(_target getVariable ['tfs_speak3d', false]) && !(_target getVariable ['tfs_playedonce', false])",
    "(_caller distance _target < 2.5) && (alive _target) && !(_target getVariable ['ACE_isUnconscious', false]) && !(_target getVariable ['tfs_speak3d', false]) && !(_target getVariable ['tfs_playedonce', false])",
    {},
    {},
    {
        params ["_target", "_caller", "_actionId", "_params"];
        if (((_params select 0) getVariable ["enabled", 0]) > 0) then {
            [(_params select 0), _caller, _target] remoteExecCall ["TFS_fnc_moduleGlobalSpeechPlay", _target];
        };
    },
    {},
    [_logic],
    1,
    999,
    false,
    false
] call BIS_fnc_holdactionAdd;