/*
Author: diwako
Description:
Post init method to set up eventhanlders and the like
*/

if !(hasinterface) exitwith {};

if (tfs_quickactions_add_detonator) then {
    [["<t color='#FF0000'>touch off all explosives</t>", {
        [ace_player, -1, ([ace_player] call ACE_explosives_fnc_getPlacedexplosives), "ACE_Clacker"] call ACE_explosives_fnc_detonateexplosiveAll;
    }, nil, 10, false, true, "", "count ([ace_player] call ACE_explosives_fnc_getPlacedexplosives) > 0"]] call CBA_fnc_addplayeraction;
};