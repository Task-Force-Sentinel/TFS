params ["_pos", "_attachedobject"];

if (isNull _attachedobject) exitwith {};
if (not alive _attachedobject) exitwith {};

private _id = format ["casualty_%1", round (random 10000)];

[_attachedobject] remoteExec ["TFS_fnc_Casualty", 0, _id];