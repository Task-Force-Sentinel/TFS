#include "\z\tfs\addons\adminmenu\script_component.hpp"

params ["", "_keyPressed"];
private _modifiersPressed = _this select [2, 3];

private _authorized = [player] call FUNC(isAuthorized);

private _binding = ["TFS", QGVAR(openKey)] call CBA_fnc_getKeybind;
if (isnil "_binding") exitwith {};
(_binding select 5) params ["_DIK", "_modifiers"];

private _handleKeypress = (_keyPressed isEqualto _DIK) && (_modifiersPressed isEqualto _modifiers);
if (_handleKeypress) then {
    if (_authorized) then {
        if (dialog && !isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
            systemChat "[TFS admin Menu] The admin menu is already open"
        } else {
            if (!isNull (findDisplay 312)) then {
                systemChat "[TFS admin Menu] Can't open the admin menu in the Zeus interface";
            } else {
                createdialog QUOTE(ADdoN);
            };
        };
    };
} else {
    _binding = ["TFS", QGVAR(spectatorremoteControl)] call CBA_fnc_getKeybind;
    if (isnil "_binding") exitwith {};
    (_binding select 5) params ["_DIK", "_modifiers"];
    
    _handleKeypress = (_keyPressed isEqualto _DIK) && (_modifiersPressed isEqualto _modifiers);
    if (_handleKeypress) then {
        if (_authorized) then {
            if (isNull (findDisplay 5454)) then {
                if (isNull (missionnamespace getVariable ["bis_fnc_moduleremoteControl_unit", objNull])) then {
                    systemChat "[TFS admin Menu] Remote Control is available only through TFS Spectator";
                } else {
                    if (player isKindOf QEGVAR(spectator, unit)) then {
                        systemChat "[TFS admin Menu] Use scroll menu action to stop remote control";
                    };
                };
            } else {
                if (isnil QEGVAR(spectator, target)) then {
                    systemChat "[TFS admin Menu] No unit selected for Remote Control.";
                } else {
                    [EGVAR(spectator, target), true] call FUNC(remoteControl);
                    [format ["%1 remote controlled unit: %2", profileName, EGVAR(spectator, target)], false, "admin Menu"] call FUNC(log);
                };
            };
        };
    };
};

if (_handleKeypress && !_authorized) then {
    systemChat "[TFS admin Menu] You're not authorized to use the admin menu";
};

true;