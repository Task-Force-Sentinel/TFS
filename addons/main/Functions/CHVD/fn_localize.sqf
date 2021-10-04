_display = (_this select 0) select 0;

if (islocalized "str_chvd_title") then {
    (_display displayCtrl 1000) ctrlsettext (toUpper (localize "str_chvd_title"));
};
if (islocalized "str_chvd_foot") then {
    (_display displayCtrl 1001) ctrlsettext (localize "str_chvd_foot");
};
if (islocalized "str_chvd_car") then {
    (_display displayCtrl 1008) ctrlsettext (localize "str_chvd_car");
};
if (islocalized "str_chvd_air") then {
    (_display displayCtrl 1015) ctrlsettext (localize "str_chvd_air");
};
if (islocalized "str_chvd_view") then {
    (_display displayCtrl 1002) ctrlsettext (localize "str_chvd_view");
    (_display displayCtrl 1010) ctrlsettext (localize "str_chvd_view");
    (_display displayCtrl 1016) ctrlsettext (localize "str_chvd_view");
};
if (islocalized "str_chvd_object") then {
    (_display displayCtrl 1003) ctrlsettext (localize "str_chvd_object");
    (_display displayCtrl 1011) ctrlsettext (localize "str_chvd_object");
    (_display displayCtrl 1021) ctrlsettext (localize "str_chvd_object");
};
if (islocalized "str_chvd_terrain") then {
    (_display displayCtrl 1005) ctrlsettext (localize "str_chvd_terrain");
    (_display displayCtrl 1012) ctrlsettext (localize "str_chvd_terrain");
    (_display displayCtrl 1019) ctrlsettext (localize "str_chvd_terrain");
};
if (islocalized "str_chvd_sync") then {
    (_display displayCtrl 1403) ctrlsettext (localize "str_chvd_sync");
    (_display displayCtrl 1405) ctrlsettext (localize "str_chvd_sync");
    (_display displayCtrl 1407) ctrlsettext (localize "str_chvd_sync");
};
if (islocalized "str_chvd_close") then {
    (_display displayCtrl 1612) ctrlsettext (localize "str_chvd_close");
};