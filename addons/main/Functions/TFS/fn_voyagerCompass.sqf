if (!hasinterface) exitwith {};

fnc_removestring =
{
    params ["_from", "_to", "_string"];
    _stringArray = _string splitstring "";
    
    _stringArray deleteRange [_from, _to];
    
    _stringArray = _stringArray joinstring "";
    private _returnMe = _stringArray;
    _returnMe
};

fnc_loadsettings =
{
    _nc_settings = profileNamespace getVariable "nc_settings";
    
    if (isnil "_nc_settings") then {
        _nc_settings = [0.499889, 0.0346965, 3.16098, 1.86439, 0, 1.18143, "C0", 0.753254, "PuristaLight", 0, 1, 1, -0.0340903, 5, 1, 0, "B1B1", "FFFFFF"];
    };
    
    private _returnMe = _nc_settings;
    _returnMe;
};

fnc_savesettings =
{
    params ["_ncX", "_ncY", "_ncW", "_ncSpan", "_nctype", "_ncFontsize", "_ncAlpha", "_ncAlphaNr", "_ncFontoption", "_ncinvert", "_ncShadow", "_ncMarkerVisibility", "_ncMarkerY", "_ncFontoptionNr", "_ncColorNr", "_nctypeNr", "_ncColorCustom", "_ncColor"];
    
    profileNamespace setVariable ["nc_settings", [_ncX, _ncY, _ncW, _ncSpan, _nctype, _ncFontsize, _ncAlpha, _ncAlphaNr, _ncFontoption, _ncinvert, _ncShadow, _ncMarkerVisibility, _ncMarkerY, _ncFontoptionNr, _ncColorNr, _nctypeNr, _ncColorCustom, _ncColor]];
    saveProfileNamespace;
};

fnc_showsettings =
{
    disableSerialization;
    
    ncColorOption = "f9f9f9";
    nc_lb_colorOption = [
        ncColorOption,
        "FFFFFF",
    "000000"];
    nc_lb_fontoption = [
        "EtelkaMonospacePro",
        "EtelkaMonospaceProBold",
        "EtelkaNarrowMediumPro",
        "LucidaConsoleB",
        "PuristaBold",
        "PuristaLight",
        "PuristaMedium",
        "PuristaSemiBold",
        "RobotoCondensed",
        "RobotoCondensedBold",
        "RobotoCondensedLight",
    "TahomaB"];
    
    folder = [] call fnc_loadsettings;
    if (isnil "folder") then {
        folder = [0.499889, 0.0346965, 3.16098, 1.86439, 0, 1.18143, "C0", 0.753254, "PuristaLight", 0, 1, 1, -0.0340903, 5, 1, 0, "B1B1", "FFFFFF"];
    };
    
    ncX = folder select 0;
    ncY = folder select 1;
    ncW = folder select 2;
    ncSpan = folder select 3;
    nctype = folder select 4;
    ncFontsize = folder select 5;
    ncAlpha = folder select 6;
    ncAlphaNr = folder select 7;
    ncFontoption = folder select 8;
    ncinvert = folder select 9;
    ncShadow = folder select 10;
    ncMarkerVisibility = folder select 11;
    ncMarkerY = folder select 12;
    ncFontoptionNr = folder select 13;
    ncColorNr = folder select 14;
    nctypeNr = folder select 15;
    
    ncColor = folder select 17;
    
    nc_barOffsetX = (ncX * safeZoneW + safeZoneX);
    nc_barOffsetY = (ncY * safeZoneH + safeZoneY);
    nc_marker_offset = ncMarkerY + nc_barOffsetY;
    
    nc_dialog_controls = [
        [1000, "nc_background", [1, "", [0.29375 * safeZoneW + safeZoneX, 0.225 * safeZoneH + safeZoneY, 0.170156 * safeZoneW, 0.759 * safeZoneH], [-1, -1, -1, -1], [0.07, 0.07, 0.07, 1], [-1, -1, -1, -1], "", "Rsctext"], []],
        [1004, "nc_background_char", [1, "", [0.304062 * safeZoneW + safeZoneX, 0.489 * safeZoneH + safeZoneY, 0.149531 * safeZoneW, 0.264 * safeZoneH], [-1, -1, -1, -1], [0.03, 0.03, 0.03, 1], [-1, -1, -1, -1], "", "Rsctext"], []],
        [1001, "nc_background_pos", [1, "", [0.304062 * safeZoneW + safeZoneX, 0.28 * safeZoneH + safeZoneY, 0.149531 * safeZoneW, 0.154 * safeZoneH], [-1, -1, -1, -1], [0.03, 0.03, 0.03, 1], [-1, -1, -1, -1], "", "Rsctext"], []],
        [1007, "nc_background_features", [1, "", [0.304062 * safeZoneW + safeZoneX, 0.808 * safeZoneH + safeZoneY, 0.149531 * safeZoneW, 0.11 * safeZoneH], [-1, -1, -1, -1], [0.03, 0.03, 0.03, 1], [-1, -1, -1, -1], "", "Rsctext"], []],
        [1002, "nc_background_title_pos", [1, "Stand & SPOT", [0.304062 * safeZoneW + safeZoneX, 0.247 * safeZoneH + safeZoneY, 0.149531 * safeZoneW, 0.033 * safeZoneH], [-1, -1, -1, -1], [0.11, 0.11, 0.11, 1], [-1, -1, -1, -1], "", "Rsctext"], []],
        [1103, "nc_background_pos_x", [1, "X", [0.314375 * safeZoneW + safeZoneX, 0.291 * safeZoneH + safeZoneY, 0.0154688 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [0, 0, 0, 0], [-1, -1, -1, -1], "HorIZONTAL position. set the correct horizontal position you desire.", "Rscstructuredtext"], []],
        [1104, "nc_background_pos_y", [1, "Y", [0.314375 * safeZoneW + safeZoneX, 0.324 * safeZoneH + safeZoneY, 0.0154688 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [0, 0, 0, 0], [-1, -1, -1, -1], "VERTICAL position. set the correct vertical position you desire.", "Rscstructuredtext"], []],
        [1106, "nc_background_pos_w", [1, "W", [0.314375 * safeZoneW + safeZoneX, 0.357 * safeZoneH + safeZoneY, 0.0154688 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [0, 0, 0, 0], [-1, -1, -1, -1], "WIDTH. Exact range of visibility for points.", "Rscstructuredtext"], []],
        [1107, "nc_background_pos_s", [1, "S", [0.314375 * safeZoneW + safeZoneX, 0.39 * safeZoneH + safeZoneY, 0.0154688 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [0, 0, 0, 0], [-1, -1, -1, -1], "SPAN. Change the distance between the points.", "Rscstructuredtext"], []],
        [1003, "nc_background_title_char", [1, "CHARACTERISTICS", [0.304062 * safeZoneW + safeZoneX, 0.456 * safeZoneH + safeZoneY, 0.149531 * safeZoneW, 0.033 * safeZoneH], [-1, -1, -1, -1], [0.11, 0.11, 0.11, 1], [-1, -1, -1, -1], "", "Rsctext"], []],
        [1100, "nc_background_fontsize", [1, "sS", [0.314375 * safeZoneW + safeZoneX, 0.544 * safeZoneH + safeZoneY, 0.020625 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [0, 0, 0, 0], [-1, -1, -1, -1], "size-FONT. Determines the size of the individual cardinal points.", "Rscstructuredtext"], []],
        [1102, "nc_background_fontAlpha", [1, "A", [0.314375 * safeZoneW + safeZoneX, 0.577 * safeZoneH + safeZoneY, 0.0154688 * safeZoneW, 0.022 * safeZoneH], [1, 1, 1, 0.5], [0, 0, 0, 0], [-1, -1, -1, -1], "TRANSPARENCY. set the visibility of the whole compass.", "Rscstructuredtext"], []],
        [1109, "nc_background_fontColor", [1, "#", [0.314375 * safeZoneW + safeZoneX, 0.621 * safeZoneH + safeZoneY, 0.0154688 * safeZoneW, 0.022 * safeZoneH], [1, 0, 0, 1], [0, 0, 0, 0], [-1, -1, -1, -1], "COLor-CODE. put #HEX color here for custom color.", "Rscstructuredtext"], []],
        [1110, "nc_background_shadow", [1, "Shadow", [0.402031 * safeZoneW + safeZoneX, 0.709 * safeZoneH + safeZoneY, 0.0360937 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [0, 0, 0, 0], [-1, -1, -1, -1], "SHAdoW. Enable the dropshadow for the cardinal points.", "Rscstructuredtext"], []],
        [1111, "nc_background_invert", [1, "invert", [0.355625 * safeZoneW + safeZoneX, 0.709 * safeZoneH + safeZoneY, 0.0309375 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [0, 0, 0, 0], [-1, -1, -1, -1], "inVERT. switch between the option of the needles being at the top or bottom of the cardinal points.", "Rscstructuredtext"], []],
        [1006, "nc_background_title_features", [1, "MARKERS & FEATURES", [0.304062 * safeZoneW + safeZoneX, 0.775 * safeZoneH + safeZoneY, 0.149531 * safeZoneW, 0.033 * safeZoneH], [-1, -1, -1, -1], [0.11, 0.11, 0.11, 1], [-1, -1, -1, -1], "", "Rsctext"], []],
        [1112, "nc_background_pos_markerY", [1, "Y", [0.314375 * safeZoneW + safeZoneX, 0.83 * safeZoneH + safeZoneY, 0.0154688 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [0, 0, 0, 0], [-1, -1, -1, -1], "VERTICAL OFFset. set the correct vertical offset you desire.", "Rscstructuredtext"], []],
        [1113, "nc_background_visibility", [1, "Visbility", [0.402031 * safeZoneW + safeZoneX, 0.874 * safeZoneH + safeZoneY, 0.0360937 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [0, 0, 0, 0], [-1, -1, -1, -1], "VISIBILITY. toggle it.", "Rscstructuredtext"], []],
        [1114, "nc_background_info_soon", [1, "more features soon", [0.314375 * safeZoneW + safeZoneX, 0.874 * safeZoneH + safeZoneY, 0.0825 * safeZoneW, 0.022 * safeZoneH], [1, 1, 1, 0.3], [0, 0, 0, 0], [-1, -1, -1, -1], "inFO. Future updates coming. Stay tuned", "Rsctext"], []],
        [1115, "nc_background_impressum", [1, "Voyager Compass 1.1", [0.304062 * safeZoneW + safeZoneX, 0.94 * safeZoneH + safeZoneY, 0.0825 * safeZoneW, 0.022 * safeZoneH], [1, 1, 1, 0.3], [0, 0, 0, 0], [-1, -1, -1, -1], "Creator: Unknown_GTX & Flax", "Rsctext"], []],
        [2400, "nc_save", [1, "SAVE", [0.412344 * safeZoneW + safeZoneX, 0.94 * safeZoneH + safeZoneY, 0.04125 * safeZoneW, 0.022 * safeZoneH], [0.07, 0.07, 0.07, 1], [0.93, 0.93, 0.93, 1], [0.07, 0.07, 0.07, 1], "Permanently save changes. (stays even after restarting the game)", "RscButton"], [],
            ["profileNamespace setVariable ['nc_settings', folder];
                saveProfileNamespace;
            "]],
            [2401, "nc_close", [1, "X", [0.391719 * safeZoneW + safeZoneX, 0.94 * safeZoneH + safeZoneY, 0.0154688 * safeZoneW, 0.022 * safeZoneH], [0.07, 0.07, 0.07, 1], [0.93, 0.93, 0.93, 1], [-1, -1, -1, -1], "Close without save.", "RscButton"], [],
            ["(uiNamespace getVariable 'nc_dialogDisplay') closeDisplay 2"]],
            [2800, "ncShadow", [1, "", [0.391719 * safeZoneW + safeZoneX, 0.709 * safeZoneH + safeZoneY, 0.0103125 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [-1, -1, -1, -1], [-1, -1, -1, -1], "SHAdoW. Enable the dropshadow for the cardinal points.", "RscCheckBox"], [],
                [ncShadow, "folder set [10, (_this select 1)];
                    switch (_this select 1) do {
                        case (0): {
                            ncShadow = 0;
                        };
                        case (1): {
                            ncShadow = 2;
                        };
                    };
                    _comp = [nctype, ncinvert, ncFontsize, ncShadow, ncFontoption, ncAlpha, ncColorOption] call fnc_compileCompass;
                "]],
                
                [1901, "ncX", [1, "", [0.340156 * safeZoneW + safeZoneX, 0.302 * safeZoneH + safeZoneY, 0.0979687 * safeZoneW, 0.011 * safeZoneH], [-1, -1, -1, -1], [1, 1, 1, 1], [-1, -1, -1, -1], "HorIZONTAL position. set the correct horizontal position you desire.", "RscSlider"], [],
                    [[/*range*/0, 1, ncX], "folder set [0, (_this select 1)];
                    nc_barOffsetX = ((_this select 1) * safeZoneH + safeZoneY)"]],
                    
                    [1900, "nc_y", [1, "", [0.340156 * safeZoneW + safeZoneX, 0.335 * safeZoneH + safeZoneY, 0.0979687 * safeZoneW, 0.011 * safeZoneH], [-1, -1, -1, -1], [1, 1, 1, 1], [-1, -1, -1, -1], "VERTICAL position. set the correct vertical position you desire.", "RscSlider"], [],
                        [[/*range*/0, 1, ncY], "folder set [1, (_this select 1)];
                            nc_barOffsetY = ((_this select 1) * safeZoneH + safeZoneY);
                            nc_marker_offset = ncMarkerY + nc_barOffsetY;
                        "]],
                        
                        [1902, "nc_w", [1, "", [0.340156 * safeZoneW + safeZoneX, 0.368 * safeZoneH + safeZoneY, 0.0979687 * safeZoneW, 0.011 * safeZoneH], [-1, -1, -1, -1], [1, 1, 1, 1], [-1, -1, -1, -1], "WIDTH. Exact range of visibility for points.", "RscSlider"], [],
                            [[/*range*/0, 5, ncW], "folder set [2, (_this select 1)];
                            ncW = (_this select 1)"]],
                            
                            [1903, "nc_s", [1, "", [0.340156 * safeZoneW + safeZoneX, 0.401 * safeZoneH + safeZoneY, 0.0979687 * safeZoneW, 0.011 * safeZoneH], [-1, -1, -1, -1], [1, 1, 1, 1], [-1, -1, -1, -1], "SPAN. Change the distance between the points.", "RscSlider"], [],
                                [[/*range*/1, 3, ncSpan], "folder set [3, (_this select 1)];
                                ncSpan = (_this select 1)"]],
                                
                                [2100, "nc_type", [1, "", [0.319531 * safeZoneW + safeZoneX, 0.511 * safeZoneH + safeZoneY, 0.118594 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [-1, -1, -1, -1], [-1, -1, -1, -1], "type. Work in progress.", "RscCombo"], [],
                                    [["Battlegrounds", "Arma 3"], "folder set [15, (_this select 1)];
                                    nctype = (_this select 1)", nctypeNr]],
                                    
                                    [1904, "nc_fontsize", [1, "", [0.340156 * safeZoneW + safeZoneX, 0.555 * safeZoneH + safeZoneY, 0.0979687 * safeZoneW, 0.011 * safeZoneH], [-1, -1, -1, -1], [1, 1, 1, 1], [-1, -1, -1, -1], "size-FONT. Determines the size of the individual cardinal points.", "RscSlider"], [],
                                        [[/*range*/0.8, 1.4, ncFontsize], "folder set [5, (_this select 1)];
                                            ncFontsize = (_this select 1);
                                            _comp = [nctype, ncinvert, ncFontsize, ncShadow, ncFontoption, ncAlpha, ncColorOption] call fnc_compileCompass;
                                        "]],
                                        
                                        [1905, "nc_fontAlpha", [1, "", [0.340156 * safeZoneW + safeZoneX, 0.588 * safeZoneH + safeZoneY, 0.0979687 * safeZoneW, 0.011 * safeZoneH], [-1, -1, -1, -1], [1, 1, 1, 1], [-1, -1, -1, -1], "TRANSPARENCY. set the visibility of the whole compass.", "RscSlider"], [],
                                            [[/*range*/0, 1, ncAlphaNr], "folder set [7, (_this select 1)];
                                                _clr = [0, 0, 0, (_this select 1)] call BIS_fnc_ColorRGBAtoHTML;
                                                _cutBelow = [0, 1, _clr] call fnc_removestring;
                                            _cutAbove = [2, 6, _cutBelow] call fnc_removestring; folder set [6, _cutAbove]; ncAlpha = _cutAbove; _comp = [nctype, ncinvert, ncFontsize, ncShadow, ncFontoption, ncAlpha, ncColorOption] call fnc_compileCompass;"]],
                                            
                                            [2103, "nc_font", [1, "", [0.319531 * safeZoneW + safeZoneX, 0.665 * safeZoneH + safeZoneY, 0.118594 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [1, 1, 1, 1], [-1, -1, -1, -1], "FONT. switch between different looks with the font.", "RscCombo"], [],
                                                [["EtelkaMonospacePro", "EtelkaMonospaceProBold", "EtelkaNarrowMediumPro", "LucidaConsoleB", "PuristaBold", "PuristaLight", "PuristaMedium", "PuristaSemiBold", "RobotoCondensed", "RobotoCondensedBold", "RobotoCondensedLight", "TahomaB"],
                                                    "folder set [13, (_this select 1)];
                                                    folder set [8, (nc_lb_fontoption select (_this select 1))];
                                                    ncFontoptionNr = (_this select 1);
                                                ncFontoption = nc_lb_fontoption select (_this select 1); _comp = [nctype, ncinvert, ncFontsize, ncShadow, ncFontoption, ncAlpha, ncColorOption] call fnc_compileCompass;", ncFontoptionNr]],
                                                
                                                [1005, "ncColor_code", [1, "", [0.326719 * safeZoneW + safeZoneX, 0.621 * safeZoneH + safeZoneY, 0.04125 * safeZoneW, 0.022 * safeZoneH], [1, 1, 1, 1], [0.03, 0.03, 0.03, 1], [-1, -1, -1, -1], "", "RscEdit"], []],
                                                [2102, "ncColor", [1, "", [0.371094 * safeZoneW + safeZoneX, 0.621 * safeZoneH + safeZoneY, 0.0670312 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [-1, -1, -1, -1], [-1, -1, -1, -1], "COLor. Choose between predefined colors.", "RscCombo"], [],
                                                    [["Custom", "White", "Black"], "folder set [14, (_this select 1)];
                                                        folder set [17, (nc_lb_colorOption select (_this select 1))];
                                                        ncColorOption = nc_lb_colorOption select (_this select 1);
                                                    _comp = [nctype, ncinvert, ncFontsize, ncShadow, ncFontoption, ncAlpha, ncColorOption] call fnc_compileCompass;", ncColorNr]],
                                                    
                                                    [2801, "nc_invert", [1, "", [0.345312 * safeZoneW + safeZoneX, 0.709 * safeZoneH + safeZoneY, 0.0103125 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [-1, -1, -1, -1], [-1, -1, -1, -1], "inVERT. switch between the option of the needles being at the top or bottom of the cardinal points.", "RscCheckBox"], [],
                                                        [ncinvert, "folder set [9, (_this select 1)];
                                                            ncinvert = (_this select 1);
                                                            _comp = [nctype, ncinvert, ncFontsize, ncShadow, ncFontoption, ncAlpha, ncColorOption] call fnc_compileCompass;
                                                        "]],
                                                        
                                                        [1906, "nc_markerY", [1, "", [0.340156 * safeZoneW + safeZoneX, 0.841 * safeZoneH + safeZoneY, 0.0979687 * safeZoneW, 0.011 * safeZoneH], [-1, -1, -1, -1], [1, 1, 1, 1], [-1, -1, -1, -1], "VERTICAL OFFset. set the correct vertical offset you desire.", "RscSlider"], [],
                                                            [[/*range*/-2, 2, ncMarkerY], "folder set [12, (_this select 1)];
                                                                nc_marker_offset = (_this select 1) + nc_barOffsetY;
                                                                ncMarkerY = (_this select 1);
                                                            "]],
                                                            
                                                            [2802, "nc_visibility", [1, "", [0.391719 * safeZoneW + safeZoneX, 0.874 * safeZoneH + safeZoneY, 0.0103125 * safeZoneW, 0.022 * safeZoneH], [-1, -1, -1, -1], [-1, -1, -1, -1], [-1, -1, -1, -1], "VISIBILITY. toggle it.", "RscCheckBox"], [],
                                                                [ncMarkerVisibility, "folder set [11, (_this select 1)];
                                                                ncMarkerVisibility = (_this select 1)"]]
                                                            ];
                                                            
                                                            with uiNamespace do {
                                                                nc_dialogDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
                                                            };
                                                            {
                                                                _idc = _x select 0;
                                                                _type = (_x select 2) select 7;
                                                                _pos = (_x select 2) select 2;
                                                                
                                                                _tooltip = (_x select 2)select 6;
                                                                _background_color = (_x select 2) select 4;
                                                                _txt = (_x select 2) select 1;
                                                                
                                                                _display = uiNamespace getVariable "nc_dialogDisplay";
                                                                
                                                                switch (_type) do {
                                                                    case ("Rsctext"): {
                                                                        _ctrl = _display ctrlCreate [_type, _idc];
                                                                        _ctrl ctrlsettext _txt;
                                                                        // hint format ["x: %1, x: %2, x: %3, x: %4", _posx, _posy, _posw, _posh];
                                                                        _ctrl ctrlsettextColor [1, 1, 1, 1];
                                                                        _ctrl ctrlsetBackgroundColor _background_color;
                                                                    };
                                                                    case ("Rscstructuredtext"): {
                                                                        _ctrl = _display ctrlCreate [_type, _idc];
                                                                        _ctrl ctrlsettext _txt;
                                                                        _ctrl ctrlsettextColor [1, 1, 1, 1];
                                                                        _ctrl ctrlsetBackgroundColor _background_color;
                                                                    };
                                                                    case ("RscSlider"): {
                                                                        _sliderRange_start = ((_x select 4) select 0) select 0;
                                                                        _sliderRange_end = ((_x select 4) select 0) select 1;
                                                                        _sliderPos = ((_x select 4) select 0) select 2;
                                                                        _func = compile ((_x select 4) select 1);
                                                                        
                                                                        _ctrl = _display ctrlCreate [_type, _idc];
                                                                        _ctrl sliderSetRange [_sliderRange_start, _sliderRange_end];
                                                                        _ctrl sliderSetPosition _sliderPos;
                                                                        _ctrl ctrlAddEventHandler ["SliderPosChanged", _func];
                                                                    };
                                                                    case ("RscCombo"): {
                                                                        _ctrl = _display ctrlCreate [_type, _idc];
                                                                        _func = compile ((_x select 4) select 1);
                                                                        for "_i" from 0 to (count ((_x select 4) select 0)-1) do
                                                                        {
                                                                            _lbItem = ((_x select 4) select 0) select _i;
                                                                            _index = _ctrl lbAdd _lbItem;
                                                                        };
                                                                        _indexy = (_x select 4) select 2;
                                                                        _ctrl lbsetCurSel _indexy;
                                                                        _ctrl ctrlAddEventHandler ["LBSelChanged", _func];
                                                                    };
                                                                    case ("RscCheckBox"): {
                                                                        _ctrl = _display ctrlCreate [_type, _idc];
                                                                        if ((_x select 4) select 0 == 1) then {
                                                                            _ctrl cbsetChecked true;
                                                                        };
                                                                        _func = compile ((_x select 4) select 1);
                                                                        _ctrl ctrlAddEventHandler ["CheckedChanged", _func];
                                                                        if (ncinvert == 1) then {
                                                                            _ctrl ctrlsetChecked true;
                                                                        } else {
                                                                            _ctrl ctrlsetChecked false;
                                                                        };
                                                                    };
                                                                    case ("RscButton"): {
                                                                        _ctrl = _display ctrlCreate [_type, _idc];
                                                                        _ctrl ctrlsettext _txt;
                                                                        _func = compile ((_x select 4) select 0);
                                                                        _ctrl ctrlAddEventHandler ["ButtonClick", _func];
                                                                    };
                                                                    case ("RscEdit"): {
                                                                        _ctrl = _display ctrlCreate [_type, _idc];
                                                                        _ctrl ctrlsettextColor [1, 1, 1, 1];
                                                                        _ctrl ctrlsetBackgroundColor [0, 0, 0, 1];
                                                                        _ctrl ctrlAddEventHandler ["KeyUp", {
                                                                            ncColorOption = ctrltext ((uiNamespace getVariable "nc_dialogDisplay") displayCtrl 1005);
                                                                            _comp = [nctype, ncinvert, ncFontsize, ncShadow, ncFontoption, ncAlpha, ncColorOption] call fnc_compileCompass;
                                                                        }];
                                                                        _ctrl ctrlsettext ncColorOption;
                                                                    };
                                                                };
                                                                _ctrl = _display displayCtrl _idc;
                                                                _ctrl ctrlsetPosition _pos;
                                                                _ctrl ctrlCommit 0;
                                                                _ctrl ctrlsettooltip _tooltip;
                                                            } forEach nc_dialog_controls;
                                                        };
                                                        
                                                        fnc_showCompass =
                                                        {
                                                            disableSerialization;
                                                            
                                                            _nc_settings = [] call fnc_loadsettings;
                                                            if (isnil "_nc_settings") then {
                                                                _nc_settings = [0.499889, 0.0346965, 3.16098, 1.86439, 0, 1.18143, "C0", 0.753254, "PuristaLight", 0, 1, 1, -0.0340903, 5, 1, 0, "B1B1", "FFFFFF"];
                                                            };
                                                            
                                                            ncX = _nc_settings select 0;
                                                            ncY = _nc_settings select 1;
                                                            ncW = _nc_settings select 2;
                                                            ncSpan = _nc_settings select 3;
                                                            nctype = _nc_settings select 4;
                                                            ncFontsize = _nc_settings select 5;
                                                            ncAlpha = _nc_settings select 6;
                                                            
                                                            ncFontoption = _nc_settings select 8;
                                                            ncinvert = _nc_settings select 9;
                                                            ncShadow = _nc_settings select 10;
                                                            ncMarkerVisibility = _nc_settings select 11;
                                                            ncMarkerY = _nc_settings select 12;
                                                            
                                                            ncColorOption = "f9f9f9";
                                                            
                                                            nc_barOffsetX = (ncX * safeZoneW + safeZoneX);
                                                            nc_barOffsetY = (ncY * safeZoneH + safeZoneY);
                                                            nc_marker_offset = ncMarkerY + nc_barOffsetY;
                                                            
                                                            ("compassTitle" call BIS_fnc_rscLayer) cutRsc ["RscTitleDisplayEmpty", "PLAin"];
                                                            
                                                            switch (ncShadow) do {
                                                                case (0): {
                                                                    ncShadow = 0;
                                                                };
                                                                case (1): {
                                                                    ncShadow = 2;
                                                                };
                                                            };
                                                            
                                                            _comp = [nctype, ncinvert, ncFontsize, ncShadow, ncFontoption, ncAlpha, ncColorOption] call fnc_compileCompass;
                                                            
                                                            // rendering of compass
                                                            allUserMarkers = [];
                                                            currentMarkers = [];
                                                            combMarkers = [];
                                                            
                                                            ["0", "onEachFrame", {
                                                                _compassNeedle = ((uiNamespace getVariable "RscTitleDisplayEmpty") displayCtrl 3399);
                                                                _compassNeedle ctrlsetPosition [nc_barOffsetX - (0.1/2), nc_barOffsetY, 0.1, 0.015 * safeZoneH];
                                                                _compassNeedle ctrlCommit 0;
                                                                
                                                                {
                                                                    _ctrl = _x select 0;
                                                                    _pos = (_x select 1) / 100;
                                                                    _degreeControl = ((uiNamespace getVariable "RscTitleDisplayEmpty") displayCtrl _ctrl);
                                                                    _playerDir = (getDir player)/100;
                                                                    
                                                                    _controlPos = (ctrlposition _degreeControl) select 0;
                                                                    
                                                                    if (_controlPos > ((ncW / 10 * safeZoneW + safeZoneX) - (0.1/2)) && _controlPos < (1 - ((ncW / 10 * safeZoneW + safeZoneX))- (0.1/2))) then {
                                                                        _degreeControl ctrlsetPosition [ nc_barOffsetX + ((_pos - _playerDir) / ncSpan) - (0.1/2), nc_barOffsetY, 0.1, 0.4];
                                                                    } else {
                                                                        _degreeControl ctrlsetPosition [ nc_barOffsetX + ((_pos - _playerDir) / ncSpan) - (0.1/2), nc_barOffsetY, 0.0, 0.4];
                                                                    };
                                                                    _degreeControl ctrlCommit 0;
                                                                } forEach compass_pos;
                                                                
                                                                {
                                                                    _ctrl = _x select 0;
                                                                    _marker = _x select 1;
                                                                    _ctrl2 = _ctrl + 100;
                                                                    
                                                                    _playerDir = (getDir player)/100;
                                                                    _relativeDir = ([player, markerPos _marker] call BIS_fnc_relativeDirto)/100;
                                                                    
                                                                    _MarkerControl = ((uiNamespace getVariable "RscTitleDisplayEmpty") displayCtrl _ctrl);
                                                                    _MarkerControl2 = ((uiNamespace getVariable "RscTitleDisplayEmpty") displayCtrl _ctrl2);
                                                                    
                                                                    _controlPos = (ctrlposition _MarkerControl) select 0;
                                                                    _controlPos2 = (ctrlposition _MarkerControl2) select 0;
                                                                    
                                                                    if (_controlPos > (((ncW / 10 * safeZoneW + safeZoneX) - (0.1/2)) * ncMarkerVisibility) && _controlPos < (((1 - (ncW / 10 * safeZoneW + safeZoneX))- (0.1/2)) * ncMarkerVisibility)) then {
                                                                        _MarkerControl ctrlsetPosition [ nc_barOffsetX + (_relativeDir / ncSpan) - (0.05/2), nc_marker_offset, 0.05, 0.09];
                                                                    } else {
                                                                        _MarkerControl ctrlsetPosition [ nc_barOffsetX + (_relativeDir / ncSpan) - (0.05/2), nc_marker_offset, 0.00, 0.09];
                                                                    };
                                                                    
                                                                    if (_controlPos2 > (((ncW / 10 * safeZoneW + safeZoneX) - (0.1/2)) * ncMarkerVisibility) && _controlPos2 < ((((1 - (ncW / 10 * safeZoneW + safeZoneX))- (0.1/2))) * ncMarkerVisibility)) then {
                                                                        _MarkerControl2 ctrlsetPosition [ nc_barOffsetX + (_relativeDir / ncSpan) - (3.6/ncSpan) - (0.05/2), nc_marker_offset, 0.05, 0.09];
                                                                    } else {
                                                                        _MarkerControl2 ctrlsetPosition [ nc_barOffsetX + (_relativeDir / ncSpan) - (3.6/ncSpan) - (0.05/2), nc_marker_offset, 0.00, 0.09];
                                                                    };
                                                                    
                                                                    _MarkerControl ctrlCommit 0;
                                                                    _MarkerControl2 ctrlCommit 0;
                                                                } forEach combMarkers;
                                                                
                                                                // hint format ["degr: %1", getDir player];
                                                            }] call BIS_fnc_addStackedEventHandler;
                                                            waitUntil {
                                                                ncMarkerVisibility == 1;
                                                            };
                                                            
                                                            while {true} do {
                                                                // create user array [marker]
                                                                {
                                                                    if !(_x in currentMarkers) then {
                                                                        _a = toArray _x;
                                                                        _a resize 15;
                                                                        if (toString _a == "_USER_DEFinED #") then {
                                                                            allUserMarkers pushBack _x;
                                                                        };
                                                                    };
                                                                } forEach allMapMarkers;
                                                                // create double array ([marker], [idc, marker])
                                                                {
                                                                    if !(_x in currentMarkers) then {
                                                                        _display = uiNamespace getVariable "RscTitleDisplayEmpty";
                                                                        _index = allUserMarkers find _x;
                                                                        _idc = 5500 + _index;
                                                                        
                                                                        _edit = _display ctrlCreate ["Rscstructuredtext", _idc];
                                                                        _edit2 = _display ctrlCreate ["Rscstructuredtext", _idc + 100];
                                                                        _edit ctrlsetPosition [-2, -2, 0.05, 0.05];
                                                                        _edit2 ctrlsetPosition [-2, -2, 0.05, 0.05];
                                                                        
                                                                        _img = gettext (configFile >> "cfgMarkers" >> markertype _x >> "icon");
                                                                        _txt = parsetext format ["<img image='%1' align='center'/>", _img];
                                                                        _edit ctrlsetstructuredtext _txt;
                                                                        _edit2 ctrlsetstructuredtext _txt;
                                                                        
                                                                        _edit ctrlCommit 0;
                                                                        _edit2 ctrlCommit 0;
                                                                        
                                                                        currentMarkers pushBack _x;
                                                                        combMarkers pushBack [_idc, _x];
                                                                    };
                                                                } forEach allUserMarkers;
                                                            // delete if marker from [idc, marker] aint alive anymore
                                                            {
                                                                if !(_x in allMapMarkers) then {
                                                                    allUserMarkers = allUserMarkers - [_x];
                                                                    currentMarkers = currentMarkers - [_x];
                                                                };
                                                            } forEach allUserMarkers;
                                                            {
                                                                if !((_x select 1) in allUserMarkers) then {
                                                                    _display = uiNamespace getVariable "RscTitleDisplayEmpty";
                                                                    ctrlDelete (_display displayCtrl (_x select 0));
                                                                    ctrlDelete (_display displayCtrl ((_x select 0)+100));
                                                                    combMarkers = combMarkers - [_x];
                                                                };
                                                            } forEach combMarkers;
                                                            sleep 0.2;
                                                        };
                                                    };
                                                    
                                                    fnc_compileCompass =
                                                    {
                                                        // coordinates of compass angles
                                                        compass_pos = [
                                                            [3400, -225, "SE" ],
                                                            [3401, -210, "140"],
                                                            [3402, -195, "165"],
                                                            
                                                            [3403, -180, "S" ],
                                                            
                                                            [3405, -165, "195"],
                                                            [3406, -150, "210"],
                                                            [3407, -135, "SW" ],
                                                            [3408, -120, "240"],
                                                            [3409, -105, "255"],
                                                            
                                                            [3410, -090, "W" ],
                                                            
                                                            [3421, -075, "285"],
                                                            [3422, -060, "300"],
                                                            [3423, -045, "NW" ],
                                                            [3424, -030, "330"],
                                                            [3425, -015, "345"],
                                                            
                                                            [3426, 0, "N" ],
                                                            
                                                            [3427, 015, "15" ],
                                                            [3428, 030, "30" ],
                                                            [3429, 045, "NE" ],
                                                            [3430, 060, "60" ],
                                                            [3431, 075, "75" ],
                                                            
                                                            [3432, 090, "E" ],
                                                            
                                                            [3433, 105, "105" ],
                                                            [3434, 120, "120" ],
                                                            [3435, 135, "SE" ],
                                                            [3436, 150, "150" ],
                                                            [3437, 165, "165" ],
                                                            
                                                            [3438, 180, "S" ],
                                                            
                                                            [3439, 195, "195" ],
                                                            [3440, 210, "210" ],
                                                            [3441, 225, "SW" ],
                                                            [3442, 240, "240" ],
                                                            [3443, 255, "255" ],
                                                            
                                                            [3445, 270, "W" ],
                                                            
                                                            [3446, 285, "285" ],
                                                            [3447, 300, "300" ],
                                                            [3448, 315, "NW" ],
                                                            [3449, 330, "330" ],
                                                            [3450, 345, "345" ],
                                                            
                                                            [3451, 360, "N" ],
                                                            
                                                            [3452, 375, "15" ],
                                                            [3453, 390, "30" ],
                                                            [3454, 405, "NE" ],
                                                            [3455, 420, "60" ],
                                                            [3456, 435, "75" ],
                                                            
                                                            [3457, 450, "E" ],
                                                            
                                                            [3458, 465, "105" ],
                                                            [3459, 480, "120" ],
                                                            [3460, 495, "SE" ],
                                                            [3461, 510, "150" ],
                                                            [3462, 525, "165" ],
                                                            
                                                            [3463, 540, "S" ],
                                                            
                                                            [3464, 555, "195" ],
                                                            [3465, 570, "210" ],
                                                            [3466, 585, "SW" ]
                                                        ];
                                                        compass_pos_a3 = [
                                                            [3410, 0, "no" ]
                                                        ];
                                                        _nc_lb_type = [compass_pos, compass_pos_a3];
                                                        
                                                        disableSerialization;
                                                        params ["_compasstype", "_ncNeedle", "_ncFontsize", "_ncShadow", "_ncFontoption", "_ncAlpha", "_ncColorOption"];
                                                        
                                                        switch (_ncShadow) do {
                                                            case (0): {
                                                                _ncShadow = 0;
                                                            };
                                                            case (1): {
                                                                _ncShadow = 2;
                                                            };
                                                            default {
                                                                _ncShadow = 2;
                                                            };
                                                        };
                                                        
                                                        _display = uiNamespace getVariable "RscTitleDisplayEmpty";
                                                        
                                                        for "_i" from 3399 to 3499 do
                                                        {
                                                            ctrlDelete (_display displayCtrl _i);
                                                        };
                                                        _compass = _nc_lb_type select _compasstype;
                                                        _compassNeedle = _display ctrlCreate ["Rscstructuredtext", 3399];
                                                        _compassNeedle ctrlsetPosition [-2, -2, 0.05, 0.05];
                                                        
                                                        _compassNeedle ctrlsetstructuredtext parsetext format["<t shadow=2><t shadowColor='#ff0000' align='center' size='%1' color='#f9f9f9'>|</t>", 0.65];
                                                        
                                                        for "_i" from 0 to (count _compass - 1) do
                                                        {
                                                            _idc = ((_compass select _i) select 0);
                                                            _dir = ((_compass select _i) select 2);
                                                            _arrayindex = _i;
                                                            // _compasstype find _x;
                                                            
                                                            nc_sizeX = 0.65 * _ncFontsize;
                                                            if (_arrayindex % 6 == 3) then {
                                                                nc_sizeX = 1 * _ncFontsize;
                                                            };
                                                            if (_arrayindex % 6 == 0) then {
                                                                nc_sizeX = 0.8 * _ncFontsize;
                                                            };
                                                            _edit = _display ctrlCreate ["Rscstructuredtext", _idc];
                                                            _edit ctrlsetPosition [-2, -2, 0.05, 0.05];
                                                            
                                                            _var_needle = "";
                                                            switch (_ncNeedle) do {
                                                                case (1): {
                                                                    _var_needle = _dir + "<br />|</t>";
                                                                };
                                                                case (0): {
                                                                    _var_needle = "|<br />" + _dir + "</t>";
                                                                };
                                                            };
                                                            _edit ctrlsetstructuredtext parsetext ("<t shadow=" + str _ncShadow + "><t shadowColor='#000000' align='center' size='" + str nc_sizeX + "' font='" + _ncFontoption + "' color='#" + _ncAlpha + _ncColorOption + "'>" + _var_needle);
                                                            _edit ctrlCommit 0;
                                                        };
                                                    };
                                                    
                                                    waitUntil {
                                                        !isNull player
                                                    };
                                                    [] spawn fnc_showCompass;
                                                    
                                                    [] spawn
                                                    {
                                                        while {true} do {
                                                            waitUntil {
                                                                !isNull (findDisplay 49)
                                                            };
                                                            
                                                            disableSerialization;
                                                            _display = findDisplay 49;
                                                            _ctrl = _display ctrlCreate ["RscButton", 3399];
                                                            _ctrl ctrlsetPosition [
                                                                (1 * (((safeZoneW / safeZoneH) min 1.2) / 40) + (safeZoneX)),
                                                                (2.2 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + safeZoneY),
                                                                (15 * (((safeZoneW / safeZoneH) min 1.2) / 40)),
                                                            (1 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25))];
                                                            _ctrl ctrlsetActiveColor [0.204, 0.286, 0.369, 1];
                                                            _ctrl ctrlsettext "COMPASS OPTIONS";
                                                            _ctrl ctrlCommit 0;
                                                            _ctrl buttonsetAction "(findDisplay 49) closeDisplay 1;
                                                            [] call fnc_showsettings;
                                                            ";
                                                            
                                                            waitUntil{
                                                                isNull (findDisplay 49)
                                                            };
                                                        };
                                                    };