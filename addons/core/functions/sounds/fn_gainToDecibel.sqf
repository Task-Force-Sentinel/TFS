/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\sounds\fn_gaintoDecibel.sqf
*	by Ojemineh
*
*	convert gain to decibel
*
*	Arguments:
*	0: gain - <NUMBER>
*
*	Return:
*	<NUMBER>
*
*	Example:
*	[1] call TFS_fnc_gaintoDecibel;
*
*/

// -------------------------------------------------------------------------------------------------

private ["_gain"];

_gain = [_this, 0, 1, [0]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (_gain <= 0) exitwith {
    0
};

// -------------------------------------------------------------------------------------------------

private _return = 20 * (log _gain);

_return;