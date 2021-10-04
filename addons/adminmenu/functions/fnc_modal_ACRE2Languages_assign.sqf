#include "\z\tfs\addons\adminmenu\script_component.hpp"

params [["_langstoAdd", []], ["_langstoremove", []]];

private _spokenLangs = (call acre_sys_core_fnc_getSpokenlanguages) - _langstoremove;
_spokenLangs append _langstoAdd;

if (count _spokenLangs == 0) exitwith {
    systemChat "[TFS admin Menu] Failed to assign ACRE2 languages";
};

private _spokenLangsIds = _spokenLangs apply {
    [_x] call acre_sys_core_fnc_getlanguageId
};
ACRE_SPOKEN_languageS = _spokenLangsIds;
[_spokenLangs select 0] call acre_sys_core_fnc_setSpeakinglanguage;

systemChat "[TFS admin Menu] New ACRE2 babel language(s) assigned";