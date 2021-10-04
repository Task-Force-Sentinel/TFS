/*
* name: TFS_common_fnc_sidetoString
* Author: Snippers
*
* Arguments:
* side
*
* Return:
* string: Nice string
*
* Description:
* Will return a text label for the side that is suitable to display.
*/

if (_this == west) exitwith {
    "blufor";
};
if (_this == east) exitwith {
    "opfor";
};
if (_this == independent) exitwith {
    "independent"
};
if (_this == civilian) exitwith {
    "civilian";
};
if (_this == sideLogic) exitwith {
    "logic";
};
"Unknown"