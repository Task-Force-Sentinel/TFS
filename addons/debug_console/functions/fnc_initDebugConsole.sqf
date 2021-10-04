#include "script_component.hpp"
/*
* Author: veteran29
* initialize debug console display
*
* Arguments:
* 0: Debug console display <DISPLAY>
*
* Return Value:
* None
*
*
* Public: No
*/
#define items_PER_ROW 2
#define BUTtoN_WIDTH 7.5

params ["_display"];
TRACE_1("initializing debug console", _display);

private _debugConsole = _display displayCtrl IDC_RSCDEBUGCONSOLE_RSCDEBUGCONSOLE;

private _basepositionRow1 = ctrlposition (_display displayCtrl IDC_RSCDEBUGCONSOLE_BUTtoNANIMATIONS);
private _basepositionRow2 = ctrlposition (_display displayCtrl IDC_RSCDEBUGCONSOLE_BUTtoNGUI);

// Create buttons in bottom row
{
    _x params ["_text", "_tooltip", "_code"];
    TRACE_3("adding debug console button", _text, _tooltip, _code);
    
    private _col = floor (_forEachindex / items_PER_ROW);
    private _basePos = +([_basepositionRow1, _basepositionRow2] select (_forEachindex % 2));
    // adjust X
    _basePos set [0, (_basePos select 0) + (BUTtoN_WIDTH * (1 + _col)) * GUI_GRID_W];
    
    private _button = _display ctrlCreate ["RscButtonMenu", -1, _debugConsole];
    
    _button ctrlsetPosition _basePos;
    _button ctrlCommit 0;
    
    _button ctrlsettext _text;
    _button ctrlsettooltip _tooltip;
    _button ctrlAddEventHandler ["ButtonClick", _code];
} forEach GVAR(buttons);

nil