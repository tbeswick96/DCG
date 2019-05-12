/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

POSTINIT;

// headless client exit 
if (!isServer) exitWith {};

["CBA_settingsInitialized", {
    if (!EGVAR(main,enable) || {!GVAR(enable)}) exitWith {LOG(MSG_EXIT)};

    [QGVAR(enableGroup), {[_this] call FUNC(enable)}] call CBA_fnc_addEventHandler;
    [QGVAR(disableGroup), {[_this] call FUNC(disable)}] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
