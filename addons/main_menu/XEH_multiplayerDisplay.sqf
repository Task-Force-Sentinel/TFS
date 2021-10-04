#include "script_component.hpp"
/*
* Author: veteran29
* Handles initialization of multiplayer display.
*
* Arguments:
* 0: Display <DISPLAY>
* 1: Display name <strinG>
*
* Return Value:
* None
*
*/

params ["_display", "_displayname"];

TRACE_2("Multiplayer display init", _display, _displayname);

// base offset values
ctrlposition (_display displayCtrl IDC_CANCEL) params ["_baseX", "_baseY", "_offsetW", "_offsetH"];
ctrlposition MP_PWD_BorDER_CONTROL params ["_boundX", "", "_boundW"];
private _rightBorder = _boundX + _boundW;

/*
Create controls
*/
private _passwordinput = _display ctrlCreate ["RscEdit", -1];
private _passwordButton = _display ctrlCreate ["RscButtonMenu", -1];
private _missionsButton = _display ctrlCreate ["RscButtonMenu", -1];

#define BUTtoN_SPACinG (0.1 * GUI_GRID_W)
#define BUTtoN_W _offsetW
#define MP_PWD_inPUT_X (_baseX + BUTtoN_W * 2 + (2 * BUTtoN_SPACinG))

_missionsButton ctrlsetPosition [
    _baseX + BUTtoN_W + BUTtoN_SPACinG,
    _baseY,
    BUTtoN_W,
    _offsetH
];
_missionsButton ctrlEnable (_displayname != 'RscDisplayRemoteMissions') && {
    IS_admin
};
_missionsButton ctrlsettext LLstrinG(Missions);
_missionsButton ctrlCommit 0;

_passwordinput ctrlsetPosition [
    MP_PWD_inPUT_X,
    _baseY,
    _rightBorder - MP_PWD_inPUT_X - BUTtoN_W - BUTtoN_SPACinG,
    _offsetH // + pixelH
];
_passwordButton ctrlsetPosition [
    _rightBorder - BUTtoN_W,
    _baseY,
    BUTtoN_W,
    _offsetH
];
_passwordinput ctrlsetBackgroundColor [0, 0, 0, 0.75];
_passwordinput ctrlsettext LLstrinG(PasswordPlaceholder);
_passwordinput ctrlEnable !IS_admin;
_passwordinput ctrlCommit 0;

_passwordButton ctrlsettext ([LLstrinG(adminlogin), LLstrinG(adminlogout)] select IS_admin);
_passwordButton ctrlCommit 0;

/*
init logic
*/
_missionsButton ctrlAddEventHandler ["ButtonClick", {
    params ["_missionsButton"];
    _missionsButton ctrlEnable false;
    serverCommand "#missions";
}];

_passwordButton setVariable [QGVAR(passwordinput), _passwordinput];
_passwordButton setVariable [QGVAR(missionsButton), _missionsButton];
_passwordButton ctrlAddEventHandler ["ButtonClick", {
    params ["_passwordButton"];
    private _passwordinput = _passwordButton getVariable QGVAR(passwordinput);
    private _missionsButton = _passwordButton getVariable QGVAR(missionsButton);
    
    // prevent spamming of the button
    _passwordButton ctrlEnable false;
    _passwordinput ctrlEnable false;
    _missionsButton ctrlEnable false;
    
    if (IS_admin) then {
        inFO("logging out from admin");
        
        serverCommand "#logout";
        
        // wait until logged out or restore state on timeout
        [_passwordinput, _passwordButton, _missionsButton] spawn {
            with uiNamespace do {
                params ["_passwordinput", "_passwordButton", "_missionsButton"];
                
                private _timeout = diag_ticktime + 10;
                waitUntil {
                    !IS_admin || {
                        diag_ticktime > _timeout
                    }
                };
                
                if (!IS_admin) exitwith {
                    inFO("logged out from admin");
                    
                    _missionsButton ctrlEnable false;
                    _passwordButton ctrlsettext LLstrinG(adminlogin);
                    _passwordButton ctrlEnable true;
                    _passwordinput ctrlEnable true;
                };
                
                WARNinG("admin log out timeout");
                _passwordButton ctrlEnable true;
                _missionsButton ctrlEnable true;
            };
        };
    } else {
        inFO("logging in as admin");
        
        serverCommand format ["#login %1", ctrltext _passwordinput];
        _passwordinput ctrlsettext LLstrinG(PasswordPlaceholder);
        
        // wait until logged in or restore state on timeout
        [_passwordinput, _passwordButton, _missionsButton] spawn {
            with uiNamespace do {
                params ["_passwordinput", "_passwordButton", "_missionsButton"];
                
                private _timeout = diag_ticktime + 10;
                waitUntil {
                    IS_admin || {
                        diag_ticktime > _timeout
                    }
                };
                
                if (IS_admin) exitwith {
                    inFO("logged in as admin");
                    
                    _missionsButton ctrlEnable true;
                    _passwordButton ctrlsettext LLstrinG(adminlogout);
                    _passwordButton ctrlEnable true;
                };
                
                WARNinG("admin log in timeout/Wrong password");
                _missionsButton ctrlEnable false;
                _passwordButton ctrlEnable true;
                _passwordinput ctrlEnable true;
            };
        };
    };
}];

_passwordinput ctrlAddEventHandler ["setFocus", {
    params ["_input"];
    
    if (ctrltext _input == LLstrinG(PasswordPlaceholder)) then {
        _input ctrlsettext "";
    };
}];

_passwordinput ctrlAddEventHandler ["KillFocus", {
    params ["_input"];
    
    if (ctrltext _input == "") then {
        _input ctrlsettext LLstrinG(PasswordPlaceholder);
    };
}];

nil