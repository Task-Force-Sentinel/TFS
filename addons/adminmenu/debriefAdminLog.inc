/*
    Author: Freddo

    Creates a debriefing section for admins containing all
    log messasges sent during the mission.
    Displayed in mission debriefing screen.

    Include this file in description.ext of your mission

    Example:
    class CfgDebriefingSections {
        #include "\z\tfs\addons\adminmenu\debriefAdminLog.inc"
    };
*/

class tfs_adminlog
{
    title = "TFS Log";
    variable = "TFS_adminmenu_debrief";
};
