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
    LOG_2("Saving %1: %2.",QGVARMAIN(ADDONTOSAVE),DATATOSAVE); \
    GVAR(saveDataScenario) pushBack [QGVARMAIN(ADDONTOSAVE),DATATOSAVE]

if (!isServer || {CBA_missionTime < 60}) exitWith {};

// overwrite current data
GVAR(saveDataScenario) = [SAVE_SCENARIO_ID];

// MAIN ADDON
if (CHECK_ADDON_2(main)) then {
    private _data = [];

    private ["_entity","_vars"];

    {
        // @todo add support for saving units
        if (_x getVariable [QGVAR(saveEntity),false] && {!(_x isKindOf "MAN") && {!(_x isKindOf "Logic")}}) then {
            _entity = _x;

            // save entity variables if "dcg" found in variable name
            _vars = (allVariables _entity) select {(_x find QUOTE(PREFIX)) >= 0};

            // set as [variable name, variable value]
            {_vars set [_forEachIndex,[_x,_entity getVariable _x]]} forEach _vars;

            _data pushBack [false,typeOf _x,getPosASL _x,getDir _x,vectorUp _x,_vars];
        };
    } foreach (allMissionObjects "All");

    PUSHBACK_DATA(main,_data);
};

// OCCUPY ADDON
if (CHECK_ADDON_2(occupy)) then {
    private _data = [];

    EGVAR(occupy,location) params ["_name","_position","_size","_type"];

	if (!isNil "_name") then {
		private _infCount = 0;
		private _vehCount = 0;
		private _airCount = 0;

    { 
        if ((driver _x) getVariable [QEGVAR(occupy,saveEntity),false]) then { 
            if (_x isKindOf "CAManBase") exitWith {
                _infCount = _infCount + 1;
            };
            if (_x isKindOf "LandVehicle") exitWith {
                _vehCount = _vehCount + 1;
            };
            if (_x isKindOf "Air") exitWith {
                _airCount = _airCount + 1;
            };
        };
    } forEach (_position nearEntities [["CAManBase","LandVehicle","Air"],_size*1.5]);

		_data append [_name,_position,_size,_type,[_infCount,_vehCount,_airCount]];
	};

    PUSHBACK_DATA(occupy,_data);
};

// FOB ADDON
if (CHECK_ADDON_2(fob)) then {
    private _data = [];

	_data pushBack GVAR(markers);

	if (EGVAR(fob,anchor) != objNull) then {
		{_x addCuratorEditableObjects [allMissionObjects "all", true]; false} count allCurators;

		private _anchors = [];
		_anchors pushBack (position EGVAR(fob,anchor));
		{
			if (!(_x isEqualTo objNull)) then {
				_anchors pushBack [(position _x), _x getVariable [QEGVAR(fob,pbname), ""]];
			} else {
				_anchors pushBack [[], ""];
			};
		} forEach (EGVAR(fob,pbAnchors));
		_data pushBack _anchors;

		_dataObj = [];
		{
			if (!(_x isKindOf "Land_PenBlack_F") && !(_x isKindOf "Logic")) then {
				private _inRange = (_x distance2D EGVAR(fob,anchor)) <= EGVAR(fob,range);
				if (!_inRange) then {
					private _obj = _x;
					{
						if (!(isNull _x)) then {
							if ((_x distance2D _obj) <= EGVAR(fob,pbrange)) then {
								_inRange = true;
							};
						};
					} forEach (EGVAR(fob,pbAnchors));
				};

				if (_inRange) then {
					if (_x isKindOf "Man") then {
						if (!(isPlayer _x) && alive _x) then {
							private _waypoints = [];
							{
								if (_forEachIndex > 0) then {
									_waypoints pushBack [_x select 1, waypointPosition _x, waypointName _x, waypointBehaviour _x, waypointCombatMode _x, waypointFormation _x, waypointSpeed _x, waypointType _x];
								};
							} forEach (waypoints (group _x));
							_dataObj pushBack [true,typeOf _x,getPosASL _x,getDir _x,vectorUp _x,_waypoints,[],[],[],[]];
						};
					} else {
						_dataObj pushBack [false,typeOf _x,getPosASL _x,getDir _x,vectorUp _x,[],getWeaponCargo _x,getMagazineCargo _x,getItemCargo _x,getBackpackCargo _x];
					};
				};
			};
			false
		} count (allMissionObjects "All");
		_data pushBack _dataObj;
	};

    PUSHBACK_DATA(fob,_data);
};

// WEATHER ADDON
if (CHECK_ADDON_2(weather)) then {
    private _data = [EGVAR(weather,overcastForecast),EGVAR(weather,rainForecast),EGVAR(weather,fogForecast),date];

    PUSHBACK_DATA(weather,_data);
};

// TASK ADDON
if (CHECK_ADDON_2(task)) then {
    private _data = [EGVAR(task,primary),EGVAR(task,secondary)];

    PUSHBACK_DATA(task,_data);
};

// APPROVAL ADDON
if (CHECK_ADDON_2(approval)) then {
    private _data = [];

    [EGVAR(approval,regions),{
        _data pushBack [_key,_value#1];
    }] call CBA_fnc_hashEachPair;

    PUSHBACK_DATA(approval,_data);
};

// following code must run last
private _dataProfile = SAVE_GETVAR;

if !(_dataProfile isEqualTo []) then {
    // only replace data for current scenario
    {
        if ((_x select 0) == SAVE_SCENARIO_ID) exitWith {
            _dataProfile set [_forEachIndex,GVAR(saveDataScenario)];
        };
        _dataProfile pushBack GVAR(saveDataScenario);
    } forEach _dataProfile;
} else {
    _dataProfile pushBack GVAR(saveDataScenario);
};

SAVE_SETVAR(_dataProfile);
saveProfileNamespace;
