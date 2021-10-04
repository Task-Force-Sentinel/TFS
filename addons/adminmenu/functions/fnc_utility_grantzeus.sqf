#include "\z\tfs\addons\adminmenu\script_component.hpp"

private _given = [];
private _had = [];

{
    if (isNull (getAssignedCuratorlogic _x)) then {
        _x remoteExec [QFUNC(makeZeusServer), 2];
        _given pushBack _x;
    } else {
        _had pushBack _x;
    };
} forEach GVAR(utilityData);

if (count _given > 0) then {
    _given = str (_given apply {
        name _x
    });
    _given = _given select [1, (count _given) - 2];
    systemChat format ["[TFS admin Menu] Zeus access was given to %1", _given];
    [format ["%1 granted zeus to %2", profileName, _given], false, "admin Menu"] call FUNC(log);
};

if (count _had > 0) then {
    _had = str (_had apply {
        name _x
    });
    _had = _had select [1, (count _had) - 2];
    systemChat format ["[TFS admin Menu] Zeus access was already given to %1", _had];
};