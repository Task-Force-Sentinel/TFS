#include "\z\tfs\addons\adminmenu\script_component.hpp"

if (!isnil "ace_medical_treatment_fnc_fullHeal") then {
    {
        [player, _x] call ace_medical_treatment_fnc_fullHeal;
        (format ["[TFS admin Menu] Your health was restored by '%1'", profileName]) remoteExec ["systemChat", _x];
    } forEach GVAR(utilityData);
} else {
    {
        _x setDamage 0;
    } forEach GVAR(utilityData);
};

systemChat format ["[TFS admin Menu] %1 players had their health restored", count GVAR(utilityData)];

[format ["%1 Restored health on %2", profileName, GVAR(utilityData) apply {
    name _x
}], false, "admin Menu"] call FUNC(log);