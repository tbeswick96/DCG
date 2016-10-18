/*
Author:
Nicholas Clark (SENSEI)

Description:
uncaches unit

Arguments:
0: unit to be uncached <OBJECT>

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

params ["_unit"];

if (!isPlayer _unit && {_unit getVariable [UNIT_CACHED,false]}) then {
	_unit setVariable [UNIT_CACHED,false];
	_unit enableSimulationGlobal true;
	_unit hideObjectGlobal false;
	_unit enableAI "ALL";
	if (isNull objectParent _unit) then {
		detach _unit;
		_pos = getPosATL _unit;
		_x = random [(_pos select 0) - 5, _pos select 0, (_pos select 0) + 5];
		_y = random [(_pos select 1) - 5, _pos select 1, (_pos select 1) + 5];
		_unit setPosATL [_x, _y, 0];
	};
	LOG_3("Uncaching %1 (%2) at %3.",_unit,typeof _unit,getPos _unit);
};