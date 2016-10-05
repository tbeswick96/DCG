/*
Author:
Nicholas Clark (SENSEI)

Description:
setup fob on server

Arguments:
0: unit to assign to curator or position <OBJECT,ARRAY>

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

if !(isServer) exitWith {};

params [
	["_center",objNull,[objNull,[]]]
];

private _unit = objNull;
private _pos = [];

call {
	if (_center isEqualType objNull) exitWith {
		_unit = _center;
		_pos = _center modelToWorld [0,0,0];
	};

	if (_center isEqualType []) exitWith {
		_unit = objNull;
		_pos = _center;
	};
};

GVAR(anchor) = "Land_PenBlack_F" createVehicle [0,0,0];
GVAR(anchor) setPos _pos;
publicVariable QGVAR(anchor);
GVAR(anchor) allowDamage false;

{
 	[getPos GVAR(anchor),"NameCity",GVAR(range),GVAR(name),QGVAR(location)] call EFUNC(main,createLocation);
} remoteExecCall [QUOTE(BIS_fnc_call),0,GVAR(anchor)];

GVAR(respawnPos) = [missionNamespace,GVAR(anchor) modelToWorld [0,-4,0],GVAR(name)] call BIS_fnc_addRespawnPosition;

GVAR(curator) addCuratorAddons activatedAddons;

if !(isNull _unit) then {
	[getPosASL GVAR(anchor),AV_FOB] call EFUNC(approval,addValue);

	_unit assignCurator GVAR(curator);
	GVAR(UID) = getPlayerUID _unit;
	(owner _unit) publicVariableClient QGVAR(UID);

	// unit does not immediately become owner of curator, it takes a few seconds
	[
		{(getAssignedCuratorUnit GVAR(curator)) isEqualTo (_this select 0)},
		{
			[] remoteExecCall [QFUNC(curatorEH), owner (getAssignedCuratorUnit GVAR(curator)), false];
		},
		[_unit]
	] call CBA_fnc_waitUntilAndExecute;
};