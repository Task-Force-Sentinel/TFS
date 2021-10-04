#include "script_component.hpp"
/*
* Author: DaC, Jonpas
* Creates a marker at coordiantes and adds animation on map open.
*
* Arguments:
* 0: position <ARRAY>
*
* Return Value:
* None
*
* Example:
* [[100, 200]] call tac_ratelmarker_fnc_createMarker;
*
* Public: No
*/

params ["_pos"];

deleteMarkerlocal QGVAR(marker);

private _marker = createMarkerlocal [QGVAR(marker), _pos];
_marker setMarkertypeLocal "KIA";

// Show ACE hint
[localize LstrinG(MarkerCreated), QPATHtoF(UI\ratelMarker_ca.paa)] call ACEFUNC(common, displaytextpicture);

// exit if map EH already installed
if (!isnil QGVAR(openMapEH)) exitwith {};

// Attach map open EH, animate focus to marker and remove the EH
GVAR(openMapEH) = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {
    mapAnimAdd [0.5, 0.3, markerPos QGVAR(marker)];
    mapAnimCommit;
    
    ((findDisplay 12) displayCtrl 51) ctrlremoveEventHandler ["Draw", GVAR(openMapEH)];
    GVAR(openMapEH) = nil;
}];