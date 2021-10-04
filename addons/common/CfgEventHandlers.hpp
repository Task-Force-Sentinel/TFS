XEH_PRESTART;
XEH_PREINIT;
XEH_POSTINIT;

class Extended_init_EventHandlers {
    class GVAR(hideMapObjects) {
        class ADdoN {
            init = QUOTE(_this call FUNC(hideMapObjectsinit));
        };
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADdoN {
            respawn = QUOTE((_this select 0) setVariable [ARR_3(QQGVARMAin(lastrespawn), time, true)]);
        };
    };
};

class Extended_Displayload_EventHandlers {
    class RscDisplayMultiplayersetup {
        tfs_slotting = QUOTE(_this call (uiNamespace getVariable 'FUNC(initDisplayMultiplayersetup)'));
    };
    class RscDisplayDebriefing {
        tfs_override_end_text = QUOTE(_this call (uiNamespace getVariable 'FUNC(initDisplayDebriefing)'));
    };
    class RscDiary {
        ADdoN = QUOTE(_this call (uiNamespace getVariable 'FUNC(initDisplayMission)'));
    };
};

class Extended_Preinit_EventHandlers {
    class tfs_Common_EH_initsettings {
        init = QUOTE(_this call FUNC(initsettings));
    };
};

class Extended_Postinit_EventHandlers {
    class tfs_Common_EH_initialize {
        init = init = QUOTE(_this call FUNC(initialize));
    };
};