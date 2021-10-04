#include "\z\tfs\addons\spectator\script_component.hpp"
for "_i" from 1 to 6 do {
    private _index = count GVAR(killedunits) - _i;
    private _control = (uiNamespace getVariable [QGVAR(labels), []]) select _i;
    if (_index < (count GVAR(killedunits)) && _index >= 0) then {
        private _data = GVAR(killedunits) select (count GVAR(killedunits) - _i);
        _data params ["_unit", "_time", "_killer", "_deadside", "_killerside", "_dname", "_kname", "_weapon"];
        private _deltatime = time - _time;
        if (_deltatime <= 12 && _i < 6) then {
            if (_killer == _unit || isNull _killer) then {
                _control ctrlsetstructuredtext parsetext format ["<img image='\a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa'/><t color='%2'>%1</t>", _dname, _deadside call CFUNC(sidetohexColor)];
            } else {
                _control ctrlsetstructuredtext parsetext format ["<t color='%4'>%1</t> [%3] <t color='%5'>%2</t>", _kname, _dname, _weapon, _killerside call CFUNC(sidetohexColor), _deadside call CFUNC(sidetohexColor)];
            };
        };
        if (_deltatime > 12) then {
            GVAR(killedunits) set [_index, 0];
        };
    } else {
        _control ctrlsetstructuredtext parsetext " ";
    }
};
GVAR(killedunits) = GVAR(killedunits) - [0];