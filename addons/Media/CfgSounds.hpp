class CfgSounds
{
    sounds[] = {};
    class Denied
    {
        name = "Denied";
        sound[] = {
            "z\tfs\addons\media\Sounds\Denied.ogg", 1, 1, 100
        };
        titles[] = {
            0, ""
        };
    };
    
    class AirRaid
    {
        name = "AirRaid";
        sound[] = {
            "z\tfs\addons\media\Sounds\AirRaid.ogg", 1, 1, 100
        };
        titles[] = {
            0, ""
        };
    };
    
    class NukeAlarm
    {
        name = "NukeAlarm";
        sound[] = {
            "z\tfs\addons\media\Sounds\NukeAlarm.ogg", 1, 1, 100
        };
        titles[] = {
            0, ""
        };
    };
    
    class windows
    {
        name = "windows";
        sound[] = {
            "z\tfs\addons\media\Sounds\windows.ogg", 1, 1, 100
        };
        titles[] = {
            0, ""
        };
    };
    class calltoPrayer
    {
        name = "calltoPrayer";
        sound[] = {
            "z\tfs\addons\media\Sounds\calltoPrayer.ogg", 1, 1, 100
        };
        titles[] = {
            0, ""
        };
        length = 73;
    };
    #include "Sounds\AL\CfgSounds_AL.hpp"
    
    class qipTPL_Nuclear {
        name = "[qip] Nuclear siren";
        sound[] = {
            QPATHtoF(Music\Misc\Nuclear.ogg), db+0, 1.0
        };
        titles[] = {
            1, "Nuclear siren"
        };
    };
    
    class qipTPL_Baby {
        name = "[qip] Baby";
        sound[] = {
            QPATHtoF(Music\Horror\baby.ogg), db+0, 1.0
        };
        titles[] = {
            1, "Baby"
        };
    };
    
    class qipTPL_Kind {
        name = "[qip] Kind";
        sound[] = {
            QPATHtoF(Music\Horror\kind.ogg), db+0, 1.0
        };
        titles[] = {
            1, "Kind"
        };
    };
};