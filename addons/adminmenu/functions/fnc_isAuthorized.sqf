#include "\z\tfs\addons\adminmenu\script_component.hpp"
/*
* name = TFS_adminmenu_fnc_isAuthorized
* Author = Freddo
*
* parameters:
* 0: Object. - Object to check
*
* Description:
* Checks if player is defined as an admin in
* class TFS_adminMenu_authorized_players
*
* if executed on server then will check if the remote object is a logged in admin.
* if executed on a object local to the client, then it will check if the client is
* a logged in admin.
*
* Return:
* Boolean. - Whether player is an authorized admin
*/
params [["_unit", player, [objNull]]];

private _index = ("true" configClasses (configFile >> QGVAR(authorized_players))) findif {
    gettext (_x >> "uid") isEqualto getplayerUID _unit
};

switch true do {
    // Return true for server/HCs
    case ((isServer || !hasinterface) && {
        isNull _unit
    });
    // player UID listed in authorized_players config
    case (_index != -1);
    // Check if local client is admin
    case ((local _unit || isNull _unit) && {
        [] call BIS_fnc_admin > 0
    });
    // Check if remote client is admin (only available for servers)
    case (isServer && {
        admin owner _unit > 0
    });
    case (!isMultiplayer);
    case (is3DEN);
    case (is3DENMultiplayer): {
        true
    };
    
    default {
        false
    };
};