/*
* name: TFS_common_fnc_sidetohexColor
* Author: Snippers
*
* Arguments:
* side
*
* Return:
* array: color array
*
* Description:
* Will return the color of the inputted side.
*/

// Cache vars for speed
if (isnil "TFS_common_blufor_color") then {
    tfs_common_blufor_color = [blufor] call bis_fnc_sideColor;
    tfs_common_opfor_color = [opfor] call bis_fnc_sideColor;
    tfs_common_indep_color = [independent] call bis_fnc_sideColor;
    tfs_common_civ_color = [civilian] call bis_fnc_sideColor;
    tfs_common_empty_color = [sideUnknown] call bis_fnc_sideColor;
};
if (isnil "TFS_common_blufor_hex_color") then {
    tfs_common_blufor_hex_color = tfs_common_blufor_color call BIS_fnc_colorRGBtoHTML;
    tfs_common_opfor_hex_color = tfs_common_opfor_color call BIS_fnc_colorRGBtoHTML;
    tfs_common_indep_hex_color = tfs_common_indep_color call BIS_fnc_colorRGBtoHTML;
    tfs_common_civ_hex_color = tfs_common_civ_color call BIS_fnc_colorRGBtoHTML;
    tfs_common_empty_hex_color = tfs_common_empty_color call BIS_fnc_colorRGBtoHTML;
};
switch _this do {
    case blufor: {
        tfs_common_blufor_hex_color
    };
    case opfor: {
        tfs_common_opfor_hex_color
    };
    case independent: {
        tfs_common_indep_hex_color
    };
    case civilian: {
        tfs_common_civ_hex_color
    };
    default {
        tfs_common_empty_hex_color
    };
};