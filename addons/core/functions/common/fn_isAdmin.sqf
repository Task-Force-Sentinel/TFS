/*
*	ARMA EXTENDED ENVIRONMENT
*	\z\tfs\addons\core\functions\common\fn_isadmin.sqf
*	by Ojemineh
*
*	check if player is admin
*
*	Arguments:
*	nothing
*
*	Return:
*	<BOOLEAN>
*
*	Example:
*	[] call TFS_fnc_isadmin;
*
*/

// -------------------------------------------------------------------------------------------------

private _return = false;

if (isMultiplayer) then {
    if (hasinterface && isServer) then {
        // HOSTED
        _return = true;
    } else {
        if ((call BIS_fnc_admin) > 0) then {
            // DEDICATED
            _return = true;
        };
    };
} else {
    // sinGLEplayer
    _return = true;
};

_return;