/*/
Script name: QS Magazine Repack
File: fn_clientRepackmagazines.sqf
Author:

Quiksilver

Last modified:
18/03/2018 A3 1.82 by Quiksilver
Description:
Repack magazines

Example:
<unit> spawn QS_fnc_clientRepackmagazines;
__________________________________________________________/*/

_unit = _this;
if ((!(_unit isEqualtype objNull)) ||
{
    (!(alive _unit))
} ||
{
    (!(_unit isKindOf 'Man'))
} ||
{
    (!local _unit)
} ||
{
    (underwater _unit)
} ||
{
    (captive _unit)
} ||
{
    (!((lifeState _unit) in ['HEALTHY', 'inJURED']))
} ||
{
    ((magazinesAmmoFull _unit) isEqualto [])
} ||
{
    (!isnil {
        _unit getVariable 'QS_unit_repackingmagazines'
    })
}
) exitwith {
    diag_log '***** QS Mag Repack ***** log ***** Repack failed *****';
};
_vehicle = vehicle _unit;
if ((isplayer _unit) && (!isNull (objectParent _unit)) && (_unit in [(driver _vehicle), (gunner _vehicle), (commander _vehicle)])) exitwith {
    // comment 'Fail quietly, key binding overlap';
};
if (_unit isEqualto player) then {
    50 cuttext ['Repacking magazines', 'PLAin doWN', 0.3];
};
_unit setVariable ['QS_unit_repackingmagazines', true, false];
_canSuspend = canSuspend;
if (isNull (objectParent _unit)) then {
    _unit playActionNow 'Medic';
};
private _magazinetypes = [];
private _data1 = [];
{
    if ((_x select 3) in [-1, 1, 2]) then {
        _data1 pushBack _x;
    };
} forEach (magazinesAmmoFull _unit);
private _data2 = [];
if (_data1 isEqualto []) exitwith {
    _unit setVariable ['QS_unit_repackingmagazines', nil, false];
};
private _i = 0;
private _magazineClass = '';
private _magazineammocount = 0;
private _magazineammoCapacity = 0;
{
    _magazineClass = _x select 0;
    _magazineammocount = _x select 1;
    _magazineammoCapacity = getNumber (configFile >> 'Cfgmagazines' >> _magazineClass >> 'count');
    if (_magazineammoCapacity > 3) then {
        _magazinetypes pushBackUnique _magazineClass;
        if (!(_data2 isEqualto [])) then {
            _i = _data2 findif {
                ((_x select 0) isEqualto _magazineClass)
            };
            if (_i isEqualto -1) then {
                _data2 pushBack [_magazineClass, _magazineammoCapacity, [_magazineammocount]];
            } else {
                ((_data2 select _i) select 2) pushBack _magazineammocount;
            };
        } else {
            _data2 pushBack [_magazineClass, _magazineammoCapacity, [_magazineammocount]];
        };
    };
} forEach _data1;
if (_data2 isEqualto []) exitwith {
    _unit setVariable ['QS_unit_repackingmagazines', nil, false];
};
private _totalammocountforMagazine = 0;
private _magazinecountArray = [];
_i = 0;
{
    _magazineClass = _x select 0;
    _magazineammoCapacity = _x select 1;
    _magazinecountArray = _x select 2;
    _totalammocountforMagazine = 0;
    for '_i' from 0 to ((count _magazinecountArray) - 1) step 1 do {
        _totalammocountforMagazine = _totalammocountforMagazine + (_magazinecountArray select _i);
    };
    (_data2 select _forEachindex) set [2, _totalammocountforMagazine];
    (_data2 select _forEachindex) pushBack (ceil(_totalammocountforMagazine / _magazineammoCapacity));
} forEach _data2;
if (_data2 isEqualto []) exitwith {
    _unit setVariable ['QS_unit_repackingmagazines', nil, false];
};
private _addMagazineArray = [];
private _magazineammocounttotal = 0;
private _magazineammoCapacity_moving = 0;
private _currentMagindex = 0;
{
    _magazineClass = _x select 0;
    _magazineammoCapacity = _x select 1;
    _magazineammocounttotal = _x select 2;
    _magazineammoCapacity_moving = 0;
    _currentMagindex = _addMagazineArray pushBack [_magazineClass, _magazineammoCapacity_moving];
    for '_x' from 0 to (_magazineammocounttotal - 1) step 1 do {
        _magazineammoCapacity_moving = _magazineammoCapacity_moving + 1;
        _addMagazineArray set [_currentMagindex, [_magazineClass, _magazineammoCapacity_moving]];
        if (_magazineammoCapacity_moving isEqualto _magazineammoCapacity) then {
            _magazineammoCapacity_moving = 0;
            _currentMagindex = _addMagazineArray pushBack [_magazineClass, _magazineammoCapacity_moving];
        };
    };
} forEach _data2;
if (!((primaryWeapon _unit) isEqualto '')) then {
    _unit removePrimaryWeaponItem ((primaryWeaponMagazine _unit) select 0);
};
if (!((handgunWeapon _unit) isEqualto '')) then {
    _unit removeHandgunItem ((handgunMagazine _unit) select 0);
};
_currentmagazines = magazines _unit;
if (!(_currentmagazines isEqualto [])) then {
    {
        if (_x in _magazinetypes) then {
            _unit removeMagazine _x;
        };
    } count _currentmagazines;
};
if (_addMagazineArray isEqualto []) exitwith {
    _unit setVariable ['QS_unit_repackingmagazines', nil, false];
};
{
    if ((_x select 1) > 0) then {
        _unit addMagazine _x;
    };
    if (_canSuspend) then {
        uiSleep 0.1;
    };
} count _addMagazineArray;
if (_canSuspend) then {
    uiSleep 2;
    _unit setVariable ['QS_unit_repackingmagazines', nil, false];
    if (!isplayer _unit) then {
        reload _unit;
    };
} else {
    _unit spawn {
        uiSleep 2;
        _this setVariable ['QS_unit_repackingmagazines', nil, false];
        if (!isplayer _this) then {
            reload _this;
        };
    };
};
if (_unit isEqualto player) then {
    50 cuttext ['magazines repacked', 'PLAin doWN', 0.2];
};