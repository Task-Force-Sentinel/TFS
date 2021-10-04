#include "\z\tfs\addons\adminmenu\script_component.hpp"

params [["_unit", objNull, [objNull]], ["_toggle", true, [true]], ["_skipmodal", false, [false]]];

if (!_toggle) exitwith {
    // Bad, can still command group via map click when back in spectator
    private _rcUnit = missionnamespace getVariable ["bis_fnc_moduleremoteControl_unit", objNull];
    if (!isNull _rcUnit && ((_rcUnit getVariable ["bis_fnc_moduleremoteControl_owner", objNull]) isEqualto player)) then {
        _rcUnit setVariable ["bis_fnc_moduleremoteControl_owner", nil, true];
        objNull remoteControl _rcUnit;
        bis_fnc_moduleremoteControl_unit = nil;
        selectPlayer EGVAR(spectator, unit);
    };
};

private _crew = [];
if (!isNull objectParent _unit && !_skipmodal) then {
    _crew = (fullCrew vehicle _unit) select {
        alive (_x # 0) && !isplayer (_x # 0)
    };
};

if ((count _crew > 1) && !_skipmodal) exitwith {
    GVAR(remoteControlunits) = [_crew, objectParent _unit];
    createdialog QGVAR(spectatorControlUnitdialog);
};

private _error = "";
call {
    if (isNull _unit) exitwith {
        _error = localize "str_a3_cfgvehicles_moduleremoteControl_f_errorNull";
    };
    if (isplayer _unit) exitwith {
        _error = localize "str_a3_cfgvehicles_moduleremoteControl_f_errorplayer";
    };
    if !(alive _unit) exitwith {
        _error = localize "str_a3_cfgvehicles_moduleremoteControl_f_errorDestroyed";
    };
    if !(_unit isKindOf "CAManBase") exitwith {
        _error = "Target must be a unit.";
    };
    if !((side group _unit) in [east, west, resistance, civilian]) exitwith {
        _error = localize "str_a3_cfgvehicles_moduleremoteControl_f_errorEmpty";
    };
    private _tempowner = _unit getVariable ["bis_fnc_moduleremoteControl_owner", objNull];
    if (!isNull _tempowner && {
        _tempowner in allplayers
    }) exitwith {
        _error = localize "str_a3_cfgvehicles_moduleremoteControl_f_errorControl";
    };
    if (isUAVConnected vehicle _unit) exitwith {
        _error = localize "str_a3_cfgvehicles_moduleremoteControl_f_errorControl";
    };
};

if (_error isEqualto "") then {
    bis_fnc_moduleremoteControl_unit = _unit;
    _unit setVariable ["bis_fnc_moduleremoteControl_owner", player, true];
    
    [{
        if (dialog) then {
            closedialog 2;
        } else {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, 0] call CBA_fnc_addPerFrameHandler;
    
    [{
        !dialog
    }, {
        private _vehicle = vehicle _this;
        player remoteControl _this;
        if (cameraOn != _vehicle) then {
            _vehicle switchCamera cameraView;
        };
        
        [{
            !alive _this ||
            (_this getVariable ["ACE_isUnconscious", false]) ||
            (cameraOn isEqualto player) ||
            !(player isKindOf QEGVAR(spectator, unit)) ||
            !((missionnamespace getVariable ["bis_fnc_moduleremoteControl_unit", objNull]) isEqualto _this) ||
            !((_this getVariable ["bis_fnc_moduleremoteControl_owner", objNull]) isEqualto player)
        }, {
            private _reasons = [];
            if (!alive _this) then {
                _reasons pushBack "RC unit is dead";
            };
            if (_this getVariable ["ACE_isUnconscious", false]) then {
                _reasons pushBack "RC unit is unconscious";
            };
            if (cameraOn isEqualto player) then {
                _reasons pushBack "Camera is on player";
            };
            if (!(player isKindOf QEGVAR(spectator, unit))) then {
                _reasons pushBack "player is not a spectator unit (respawned?)";
            };
            if (!((missionnamespace getVariable ["bis_fnc_moduleremoteControl_unit", objNull]) isEqualto _this)) then {
                _reasons pushBack "Mission RC var says current unit shouldn't be RC'd";
            };
            if (!((_this getVariable ["bis_fnc_moduleremoteControl_owner", objNull]) isEqualto player)) then {
                _reasons pushBack "Unit RC var says player shouldn't be remote controlling it";
            };
            systemChat format [
                "[TFS admin Menu] Remote Control stopped because: %1",
                _reasons joinstring " | "
            ];
            
            if ((_this getVariable ["bis_fnc_moduleremoteControl_owner", objNull]) isEqualto player) then {
                _this setVariable ["bis_fnc_moduleremoteControl_owner", nil, true];
                objNull remoteControl _this;
                bis_fnc_moduleremoteControl_unit = nil;
            };
            
            [{
                if (isNull (findDisplay 5454)) then {
                    createdialog QEGVAR(spectator, dialog);
                };
            }, 0, 0.33] call CBA_fnc_waitandexecute;
        }, _this] call CBA_fnc_waitUntilandexecute;
    }, _unit] call CBA_fnc_waitUntilandexecute;
} else {
    systemChat format [
        "[TFS admin Menu] Spectator Remote Control error: %1",
        _error
    ];
};