/*
* name: TFS_common_fnc_sidetotexture
* Author: Snippers
*
* Arguments:
* side
*
* Return:
* string: texture
*
* Description:
* Will return a texture for the given side.
*/

if (_this == west) exitwith {
    "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
};
if (_this == east) exitwith {
    "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
};
if (_this == independent) exitwith {
    "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
};
if (_this == civilian) exitwith {
    "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
};
if (_this == sideLogic) exitwith {
    "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_custom_ca.paa";
};
"\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_empty_ca.paa"