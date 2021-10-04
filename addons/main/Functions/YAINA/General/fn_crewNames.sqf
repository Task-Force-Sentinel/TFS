// not documented: postinit

if (!hasinterface) exitwith {};

player addEventHandler ["GetinMan", {
    [{
        params ["_args", "_pfhID"];
        
        if (isNull objectParent player) then {
            [_pfhID] call CBA_fnc_removePerFrameHandler;
        } else {
            disableSerialization;
            
            1000 cutRsc ["Hudnames", "PLAin"];
            private _ui = uiNamespace getVariable "Hudnames";
            private _Hudnames = _ui displayCtrl 99999;
            
            private _vehicle = assignedvehicle player;
            private _weap = currentWeapon vehicle player;
            private _name = format ["<t size='1.1' color='#FFFFFF'>%1</t><br/>", gettext (configFile >> "Cfgvehicles" >> (typeOf _vehicle) >> "Displayname")];
            
            {
                _x params ["_unit", "_role", "_cargoindex", "_turretPath", "_personTurret"];
                
                if (_role isEqualto "driver") then {
                    _name = format ["<t size='0.9' color='#f0e68c'>%1 %2</t> <img size='0.8' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\actions\getindriver_ca.paa'/><br/>", _name, (name _unit)];
                } else {
                    if ((_role isEqualto "Turret" || {
                        _role isEqualto "gunner"
                    }) && {
                        count (getArray (([_vehicle, _turretPath] call CBA_fnc_getTurret) >> "weapons") select {
                            !(_x isEqualto "Laserdesignator_mounted")
                        }) > 0
                    }) then {
                        _name = format ["<t size='0.9' color='#f0e68c'>%1 %2</t> <img size='0.8' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\actions\getingunner_ca.paa'/><br/>", _name, (name _unit)];
                    } else {
                        _name = format ["<t size='0.9' color='#f0e68c'>%1 %2</t> <img size='0.8' color='#6b8e23' image='a3\ui_f\data\IGUI\Cfg\actions\getincargo_ca.paa'/><br/>", _name, (name _unit)];
                    };
                };
                nil;
            } count (fullCrew _vehicle);
            
            _Hudnames ctrlsetstructuredtext parsetext _name;
            _Hudnames ctrlCommit 0;
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
}];