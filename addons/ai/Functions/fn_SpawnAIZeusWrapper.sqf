/*
Function: TFS_fnc_spawnAIZeusWrapper

Description:
Wraps calls to TFS_fnc_spawnAI for use with the Zeus modules.

Arguments:
_side - The side of the AI to spawn <strinG>
_pos - position of the module <ARRAY/POS3D>

Return Values:
None

Examples:
nothing to see here

Author:
Mokka
*/

#define east_factionS ["Vanilla - CSAT", "Vanilla - CSAT (Pacific)", "@3CB factions - Chernarus Communist Militia", "@3CB factions - Takistan National Army", "@3CB factions - Takistan insurgents", "@3CB factions - Takistan National Police", "@CFP - Abu sayyaf group", "@CFP - Al Qaeda", "@CFP - Al-Shabaab", "@CFP - Ansar Allah (Houthis)", "@CFP - Boko Haram", "@CFP - Central African Rebels", "@CFP - Chernarussian movement of the Red Star Winter", "@CFP - Hamas Al Qassam Brigades", "@CFP - Hezbollah", "@CFP - Iraqi Army (Hussein Regime)", "@CFP - Islamic Republic of Iran Army", "@CFP - Islamic State", "@CFP - Korean People's Army", "@CFP - Russian Ground forces (Arid / Desert)", "@CFP - Russian National Guard", "@CFP - Sudanese Armed forces", "@CFP - Sudan Rapid Support forces / Janjaweed", "@CFP - Somali Rebels", "@CFP - Sudan People's Liberation movement", "@CFP - Syrian Arab Army", "@CFP - Taliban insurgents", "@CSAT mod Project - CSAT (Iran, Mediterranean)", "@CSAT mod Project - CSAT (Iran, Pacific)", "@CUP - Chernarussian movement of the Red Star", "@CUP - Russian Federation", "@CUP - Sahrani Liberation Army", "@CUP - Takistan Army", "@CUP - Takistan Militia", "@ifA3 - Red Army", "@OPTRE - insurrectionists", "@Project opfor - African Militia", "@Project opfor - Middle eastern Militia", "@Project opfor - Boko Haram", "@Project opfor - ChDKZ", "@Project opfor - Irish Republican Army", "@Project opfor - Islamic State", "@Project opfor - Sahrani Liberation Army", "@Project opfor - Takistani Armed forces", "@RHS AFRF - Russia - MSV", "@RHS AFRF - Russia - VDV", "@RHS AFRF - Russia - VMF", "@RHS GREF - ChDKZ insurgents", "@UNSUNG - NVA", "@Taliban RHS Config - Taliban"]
#define inDEP_factionS ["Vanilla - AAF", "Vanilla - Syndikat", "@3CB factions - Chernarus Nationalist Militia", "@3CB factions - Takistan National Army", "@3CB factions - Takistan Tribal Fighters", "@3CB factions - Takistan National Police", "@3CB factions - UN Peacekeepers", "@CFP - al-Nusra Front", "@CFP - Islamic State", "@CFP - Sudan People's Liberation movement North", "@CFP - Sudan Revolutionary Front", "@CFP - South Sudan People's Defense force", "@CFP - Tuareg Rebels", "@CFP - western Ultranationalists", "@CUP - National Part of Chernarus", "@CUP - ION PMC", "@CUP - Royal Army Corps of Sahrani", "@CUP - Takistani locals", "@CUP - United Nations", "@ifA3 - US Army", "@Project opfor - Iranian Armed forces", "@Project opfor - Chernarussian National insurgents", "@Project opfor - Kurdish Peshmerga forces", "@Project opfor - private Military Company", "@Project opfor - Royal Army Corps of Sahrani", "@Project opfor - Ultranationalists", "@Project opfor - Ukrainian Armed forces", "@Project opfor - United Nations", "@Project opfor - Ulster Volunteer force", "@RHS GREF - Chernarus (Ground forces)", "@RHS GREF - ChDKZ insurgents", "@RHS GREF - Nationalist Militia", "@RHS SAF - SAF (KOV)", "@RHS SAF - SAF (UN Peacekeepers)"]
#define west_factionS ["Vanilla - NAto", "Vanilla - NAto (Pacific)", "@3CB BAF - Army - Arctic", "@3CB BAF - Army - Desert", "@3CB BAF - Army - MTP", "@3CB BAF - Army - Temperate", "@3CB BAF - Army - Tropical", "@3CB BAF - Army - Woodland", "@3CB factions - Afghan National Army", "@3CB factions - Afghan National Police", "@3CB factions - Chernarus local Defence Volunteers", "@3CB factions - Takistan National Army", "@3CB factions - Takistan Pro-Government Militia", "@3CB factions - Takistan National Police", "@3CB factions - UN Peacekeepers", "@CFP - Afghan Army", "@CFP - Afghan Police", "@CFP - Chadian Armed forces", "@CFP - Chernarus Defense forces [Winter]", "@CFP - Israeli Defense force", "@CFP - Iraqi Army", "@CFP - Iraqi Police", "@CFP - Kenyan Defense force", "@CFP - Malian Government forces", "@CFP - Nigerian Army", "@CFP - Peshmerga", "@CFP - Uganda People's Defense force", "@CFP - US Army 1991 [Arid/Desert]", "@CFP - US Army 1991 [Woodland]", "@CFP - US Army 2003 [Arid/Desert]", "@CFP - US Army 2003 [Woodland]", "@CFP - US CIA (Middle east)", "@CFP - US 75th Rangers (Jungle/Woodland)", "@CFP - US Navy Seals (Arid / Desert)", "@CFP - US Navy Seals (Jungle / Woodland)", "@CFP - YPG", "@CUP - Army of the Czech Republic", "@CUP - British Armed forces", "@CUP - Bundeswehr", "@CUP - United States Army", "@ifA3 - Wehrmacht", "@OPTRE - UNSCDF", "@Project opfor - Afghan National Army", "@Project opfor - Iraqi Armed forces", "@RHS USAF - USA Army - Desert", "@RHS USAF - USA Army - Woodland"]

#define east_factionS_LOOKUP ["OPF_F", "OPF_T_F", "UK3CB_CCM_O", "UK3CB_TKA_O", "UK3CB_TKM_O", "UK3CB_TKP_O", "CFP_O_ABUsayYAF", "CFP_O_ALQAEDA", "CFP_O_ALSHABAAB", "CFP_O_ANSARALLAH", "CFP_O_BOKOHARAM", "CFP_O_CFRebels", "CFP_O_CHDKZ_SNW", "CFP_O_HAMAS", "CFP_O_HEZBOLLAH", "CFP_O_IQARMY", "CFP_O_IRARMY", "CFP_O_IS", "CFP_O_NKARMY", "CFP_O_RUARMY_DES", "CFP_O_RUMVD", "CFP_O_SDARMY", "CFP_O_SDMilitia", "CFP_O_SorEBEL", "CFP_O_SSREBELS", "CFP_O_SYARMY", "CFP_O_TBAN", "TEC_CSAT", "TEC_CSAT_Pacific", "CUP_O_ChDKZ", "CUP_O_RU", "CUP_O_SLA", "CUP_O_TK", "CUP_O_TK_MILITIA", "LIB_RKKA", "OPTRE_ins", "LOP_AFR_OPF", "LOP_AM_OPF", "LOP_BH", "LOP_ChDKZ", "LOP_IRA", "LOP_ISTS_OPF", "LOP_SLA", "LOP_TKA", "rhs_faction_msv", "rhs_faction_vdv", "rhs_faction_vmf", "rhsgref_faction_chdkz", "UNSUNG_E_NVA", "TBan_group"]
#define inDEP_factionS_LOOKUP ["inD_F", "inD_C_F", "UK3CB_CCM_I", "UK3CB_TKA_I", "UK3CB_TKM_I", "UK3CB_TKP_I", "UK3CB_UN_I", "CFP_I_AlnUSRA", "CFP_I_IS", "CFP_I_SDRebels", "CFP_I_SDRebelsrf", "CFP_I_SSArmy", "CFP_I_TUAREG", "CFP_I_westUltra", "CUP_I_NAPA", "CUP_I_PMC_ION", "CUP_I_RACS", "CUP_I_TK_GUE", "CUP_I_UN", "LIB_US_ARMY", "LOP_IRAN", "LOP_NAPA", "LOP_PESH_inD", "LOP_PMC", "LOP_RACS", "LOP_UA", "LOP_UKR", "LOP_UN", "LOP_UVF", "rhsgref_faction_cdf_ground", "rhsgref_faction_chdkz_g", "rhsgref_faction_nationalist", "rhssaf_faction_army", "rhssaf_faction_un"]
#define west_factionS_LOOKUP ["BLU_F", "BLU_T_F", "UK3CB_BAF_faction_Army_Arctic", "UK3CB_BAF_faction_Army_Desert", "UK3CB_BAF_faction_Army_MTP", "UK3CB_BAF_faction_Army_Temperate", "UK3CB_BAF_faction_Army_Tropical", "UK3CB_BAF_faction_Army_Woodland", "UK3CB_ANA_B", "UK3CB_ANP_B", "UK3CB_CCM_B", "UK3CB_TKA_B", "UK3CB_TKM_B", "UK3CB_TKP_B", "UK3CB_UN_B", "CFP_B_AFARMY", "CFP_B_AFGPOLICE", "CFP_B_CAF", "CFP_B_CDF_SNW", "CFP_B_ILIDF", "CFP_B_IQARMY", "CFP_B_IQPOLICE", "CFP_B_KEARMY", "CFP_B_MLARMY", "CFP_B_NAARMY", "CFP_B_PESH", "CFP_B_UGARMY", "CFP_B_USARMY_1991_DES", "CFP_B_USARMY_1991_WDL", "CFP_B_USARMY_2003_DES", "CFP_B_USARMY_2003_WDL", "CFP_B_USCI", "CFP_B_USRANGERS_WDL", "CFP_B_USSEALS_DES", "CFP_B_USSEALS_WDL", "CFP_B_YPG", "CUP_B_CZ", "CUP_B_GB", "CUP_B_GER", "CUP_B_US_Army", "LIB_WEHRMACHT", "OPTRE_UNSC", "LOP_AA", "LOP_IA", "rhs_faction_usarmy_d", "rhs_faction_usarmy_wd"]

params [["_side", ""], ["_pos", [0, 0, 0]]];

if ((_side isEqualto "") || (_pos isEqualto [0, 0, 0])) exitwith {
    ["Couldn't process wrapper call", "Errorlog"] call YAinA_F_fnc_log;
};

// Holds the array of factions that are available for selection, based on side
_prettynames = [];

// Is used to match the selected faction with the the internal name, by index
_lookup = [];

switch (toLower _side) do {
    case "east": {
        _prettynames = east_factionS;
        _lookup = east_factionS_LOOKUP;
    };
    case "independent": {
        _prettynames = inDEP_factionS;
        _lookup = inDEP_factionS_LOOKUP;
    };
    case "west": {
        _prettynames = west_factionS;
        _lookup = west_factionS_LOOKUP;
    };
    default {};
};

private _dialogResult = [
    format ["spawn AI - %1", _side],
    [
        ["EDIT", "Objective name", ["Objective Alpha"]],
        ["COMBO", "faction", [_lookup, _prettynames, 0]],
        ["EDIT", "Garrison radius", ["100"]],
        ["EDIT", "min. Garrisoned groups", ["0"]],
        ["EDIT", "max. Garrisoned groups", ["0"]],
        ["COMBO", "Patrol Method", [["random", "ROAD"], ["random", "Along Roads"], 1]],
        ["EDIT", "spawn radius", ["500"]],
        ["EDIT", "min. infantry Patrols", ["0"]],
        ["EDIT", "max. infantry Patrols", ["0"]],
        ["EDIT", "min. AA infantry Squads", ["0"]],
        ["EDIT", "max. AA infantry Squads", ["0"]],
        ["EDIT", "min. AT infantry Squads", ["0"]],
        ["EDIT", "max. AT infantry Squads", ["0"]],
        ["EDIT", "min. Sniper teams", ["0"]],
        ["EDIT", "max. Sniper teams", ["0"]],
        ["EDIT", "min. AA vehicles", ["0"]],
        ["EDIT", "max. AA vehicles", ["0"]],
        ["EDIT", "min. Light vehicles", ["0"]],
        ["EDIT", "max. Light vehicles", ["0"]],
        ["EDIT", "min. MRAPS", ["0"]],
        ["EDIT", "max. MRAPS", ["0"]],
        ["EDIT", "min. Heavy vehicles", ["0"]],
        ["EDIT", "max. Heavy vehicles", ["0"]],
        ["EDIT", "min. random vehicles", ["0"]],
        ["EDIT", "max. random vehicles", ["0"]]
    ],
    {
        params ["_results", "_args"];
        
        _args params ["_pos"];
        
        _procResults = [];
        
        {
            _value = _x;
            
            // Process number inputs and make sure they're integers
            if !(_forEachindex in [0, 1, 5]) then {
                _value = round (parseNumber _x);
            };
            
            _procResults pushBack _value;
        } forEach _results;
        
        _procResults params [
            "_grpPrefix",
            "_faction",
            "_garrradius",
            "_garrisonsmin", "_garrisonsmax",
            "_patrolMethod",
            "_radius",
            "_infmin", "_infmax",
            "_infaamin", "_infaamax",
            "_infatmin", "_infatmax",
            "_snipermin", "_snipermax",
            "_vehaamin", "_vehaamax",
            "_vehlightmin", "_vehlightmax",
            "_vehmrapmin", "_vehmrapmax",
            "_vehheavymin", "_vehheavymax",
            "_vehrandmin", "_vehrandmax"
        ];
        
        // Actually call spawnAI, do it remotely so the server has the units and takes care of them c:
        [
            _pos,
            _grpPrefix,
            _faction,
            _garrradius,
            [_garrisonsmin, _garrisonsmax],
            _patrolMethod,
            _radius,
            [_infmin, _infmax],
            [_infaamin, _infaamax],
            [_infatmin, _infatmax],
            [_snipermin, _snipermax],
            [_vehaamin, _vehaamax],
            [_vehlightmin, _vehlightmax],
            [_vehmrapmin, _vehmrapmax],
            [_vehheavymin, _vehheavymax],
            [_vehrandmin, _vehrandmax]
        ] remoteExec ["TFS_fnc_spawnAI", 2];
    },
    {},
    [_pos]
] call zen_dialog_fnc_create;

if !(_dialogResult) exitwith {
    ["Failed to create zen dialog!", "Errorlog"] call YAinA_F_fnc_log;
};