// not documented: postinit

if (!hasinterface) exitwith {};

private ["_vehicle", "_fnc_checkAccess"];

switch (TFS_Main_MaydayAccess) do {
    case 0: {
        _fnc_checkAccess = {
            false
        };
    };
    case 1: {
        _fnc_checkAccess = {
            (_this getVariable ["TFS_Section", -1]) isEqualto "909 EAW"
        };
    };
    case 2: {
        _fnc_checkAccess = {
            true
        };
    };
    default {
        _fnc_checkAccess = {
            true
        };
    };
};

[player, "GetinMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    _thisArgs params ["_fnc_checkAccess"];
    
    _playerVehRole = assignedvehicleRole player;
    if (_playerVehRole isEqualto []) exitwith {};
    _playerPos = _playerVehRole select 0;
    
    if ((_vehicle isKindOf "Air") && !(_vehicle isKindOf "ParachuteBase")) then {
        if (_vehicle isKindOf "Helicopter") then {
            _Heliactions = _vehicle getVariable ["HeliaddActions", false];
            
            if (not _Heliactions) then {
                _vehicle addAction ["<t color='#00FFFF'>Authorise Co-pilot</t>", {
                    params ["_target", "_caller", "_actionId", "_arguments"];
                    [_target, true] remoteExec ["enableCopilot", 0]
                }, "", 9, false, true, "", '(driver _target isEqualto _this) && (not isCopilotEnabled _target)'];
                _vehicle addAction ["<t color='#B33A3A'>Unauthorise Co-pilot</t>", {
                    params ["_target", "_caller", "_actionId", "_arguments"];
                    [_target, false] remoteExec ["enableCopilot", 0]
                }, "", 10, false, true, "", '(driver _target isEqualto _this) && (isCopilotEnabled _target)'];
                
                _vehicle setVariable ["HeliaddActions", true, false];
            };
            
            if (_unit call _fnc_checkAccess) then {
                // check for emergency takeover of controls
                private _handle = [
                    {
                        params ["_args", "_handle"];
                        _args params ["_unit", "_vehicle"];
                        
                        // check if pilot still active
                        if ([_vehicle] call TFS_fnc_ispilotdown) exitwith {
                            // check if vehicle moving/on the ground
                            if ((round (speed _vehicle) != 0) || (not istouchingGround _vehicle)) then {
                                // check if player is copilot
                                if (_unit in ([_vehicle] call TFS_fnc_getCopilots)) then {
                                    _unit action ["TakevehicleControl", _vehicle];
                                    
                                    if (not isCopilotEnabled _vehicle) then {
                                        [_vehicle, true] remoteExec ["enableCopilot", 0];
                                    };
                                    
                                    [
                                        "<t color='#ff0000' size='0.5'>Emergency Controls Enabled!</t>",
                                        -1, 0.8, 2,
                                        0, 0, 789
                                    ] spawn BIS_fnc_dynamictext;
                                };
                            };
                        };
                    },
                    1,
                    [_unit, _vehicle]
                ] call CBA_fnc_addPerFrameHandler;
                
                _vehicle setVariable ["TFS_MaydayHandle", _handle, false];
            };
        };
        
        if ((_playerPos isEqualto "driver") && !(player getUnitTrait "pilot")) exitwith {
            moveOut _unit;
            playSound "Denied";
            ["<t color='#FFBB00' size = '.5'>You're not a pilot.</t>", -1, 0.8, 5, 0.5, 0, 789] spawn BIS_fnc_dynamictext;
        };
    };
}, [_fnc_checkAccess]] call CBA_fnc_addBISEventHandler;

player addEventHandler [
    "SeatswitchedMan", {
        params ["_unit1", "_unit2", "_vehicle"];
        
        _playerVehRole = assignedvehicleRole player;
        if (_playerVehRole isEqualto []) exitwith {};
        _playerPos = _playerVehRole select 0;
        
        if ((_vehicle isKindOf "Air") && !(_vehicle isKindOf "ParachuteBase")) then {
            if ((_playerPos isEqualto "driver") && !(player getUnitTrait "pilot")) exitwith {
                moveOut _unit1;
                playSound "Denied";
            };
        };
    }
];

player addEventHandler ["GetoutMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    
    // remove the mayday check
    _handle = _vehicle getVariable ["TFS_MaydayHandle", -1];
    
    if (_handle != -1) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
}];