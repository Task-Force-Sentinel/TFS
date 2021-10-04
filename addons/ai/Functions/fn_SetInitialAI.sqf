// not documented: postinit function

if (!isServer) exitwith {};
{
    _class = typeOf (_x);
    
    _result = call {
        if (_class isKindOf "Man") exitwith {
            private _group = call {
                if ((typeName _x) isEqualto "group") exitwith {
                    _x
                };
                if ((typeName _x) isEqualto "OBJECT") exitwith {
                    group _x
                };
                _x;
            };
            
            [_group, "TFS default"] remoteExec ["TFS_fnc_setunitskill", 2];
            [_group, true] remoteExec ["enableDynamicSimulation", 2];
        };
        
        if (_class isKindOf "Allvehicles") exitwith {
            {
                [_x, "TFS default"] remoteExec ["TFS_fnc_setunitskill", 2];
            } forEach crew _x;
            [group _x, true] remoteExec ["enableDynamicSimulation", 2];
        };
    };
} forEach allunits;