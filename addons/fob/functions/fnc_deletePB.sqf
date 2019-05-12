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

private _anchor = objNull;
private _index = 0;
{
	if (!(isNull _x) && (position _x) distance2D (position (_this select 1)) <= 10) then {
		_anchor = _x;
		_index = _forEachIndex;
	};
} forEach GVAR(pbAnchors);

deleteMarker (GETVAR(_anchor,GVAR(pbmarker),""));

[getPosASL _anchor,AP_PB*-1] call EFUNC(approval,addValue);
deleteVehicle _anchor;
if (_index == 0) then {
	GVAR(pbRespawnPos) call BIS_fnc_removeRespawnPosition;
};

GVAR(pbAnchors) set [_index, objNull];
publicVariable QGVAR(pbAnchors);
