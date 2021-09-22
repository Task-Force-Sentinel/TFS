// debug logging

params ["_message"];

[_message, "DEBUG"] call YAINA_F_fnc_log;

[format ["[[TFSRHSF - DEBUG]] %1", _message]] remoteExec ["systemChat", 0];
[format ["[[TFSRHSF - DEBUG]] %1", _message]] remoteExec ["diag_log", 0];