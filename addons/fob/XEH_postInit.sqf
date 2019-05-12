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

    [QGVAR(create), {_this call FUNC(handleCreate)}] call CBA_fnc_addEventHandler;
    [QGVAR(delete), {call FUNC(handleDelete)}] call CBA_fnc_addEventHandler;
    [QGVAR(setupPB), {_this call FUNC(setupPB)}] call CBA_fnc_addEventHandler;
    [QGVAR(deletePB), {_this call FUNC(deletePB)}] call CBA_fnc_addEventHandler;

    call FUNC(init);
    call FUNC(handleLoadData);
    remoteExecCall [QFUNC(initClient),0,true];
}] call CBA_fnc_addEventHandler;
