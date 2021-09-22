class ctrlToolbox;

class Cfg3DEN {
    class Attributes {
        class Default;
        class Title: Default {
            class Controls {
                class Title;
            };
        };
        class GroupSelect: Title {
            attributeLoad = "(_this controlsGroupCtrl 100) lbSetCurSel (((_value + 1) min 7) max 0);";
            attributeSave = "(lbCurSel (_this controlsGroupCtrl 100)) - 1";
            class Controls: Controls {
                class Title: Title{};
                class Value: ctrlToolbox {
                    idc = 100;
                    style = "0x02";
                    x = "48 * (pixelW * pixelGrid * 0.50)";
                    w = "75 * (pixelW * pixelGrid * 0.50)";
                    h = "15 * (pixelH * pixelGrid * 0.50)";
                    rows = 3;
                    columns = 3;
                    strings[] = {"None", "Headhunter 1", "Headhunter 2", "Headhunter 3", "Headhunter HHC", "Arrow", "Outlaw", "Sentinel", "bolo"};
                };
            };
        };
    };
    class Object {
        class AttributeCategories {
            class PREFIX {
                displayName = "TFSRHS Fundamentals";
                collapsed = 1;
                class Attributes {
                    class TFSRHS_Group_Preset {
                        property = QUOTE(TFSRHS_Group_Preset);
                        control = GroupSelect;
                        displayName = "TFSRHS Preset Group:";
                        tooltip = "Default Preset for Patches & Radio Frequencies.";
                        expression = "[_this, _value] call TFSRHS_fnc_ConfigPlayer;";
                        typeName = "STRING";
                        condition = "objectBrain";
                        defaultValue = "-1";
                    };
                    class TFSRHS_Pilot {
                        property = QUOTE(TFSRHS_Pilot);
                        control = "Checkbox";
                        displayName = "Pilot";
                        tooltip = "Set the player to Pilot to allow them in the Pilot seat of aircraft.";
                        expression = "_this setUnitTrait ['Pilot', _value, true];";
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                    class TFSRHS_Mission_Maker {
                        property = QUOTE(TFSRHS_Mission_Maker);
                        control = "Checkbox";
                        displayName = "Mission Maker";
                        tooltip = "Define this player as Mission Maker to allow access to further mission controls.";
                        expression = "_this setUnitTrait ['Mission Maker', _value, true];";
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                    class TFSRHS_Instructor {
                        property = QUOTE(TFSRHS_Instructor);
                        control = "Checkbox";
                        displayName = "Instructor";
                        tooltip = "Define this player as Instructor to allow access to any valid Instructor Controls - Only used with Training Functions.";
                        expression = "_this setUnitTrait ['Instructor', _value, true];";
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                         class TFSRHS_DefaultLoadout {
                        property = QUOTE(TFSRHS_DefaultLoadout);
                        control = "Checkbox";
                        displayName = "TFSRHS Preset Loadout";
                        tooltip = "Use Preset Loadout for this player type if available.";
                        expression = "if (_value IsEqualTo true) then { [_this] call TFSRHS_fnc_Loadouts;}";
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                };
            };
        };
    };
};
