/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

CHECK_POSTINIT;

[
	{DOUBLES(PREFIX,main)},
	{
		GVAR(blacklist) pushBack [locationPosition EGVAR(main,baseLocation),EGVAR(main,baseRadius)]; // add main base to blacklist

		if (!isNil {HEADLESSCLIENT} && {!(CHECK_ADDON_1("acex_headless"))}) then { // let ace handle transfer if enabled
			(owner HEADLESSCLIENT) publicVariableClient QFUNC(handlePatrol);
			(owner HEADLESSCLIENT) publicVariableClient QGVAR(groups);
			(owner HEADLESSCLIENT) publicVariableClient QGVAR(blacklist);
			[{
				[FUNC(handlePatrol), 90, []] remoteExecCall [QUOTE(CBA_fnc_addPerFrameHandler), owner HEADLESSCLIENT, false];
			}, [], 60] call CBA_fnc_waitAndExecute;
		} else {
			[{
				[FUNC(handlePatrol), 90, []] call CBA_fnc_addPerFrameHandler;
			}, [], 60] call CBA_fnc_waitAndExecute;
		};
	}
] call CBA_fnc_waitUntilAndExecute;

ADDON = true;
