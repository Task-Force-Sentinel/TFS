params ["_pos"];

if (_pos isEqualto [0, 0, 0]) exitwith {
    [format ["Error: invalid position for module"], "Zeuslog"] call YAinA_F_fnc_log;
};

private _dialogResult = [
    "Create Safe Zone",
    [
        ["EDIT", "size", "150"],
        ["EDIT", "Duration", "0"]
    ],
    {
        params ["_results", "_args"];
        
        _args params ["_pos"];
        
        _procResults = [];
        
        {
            // Process number inputs and make sure they're integers
            _value = round (parseNumber _x);
            _procResults pushBack _value;
        } forEach _results;
        
        _procResults params [
            "_size",
            "_duration"
        ];
        
        [_size, _duration, _pos] remoteExec ["TFS_fnc_SafeZone", 0];
    },
    {},
    [_pos]
] call zen_dialog_fnc_create;

if !(_dialogResult) exitwith {
    ["Failed to create zen dialog!", "Errorlog"] call YAinA_F_fnc_log;
};