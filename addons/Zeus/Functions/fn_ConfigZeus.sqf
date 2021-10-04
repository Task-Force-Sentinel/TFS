/*
Function: TFS_fnc_ConfigZeus

Description:
Used to configure a Zeus module. Ensures that any AI placed down by that Zeus have Dynamic Sim
enabled and their difficulty settings configured to the TFS default.

Arguments:
_object - Zeus module to apply the function to. <OBJECT>

Examples:
(begin example)
[this] call TFS_fnc_ConfigZeus;
(end)

Author:
MitchJC
*/
params [
    "_object"
];

_object addEventHandler [
    "CuratorObjectPlaced", {
        params ["_curator", "_entity"];
        
        _class = typeOf (_entity);
        _result = call {
            if (_class isKindOf "Man") exitwith {
                private _group = call {
                    if ((typeName _entity) isEqualto "group") exitwith {
                        _entity
                    };
                    if ((typeName _entity) isEqualto "OBJECT") exitwith {
                        group _entity
                    };
                    _entity;
                };
                
                [_group, "TFS default"] remoteExec ["TFS_fnc_setunitskill", 2];
                [_group, true] remoteExec ["enableDynamicSimulation", 2];
            };
            
            if (_class isKindOf "Allvehicles") exitwith {
                {
                    [_x, "TFS default"] remoteExec ["TFS_fnc_setunitskill", 2];
                } forEach crew _entity;
                [group _entity, true] remoteExec ["enableDynamicSimulation", 2];
            };
        };
    }
];
_object setVariable ["shownotification", false];
_object setVariable ["birdtype", "", true];