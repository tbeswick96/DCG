class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_DisplayLoad_EventHandlers {
    class Display3DEN {
        ADDON = QUOTE(call COMPILE_FILE(init3DEN));
    };
};