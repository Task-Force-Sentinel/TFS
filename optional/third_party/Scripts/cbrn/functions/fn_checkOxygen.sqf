#include "script_component.hpp"

params ["_unit"];
private ["_remaining", "_bars", "_emptyBars", "_color", "_string", "_text", "_picture"];

_remaining = (backpackContainer _unit) getVariable ["cbrn_oxygen", cbrn_maxOxygenTime];
_bars = round ((_remaining / cbrn_maxOxygenTime) * 10);
if (_bars isEqualTo 0 && {_remaining > 0}) then {
    _bars = 1;
};
_emptyBars = 10 - _bars;

_color = [((2 * (1 - _remaining / cbrn_maxOxygenTime)) min 1), ((2 * _remaining / cbrn_maxOxygenTime) min 1), 0];

_string = "";
for "_a" from 1 to _bars do {
    _string = _string + "|";
};
_text = [_string, _color] call ace_common_fnc_stringToColoredText;

_string = "";
for "_a" from 1 to _emptyBars do {
    _string = _string + "|";
};
_text = composeText [_text, [_string, "#808080"] call ace_common_fnc_stringToColoredText];

_picture = getText (configFile >> "CfgVehicles" >> (backpack _unit) >> "picture");
[_text, _picture] call ace_common_fnc_displayTextPicture;
