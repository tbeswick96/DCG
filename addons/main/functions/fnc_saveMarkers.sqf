/*
Author:
Tim Beswick

Description:
Save markers from client to server

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

GVAR(markers) = [];
{
	private _marker = _x;
	if ((_marker find "respawn") isEqualTo -1) then {
        private _split = _marker splitString "/";
        if (count _split > 1 && {_split#2 isEqualTo "1"}) then {
            private _pos = markerPos _marker;
            private _shape = markerShape _marker;
            if (_shape != "POLYLINE") then {
                private _type = markerType _marker;
                private _brush = markerBrush _marker;
                private _size = markerSize _marker;
                private _colour = markerColor _marker;
                private _alpha = markerAlpha _marker;
                private _dir = markerDir _marker;
                private _text = markerText _marker;
                GVAR(markers) pushBack [_pos, _shape, _type, _brush, _size, _colour, _alpha, _dir, _text];
            };
        };
	};		
	true
} count allMapMarkers;

publicVariableServer QGVAR(markers);
