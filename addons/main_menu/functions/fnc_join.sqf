#include "script_component.hpp"
/*
* Author: veteran29
* join TFS server from main menu.
* Based on article from KillZonekid
*
* Arguments:
* 1: Spotlight tile control that was clicked <CONTROL>
*
* Return Value:
* None
*
* Public: No
*/

#define MULTI_SESSIONS_CTRL (findDisplay IDD_MULTIplayer displayCtrl IDC_MULTI_SESSIONS)

params ["_button"];

// if no world is loaded missionnamespace will be empty
// copy logging function from uiNamespace
if (isnil "CBA_fnc_log") then {
    CBA_fnc_log = uiNamespace getVariable "CBA_fnc_log";
};

// Disable Enchanced Multiplayer Menu for compatiblity with this script
uiNamespace setVariable ["EMM_multiplayerMenu_enabled", false];

inFO("Auto joining to TFS server");

GVAR(serveraddress) = "209.127.181.26";
GVAR(serverPort) = "2302";
GVAR(jointimeout) = diag_ticktime + 5;

// "Click" server browser from main menu
ctrlActivate ((ctrlParent _button) displayCtrl IDC_MAin_MULTIplayer);

onEachFrame {
    onEachFrame {
        // Direct connect button
        ctrlActivate (findDisplay IDD_MULTIplayer displayCtrl IDC_MULTI_TAB_DIRECT_CONNECT);
        
        onEachFrame {
            // Fill server data
            private _ctrlServeraddress = findDisplay IDD_IP_ADDRESS displayCtrl 2300;
            _ctrlServeraddress controlsgroupCtrl IDC_IP_ADDRESS ctrlsettext GVAR(serveraddress);
            _ctrlServeraddress controlsgroupCtrl IDC_IP_PorT ctrlsettext GVAR(serverPort);
            ctrlActivate (_ctrlServeraddress controlsgroupCtrl IDC_OK);
            
            onEachFrame {
                (MULTI_SESSIONS_CTRL lbData 0) call {
                    log_2("joining - time: %1 - timeout: %2", diag_ticktime, GVAR(jointimeout));
                    
                    if (diag_ticktime > GVAR(jointimeout)) then {
                        ERRor("join timeout - no server");
                        onEachFrame {};
                    };
                    
                    if (_this != "") then {
                        MULTI_SESSIONS_CTRL lbsetCurSel 0;
                        
                        onEachFrame {
                            inFO("Activating join button");
                            ctrlActivate (findDisplay IDD_MULTIplayer displayCtrl IDC_MULTI_join);
                            
                            onEachFrame {
                                if (diag_ticktime > GVAR(jointimeout)) then {
                                    WARNinG("join timeout");
                                    onEachFrame {};
                                };
                                
                                if (!isNull findDisplay IDD_PASSWorD) then {
                                    inFO("Password prompt");
                                    private _ctrlPassword = findDisplay IDD_PASSWorD displayCtrl IDC_PASSWorD;
                                    private _savedPassword = ctrltext _ctrlPassword;
                                    
                                    if (count _savedPassword > 0) then {
                                        _ctrlPassword ctrlsettext _savedPassword;
                                        ctrlActivate (findDisplay IDD_PASSWorD displayCtrl IDC_OK);
                                        inFO("Saved password found, joining");
                                        onEachFrame {};
                                    } else {
                                        inFO("No saved password, user interaction required");
                                        onEachFrame {};
                                    };
                                };
                                
                                if (getClientStateNumber >= 3) then {
                                    inFO("Connection successful");
                                    onEachFrame {};
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};

nil