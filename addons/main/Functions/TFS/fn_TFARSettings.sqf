// not documented: postinit

if (isServer) then {
    {
        _x setspeaker "NoVoice"
    } forEach playableunits;
};
// Here because it has nowhere else to go!

if (!hasinterface) exitwith {};

if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitwith {};

if (isnil "TFS_Main_TFARTransmitRange") exitwith {};
player setVariable ["tf_sendingdistanceMultiplicator", TFS_Main_TFARTransmitRange];

if (isnil "TFS_Main_TFARTerraininterference") exitwith {};
player setVariable ["TF_terrain_interception_coefficient", TFS_Main_TFARTerraininterference];