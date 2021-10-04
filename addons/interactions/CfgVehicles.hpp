class CBA_Extended_EventHandlers;
class Cfgvehicles {
    class Man;
    class CAManBase: Man {
        class ACE_actions {
            // exceptions[] = {"isnotDead", "isnotUnconscious", "isnotSurrendering", "isnotHandcuffed", "isnotCarrying", "isnotDragging", "isnotEscorting", "isnotSwimming", "isnotRefueling", "isnotonLadder", "isnotSitting", "isnotinside", "isnotinZeus", "notonMap"};
            
            /* SHOULDER TAP */
            
            class ACE_TapShoulderLeft {
                condition = "false";
            };
            class ACE_TapShoulderRight {
                condition = "false";
            };
            
            class TFS_interactions_action_TapShoulder_Left {
                displayname = "$str_TFS_interactions_action_TapShoulder";
                condition = "[_player, _target] call TFS_interactions_fnc_tapshoulder_canTap";
                statement = "[_player, _target, 0] call TFS_interactions_fnc_tapshoulder_doTap";
                exceptions[] = {
                    "isnotSwimming"
                };
                selection = "LeftShoulder";
                showDisabled = 0;
                distance = 2.0;
            };
            
            class TFS_interactions_action_TapShoulder_Right {
                displayname = "$str_TFS_interactions_action_TapShoulder";
                condition = "[_player, _target] call TFS_interactions_fnc_tapshoulder_canTap";
                statement = "[_player, _target, 1] call TFS_interactions_fnc_tapshoulder_doTap";
                exceptions[] = {
                    "isnotSwimming"
                };
                selection = "RightShoulder";
                showDisabled = 0;
                distance = 2.0;
            };
            
            class ACE_Mainactions {
                /* backpack ACCESS */
                
                class TFS_interactions_action_backpack_Access {
                    displayname = "$str_TFS_interactions_action_backpack_Access";
                    condition = "[_player, _target] call TFS_interactions_fnc_backpack_canAccess";
                    statement = "[_player, _target] call TFS_interactions_fnc_backpack_doAccess";
                    exceptions[] = {};
                    icon = "\z\tfs\addons\interactions\data\icons\search_backpack_ca.paa";
                    showDisabled = 0;
                };
                
                /* GEAR ACCESS */
                
                class TFS_interactions_action_Gear_Access {
                    displayname = "$str_TFS_interactions_action_Gear_Access";
                    condition = "[_player, _target] call TFS_interactions_fnc_gear_canAccess";
                    statement = "[_player, _target] call TFS_interactions_fnc_gear_doAccess";
                    exceptions[] = {};
                    icon = "\z\tfs\addons\interactions\data\icons\search_gear_ca.paa";
                    showDisabled = 0;
                };
                
                /* DISARminG */
                
                class ACE_Disarminventory {
                    condition = "false";
                };
            };
        };
    };
};