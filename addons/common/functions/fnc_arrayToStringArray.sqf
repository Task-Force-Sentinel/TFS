params ["_arr"];
private _text = "";
{
    private _t = _x;
    if (!(_t isEqualtype "")) then {
        _t = str _x
    };
    if (_t != "") then {
        _t = str _t;
        // quote _t
        if (_forEachindex != 0) then {
            _t = ", " + _t;
        };
        _text = _text + _t;
    };
} forEach _arr;
format["{
    %1
}", _text];