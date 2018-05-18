/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

CHECK_POSTINIT;

call FUNC(init);

PVEH_CREATE addPublicVariableEventHandler {[_this select 1] call FUNC(handleCreate)};
PVEH_DELETE addPublicVariableEventHandler {[_this select 1] call FUNC(handleDelete)};

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

	GVAR(pbanchors) set [_index, objNull];
};

[
	{DOUBLES(PREFIX,main)},
	{
		_data = QUOTE(ADDON) call EFUNC(main,loadDataAddon);
		[_data] call FUNC(handleLoadData);

		[[],{
			if (hasInterface) then {
				call FUNC(handleClient);
			};
 		}] remoteExecCall [QUOTE(BIS_fnc_call),0,true];
	}
] call CBA_fnc_waitUntilAndExecute;

ADDON = true;
