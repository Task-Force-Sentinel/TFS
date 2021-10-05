/*
 * ARMA EXTENDED ENVIRONMENT
 * \z\tfs\addons\modules\functions\speech\fn_moduleGlobalSpeechMenu.sqf
 * by Ojemineh
 * 
 * module function
 * 
 * Arguments:
 * 0: logic - <OBJECT>
 * 
 * Return:
 * nothing
 * 
 * Example:
 * [] call TFS_fnc_moduleGlobalSpeechMenu;
 * 
 */

// -------------------------------------------------------------------------------------------------

private ["_logic"];

_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _logic) exitWith {};

// -------------------------------------------------------------------------------------------------

// VALIDATE SOURCE

private _source = _logic getVariable ["source", ""];
if (_source isEqualTo "") exitWith {};
if (isNull (missionNamespace getVariable [_source, objNull])) exitWith {};

private _unit = missionNamespace getVariable _source;
if !(_unit isKindOf "Man") exitWith {};

// -------------------------------------------------------------------------------------------------

private _unitName = [_unit] call ACE_common_fnc_getName;
private _holdText = format [localize "STR_TFS_Modules_GlobalSpeech_HoldAction", _unitName];
private _holdIcon = "\z\tfs\addons\modules\data\gui\holdAction_speech_ca.paa";

[
    _unit,
    _holdText,
    _holdIcon,
    _holdIcon,
    "(_this distance _target < 2.5) && (alive _target) && !(_target getVariable ['ACE_isUnconscious', false]) && !(_target getVariable ['tfs_speak3d', false]) && !(_target getVariable ['tfs_playedOnce', false])",
    "(_caller distance _target < 2.5) && (alive _target) && !(_target getVariable ['ACE_isUnconscious', false]) && !(_target getVariable ['tfs_speak3d', false]) && !(_target getVariable ['tfs_playedOnce', false])",
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
] call BIS_fnc_holdActionAdd;
