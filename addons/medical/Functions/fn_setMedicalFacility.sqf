/*
Function: TFS_fnc_setMedicalFacility

Description:
Turns the given object or trigger into a medical facility.

Arguments:
_object - Object to turn into a medical facility

Return Values:
nothing.

Examples:
nothing to see here

Author:
Mokka
*/

params ["_object"];

// if the object is not a trigger, create one based on bounding boxes
if !(_object isKindOf "EmptyDetector") then {
    private _spawnLocation = getPos _object;
    private _Getobjectsize = boundingBoxReal _object;
    private _Width = (_Getobjectsize select 1) select 0;
    private _Length = (_Getobjectsize select 1) select 1;
    private _Height = ((_Getobjectsize select 1) select 2) *2;
    _object = createTrigger ["EmptyDetector", _spawnLocation];
    _object settriggerArea [_Width, _Length, getDir _object, false, _Height];
};

_object settriggerActivation ["ANYplayer", "PRESENT", true];
_object settriggerStatements [
    "player in thislist",
    "
    [player] call TFS_fnc_FacilityHeal;
    ",
    ""
];