// not documented: called at display creation

#include "\a3\UI_F_orange\UI\resincl.inc"
#include "\a3\UI_F_orange\UI\dikCodes.inc"

#define PREVIEW_soundVolume 0.25

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {
    case "onload": {
        _display = _params select 0;
        
        _data = missionnamespace getVariable ["RscDisplayCueCard_data", []];
        _data params [
            ["_textureData", "", ["", []]]
        ];
        _textureData params [
            ["_texture", "", [""]]
        ];
        
        _ctrltexture = _display displayCtrl 1001;
        _ctrlnotepadin = _display displayCtrl 1002;
        _ctrlnotepadBack = _display displayCtrl 1200;
        
        ctrlsetFocus _ctrltexture;
        _ctrltexture ctrlEnable true;
        _ctrlnotepadin ctrlEnable true;
        
        _notepadContents = uiNamespace getVariable ["TFS_notepad_Content", ""];
        
        _ctrlnotepadin ctrlsettext _notepadContents;
        
        _ctrltexture ctrlsettext _texture;
        
        missionnamespace setVariable ["RscDisplayCueCard_data", nil];
    };
    case "onUnload": {
        _display = _params select 0;
        ppEffectDestroy (_display getVariable ["pp", -1]);
        
        _ctrlnotepadin = _display displayCtrl 1002;
        _notepadContents = ctrltext _ctrlnotepadin;
        
        // Save the contents of the notepad to the missionnamespace
        missionnamespace setVariable ["TFS_notepad_Content", _notepadContents];
    };
};