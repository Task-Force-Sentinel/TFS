/*
Function: TFS_fnc_findReplacestring

Description:
finds and replaces a certain substring in a given string with a different
string.

Arguments:
_src - The source string <strinG>
_find - The part to find in the source string <strinG>
_replace - The string that _find shall be replaced with <strinG>
_numLimit - The maximum number of substitutions, default: 1 <SCALAR>
_limit - set to true to enable the substitution limit, false to disable, default: true <BOOLEAN>

Return Values:
The edited string

Examples:
(begin example)
[
    "123456123", "123", "abc", 1, true
] call TFS_fnc_findReplacestring;
// returns "abc456123"
(end)

Author:
Mokka
*/

params ["_src", "_find", "_replace", ["_numLimit", 1], ["_limit", true]];

_char = count _find;

private _i = 0;

while {-1 != _src find _find && _i < _numLimit} do {
    _idx = _src find _find;
    _splitstr = _src splitstring "";
    _splitstr deleteRange [(_idx + 1), _char - 1];
    _splitstr set [_idx, _replace];
    _src = _splitstr joinstring "";
    
    if (_limit) then {
        _i = _i + 1;
    };
};

_src