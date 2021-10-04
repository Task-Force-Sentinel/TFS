/*
Function: TFS_fnc_DynamicSim

Description:
Globally enables or disables dynamic simulation and sets proper parameters.

Arguments:
None

Return Value:
None

Example:
nothing to see here

Author:
MitchJC
*/

if (!isServer) exitwith {};

if !(dynamicSimulationSystemEnabled) exitwith {
    enableDynamicSimulationSystem true;
    
    "group" setDynamicSimulationDistance 3000;
    "vehicle" setDynamicSimulationDistance 3000;
    "Emptyvehicle" setDynamicSimulationDistance 250;
    "Prop" setDynamicSimulationDistance 50;
    "IsMoving" setDynamicSimulationDistanceCoef 3;
};