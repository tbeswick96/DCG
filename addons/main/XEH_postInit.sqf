#include "script_component.hpp"
/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
POSTINIT;

// eventhandlers
["CBA_settingsInitialized", {
    if !(GVAR(enable)) exitWith {LOG(MSG_EXIT)};

    // headless client exit 
    if (!isServer) exitWith {};

    // if marker exist, create base object on marker position
    if (CHECK_MARKER(QUOTE(BASE))) then {
        BASE = "Land_HelipadEmpty_F" createVehicle [0,0,0];
        BASE setPos (getMarkerPos QUOTE(BASE));
        publicVariable QUOTE(BASE);
    };
    [{
        // if base object created from marker or created in editor, create base location
        if !(isNil QUOTE(BASE)) then {
            CREATE_BASE;
            {
                CREATE_BASE;
            } remoteExecCall [QUOTE(BIS_fnc_call),-2,true];
            private _marker = createMarker [GVAR(baseName), position GVAR(baseLocation)];
            _marker setMarkerShape "ICON";
            _marker setMarkerType "hd_dot";
            _marker setMarkerColor "colorBLUFOR";
            _marker setMarkerText GVAR(baseName);
        };

        if (isNull GVAR(baseLocation)) then {
            CREATE_DEFAULTBASE;
            {
                CREATE_DEFAULTBASE;
            } remoteExecCall [QUOTE(BIS_fnc_call),-2,true];

            WARNING_2("Base object '%1' does not exist. Base location created at %2",BASE,DEFAULTPOS);
        };
    }, [], 1] call CBA_fnc_waitAndExecute;

    // eventhandlers
    [QGVAR(saveData), FUNC(saveData)] call CBA_fnc_addEventHandler;

    [QGVAR(deleteData), {
        profileNamespace setVariable [QGVAR(saveData),nil];
        saveProfileNamespace;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(cleanup), {_this call FUNC(cleanup)}] call CBA_fnc_addEventHandler;

    [QGVAR(debugMarkers), {
        if (GVAR(debug)) then {[1] call FUNC(debug)};
    }] call CBA_fnc_addEventHandler;

    // per frame handlers
    [
        {if (GVAR(autoSave)) then {call FUNC(saveData)}}, 
        1800
    ] call CBA_fnc_addPerFrameHandler;
        
    [FUNC(handleCleanup), 120] call CBA_fnc_addPerFrameHandler;

    // call debug if macro enabled
    [DEBUG_ADDON] call FUNC(debug);

    // load main addon data 
    call FUNC(handleLoadData);

    // setup clients
    remoteExecCall [QFUNC(initClient),0,true];

    MAIN_ADDON = true;
    publicVariable QUOTE(MAIN_ADDON);

    TRACE_1("",MAIN_ADDON);
}] call CBA_fnc_addEventHandler;
