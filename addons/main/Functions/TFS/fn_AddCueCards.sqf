// not documented: postinit

if !(hasinterface) exitwith {};
if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

_cueCardsData = [
    // 0 - caseVAC Request Card
    [
        "z\tfs\addons\Media\images\cuecards\medivac.paa",
        "caseVAC Request Card"
    ],
    
    // 1 - Contact Report Card
    [
        "z\tfs\addons\Media\images\cuecards\tic.paa",
        "Contact Report Card"
    ],
    
    // 2 - CAS Checkin Card
    [
        "z\tfs\addons\Media\images\cuecards\cascheck.paa",
        "CAS Check in Card"
    ],
    
    // 3 - CAS Card
    [
        "z\tfs\addons\Media\images\cuecards\casbrief.paa",
        "CAS Briefing Card"
    ],
    
    // 4 - Salute Card
    [
        "z\tfs\addons\Media\images\cuecards\salute.paa",
        "(SALUTE) Card"
    ],
    // 5 - ACE Card
    [
        "z\tfs\addons\Media\images\cuecards\ace.paa",
        "(ACE) Card"
    ],
    // 6 - Front Line Trace (POSREP) Card
    [
        "z\tfs\addons\Media\images\cuecards\posrep.paa",
        "Front Line Trace (POSREP) Card"
    ],
    // 7 - vehicle Report (DEFREP) Card
    [
        "z\tfs\addons\Media\images\cuecards\venicle.paa",
        "vehicle Report (DEFREP) Card"
    ],
    // 8 - Bandages
    [
        "z\tfs\addons\Media\images\cuecards\bandages.paa",
        "Bandages notes"
    ],
    // 9 - Medical notes
    [
        "z\tfs\addons\Media\images\cuecards\mednotes.paa",
        "Medical notes"
    ],
    // 10 - Medical Process
    [
        "z\tfs\addons\Media\images\cuecards\medproces.paa",
        "Medical Process"
    ],
    // 11 - call for fire
    [
        "z\tfs\addons\Media\images\cuecards\cff.paa",
        "call for fire"
    ],
    // 12 - Method of fire and Control
    [
        "z\tfs\addons\Media\images\cuecards\mfc.paa",
        "Method of fire and Control"
    ],
    // 13 - Rotary landing
    [
        "z\tfs\addons\Media\images\cuecards\landingb.paa",
        "Rotary landing"
    ]
];

// Add Parent action
_parentaction = [
    "CueCardaction",
    "Cue Cards",
    "",
    {
        diag_log "running parent action"
    },
    {
        true
    }
] call ace_interact_menu_fnc_createaction;

[player, 1, ["ACE_Selfactions"], _parentaction] call ace_interact_menu_fnc_addActiontoObject;

// Add action to open notepad
_npaction = [
    "opennotepad",
    "Open notepad",
    "", // see if this looks nice or not todo
    {
        _this spawn {
            params ["_target", "_caller"];
            
            diag_log format ["[[logGinG]] Target: %1", _target];
            
            disableSerialization;
            ([] call bis_fnc_displayMission) createDisplay "Rscnotepad";
            [missionnamespace, "cueCardShown", [_target] + ["notepad"]] spawn bis_fnc_callScriptedEventHandler;
        };
    },
    {
        true
    },
    {},
    [],
    ""
] call ace_interact_menu_fnc_createaction;

[player, 1, ["ACE_Selfactions", "CueCardaction"], _npaction] call ace_interact_menu_fnc_addActiontoObject;

// Add Cue Card actions
{
    _x params [
        "_texture",
        "_name"
    ];
    
    _title = format ["Show %1", _name];
    _id = format ["cueCardaction_%1", _forEachindex];
    
    diag_log format ["[[logGinG]] ID: %1 Title: %2", _id, _title];
    
    _action = [
        _id,
        _title,
        _texture, // see if this looks nice or not todo
        {
            _this spawn {
                params ["_target", "_caller", "_data"];
                
                diag_log format ["[[logGinG]] Target: %2 Data: %1", _data, _target];
                
                disableSerialization;
                missionnamespace setVariable ["RscDisplayCueCard_data", _data];
                ([] call bis_fnc_displayMission) createDisplay "RscDisplayCueCard";
                ([] call bis_fnc_displayMission) createDisplay "notepaddialog";
                [missionnamespace, "cueCardShown", [_target] + _data] spawn bis_fnc_callScriptedEventHandler;
            };
        },
        {
            true
        },
        {},
        _x,
        ""
    ] call ace_interact_menu_fnc_createaction;
    
    [player, 1, ["ACE_Selfactions", "CueCardaction"], _action] call ace_interact_menu_fnc_addActiontoObject;
} forEach _cueCardsData;