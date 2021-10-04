params ["_value"];
if (_value) then {
    [{
        time > 5 && {
            player == player
        }
    },
    {
        [] spawn {
            if !(hasinterface) exitwith {};
            private _msg = (getPos player) call BIS_fnc_locationDescription;
            _msg = _msg + format ['<br/>%1/%2/%3', (date select 0), (date select 1), (date select 2)];
            _msg = _msg + format ['<br/>%1', ([daytime, 'HH:MM'] call BIS_fnc_timetoString)];
            [
                _msg,
                [safeZoneX + safeZoneW - 0.8, 0.50],
                [safeZoneY + safeZoneH - 0.8, 0.8],
                5,
                0.5
            ] spawn BIS_fnc_dynamictext;
        };
    }, nil] call CBA_fnc_waitUntilandexecute;
};