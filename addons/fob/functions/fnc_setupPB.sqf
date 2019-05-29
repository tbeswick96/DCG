/*
Author:
Tim Beswick & Nicholas Clark (SENSEI)

Description:
setup pb on server

Arguments:
0: unit or position <OBJECT,ARRAY>
1: name <STRING>

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

if !(isServer) exitWith {};

params [["_center",objNull,[objNull,[]]],["_name","",[""]]];

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

private _index = 0;
{
	if (isNull _x) exitWith {
		_index = _forEachIndex;
	};
} forEach GVAR(pbAnchors);

private _anchor = "Land_PenBlack_F" createVehicle [0,0,0];
GVAR(pbAnchors) set [_index, _anchor];
_anchor setPos _pos;
publicVariable QGVAR(pbAnchors);
_anchor allowDamage false;
_anchor enableSimulation false;
if (_name == "") then {
	_name = ((GVAR(pbnames) splitString ",") select _index);
};
SETPVAR(_anchor,GVAR(pbname),_name);

_marker = createMarker [_name, _pos];
_marker setMarkerShape "ICON";
_marker setMarkerType "hd_dot";
_marker setMarkerColor "colorBLUFOR";
_marker setMarkerText _name;
SETPVAR(_anchor,GVAR(pbmarker),_marker);

if !(isNull _unit) then {
	[getPosASL _anchor,AP_PB] call EFUNC(approval,addValue);
};

if (_index == 0) then {
	[{
		params ["_anchor"];
		!((getPos _anchor) isEqualTo [0,0,0])
	}, {
		params ["_anchor", "_name"];
		GVAR(pbRespawnPos) = [missionNamespace, getPos _anchor, _name] call BIS_fnc_addRespawnPosition;
	}, [_anchor, _name]] call CBA_fnc_waitUntilAndExecute;
};
