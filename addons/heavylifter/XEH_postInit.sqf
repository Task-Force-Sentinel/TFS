#include "script_component.hpp"

#ifdef DRAW_ATTACHPOS_inFO
GVAR(testHelper) = createvehicle ["land_Pod_Heli_Transport_04_fuel_F", [-1000, -1000, -1000], [], 0, "NONE"];
addMissionEventHandler ["Draw3D", {
    if (isNull cursorObject) exitwith {};
    private _attachPos = getArray (configFile >> "Cfgvehicles" >> typeOf cursorObject >> QGVAR(attachPos));
    drawIcon3D ["", [0.5, 0.5, 1, 1], ASLtoAGL getPosASL cursorObject, 0.5, 0.5, 0, format ["%1 = %2", typeOf cursorObject, _attachPos], 0.5, 0.025, "TahomaB"];
    drawIcon3D ["", [0.5, 0.5, 1, 1], cursorObject modeltoWorldVisual (getCenterOfMass cursorObject), 0.5, 0.5, 0, "Center", 0.5, 0.025, "TahomaB"];
    // Centre of mass
    if !(_attachPos isEqualto []) then {
        (boundingBoxReal GVAR(testHelper)) params ["_box0", "_box1"];
        {
            _x params ["_start", "_end"];
            drawLine3D [cursorObject modeltoWorldVisual _start, cursorObject modeltoWorldVisual _end, [0, 255, 255, 1]];
            // Center - Cyan
            drawLine3D [(cursorObject modeltoWorldVisual _start) vectorDiff _attachPos, (cursorObject modeltoWorldVisual _end) vectorDiff _attachPos, [255, 0, 0, 1]];
            // Config - Red
            private _dynamicAttachPos = cursorObject getVariable ["TFS_heavylifter_testAttachPos", [-100, -100, -100]];
            if !(_dynamicAttachPos isEqualto [-100, -100, -100]) then {
                drawLine3D [(cursorObject modeltoWorldVisual _start) vectorDiff _dynamicAttachPos, (cursorObject modeltoWorldVisual _end) vectorDiff _dynamicAttachPos, [0, 255, 0, 1]];
                // Dynamic - Green
            };
            false
            } count [
                [_box0, [_box1 select 0, _box0 select 1, _box0 select 2]], // Left Front Bottom -> Right Front Bottom
                [_box0, [_box0 select 0, _box1 select 1, _box0 select 2]], // Left Front Bottom -> Left Back Bottom
                [_box0, [_box0 select 0, _box0 select 1, _box1 select 2]], // Left Front Bottom -> Left Front top
                [_box1, [_box0 select 0, _box1 select 1, _box1 select 2]], // Right Back top -> Left Back top
                [_box1, [_box1 select 0, _box0 select 1, _box1 select 2]], // Right Back top -> Right Front top
                [_box1, [_box1 select 0, _box1 select 1, _box0 select 2]], // Right Back top -> Right Back Bottom
                [[_box1 select 0, _box1 select 1, _box0 select 2], [_box1 select 0, _box0 select 1, _box0 select 2]], // Right Back Bottom -> Right Front Bottom
                [[_box1 select 0, _box0 select 1, _box1 select 2], [_box0 select 0, _box0 select 1, _box1 select 2]], // Right Front top -> Left Front top
                [[_box1 select 0, _box0 select 1, _box0 select 2], [_box1 select 0, _box0 select 1, _box1 select 2]], // Right Front Bottom -> Right Front top
                [[_box0 select 0, _box1 select 1, _box1 select 2], [_box0 select 0, _box0 select 1, _box1 select 2]], // Left Back top -> Left Front top
                [[_box0 select 0, _box1 select 1, _box1 select 2], [_box0 select 0, _box1 select 1, _box0 select 2]], // Left Back top -> Left Back Bottom
                [[_box0 select 0, _box1 select 1, _box0 select 2], [_box1 select 0, _box1 select 1, _box0 select 2]] // Left Back Bottom -> Right Back Bottom
            ];
        };
    }];
    #endif