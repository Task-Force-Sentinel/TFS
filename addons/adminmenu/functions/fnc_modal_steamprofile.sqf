#include "\z\tfs\addons\adminmenu\script_component.hpp"

disableSerialization;
params ["_ctrlgroup"];

private _ctrltextPos = [0, 0];
_ctrltextPos append ((ctrlposition _ctrlgroup) select [2, 2]);
private _ctrltext = (uiNamespace getVariable [QGVAR(modalDisplay), displayNull]) ctrlCreate ["Rscstructuredtext", -1, _ctrlgroup];
_ctrltext ctrlsetPosition _ctrltextPos;
_ctrltext ctrlCommit 0;

private _textArray = GVAR(utilityData) apply {
    format [
        "<t size='1'><a color='#FFC04D' href='http:// steamcommunity.com/profiles/%1'>%2</a></t>",
        getplayerUID _x,
        name _x
    ]
};

_ctrltext ctrlsetstructuredtext parsetext (_textArray joinstring ", ");