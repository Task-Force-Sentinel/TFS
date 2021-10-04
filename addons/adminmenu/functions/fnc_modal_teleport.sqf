#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_ctrlgroup"];

GVAR(utility_teleport_toggle) = false;
GVAR(utility_teleport_drawEnemy) = 0;
GVAR(utility_teleport_paradrop) = 0;

(ctrlposition _ctrlgroup) params ["_ctrlGrpX", "_ctrlGrpY", "_ctrlGrpWidth", "_ctrlGrpHeight"];
_ctrlgroup ctrlEnable false;

private _display = uiNamespace getVariable [QGVAR(modalDisplay), displayNull];
private _ctrlMap = _display ctrlCreate ["RscMapControl", -1];
GVAR(utilityTabControls) pushBack _ctrlMap;
_ctrlMap ctrlsetPosition [_ctrlGrpX, _ctrlGrpY, _ctrlGrpWidth, _ctrlGrpHeight - (2.2 * TFS_adminMENU_STD_HEIGHT)];
_ctrlMap ctrlCommit 0;
if (!isNull cameraOn) then {
    _ctrlMap ctrlmapAnimAdd [0, ctrlMapScale _ctrlMap, cameraOn];
    ctrlmapAnimCommit _ctrlMap;
};
_ctrlMap ctrlAddEventHandler ["mouseButtonClick", {
    params ["_ctrlMap", "", "_pos_x", "_pos_y"];
    
    private _toggle = missionnamespace getVariable [QGVAR(utility_teleport_toggle), false];
    if (_toggle) then {
        GVAR(utility_teleport_toggle) = !_toggle;
        (_ctrlMap getVariable [QGVAR(association), controlnull]) ctrlsettext (["Enable Teleport", "Disable Teleport"] select GVAR(utility_teleport_toggle));
        
        private _numplayers = count GVAR(utilityData);
        
        {
            // swap vehicle crew with their vehicle
            if (!isNull objectParent _x) then {
                GVAR(utilityData) set [_forEachindex, objectParent _x];
            };
        } forEach GVAR(utilityData);
        GVAR(utilityData) = GVAR(utilityData) arrayintersect GVAR(utilityData);
        
        private _pos = _ctrlMap ctrlMapscreentoWorld [_pos_x, _pos_y];
        
        [{
            params ["_args", "_pfh"];
            _args params ["_pos", "_units"];
            
            if (count _units == 0) exitwith {
                [_pfh] call CBA_fnc_removePerFrameHandler;
            };
            private _isParadropped = (missionnamespace getVariable [QGVAR(utility_teleport_paradrop), 0]) == 1;
            
            private _unit = _units deleteAt 0;
            
            if (_unit isKindOf "CAManBase") then {
                // humans
                if (_isParadropped) then {
                    private _parachute = createvehicle ["Steerable_Parachute_F", _pos, [], 50, "FLY"];
                    _parachute allowdamage false;
                    private _newPos = getPos _parachute;
                    _newPos set [2, 500];
                    _parachute setPos _newPos;
                    
                    _unit moveInAny _parachute;
                    
                    "[TFS admin Menu] You were paradropped" remoteExec ["systemChat", _unit];
                } else {
                    _unit setvehiclePosition [_pos, [], 0, "forM"];
                    "[TFS admin Menu] You were teleported" remoteExec ["systemChat", _unit];
                };
            } else {
                // vehicles
                if (_unit isKindOf "Airvehicle" && !istouchingGround _unit) then {
                    // flying aircraft
                    private _velocity = velocity _unit;
                    
                    private _height = ((getPosATL _unit) select 2) max 100;
                    if (_unit isKindOf "Plane") then {
                        _height = _height max 500;
                    };
                    private _newPos = +_pos;
                    _newPos set [2, _height];
                    _unit setPos _newPos;
                    [_unit, _newPos] remoteExec ["setPos", _unit];
                    
                    if (_unit isKindOf "Plane") then {
                        // only planes need velocity;
                        for helicopters this is risky
                        _velocity set [2, 0 max (_velocity select 2)];
                        if (vectorMagnitude _velocity < 100) then {
                            _velocity = _velocity vectorMultiply (100 / vectorMagnitude _velocity);
                        };
                        
                        [_unit, _velocity] remoteExec ["setvelocity", _unit];
                    };
                } else {
                    _unit setvehiclePosition [_pos, [], 0, "forM"];
                };
                
                private _crew = crew _unit;
                "[TFS admin Menu] Your vehicle was teleported" remoteExec ["systemChat", _crew];
            };
        }, 0.1, [_pos, +GVAR(utilityData)]] call CBA_fnc_addPerFrameHandler;
        
        systemChat format ["[TFS admin Menu] Teleported %1 players", _numplayers];
        
        [format [
            "%1 %2 %3 %4 %5",
            profileName,
            if _isParadropped then [{
                "Paradropped"
            }, {
                "Teleported"
            }],
            GVAR(utilityData) apply {
                name _x
            },
            if _isParadropped then [{
                "at"
            }, {
                "to"
            }],
            _pos
        ], false, "admin Menu"] call FUNC(log);
    };
}];
_ctrlMap ctrlAddEventHandler ["draw", {
    params ["_ctrlMap"];
    if ((missionnamespace getVariable [QGVAR(utility_teleport_drawEnemy), 0]) == 1) then {
        {
            _ctrlMap drawIcon ["\a3\ui_f\data\Map\Markers\Military\dot_CA.paa", (side _x) call FUNC(sidetoColor), getPos _x, 24, 24, 0];
        } forEach allunits;
    } else {
        private _pos = [];
        {
            if ((side _x) isEqualto (side player)) then {
                _pos = getPos _x;
                _ctrlMap drawIcon ["\a3\ui_f\data\Map\Markers\Military\dot_CA.paa", [0, 0, 0, 1], _pos, 24, 24, 0];
                _ctrlMap drawIcon ["\a3\ui_f\data\Map\Markers\Military\dot_CA.paa", (side _x) call FUNC(sidetoColor), _pos, 20, 20, 0];
            };
        } forEach playableunits;
    };
}];

private _ctrlCheckDrawAllsides = _display ctrlCreate ["RscCheckBox", -1];
GVAR(utilityTabControls) pushBack _ctrlCheckDrawAllsides;
_ctrlCheckDrawAllsides ctrlsetPosition [_ctrlGrpX, _ctrlGrpY + _ctrlGrpHeight - (2.2 * TFS_adminMENU_STD_HEIGHT), TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
_ctrlCheckDrawAllsides ctrlCommit 0;
_ctrlCheckDrawAllsides ctrlAddEventHandler ["CheckedChanged", {
    GVAR(utility_teleport_drawEnemy) = param [1];
}];

private _ctrlLabelDrawAllsides = _display ctrlCreate [QGVAR(Rsctext), -1];
GVAR(utilityTabControls) pushBack _ctrlLabelDrawAllsides;
_ctrlLabelDrawAllsides ctrlsetPosition [_ctrlGrpX + TFS_adminMENU_STD_WIDTH, _ctrlGrpY + _ctrlGrpHeight - (2.2 * TFS_adminMENU_STD_HEIGHT), (0.2 * _ctrlGrpWidth) - TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
_ctrlLabelDrawAllsides ctrlCommit 0;
_ctrlLabelDrawAllsides ctrlsettext "Draw enemy units on map";

// private _paradropCheckX = (ctrlposition _ctrlLabelDrawAllsides) select 0 + ctrltextWidth _ctrlLabelDrawAllsides + TFS_adminMENU_STD_WIDTH;
private _ctrlCheckParadropinfantry = _display ctrlCreate ["RscCheckBox", -1];
GVAR(utilityTabControls) pushBack _ctrlCheckParadropinfantry;
_ctrlCheckParadropinfantry ctrlsetPosition [_ctrlGrpX + (0.2 * _ctrlGrpWidth), _ctrlGrpY + _ctrlGrpHeight - (2.2 * TFS_adminMENU_STD_HEIGHT), TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
_ctrlCheckParadropinfantry ctrlCommit 0;
_ctrlCheckParadropinfantry ctrlAddEventHandler ["CheckedChanged", {
    GVAR(utility_teleport_paradrop) = param [1];
}];

private _ctrlLabelParadropinfantry = _display ctrlCreate [QGVAR(Rsctext), -1];
GVAR(utilityTabControls) pushBack _ctrlLabelParadropinfantry;
_ctrlLabelParadropinfantry ctrlsetPosition [_ctrlGrpX + (0.2 * _ctrlGrpWidth) + TFS_adminMENU_STD_WIDTH, _ctrlGrpY + _ctrlGrpHeight - (2.2 * TFS_adminMENU_STD_HEIGHT), (0.2 * _ctrlGrpWidth) - TFS_adminMENU_STD_WIDTH, TFS_adminMENU_STD_HEIGHT];
_ctrlLabelParadropinfantry ctrlCommit 0;
_ctrlLabelParadropinfantry ctrlsettext "drop infantry in parachute";

private _ctrlhint = _display ctrlCreate [QGVAR(Rsctext), -1];
GVAR(utilityTabControls) pushBack _ctrlhint;
_ctrlhint ctrlsetPosition [_ctrlGrpX, _ctrlGrpY + _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT, 0.8 * _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
_ctrlhint ctrlCommit 0;
_ctrlhint ctrlsettext "After locating the destination area, press the Enable Teleport button and then click the desired location on the map.";

private _ctrlButton = _display ctrlCreate [QGVAR(RscButtonMenu), -1];
GVAR(utilityTabControls) pushBack _ctrlButton;
_ctrlButton ctrlsetPosition [_ctrlGrpX + 0.8 * _ctrlGrpWidth, _ctrlGrpY + _ctrlGrpHeight - TFS_adminMENU_STD_HEIGHT, 0.2 * _ctrlGrpWidth, TFS_adminMENU_STD_HEIGHT];
_ctrlButton ctrlCommit 0;
_ctrlButton ctrlsettext "Enable Teleport";
_ctrlButton ctrlAddEventHandler ["buttonClick", {
    params ["_ctrlButton"];
    GVAR(utility_teleport_toggle) = !(missionnamespace getVariable [QGVAR(utility_teleport_toggle), false]);
    _ctrlButton ctrlsettext (["Enable Teleport", "Disable Teleport"] select GVAR(utility_teleport_toggle));
}];

_ctrlMap setVariable [QGVAR(association), _ctrlButton];