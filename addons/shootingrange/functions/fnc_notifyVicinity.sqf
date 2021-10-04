#include "script_component.hpp"
/*
* Author: Jonpas
* Shows notifications to everyone in vicinity.
*
* Arguments:
* 0: texts (unlocalized) <ARRAY>
* 1: size <NUMBER>
* 2: include caller <BOOL> (default: false)
* 3: Vicinity Range <NUMBER> (default: 100)
*
* Return Value:
* None
*
* Example:
* [["text", "str_text"], 2.5] call TFS_shootingrange_fnc_notifyVicinity;
*
* Public: No
*/

params ["_texts", "_size", ["_includecaller", false], ["_vicinityRange", notifY_distance, [0]] ];

private _nearbyplayers = (getPosATL ACE_player) nearObjects ["CAManBase", _vicinityRange];

if (!_includecaller) then {
    _nearbyplayers deleteAt (_nearbyplayers find ACE_player);
};

// localize text locally
[QGVAR(notifyplayer), [_texts, _size], _nearbyplayers] call CBA_fnc_targetEvent;