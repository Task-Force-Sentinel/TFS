/*
* name: TFS_common_fnc_isadmin
* Author: Snippers
*
* Arguments:
* None
*
* Return:
* boolean
*
* Description:
* Use this function to determine if the local client is admin
*/

private _return = false;

if (isServer or serverCommandAvailable "#kick") then {
    _return = true;
};

// Check 1Tac admin IDs.
if (!isnil "tac1_adminIDs") then {
    private _localID = [] call tac1_admin_local_uid;
    if (_localID in ([] call tac1_adminIDs)) then {
        _return = true;
    };
};

_return