/*
Author:
Nicholas Clark (SENSEI)

Description:
delete FOB on server

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

private _unit = getAssignedCuratorUnit GVAR(curator);

[FOB_POSITION,AV_FOB*-1] call EFUNC(approval,addValue);
deleteMarker (GETVAR(GVAR(anchor),GVAR(marker),""));
GVAR(respawnPos) call BIS_fnc_removeRespawnPosition;
deleteVehicle GVAR(anchor);
unassignCurator GVAR(curator);

// reassign previous curator
if !(isNull GVAR(curatorExternal)) then {
    [GVAR(curatorExternal),_unit] call FUNC(handleAssign);

    // reset external curator var after reassign
    [
        {getAssignedCuratorUnit GVAR(curatorExternal) isEqualTo (_this select 0)},
        {
            GVAR(curatorExternal) = objNull;
        },
        [_unit]
    ] call CBA_fnc_waitUntilAndExecute;
} else {
    [objNull,_unit] call FUNC(handleAssign);
}
