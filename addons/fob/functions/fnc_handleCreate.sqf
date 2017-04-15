/*
Author:
Nicholas Clark (SENSEI)

Description:
create FOB on server

Arguments:
0: unit to assign to curator or position <OBJECT,ARRAY>

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

params [
	["_center",objNull,[objNull,[]]]
];

private _unit = objNull;
private _pos = [];
private _type = "";

call {
	if (_center isEqualType objNull) exitWith {
		_unit = _center;
		_pos = _center modelToWorld [0,3,0];
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
GVAR(anchor) enableSimulation false;
_name = GVAR(name);
_marker = createMarker [_name, _pos];
_marker setMarkerShape "ICON";
_marker setMarkerType "hd_dot";
_marker setMarkerColor "colorBLUFOR";
_marker setMarkerText _name;
SETPVAR(_anchor,GVAR(marker),_marker);

GVAR(curator) addCuratorAddons activatedAddons;

// make sure setup occurs at correct position
[
    {!(FOB_POSITION isEqualTo [0,0,0])},
    {
        params ["_unit"];

        GVAR(respawnPos) = [missionNamespace,FOB_POSITION,GVAR(name)] call BIS_fnc_addRespawnPosition;

        if !(isNull _unit) then {
            // if unit is already assigned to a curator, save previous curator for later
            _previousCurator = getAssignedCuratorLogic _unit;

            if !(isNull _previousCurator) then {
                if !(_previousCurator isEqualTo GVAR(curator)) then {
                    GVAR(curatorExternal) = _previousCurator;
                };
            };

            [GVAR(curator),_unit] call FUNC(handleAssign);

        	// unit does not immediately become owner of curator
        	[
        		{getAssignedCuratorUnit GVAR(curator) isEqualTo (_this select 0)},
        		{
        			[] remoteExecCall [QFUNC(curatorEH), owner (getAssignedCuratorUnit GVAR(curator)), false];
        		},
        		[_unit]
        	] call CBA_fnc_waitUntilAndExecute;

            [FOB_POSITION,AV_FOB] call EFUNC(approval,addValue);
        };
    },
    [_unit]
] call CBA_fnc_waitUntilAndExecute;
