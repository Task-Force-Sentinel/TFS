private _dialogResult = [
    "Make IED",
    [
        [
            "SLIDER", ["Detonation time", "time in seconds until the IED detonates after being triggered"], [0, 3600, 120, 0]
        ],
        [
            "SLIDER", ["Trigger Proximity radius", "radius in m around the IED where players will trigger the detonation timer"], [0, 2000, 20, 0]
        ],
        [
            "CHECKBOX", ["Secondary explosions", "Enable/disable random secondary explosives around the IED"], true
        ],
        [
            "CHECKBOX", ["Announcements", "Enable/disable announcements when the IED is triggered, when it explodes and in certain intervals during the detonation countdown (see Announce interval)"], false
        ],
        [
            "SLIDER", ["Announce interval", "interval in seconds between announcements, ignore if 'Announcements' are disabled"], [0, 600, 30, 0]
        ],
        [
            "CHECKBOX", ["Require Defusal Kit", "if enabled, players require an ACE defusal kit in order to be able to defuse the IED"], true
        ]
    ],
    {
        params ["_results", "_args"];
        _results params ["_dettime", "_proxradius", "_secondaries", "_announce", "_anninterval", "_reqDefKit"];
        _args params ["_hoveredEntity"];
        
        [_hoveredEntity, _dettime, _proxradius, _secondaries, _announce, _anninterval, _reqDefKit] remoteExec ["TFS_fnc_MakeIED", 0, true];
    },
    {},
    [_hoveredEntity]
] call zen_dialog_fnc_create;

if !(_dialogResult) exitwith {
    ["Failed to create zen dialog!", "Errorlog"] call YAinA_F_fnc_log;
};