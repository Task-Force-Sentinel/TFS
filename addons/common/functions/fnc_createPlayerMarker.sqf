#include "script_component.hpp"
/*
* Author: veteran29
* Create player owned marker.
*
* Arguments:
* 0: Marker position <ARRAY, OBJECT>
* 1: Channel to create marker on, defaults to 1 (side channel) <strinG, NUMBER>
* 2: player owning the marker, defaults to local player <OBJECT>
*
* Return Value:
* Marker ID, empty string if could not create <strinG>
*
* Example:
* [player, "global"] call afm_common_fnc_createplayerMarker
*
* Public: No
*/

#define CHANNEL_nameS ["global", "side", "command", "group", "vehicle", "direct"]
#define CHANNEL_min 0
#define CHANNEL_max 5

params [
    ["_position", [0, 0, 0], [[], objNull]],
    ["_channel", 1, [0, ""]],
    ["_player", player, [objNull]]
];

if (_channel isEqualtype "") then {
    _channel = CHANNEL_nameS find _channel;
};

if (_channel < CHANNEL_min || {
    _channel > CHANNEL_max
}) exitwith {
    ERRor_1("invalid channel given! - %1", _channel);
    
    "" // return
};

// create marker id
private _id = format ["%1_%2", QUOTE(PREFIX), GVAR(playerMarkerIdx)];
GVAR(playerMarkerIdx) = GVAR(playerMarkerIdx) + 1;

private _markerId = format ["_USER_DEFinED #%1/%2/%3", getplayerID _player, _id, _channel];

createMarker [_markerId, _position, _channel, _player] // return