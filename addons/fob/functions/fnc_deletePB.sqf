/*
Author:
Tim Beswick

Description:
delete PB

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

[] spawn {
	closeDialog 0;
	_ret = [
		parseText (format ["<t align='center'>%1</t>","Are you sure you want to dismantle PB?"]),
		TITLE,
		"Yes",
		"No"
	] call bis_fnc_GUImessage;

	if (_ret) then {
		GVAR(UID) = "";

		missionNamespace setVariable [PVEH_DELETEPB,player];
		publicVariableServer PVEH_DELETEPB;

		["PB dismantled",true] call EFUNC(main,displayText);
	};
};