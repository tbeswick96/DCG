/*
Author:
Nicholas Clark (SENSEI)

Description:
find and occupy location

Arguments:
0: data loaded from server profile <ARRAY>

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

params [
	["_data",[],[[]]]
];

if !(_data isEqualTo []) exitWith {
	{
		if !((_x select 1) inArea EGVAR(main,baseLocation)) then {
			_x spawn FUNC(setOccupied);
		};
	} forEach _data;
};

private _locations = [];
private _fobCheck = true;
private _occupied = [];

if (EGVAR(fob,anchor) isEqualTo objNull) then {
	_fobCheck = false;
};
{
    private _distCheck = true;
	if (_fobCheck) then {
		_distCheck = (EGVAR(fob,anchor) distance2D (_x select 1) <= 6000);
	};
	if !((_x select 1) inArea EGVAR(main,baseLocation)) then {
		_locations pushBack _x;
	};
} forEach EGVAR(main,locations);

if (count _locations < GVAR(locationCount)) exitWith {
    WARNING_1("%1 exceeds terrain location count",QGVAR(locationCount));
};

[{
	params ["_args","_idPFH"];
	_args params ["_locations","_occupied"];

	if (count _occupied >= GVAR(locationCount)) exitWith {
		[_idPFH] call CBA_fnc_removePerFrameHandler;
	};

    _selected = selectRandom _locations;
    _name = _selected select 0;

    if !(_name in _occupied) then {
        _selected spawn FUNC(setOccupied);
        _occupied pushBack _name;
    };
}, 5, [_locations,_occupied]] call CBA_fnc_addPerFrameHandler;
