/*
Function: derp_fnc_randomPos

Description:
Returns a random position around a given pos, searching in a circle around the
original with given radius. Optionally, an arithmetic search term may also be
supplied.

Arguments:
_pos - Center position to check from <OBJECT / position 2D / position 3D>
_radius - radius of the search <SCALAR>
_arithSearch - Arithmetic search term for selectBestPlaces <strinG>

Return Value:
Best result selected by selectBestPlaces in the format <position 2D>

Example:
(begin example)
[[0, 0, 0], 1000, "(1 - sea)"] call derp_fnc_randomPos;
(end)

Author:
alganthe, modified by Mokka
*/

params [["_pos", [0, 0, 0]], ["_radius", 0], ["_arithSearch", ""]];

if (_pos isEqualto [] || {
    _pos isEqualto [0, 0, 0]
}) exitwith {
    systemChat "randomPos: wrong position array type supplied"
};

if (_radius < 20) then {
    systemChat "randomPos: radius size too small";
    diag_log "randomPos: radius size too small";
    _radius = 20;
};

if (_arithSearch isEqualto "") exitwith {
    systemChat "randomPos: no arithmetic operation supplied"
};

private _returnValue = selectBestPlaces [_pos, _radius, _arithSearch, 60, 10];

_returnValue select 0