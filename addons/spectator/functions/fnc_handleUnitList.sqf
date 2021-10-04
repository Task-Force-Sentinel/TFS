#include "\z\tfs\addons\spectator\script_component.hpp"
if (!([] call FUNC(isOpen))) exitwith {};
disableSerialization;
private _treeView = (uiNamespace getVariable [QGVAR(unitlist), controlnull]);

if (GVAR(cleargroups)) then {
    GVAR(cleargroups) = false;
    tvClear _treeView;
};
private _grps = allgroups select {
    side _x in GVAR(sides) && (units _x) findif {
        alive _x
    } >= 0
};
if (GVAR(playersOnly)) then {
    _grps = _grps arrayintersect (playableunits apply {
        group _x
    });
};
private _lookupgroups = _grps apply {
    [_x call BIS_fnc_netId, _x]
};

private _toDelete = [];
private _foundgroups = [];
private _items = [];
for "_index" from 0 to (_treeView tvCount []) do {
    private _netId = _treeView tvData [_index];
    
    _grpindex = _lookupgroups findif {
        (_x # 0) == _netId
    };
    if (_grpindex >= 0) then {
        private _grp = ((_lookupgroups # _grpindex) # 1);
        _foundgroups pushBack _grp;
        if(((units _grp) findif {
            alive _x
        }) >= 0) then {
            private _deleteRows = [];
            for "_childindex" from 0 to (_treeView tvCount [_index]) do {
                private _unitId = _treeView tvData [_index, _childindex];
                private _unit = _unitId call BIS_fnc_objectFromNetId;
                if (!alive _unit || (group _unit) != _grp) then {
                    _deleteRows pushBack _childindex;
                } else {
                    private _icon = gettext (configFile >> "Cfgvehicles" >> typeOf (vehicle _unit) >> "icon");
                    if (istext (configFile >> "CfgvehicleIcons" >> _icon )) then {
                        _icon = gettext (configFile >> "CfgvehicleIcons" >> _icon);
                    };
                    _treeView tvSetPicture [[_index, _childindex], _icon];
                }
            };
            {
                _treeView tvDelete [_index, _x];
            } forEach _deleteRows;
        } else {
            _toDelete pushBack _index;
        };
    } else {
        _toDelete pushBack _index;
    };
};

{
    _treeView tvDelete [_x];
} forEach _toDelete;

{
    [_x] call FUNC(creategroupNode);
} forEach (_grps - _foundgroups);