/*
* name: TFS_common_fnc_drawLines
* Author: Head
*
* Arguments:
* list of positions
* Color
*
* Return:
* nil
*
* Description:
*
*/
params ["_poslist", "_color"];
private _prevPos = _poslist select 0;
if (count _poslist <= 1) exitwith {};
for "_i" from 1 to (count _poslist)-1 do {
    drawLine3D [_prevPos, _poslist select _i, _color];
    _prevPos = _poslist select _i;
};