#include "\z\tfs\addons\autotest\script_component.hpp"

private _output = [];
// group count check.
{
    private _side = _x;
    private _groupcount = {
        (side _x isEqualto _side)
    } count allgroups;
    if (_groupcount > 200) then {
        _output pushBack [1, format["side %1 has %2 groups. note Arma has a 288 group limit per side.", _side, _groupcount]];
    }
} forEach [west, east, civilian, resistance];

_output