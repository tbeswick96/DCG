/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

if !(CHECK_INIT) exitWith {};

if (GVAR(enable) isEqualTo 0) exitWith {
	INFO("Addon is disabled.");
};

QUOTE(DOUBLES(ADDON,getLocations)) addPublicVariableEventHandler {
	_requestor = _this select 1;
	if (CHECK_ADDON_2(occupy)) then {
		(owner _requestor) publicVariableClient QEGVAR(occupy,occupiedLocations);
	};
};

[
	{DOUBLES(PREFIX,main)},
	{
		[QUOTE(ADDON),"Transport",{},QUOTE(call FUNC(canCallTransport)),{call FUNC(getChildren)}] remoteExecCall [QEFUNC(main,setAction), 0, true];
	}
] call CBA_fnc_waitUntilAndExecute;

ADDON = true;
