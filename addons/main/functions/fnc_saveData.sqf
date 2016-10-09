/*
Author:
Nicholas Clark (SENSEI)

Description:
save data to server profile

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"
#define PUSHBACK_DATA(ADDONTOSAVE,DATATOSAVE) \
	INFO_2("Saving %1: %2.",QUOTE(DOUBLES(PREFIX,ADDONTOSAVE)),DATATOSAVE); \
	GVAR(saveDataCurrent) pushBack [QUOTE(DOUBLES(PREFIX,ADDONTOSAVE)),DATATOSAVE]

if (!isServer) exitWith {};

GVAR(saveDataCurrent) = [DATA_MISSION_ID]; // overwrite current data

// don't need to check for main addon, it's always enabled
private _data = [];

{
	if (!(_x isKindOf "Man") && {!(_x isKindOf "Logic")}) then {
		if (_x getVariable [DATA_OBJVAR,false]) then {
			_data pushBack [false,typeOf _x,getPosASL _x,getDir _x,vectorUp _x];
		};
	};
} foreach (allMissionObjects "All");

PUSHBACK_DATA(main,_data);

if (CHECK_ADDON_2(occupy)) then {
	private ["_data","_locations","_infCount","_vehCount","_airCount","_players"];
	_locations = []; // active locations

	for "_i" from 0 to count EGVAR(occupy,locations) - 1 do {
		(EGVAR(occupy,locations) select _i) params ["_name","_position","_size","_type"];
		_infCount = 0;
		_vehCount = 0;
		_airCount = 0;
		{
			if ((driver _x) getVariable [QUOTE(TRIPLES(PREFIX,occupy,unit)),false]) then {
				if (_x isKindOf "Man") exitWith {
					_infCount = _infCount + 1;
				};
				if (_x isKindOf "LandVehicle") exitWith {
					_vehCount = _vehCount + 1;
				};
				if (_x isKindOf "Air") exitWith {
					_airCount = _airCount + 1;
				};
			};
			false
		} count (_position nearEntities [["Man","LandVehicle","Air","Ship"],_size*2]);

		_locations pushBack [_name,_position,_size,_type,[_infCount,_vehCount,_airCount]];
	};

	_data = [_locations];

	PUSHBACK_DATA(occupy,_data);
};

if (CHECK_ADDON_2(fob)) then {
	private ["_data","_dataObj"];
	_data = [];

	if !(EGVAR(fob,location) isEqualTo locationNull) then {
		{_x addCuratorEditableObjects [allMissionObjects "all", true]} forEach allCurators;
		_data pushBack (locationPosition EGVAR(fob,location));
		{
			if(!(_x isEqualTo objNull)) then {
				_data pushBack [(position _x), GETVAR(_x,EGVAR(fob,pbname),"")];
			} else {
				_data pushBack [[], ""];
			};
		} forEach (EGVAR(fob,pbanchors));
		_dataObj = [];
		{
			if (!(_x isKindOf "Land_PenBlack_F") && !(_x isKindOf "Logic")) then {
				private _inRange = (_x distance2D EGVAR(fob,anchor)) <= EGVAR(fob,range);
				if(!_inRange) then {
					private _obj = _x;
					{
						if(!(isNull _x)) then {
							if((_x distance2D _obj) <= EGVAR(fob,pbrange)) then {
								_inRange = true;
							};
						};
					} forEach (EGVAR(fob,pbanchors));
				};

				if(_inRange) then {
					if(_x isKindOf "Man") then {
						if(!(isPlayer _x) && alive _x) then {
							private _waypoints = [];
							{
								if(_forEachIndex > 0) then {
									_waypoints pushBack [_x select 1, waypointPosition _x, waypointName _x, waypointBehaviour _x, waypointCombatMode _x, waypointFormation _x, waypointSpeed _x, waypointType _x];
								};
							} forEach (waypoints (group _x));
							_dataObj pushBack [true,typeOf _x,getPosASL _x,getDir _x,vectorUp _x,_waypoints];
						};
					} else {
						_dataObj pushBack [false,typeOf _x,getPosASL _x,getDir _x,vectorUp _x,[],getWeaponCargo _x,getMagazineCargo _x,getItemCargo _x,getBackpackCargo _x];
					};
				};
			};
			false
		} count (curatorEditableObjects EGVAR(fob,curator));

		_data pushBack _dataObj;
	};

	PUSHBACK_DATA(fob,_data);
};

if (CHECK_ADDON_2(weather)) then {
	private ["_data"];
	_data = [overcast,date];

	PUSHBACK_DATA(weather,_data);
};

if (CHECK_ADDON_2(ied)) then {
	private ["_data"];
	_data = [];
	{
		private "_pos";
		_pos = getPos _x;
		_pos deleteAt 2;
		_data pushBack _pos;
		false
	} count EGVAR(ied,list);

	PUSHBACK_DATA(ied,_data);
};

if (CHECK_ADDON_2(task)) then {
	private ["_data"];
	_data = [EGVAR(task,primary),EGVAR(task,secondary)];

	PUSHBACK_DATA(task,_data);
};

if (CHECK_ADDON_2(approval)) then {
	private ["_data"];
	_data = [];
	{
		_data pushBack [_x select 0,missionNamespace getVariable [AV_VAR(_x select 0),AV_MAX*0.1]];
		false
	} count GVAR(locations);

	PUSHBACK_DATA(approval,_data);
};

// following code must run last
private _dataProfile = DATA_GETVAR;

if !(_dataProfile isEqualTo []) then {
	{
		if (toUpper (_x select 0) isEqualTo DATA_MISSION_ID) exitWith {
			_dataProfile set [_forEachIndex,GVAR(saveDataCurrent)];
		};
		_dataProfile pushBack GVAR(saveDataCurrent);
	} forEach _dataProfile;
} else {
	_dataProfile pushBack GVAR(saveDataCurrent);
};

DATA_SETVAR(_dataProfile);
saveProfileNamespace;