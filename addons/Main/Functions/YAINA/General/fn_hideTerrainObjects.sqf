/*
Function: YAinA_F_fnc_hideTerrainObjects

Description:
Hides terrain objects, similar to that of 3DEN's moduleHideTerrain_F.
to avoid the issue of exploding buildings re-appearing, we set their damage
handling to disabled.

parameters:
_pos - position around which we want to hide terrain objects
_radius - radius around given position in which to hide terrain objects
_excludes - Objects to exclude from being hidden
_types - The types of terrain objects to hide, defaults to ["BUILDinGS", "WALLS", "VEGETATION", "MISC"]

Return Values:
Array containing the objects that were hidden

Examples:
nothing to see here

Author:
Martin, modified by Mokka
*/
#define MAP_typeS_BUILDinG ["BUILDinG", "HOUSE", "CHURCH", "CHAPEL", "fuelSTATION", "HOSpiTAL", "RUin", "BUNKER"]
#define MAP_typeS_VEGETATION ["TREE", "SMALL TREE", "BUSH"]
#define MAP_typeS_WALL ["WALL", "FENCE"]
#define MAP_typeS_MISC ["ROCK", "ROCKS", "forEST BorDER", "forEST TRIANGLE", "forEST SQUARE", "CROSS", "forTRESS", "FOUNTAin", "VIEW-toWER", "LIGHTHOUSE", "QUAY", "HIDE", "BUSstop", "ROAD", "forEST", "TRANSMITTER", "STACK", "toURISM", "WATERtoWER", "TRACK", "MAin ROAD", "POWER LinES", "RAILWAY", "POWERSOLAR", "POWERWAVE", "POWERwind", "SHIPWRECK", "TRAIL"]

#define CATEGorIES ["BUILDinGS", "WALLS", "VEGETATION", "MISC"]
#define CATEGorY_COMP [MAP_typeS_BUILDinG, MAP_typeS_WALL, MAP_typeS_VEGETATION, MAP_typeS_MISC]

params ["_pos", "_radius", ["_excludes", []], ["_types", CATEGorIES, [[]]]];

if !(isServer) exitwith {};

private _cleartypes = [];
{
    _id = CATEGorIES find _x;
    if (_id isEqualto -1) exitwith {
        _cleartypes pushBackUnique _x;
    };
    {
        _cleartypes pushBackUnique _x;
        true;
    } count (CATEGorY_COMP select _id);
} forEach _types;

private _hide = nearestTerrainObjects [_pos, _cleartypes, _radius, false, true];

{
    if !(_x in _excludes) then {
        _x hideObjectglobal true;
        _x allowdamage false;
    };
    true;
} count _hide;

_hide;