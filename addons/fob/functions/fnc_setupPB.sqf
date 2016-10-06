/*
Author:
Tim Beswick & Nicholas Clark (SENSEI)

Description:
setup pb on server

Arguments:
0: unit to assign to curator or position <OBJECT,ARRAY>
1: name <STRING>

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

if !(isServer) exitWith {};

params [["_center",objNull,[objNull,[]]],["_name",""]];

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
	if(isNull _x) exitWith {
		_index = _forEachIndex;
	};
} forEach GVAR(pbanchors);

_anchor = "Land_PenBlack_F" createVehicle [0,0,0];
GVAR(pbanchors) set [_index, _anchor];
_anchor setPos _pos;
publicVariable QGVAR(pbanchors);
_anchor allowDamage false;
_anchor enableSimulation false;
_name = if(_name == "") then {
	(GVAR(pbnames) select _index)
} else {
	_name
};
SETPVAR(_anchor,GVAR(pbname),_name);

_marker = createMarker [_name, _pos];
_marker setMarkerShape "ICON";
_marker setMarkerType "hd_dot";
_marker setMarkerColor "colorBLUFOR";
_marker setMarkerText _name;
SETPVAR(_anchor,GVAR(pbmarker),_marker);

if !(isNull _unit) then {
	[getPosASL _anchor,AV_PB] call EFUNC(approval,addValue);
};