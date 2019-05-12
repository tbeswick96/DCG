/*
Author:
Nicholas Clark (SENSEI)

Description:
create FOB on server

Arguments:
0: unit or position <OBJECT,ARRAY>

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
private _name = GVAR(name);
private _marker = createMarker [_name, _pos];
_marker setMarkerShape "ICON";
_marker setMarkerType "hd_dot";
_marker setMarkerColor "colorBLUFOR";
_marker setMarkerText _name;
GVAR(marker) = _name;

// make sure setup occurs at correct position
[
    {!(FOB_POSITION isEqualTo [0,0,0])},
    {
        GVAR(respawnPos) = [missionNamespace,FOB_POSITION,GVAR(name)] call BIS_fnc_addRespawnPosition;
        [FOB_POSITION,AP_FOB] call EFUNC(approval,addValue);
    },
    []
] call CBA_fnc_waitUntilAndExecute;
