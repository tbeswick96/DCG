#include "script_component.hpp"
/*
Author:
Nicholas Clark (SENSEI)

Description:
check if position or entity is in any safezone area

Arguments:
0: entity to check <ARRAY, OBJECT, GROUP, LOCATION, MARKER>

Return:
boolean
__________________________________________________________________*/

params [
    ["_entity", objNull, [objNull, grpNull, locationNull, "", []]]
];

// @todo optimize array case 
switch (typeName _entity) do {
    case "ARRAY" : {
        if ((_entity select 0) isEqualType 0) then {
            _entity = [_entity];
        };

        {
            private ["_ret"];
            private _entity = _x;
            
            if !(_entity isEqualType []) then {
                _ret = [_entity] call FUNC(inSafezones);
            } else {
                _ret = _entity inArea GVAR(baseLocation)
            };

            [false,true] select _ret;
        } forEach _entity;
    };
    case "OBJECT" : {
        _entity inArea GVAR(baseLocation)
    };
    case "GROUP" : {
        (getPos leader _entity) inArea GVAR(baseLocation)
    };
    case "LOCATION" : {
        (locationPosition _entity) inArea GVAR(baseLocation)
    };
    case "STRING" : {
        (getMarkerPos _entity) inArea GVAR(baseLocation)
    };
    default {};
};
