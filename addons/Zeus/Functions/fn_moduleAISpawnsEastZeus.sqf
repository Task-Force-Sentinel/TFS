params ["_pos"];

if (_pos isEqualto [0, 0, 0]) exitwith {
    [format ["Error: invalid position for module"], "Zeuslog"] call YAinA_F_fnc_log;
};

["east", _pos] call TFS_fnc_spawnAIZeusWrapper;