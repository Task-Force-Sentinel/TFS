/*
* name: TFS_common_fnc_sidetoNum
* Author: Snippers
*
* Arguments:
* side
*
* Return:
* scalar
*
* Description:
* Will return the number associated to a side as used by the BI configs. This allows lookup interaction with the side property for factions in factionclasses.
*/

private _return = [east, west, independent, civilian, sideUnknown, sideEnemy, sideFriendly, sideLogic, sideEmpty, sideAmbientLife] find _this;

if (_return isEqualto -1) then {
    _return = 4;
    // sideUnknown
};

_return;