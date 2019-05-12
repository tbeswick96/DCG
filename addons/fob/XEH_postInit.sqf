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
    [QGVAR(transfer), {_this call FUNC(handleTransfer)}] call CBA_fnc_addEventHandler;
    [QGVAR(assign), {_this call FUNC(handleAssign)}] call CBA_fnc_addEventHandler;
    // TODO: MOVE PB TO CBA EVENTS
    PVEH_DEPLOYPB addPublicVariableEventHandler {[_this select 1, ""] call FUNC(setupPB)};
PVEH_DELETEPB addPublicVariableEventHandler {
	private _anchor = objNull;
	private _index = 0;
	{
		if (!(isNull _x) && (position _x) distance2D (position (_this select 1)) <= 10) then {
			_anchor = _x;
			_index = _forEachIndex;
		};
	} forEach GVAR(pbanchors);

	deleteMarker (GETVAR(_anchor,GVAR(pbmarker),""));

	[getPosASL _anchor,AV_PB*-1] call EFUNC(approval,addValue);
	deleteVehicle _anchor;
	if (_index == 0) then {
		GVAR(pbRespawnPos) call BIS_fnc_removeRespawnPosition;
	};

	GVAR(pbanchors) set [_index, objNull];
};

    call FUNC(init);
    call FUNC(handleLoadData);
    remoteExecCall [QFUNC(initClient),0,true];
}] call CBA_fnc_addEventHandler;