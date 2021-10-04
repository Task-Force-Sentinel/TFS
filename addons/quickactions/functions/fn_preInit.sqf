/*
Author: diwako
Description:
Pre init method for CBA settings
*/
#define CBA_setTinGS_CAT "TFS Quick actions"

[
    "TFS_quickactions_add_detonator", "CHECKBOX", ["Add detonate action", "Adds the detonation quick action to detonate all placed explosives"], CBA_setTinGS_CAT, true, true
] call CBA_settings_fnc_init;

[
    "TFS_quickactions_add_fast_rope", "CHECKBOX", ["Add fast rope action", "Adds the fast rope action to the quick action menu to fast rope"], CBA_setTinGS_CAT, true, true
] call CBA_settings_fnc_init;