/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

if !(CHECK_INIT) exitWith {};

if (GVAR(enable) isEqualTo 0) exitWith {
	INFO("Addon is disabled.");
};

unassignCurator GVAR(curator);

PVEH_DEPLOY addPublicVariableEventHandler {[_this select 1] call FUNC(setup)};
PVEH_REQUEST addPublicVariableEventHandler {(_this select 1) call FUNC(handleRequest)};
PVEH_REASSIGN addPublicVariableEventHandler {(_this select 1) assignCurator GVAR(curator)};
PVEH_DELETE addPublicVariableEventHandler {
	[getPosASL GVAR(anchor),AV_FOB*-1] call EFUNC(approval,addValue);
	unassignCurator GVAR(curator);
	deleteVehicle GVAR(anchor);

	GVAR(respawnPos) call BIS_fnc_removeRespawnPosition;

	{
		deleteLocation GVAR(location);
	} remoteExecCall [QUOTE(BIS_fnc_call), 0, false];
};

addMissionEventHandler ["HandleDisconnect",{
	if ((_this select 2) isEqualTo GVAR(UID)) then {unassignCurator GVAR(curator)};
	false
}];

PVEH_DEPLOYPB addPublicVariableEventHandler {[_this select 1, ""] call FUNC(setupPB)};
PVEH_DELETEPB addPublicVariableEventHandler {
	private _anchor = objNull;
	private _index = 0;
	{
		if(!(isNull _x) && (position _x) distance2D (position (_this select 1)) <= 10) then {
			_anchor = _x;
			_index = _forEachIndex;
		};
	} forEach GVAR(pbanchors);

	deleteMarker (GETVAR(_anchor,GVAR(pbmarker),""));

	[getPosASL _anchor,AV_PB*-1] call EFUNC(approval,addValue);
	deleteVehicle _anchor;

	GVAR(pbanchors) set [_index, objNull];
};

[{
	if (DOUBLES(PREFIX,main)) exitWith {
		[_this select 1] call CBA_fnc_removePerFrameHandler;

		_data = QUOTE(ADDON) call EFUNC(main,loadDataAddon);
		if !(_data isEqualTo []) then {
			[_data select 0] call FUNC(setup);
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
				_x params ["_isMan", "_type", "_pos", "_dir", "_vectorUp", ["_waypoints", []], ["_weapons", []], ["_magazines", []], ["_items", []], ["_backpacks", []]];
				if(_isMan) then {
					_side = switch(getNumber (configFile >> "CfgVehicles" >> _type >> "side")) do {
						case 0: {east};
						case 1: {west};
						case 2: {resistance};
						case 3: {civilian};
						default {sideUnknown};
					};
					_man = (createGroup _side) createUnit [_type, [0,0,0], [], 0, "NONE"];
					_man setDir _dir;
					_man setPosASL _pos;
					if(count _waypoints > 1) then {
						{
							_x params ["_index", "_pos", "_name", "_behaviour", "_combatMode", "_formation", "_speed", "_type"];
							_waypoint = (group _man) addWaypoint [_pos, 0, _index, _name];
							_waypoint setWaypointBehaviour _behaviour;
							_waypoint setWaypointCombatMode _combatMode;
							_waypoint setWaypointFormation _formation;
							_waypoint setWaypointSpeed _speed;
							_waypoint setWaypointType _type;
						} forEach _waypoints;
					};
				} else {
					_veh = _type createVehicle [0,0,0];
					_veh setDir _dir;
					_veh setPosASL _pos;
					_veh setVectorUp _vectorUp;

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
				false
			} count (_data select 4);
		};
		{_x addCuratorEditableObjects [allMissionObjects "all", true]} forEach allCurators;

		{
			[QUOTE(ADDON),"Forward Operating Base","",QUOTE(true),QUOTE(call FUNC(getChildren))] call EFUNC(main,setAction);

			player addEventHandler ["Respawn",{
				if ((getPlayerUID (_this select 0)) isEqualTo GVAR(UID)) then {
					[
						{
							missionNamespace setVariable [PVEH_REASSIGN,player];
							publicVariableServer PVEH_REASSIGN;
						},
						[],
						5
					] call CBA_fnc_waitAndExecute;
				};
			}];
		} remoteExecCall [QUOTE(BIS_fnc_call),0,true];

		if (EGVAR(main,baseSafezone)) then {
			[{
				private _radius = (([GVAR(anchor)] call EFUNC(approval,getValue)) * 25 min 750) max 2500;
				diag_log _radius;
				{
					if (side _x isEqualTo GVAR(enemySide) && {!isPlayer _x}) then {
						deleteVehicle (vehicle _x);
						deleteVehicle _x;
					};
				} forEach (locationPosition GVAR(location) nearEntities [["Man","LandVehicle","Ship","Air"], _radius]);
			}, 60, []] call CBA_fnc_addPerFrameHandler;
		};
	};
}, 0, []] call CBA_fnc_addPerFrameHandler;

ADDON = true;