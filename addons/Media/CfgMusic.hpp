class CfgMusic
{
    tracks[] = {};
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
};
class CfgMusicClasses
{
    class Tears_of_the_sun {
        displayname = "Tears of the Sun";
    };
    
    class Horror {
        displayname = "Horror";
    };
    
    class Misc {
        displayname = "Sonstiges";
    };
    
    class Contact {
        displayname = "Contact";
    };
};

class CfgMusic {
    tracks[]={};
    #include "Music\Horror\CfgMusic_Horror.hpp"
    #include "Music\Tears_of_the_Sun\CfgMusic_TotS.hpp"
    #include "Music\Misc\CfgMusic_Misc.hpp"
    #include "Music\Contact\CfgMusic_Contact.hpp"
};