/*
Author:
Nicholas Clark (SENSEI)

Description:
handle loading data

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

params ["_data"];

if !(_data isEqualTo []) then {
	[_data select 0] call FUNC(handleCreate);
	(_data select 1) params ["_pos", "_name"];
	if(count _pos > 0) then {
		[_pos, _name] call FUNC(setupPB);
	};
	(_data select 2) params ["_pos", "_name"];
	if(count _pos > 0) then {
		[_pos, _name] call FUNC(setupPB);
	};
	(_data select 3) params ["_pos", "_name"];
	if(count _pos > 0) then {
		[_pos, _name] call FUNC(setupPB);
	};

	{
		_x params ["_isMan", "_type", "_pos", "_dir", "_vectorUp", ["_waypoints", []], ["_weapons", []], ["_magazines", []], ["_items", []], ["_backpacks", []], ["_vars", []], ["_varValues", []]];
		if(_isMan) then {
			_side = switch(getNumber (configFile >> "CfgVehicles" >> _type >> "side")) do {
				case 0: {east};
				case 1: {west};
				case 2: {resistance};
				case 3: {civilian};
				default {sideUnknown};
			};
			_veh = (createGroup _side) createUnit [_type, [0,0,0], [], 0, "NONE"];
			_veh setDir _dir;
			_veh setPosASL _pos;
			if(count _waypoints > 1) then {
				{
					_x params ["_index", "_pos", "_name", "_behaviour", "_combatMode", "_formation", "_speed", "_type"];
					_waypoint = (group _veh) addWaypoint [_pos, 0, _index, _name];
					_waypoint setWaypointBehaviour _behaviour;
					_waypoint setWaypointCombatMode _combatMode;
					_waypoint setWaypointFormation _formation;
					_waypoint setWaypointSpeed _speed;
					_waypoint setWaypointType _type;
				} forEach _waypoints;
			} else {
				_veh disableAI "MOVE";
			};
			_veh allowDamage false;
			_veh addEventHandler ["Fired", {(_this select 0) setVehicleAmmo 1}];
		} else {
			_veh = _type createVehicle [0,0,0];
			_veh setDir _dir;
			_veh setPosASL _pos;
			_veh setVectorUp _vectorUp;

			[_veh, _weapons, _magazines, _items, _backpacks] spawn {
				params ["_veh", "_weapons", "_magazines", "_items", "_backpacks"];
				if(count (_weapons select 0) > 0) then {
					clearWeaponCargoGlobal _veh;
					{
						_count = (_weapons select 1) select _forEachIndex;
						_veh addWeaponCargoGlobal [_x, _count];
					} forEach (_weapons select 0);
				};
				if(count (_magazines select 0) > 0) then {
					clearMagazineCargoGlobal _veh;
					{
						_count = (_magazines select 1) select _forEachIndex;
						_veh addMagazineCargoGlobal [_x, _count];
					} forEach (_magazines select 0);
				};
				if(count (_items select 0) > 0) then {
					clearItemCargoGlobal _veh;
					{
						_count = (_items select 1) select _forEachIndex;
						_veh addItemCargoGlobal [_x, _count];
					} forEach (_items select 0);
				};
				if(count (_backpacks select 0) > 0) then {
					clearBackpackCargoGlobal _veh;
					{
						_count = (_backpacks select 1) select _forEachIndex;
						_veh addBackpackCargoGlobal [_x, _count];
					} forEach (_backpacks select 0);
				};
			};
		};
		
		{
			_veh setVariable [_x, _varValues select _forEachIndex, true];
		} forEach _vars;
		false
	} count (_data select 4);
};
