/*
Function: TFS_fnc_checkFOBPackUp

Description:
Returns true if the FOB can be deployed, false otherwise...

Arguments:
_object - Object to check FOB space for

Return Values:
true if enough space is free, false otherwise

Examples:
nothing to see here

Author:
Mokka
*/
params ["_object"];

_size = _object getVariable ["TFS_PortableFOB_size", -1];
_fobPos = _object getVariable ["TFS_PortableFOB_Pos", [0, 0, 0]];
_pos = getPos _object;

_tooFar = ((_pos distance2D _fobPos) > (5 + _size * 5));
_deployed = (_object getVariable ["TFS_PortableFOB_Deployed", false]);

if (_deployed && {
    _tooFar
}) exitwith {
    hintSilent "FOB can't be packed up! Container is too far away...";
    false;
};

// Can't packed up what's not been deployed
// Can't pack up stuff that's too far away either
_deployed && (!_tooFar)