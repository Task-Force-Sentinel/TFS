// Display faction icons in 3DEN unit/group asset lists

#include "\z\tfs\addons\common\script_component.hpp"

disableSerialization;

if !(is3DEN) exitwith {};

private _topCtrl = (((findDisplay 313) displayCtrl 1021) controlsgroupCtrl 1039) controlsgroupCtrl 1049;
if (isNull _topCtrl) exitwith {};

private ["_i", "_faction", "_factionIcon"];
{
    for "_i" from 0 to ((_x tvCount []) - 1) do {
        _faction = _x tvData [_i];
        
        if !(_faction isEqualto "") then {
            _factionIcon = gettext (configFile >> "CfgfactionClasses" >> _faction >> "icon");
            
            if !(_factionIcon isEqualto "") then {
                _x tvSetPictureRight [[_i], _factionIcon];
            };
        };
    };
} forEach ([56, 57, 58, 59, 61, 62, 63, 64] apply {
    _topCtrl controlsgroupCtrl _x
});