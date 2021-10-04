#include "script_component.hpp"
/*
Author: NemesisRE

Description:
Shows initialization message

*/

if (GVAR(skipplayerinit)) exitwith {};

private ["_unitname", "_cnt", "_cntstop", "_timerinput", "_timer", "_missionAuthor", "_initMsg", "_postinitMsg"];
_unitname = name TFS_unit;
_cnt = 0;
_timerinput = GVAR(playerinittime);
_timer = _timerinput / 100;
_cntstop = -1;
_missionAuthor = gettext (missionConfigFile >> "author");

while {(_cnt != 100)} do {
    _cnt = _cnt + 1;
    
    _initMsg = format ["
        <br/>
        <t align='left' size='1.2' color='#F7D358'>Missions initialsierung:</t><br/>
        <t align='left' size='1.1' color='#CCA9A9' font='PuristaBold'>%1&#0037;
        abgeschlossen</t><br/><br/>
        <t align='left' color='#CCA9A9'>Hallo %3, </t><br/>
        <t align='left' color='#CCA9A9'>die initialisierung dauert etwa %2 Sekunden. Währenddessen solltest du dich nicht bewegen oder andere Aktionen durchführen.</t><br/>
        <br/>
    ", _cnt, _timerinput, _unitname];
    
    sleep _timer;
    
    hintSilent parsetext _initMsg;
    if (_cntstop == -1) then {
        _cntstop = _cnt;
        [
            "<img size='8' shadow='false' image='" + GVAR(clanlogo) + "'/><br/><br/><t size='.7' color='#FFFFFF'>Mission build by " + _missionAuthor + "</t>",
            0,
            0,
            5,
            ((100 - _cntstop) * _timer)
        ] spawn BIS_fnc_dynamictext;
    };
};

_postinitMsg = format ["
    <br/>
    <t align='left' size='1.2' color='#F7D358'>Missions initialsierung:</t><br/>
    <t align='left' size='1.1' color='#A9CCA9' font='PuristaBold'>Vollständig abgeschlossen</t><br/><br/>
    <t align='left' color='#FFFFFF'>Viel Spaß und denkt daran:</t><br/>
    <t align='left' color='#A1A4AD'>- Folgt den Befehlen eures Teamleiters.</t><br/>
    <t align='left' color='#A1A4AD'>- Sichert und senkt eure Waffe.</t><br/>
    <t align='left' color='#A1A4AD'>- haltung bewahren, wenn angebracht.</t><br/>
    <t align='left' color='#A1A4AD'>- Verwendet nicht den Chat.</t><br/>
    <br/>
"];

hint parsetext _postinitMsg;
sleep 10;

hintSilent "";