// not documented: internal function
if (not hasinterface) exitwith {};

params [
    "_object",
    ["_actionTitle", "Take intel"],
    ["_itemname", "intel"]
];

[
    _object,
    "intel_" + str (floor (random 360)),
    _actionTitle,
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
    "_player distance _target < 2 &&
    {
        ((side group _player) in (_target getVariable ['RscAttributeowners', [west, east, resistance, civilian]])) ||
        (((group _player) getVariable ['TFS_section', 'Command']) in (_target getVariable ['RscAttributeowners', ['Command']]))
    }",
    "true",
    {
        [format["<t color='#FFBB00' size = '.5'>You're collecting %1.</t>", (_this select 2) select 0], -1, 0.8, 5, 2, 0, 789] spawn BIS_fnc_dynamictext;
    },
    {},
    {
        _this spawn TFS_fnc_Runintelaction;
        [format["<t color='#339900' size = '.5'>You've collected %1.</t>", (_this select 2) select 0], -1, 0.8, 5, 2, 0, 789] spawn BIS_fnc_dynamictext;
    },
    {
        [format["<t color='#cc3232' size = '.5'>You've stopped collecting %1.</t>", (_this select 2) select 0], -1, 0.8, 5, 2, 0, 789] spawn BIS_fnc_dynamictext;
    },
    [_itemname],
    5,
    true,
    format ["You're collecting %1", _itemname],
    false
] call TFS_fnc_AddHoldaction;