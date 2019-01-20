/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

if !(isMultiplayer) exitWith {};

[
    {MAIN_ADDON && {CHECK_POSTBRIEFING}},
    {
        if (!(EGVAR(main,enable)) || {!(GVAR(enable))}) exitWith {
            LOG(MSG_EXIT);
        };
        
        QGVAR(questionPVEH) addPublicVariableEventHandler {(_this select 1) call FUNC(handleQuestion)};
        QGVAR(hintPVEH) addPublicVariableEventHandler {[_this select 1,0] call FUNC(handleHint)};
        QGVAR(stopPVEH) addPublicVariableEventHandler {(_this select 1) call FUNC(handleStop)};
        QGVAR(addPVEH) addPublicVariableEventHandler {
            (_this select 1) call FUNC(addValue);
            TRACE_1("Client add value",_this);
        };

        call FUNC(handleLoadData);

        [{
            [FUNC(handleHostile), GVAR(hostileCooldown), []] call CBA_fnc_addPerFrameHandler;
        }, [], GVAR(hostileCooldown)] call CBA_fnc_waitAndExecute;

        [[],{
            if (hasInterface) then {
                call FUNC(handleClient);
            };
         }] remoteExecCall [QUOTE(BIS_fnc_call),0,true];
    }
] call CBA_fnc_waitUntilAndExecute;