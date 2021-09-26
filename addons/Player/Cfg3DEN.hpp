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
                    style = "0x10+0x0200";
                    lineSpacing = 2;
                    x = "48 * (pixelW * pixelGrid * 0.50)";
                    w = "75 * (pixelW * pixelGrid * 0.50)";
                    h = "5 * (pixelH * pixelGrid * 0.50)";
                    rows = 1;
                    columns = 7;
                    strings[] = {"None", "1-1", "1-1-A", "1-1-B", "HHC", "ISA", "AIR"};
                };
            };
        };
    };
    class Value: Combo
    {
        // Static items
        class Items
        {
        };
        // Dynamically loaded items
        class ItemsConfig
        {
            path[] = {"CfgNotifications"}; // Path to config container
            localConfig = 1; // 1 to search local Description.ext as well
            // Name of the property which will be used for item text
            propertyText = "title";
            // Name of the property which will be used for item right text
            propertyTextRight = "description";
            // Name of the property which will be used for item picture
            propertyPicture = "iconPicture";
            // Name of the property which will be used for item text color
            propertyColor = "color";
                    // Decide whether the list should be sorted or not (1 = sorted/ 0 = unsorted)
                    sort = 1;
        };
    };
    
    class Object {
        class AttributeCategories {
            class PREFIX {
                displayName = "TFS Fundamentals";
                collapsed = 1;
                class Attributes {
                    class TFS_Group_Preset {
                        property = QUOTE(TFS_Group_Preset);
                        control = Combo;
                        displayName = "TFS Preset Group:";
                        tooltip = "Default Preset for Patches & Radio Frequencies.";
                        expression = "[_this, _value] call TFS_fnc_ConfigPlayer;";
                        typeName = "STRING";
                        condition = "objectBrain";
                        defaultValue = "-1";
                        class Values 
                        {
                            class None
                            {
                                name = "None";
                                value = -1;
                            };
                           class Info1 
                            {
                                name = "1ST Platoon (Headhunter 1)";
                                value = 1;
                            }; 
                            class Info11 
                            {
                                name = "1ST Platoon 1ST Squad (Headhunter 1-1)";
                                value = 11;
                            };
                            class Info11a 
                            {
                                name = "1ST Platoon 1ST Squad A Team (Headhunter 1-1-A)";
                                value = 111;
                            };
                            class Info11b 
                            {
                                name = "1ST Platoon 1ST Squad B Team (Headhunter 1-1-B)";
                                value = 112;
                            };
                            class Info12 
                            {
                                name = "1ST Platoon 2ND Squad (Headhunter 1-2)";
                                value = 12;
                            }; 
                            class Info12a 
                            {
                                name = "1ST Platoon 2ND Squad A Team (Headhunter 1-2-A)";
                                value = 121;
                            };
                            class Info12b 
                            {
                                name = "1ST Platoon 2ND Squad B Team (Headhunter 1-2-B)";
                                value = 122;
                            };
                            class Info13 
                            {
                                name = "1ST Platoon 3RD Squad (Headhunter 1-3)";
                                value = 13;
                            };
                            class Info13a 
                            {
                                name = "1ST Platoon 3RD Squad A Team (Headhunter 1-3-A)";
                                value = 131;
                            };
                            class Info13b 
                            {
                                name = "1ST Platoon 3RD Squad B Team (Headhunter 1-3-B)";
                                value = 132;
                            };
                            class Info2 
                            {
                                name = "2ND Platoon (Headhunter 2)";
                                value = 2;
                            };
                            class Info21 
                            {
                                name = "2ND Platoon 1ST Squad (Headhunter 2-1)";
                                value = 21;
                            };
                            class Info21a 
                            {
                                name = "2ND Platoon 1ST Squad A Team (Headhunter 2-1-A)";
                                value = 211;
                            };
                            class Info21b
                            {
                                name = "2ND Platoon 1ST Squad B Team (Headhunter 2-1-B)";
                                value = 212;
                            };
                            class Info22
                            {
                                name = "2ND Platoon 2ND Squad (Headhunter 2-2)";
                                value = 22;
                            };
                            class Info22a
                            {
                                name = "2ND Platoon 2ND Squad A Team (Headhunter 2-2-A)";
                                value = 221;
                            }; 
                            class Info22b 
                            {
                                name = "2ND Platoon 2ND Squad B Team (Headhunter 2-2-B)";
                                value = 222;
                            };
                            class Info23 
                            {
                                name = "2ND Platoon 3RD Squad (Headhunter 2-3)";
                                value = 23;
                            };
                            class Info23a 
                            {
                                name = "2ND Platoon 3RD Squad A Team (Headhunter 2-3-A)";
                                value = 231;
                            };
                            class Info23b 
                            {
                                name = "2ND Platoon 3RD Squad B Team (Headhunter 2-3-B)";
                                value = 231;
                            };
                            class Info3 
                            {
                                name = "3RD Platoon (Headhunter 3)";
                                value = 3;
                            };
                            class Info31
                            {
                                name = "3RD Platoon 1ST Squad (Headhunter 3-1)";
                                value = 31;
                            };
                            class Info31a 
                            {
                                name = "3RD Platoon 1ST Squad A Team (Headhunter 3-1-A)";
                                value = 311;
                            };
                            class Info31b 
                            {
                                name = "3RD Platoon 1ST Squad B Team (Headhunter 3-1-B)";
                                value = 312;
                            }; 
                            class Info32 
                            {
                                name = "3RD Platoon 2ND Squad (Headhunter 3-2)";
                                value = 32;
                            }; 
                            class Info32a 
                            {
                                name = "3RD Platoon 2ND Squad A Team (Headhunter 3-2-A)";
                                value = 321;
                            }; 
                            class Info32b 
                            {
                                name = "3RD Platoon 2ND Squad B Team (Headhunter 3-2-B)";
                                value = 322;
                            }; 
                            class Info33 
                            {
                                name = "3RD Platoon 3RD Squad (Headhunter 3-3)";
                                value = 33;
                            };
                            class Info33a 
                            {
                                name = "3RD Platoon 3RD Squad A Team (Headhunter 2-3-A)";
                                value = 331;
                            };
                            class Info33b 
                            {
                                name = "3RD Platoon 3RD Squad B Team (Headhunter 2-3-B)";
                                value = 332;
                            };
                            class Infohhc 
                            {
                                name = "HHC (Headhunter HHC)";
                                value = 500;
                            };
                            class Infoisa
                            {
                                name = "ISA Action Group (Arrow)";
                                value = 150;
                            };
                            class Infoair
                            {
                                name = "Air Group (Outlaw)";
                                value = 90;
                            };
                        };
                    };
                    class TFS_Pilot {
                        property = QUOTE(TFS_Pilot);
                        control = "Checkbox";
                        displayName = "Pilot";
                        tooltip = "Set the player to Pilot to allow them in the Pilot seat of aircraft.";
                        expression = "_this setUnitTrait ['Pilot', _value, true];";
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                    class TFS_Mission_Maker {
                        property = QUOTE(TFS_Mission_Maker);
                        control = "Checkbox";
                        displayName = "Mission Maker";
                        tooltip = "Define this player as Mission Maker to allow access to further mission controls.";
                        expression = "_this setUnitTrait ['Mission Maker', _value, true];";
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                    class TFS_Instructor {
                        property = QUOTE(TFS_Instructor);
                        control = "Checkbox";
                        displayName = "Instructor";
                        tooltip = "Define this player as Instructor to allow access to any valid Instructor Controls - Only used with Training Functions.";
                        expression = "_this setUnitTrait ['Instructor', _value, true];";
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                         class TFS_DefaultLoadout {
                        property = QUOTE(TFS_DefaultLoadout);
                        control = "Checkbox";
                        displayName = "TFS Preset Loadout";
                        tooltip = "Use Preset Loadout for this player type if available.";
                        expression = "if (_value IsEqualTo true) then { [_this] call TFS_fnc_Loadouts;}";
                        typeName = "BOOL";
                        condition = "objectBrain";
                        defaultValue = "(false)";
                    };
                };
            };
        };
    };
};
