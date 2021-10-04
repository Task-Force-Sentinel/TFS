/*
Function: TFS_fnc_GetAvailablefactions

Description:
Returns a list of all the available factions of the selected side(s).

Arguments:
_sides - Array containing all sides for which the available factions should be retrieved <strinG>

Return Value:
list of all the available factions of selected sides(s).

Example:
nothing to see here

Author:
Mokka
*/

params ["_sides"];

if !(_sides isEqualtype []) then {
    _sides = _this;
};

private _factions = [];

{
    private _side = _x;
    private _sidefactions = [];
    private _sideVar = format ["TFS_Availablefactions_%1", _side];
    
    // Retrieve cached factions if possible
    if !(isnil _sideVar) then {
        _sidefactions = missionnamespace getVariable _sideVar;
        _factions append _sidefactions;
    } else {
        _sidefactions = [nil, ["TFS_AI", format ["%1_factions", _side]]] call YAinA_F_fnc_GetFunctions;
        
        for "_i" from (count _sidefactions) to 0 step -1 do {
            if !(isClass (configFile >> "CfgfactionClasses" >> (_sidefactions select _i))) then {
                _sidefactions deleteAt _i;
            };
        };
        
        missionnamespace setVariable [_sideVar, _sidefactions];
        _factions append _sidefactions;
    };
} forEach _sides;

_factions;