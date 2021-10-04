#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;

[{
    disableSerialization;
    params ["_list", "_lastselected"];
    
    private _selection = lbselection _list;
    GVAR(playerManagement_selected) = _selection apply {
        _list lbData _x
    };
    
    private _selected = [];
    for "_i" from 0 to ((lbsize _list) - 1) do {
        if (_list lbIsselected _i) then {
            _selected pushBack _i;
        };
    };
}, _this] call CBA_fnc_execNextFrame;