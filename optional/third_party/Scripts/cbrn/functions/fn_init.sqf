#include "script_component.hpp"

if (isServer) then {
    cbrn_zoneSimulationRange = 500;
    publicVariable "cbrn_zoneSimulationRange";
};

if !(hasInterface) exitWith {};

if (isNil "cbrn_mask_abberation") then {
    private _name = "ChromAberration";
    private _priority = 400;
    cbrn_mask_abberation = ppEffectCreate [_name, _priority];
    while {
        cbrn_mask_abberation < 0
    } do {
        _priority = _priority + 1;
        cbrn_mask_abberation = ppEffectCreate [_name, _priority];
    };
};
if (isNil "cbrn_mask_damage") then {
    private _name = "ChromAberration";
    private _priority = 400;
    cbrn_mask_damage = ppEffectCreate [_name, _priority];
    while {
        cbrn_mask_damage < 0
    } do {
        _priority = _priority + 1;
        cbrn_mask_damage = ppEffectCreate [_name, _priority];
    };
    cbrn_mask_damage ppEffectEnable true;
    cbrn_mask_damage ppEffectAdjust [0, 0, true];
    cbrn_mask_damage ppEffectCommit 0;
};

cbrn_loadouteh = ["cba_events_loadoutEvent",{
    params ["_unit"];
    if (_unit != TFS_unit) exitWith {};
    private _goggles = goggles _unit;
    private _backpack = backpack _unit;
    private _uniform = uniform _unit;

    private _hasMask = (cbrn_masks findIf {_x isEqualTo _goggles}) > -1;
    if (!(_unit getVariable ["cbrn_mask_on", false]) && {_hasMask}) then {
        // guy JUST put that mask on
        _unit setVariable ["cbrn_mask_on", true, true];
        cbrn_mask_abberation ppEffectEnable true;
        cbrn_mask_abberation ppEffectAdjust [0.005,0.005,true];
        cbrn_mask_abberation ppEffectCommit 1;

        "cbrn_gasmask_overlay" cutRsc ["cbrn_gasmask", "PLAIN", 1, false];
        cbrn_breath_handle = [_unit] spawn {
            params ["_unit"];
            private _fat = 0;
            while{alive _unit && _unit getVariable ["cbrn_mask_on", false]} do {
                _fat = [_unit] call cbrn_fnc_getFatigue;
                sleep (0.75 + (3 - (3 * _fat)) + (random (2 - (2 * _fat))));
                if !(alive _unit && _unit getVariable ["cbrn_mask_on", false]) exitWith {};
                playSound format ["gas_breath_in_%1", floor (random 4) + 1];
                _fat = [_unit] call cbrn_fnc_getFatigue;
                sleep (0.75 + (2 - (2 * _fat)) + (random (2 - (2 * _fat))));
                if !(alive _unit && _unit getVariable ["cbrn_mask_on", false]) exitWith {};
                playSound format ["gas_breath_out_%1", floor (random 4) + 1];
            };
        };
    };
    if (_unit getVariable ["cbrn_mask_on", false] && {!_hasMask}) then {
        // guy JUST put that mask away
        _unit setVariable ["cbrn_mask_on", false, true];
        cbrn_mask_abberation ppEffectEnable true;
        cbrn_mask_abberation ppEffectAdjust [0,0,true];
        cbrn_mask_abberation ppEffectCommit 1;
        "cbrn_gasmask_overlay" cutFadeOut 1;
        terminate cbrn_breath_handle;
    };

    private _hasBackpack = (cbrn_backpacks findIf {_x isEqualTo _backpack}) > -1;
    if (!(_unit getVariable ["cbrn_backpack_on", false]) && {_hasBackpack}) then {
        _unit setVariable ["cbrn_backpack_on", true, true];
    };
    if (_unit getVariable ["cbrn_backpack_on", false] && {!_hasBackpack}) then {
        _unit setVariable ["cbrn_backpack_on", false, true];
    };

    private _hasThreatMeter = ([_unit, cbrn_threatMeteritem] call ace_common_fnc_hasItem || cbrn_threatMeteritem in assignedItems _unit);
    if (!(_unit getVariable ["cbrn_hasThreatMeter", false]) && {_hasThreatMeter}) then {
        _unit setVariable ["cbrn_hasThreatMeter", true, true];
    };
    if (_unit getVariable ["cbrn_hasThreatMeter", false] && {!_hasThreatMeter}) then {
        _unit setVariable ["cbrn_hasThreatMeter", false, true];
        if (_unit getVariable ["cbrn_using_threat_meter", false]) then {
            _unit setVariable ["cbrn_using_threat_meter", false, true];
        };
    };

    private _hasSuit = (cbrn_suits findIf {_x isEqualTo _uniform}) > -1;
    if (!(_unit getVariable ["cbrn_hasSuite", false]) && {_hasSuit}) then {
        _unit setVariable ["cbrn_hasSuite", true, true];
    };
    if (_unit getVariable ["cbrn_hasSuite", false] && {!_hasSuit}) then {
        _unit setVariable ["cbrn_hasSuite", false, true];
    };

    private _backPackContainer = backpackContainer _unit;
    if (_unit getVariable ["cbrn_backpack_on", false] && {_unit getVariable ["cbrn_mask_on", false]}) then {
        // add hose
        if !(_backPackContainer getVariable ["cbrn_hose_attached", false]) then {
            _backPackContainer setVariable ["cbrn_hose_attached", true];

            if (_goggles isEqualTo "G_RegulatorMask_F") then {
                _backPackContainer setObjectTextureGlobal [2,"a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
            } else {
                _backPackContainer setObjectTextureGlobal [1,"a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
                _backPackContainer setObjectTextureGlobal [3,"a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
            };
        };
    } else {
        if (_backPackContainer getVariable ["cbrn_hose_attached", false]) then {
            _backPackContainer setVariable ["cbrn_hose_attached", false];
            _backPackContainer setObjectTextureGlobal [1,""];
            _backPackContainer setObjectTextureGlobal [2,""];
            _backPackContainer setObjectTextureGlobal [3,""];
        };
    };
}] call CBA_fnc_addEventHandler;

private _action = ["cbrn_turn_on_oxygen", "Turn on oxygen","",{
    [TFS_unit] call cbrn_fnc_startOxygen;
},{
    private _player = TFS_unit;
    private _backpackItem = backpackContainer _player;
    !(_player getVariable ["cbrn_oxygen", false]) && {!isNull _backpackItem && {_player getVariable ["cbrn_mask_on", false] && {_player getVariable ["cbrn_backpack_on", false] && {_backpackItem getVariable ["cbrn_air", 100] > 0}}}}
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["cbrn_turn_off_oxygen", "Turn off oxygen","",{
    TFS_unit setVariable ["cbrn_oxygen", false];
},{
    TFS_unit getVariable ["cbrn_oxygen", false]
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["cbrn_check_oxygen", "Check remaining oxygen","",{
    [{
        params ["_unit"];
        [_unit] call cbrn_fnc_checkOxygen;
    }, [TFS_unit]] call CBA_fnc_execNextFrame;
},{
    TFS_unit getVariable ["cbrn_backpack_on", false];
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

"ChemiCalDetector" cutRsc ["RscWeaponChemicalDetector", "PLAIN", 1, false];
cbrn_threatPfh = [cbrn_fnc_threatPFH, 0.5, [cba_missiontime]] call CBA_fnc_addPerFrameHandler;
cbrn_beepPfh = -1;

[{
    private _player = TFS_unit;
    private _range = missionNameSpace getVariable ["cbrn_zoneSimulationRange", 500];
    {
        if ((_player distance2D _x) < _range) then {
            if !(simulationEnabled _x) then {
                _x enableSimulation true;
            };
        } else {
            if (simulationEnabled _x) then {
                _x enableSimulation false;
            };
        };
    } forEach cbrn_localZones;
}, 10] call CBA_fnc_addPerFrameHandler;

TFS_unit addEventHandler ["Killed", {
    params ["_unit"];
    if (_unit getVariable ["cbrn_mask_on", false]) then {
        _unit setVariable ["cbrn_mask_on", false, true];
        cbrn_mask_abberation ppEffectEnable true;
        cbrn_mask_abberation ppEffectAdjust [0,0,true];
        cbrn_mask_abberation ppEffectCommit 1;
        "cbrn_gasmask_overlay" cutFadeOut 1;
        terminate cbrn_breath_handle;
    };
    _unit setVariable ["cbrn_using_threat_meter", false, true];
}];

TFS_unit addEventHandler ["Respawn", {
    TFS_unit setVariable ["cbrn_damage", nil];
    TFS_unit setVariable ["cbrn_autoDamage", nil];
    TFS_unit setVariable ["cbrn_stoppedAutoDamage", nil];
    TFS_unit getVariable ["cbrn_using_threat_meter", nil];
    TFS_unit setVariable ["cbrn_oxygen", nil];
}];

_action = ["cbrn_turn_check_damage", "Check CRBN Exposure","",{
    private _damage = TFS_unit getVariable ["cbrn_damage", 0];
    private _coef = _damage / cbrn_maxDamage;
    if (_coef < 0.1) exitWith {
        titleText ["You are feeling <t color='#00ff00'>fine</t>!" , "PLAIN DOWN", -1, false, true];
    };
    if (_coef < 0.4) exitWith {
        titleText ["You are feeling <t color='#ffff00'>okay</t>! Breathing stings a little..." , "PLAIN DOWN", -1, false, true];
    };
    if (_coef < 0.9) exitWith {
        titleText ["You are feeling <t color='#ff7b00'>not good</t>! Breathing stings, your skin feels bad..." , "PLAIN DOWN", -1, false, true];
    };
    titleText ["You are feeling <t color='#ff0000'>really fucking bad</t>! The end is near..." , "PLAIN DOWN", -1, false, true];
    },
    {local TFS_unit},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","Medical"], _action, true] call ace_interact_menu_fnc_addActionToClass;
["CAManBase", 1, ["ACE_SelfActions","ACE_Medical"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ["cbrn_turn_on_threatmeter", "Turn on threatmeter","",{
    TFS_unit setVariable ["cbrn_using_threat_meter", true, true];
},{
    !(TFS_unit getVariable ["cbrn_using_threat_meter", false]) && {TFS_unit getVariable ["cbrn_hasThreatMeter", false]}
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;
_action = ["cbrn_turn_off_threatmeter", "Turn off threatmeter","",{
    TFS_unit setVariable ["cbrn_using_threat_meter", false, true];
},{
    TFS_unit getVariable ["cbrn_using_threat_meter", false]
},{},[], [0,0,0], 3] call ace_interact_menu_fnc_createAction;
["CAManBase", 1, ["ACE_SelfActions","ACE_Equipment"], _action, true] call ace_interact_menu_fnc_addActionToClass;

["cbrn_turnOnShower", {
    params ["_shower"];
    [_shower, true] call cbrn_fnc_toggleShower;
}] call CBA_fnc_addEventhandler;
["cbrn_turnOffShower", {
    params ["_shower"];
    [_shower, false] call cbrn_fnc_toggleShower;
}] call CBA_fnc_addEventhandler;

TFS_unit createDiaryRecord ["Credits", ["CBRN Mechanic",
"This Mission will feature several CBRN mechanics! There is CBRN related damage, you can check on your approximate health via ACE self-interacting -> Medical -> Check CBRN Exposure.<br/><br/>Warning CBRN exposure will never vanish in this mission, it takes days to get rid of it, so it is not simulated! Be careful and do not soak up too much! If you soak up too much a vicious cycle will start, and the exposure will constantly rise. It will continue to rise even in non-exposed areas until you use a decontamination shower. You will be notified when this happens!<br/><br/>If you exceed the maximum threshold you will die, flat out.<br/><br/>Oxygen in backpack tanks are finite! Once the air runs out they are useless, constantly keep checking your tanks air pressure! The tank will beep 3 times if your remaining air is below 5 minutes, it will sound a constant tone for 10 seconds when you reach 30 seconds left. You can switch out an oxygen tank while oxygen is still running without the oxygen supply to dry up.<br/><br/>People with a MicroDagr can open a threat monitor. It will appear at the top of the screen. The threat meter is rainbow color coded, going from Green to Yellow to Orange to Red, indicating the threat level. Each level is additive and need the previous requirements!<br/><br/>Threat level 1 (Green): No Mask needed<br/><br/>Threat level 2 (Yellow): Mask needed<br/><br/>Threat level 3 (Orange): Fresh oxygen supply needed<br/><br/>Threat level 4 (Red): Full CBRN suit<br/><br/>Any threat level above cannot be displayed on the threat meter, it is kind of the equivalent of 3.6 roentgen."]];

if !(isNil "CBA_fnc_addItemContextMenuOption") then {
    {
        [_x, "BACKPACK", "Turn on oxygen", nil, nil, [{
                private _player = TFS_unit;
                private _backpackItem = backpackContainer _player;
                !(_player getVariable ["cbrn_oxygen", false]) && {!isNull _backpackItem && {_player getVariable ["cbrn_mask_on", false] && {_player getVariable ["cbrn_backpack_on", false] && {_backpackItem getVariable ["cbrn_air", 100] > 0}}}}
            }, {
                private _player = TFS_unit;
                _player getVariable ["cbrn_backpack_on", false] && {!(_player getVariable ["cbrn_oxygen", false])}
            }], {
            [TFS_unit] call cbrn_fnc_startOxygen;
            false
        }, false] call CBA_fnc_addItemContextMenuOption;

        [_x, "BACKPACK", "Turn off oxygen", nil, nil,
        [{TFS_unit getVariable ["cbrn_oxygen", false]}, {TFS_unit getVariable ["cbrn_oxygen", false]}], {
            TFS_unit setVariable ["cbrn_oxygen", false];
            false
        }, false] call CBA_fnc_addItemContextMenuOption;

        [_x, "BACKPACK", "Check remaining oxygen", nil, nil,
        [{true}, {TFS_unit getVariable ["cbrn_backpack_on", false]}], {
            [{
                params ["_unit"];
                [_unit] call cbrn_fnc_checkOxygen;
            }, [TFS_unit]] call CBA_fnc_execNextFrame;
            false
        }, false] call CBA_fnc_addItemContextMenuOption;
    } forEach cbrn_backpacks;

    ["ChemicalDetector_01_watch_F", "WATCH", "Increase volume", nil, nil,
    [{cbrn_beepVolume < 5},{cbrn_beep}], {
        cbrn_beepVolume = cbrn_beepVolume + 1;
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    ["ChemicalDetector_01_watch_F", "WATCH", "Decrease volume", nil, nil,
    [{cbrn_beepVolume > 0},{cbrn_beep}], {
        cbrn_beepVolume = cbrn_beepVolume - 1;
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    ["ChemicalDetector_01_watch_F", "WATCH", "Turn beeping on", nil, nil,
    [{!cbrn_beep},{!cbrn_beep}], {
        cbrn_beep = true;
        cbrn_beepPfh = [cbrn_fnc_detectorBeepPFH, 0.05, [cba_missiontime]] call CBA_fnc_addPerFrameHandler;
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    ["ChemicalDetector_01_watch_F", "WATCH", "Turn beeping off", nil, nil,
    [{cbrn_beep},{cbrn_beep}], {
        cbrn_beep = false;
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    [cbrn_threatMeteritem, "CONTAINER", "Turn on threatmeter", nil, nil,
    [{!(TFS_unit getVariable ["cbrn_using_threat_meter", false]) && {TFS_unit getVariable ["cbrn_hasThreatMeter", false]}},{!(TFS_unit getVariable ["cbrn_using_threat_meter", false]) && {TFS_unit getVariable ["cbrn_hasThreatMeter", false]}}], {
        TFS_unit setVariable ["cbrn_using_threat_meter", true, true];
        false
    }, false] call CBA_fnc_addItemContextMenuOption;

    [cbrn_threatMeteritem, "CONTAINER", "Turn off threatmeter", nil, nil,
    [{TFS_unit getVariable ["cbrn_using_threat_meter", false]},{TFS_unit getVariable ["cbrn_using_threat_meter", false]}], {
        TFS_unit setVariable ["cbrn_using_threat_meter", false, true];
        false
    }, false] call CBA_fnc_addItemContextMenuOption;
};
