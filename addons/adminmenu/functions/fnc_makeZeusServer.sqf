#include "\z\tfs\addons\adminmenu\script_component.hpp"

if !(isServer) exitwith {};

params ["_unit"];
if (isNull _unit) exitwith {};
if (!isNull (getAssignedCuratorlogic _unit)) exitwith {};
// already is a curator

private _isValidCurator = false;
{
    _isValidCurator = false;
    if (_x getVariable [QGVAR(zeus), false]) then {
        if (isNull (getAssignedCuratorUnit _x)) then {
            _isValidCurator = true;
        } else {
            if (!isplayer (getAssignedCuratorUnit _x)) then {
                _isValidCurator = true;
            };
        };
    };
    
    if (_isValidCurator) exitwith {
        unassignCurator _x;
        _unit assignCurator _x;
        "[TFS admin Menu] You were given access to Zeus" remoteExec ["systemChat", _unit];
    };
} forEach allCurators;

if (!_isValidCurator) then {
    private _curator = GVAR(zeusgroup) createUnit ["moduleCurator_F", [0, 0, 0], [], 0, "NONE"];
    _curator setVariable ["Addons", 3, true];
    _curator setVariable [QGVAR(zeus), true, true];
    _curator setVariable ["shownotification", false, true];
    
    _curator setCuratorWaypointCost 0;
    {
        _curator setCuratorCoef [_x, 0];
    } forEach ["place", "edit", "delete", "destroy", "group", "synchronize"];
    
    _unit assignCurator _curator;
    "[TFS admin Menu] You were given access to Zeus" remoteExec ["systemChat", _unit];
};