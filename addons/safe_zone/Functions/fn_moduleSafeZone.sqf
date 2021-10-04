// not documented: module called

_logic = param [0, objNull, [objNull]];

// if (hasinterface && !isServer) exitwith {};

// _localgroups = _groups select {local _x};

// if (_localgroups isEqualto []) exitwith {};

private _SafeZoneEnable = _logic getVariable ["SafeZoneEnable", true];
private _SafeZonesize = _logic getVariable ["SafeZonesize", 150];
private _SafeZoneDuration = _logic getVariable ["SafeZoneDuration", 0];
private _SafeZoneLocation = (getPos _logic);

if !(_SafeZoneEnable) exitwith {};

[_SafeZonesize, _SafeZoneDuration, _SafeZoneLocation] remoteExecCall ["TFS_fnc_SafeZone", 0, true];