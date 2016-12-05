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
deleteVehicle GVAR(anchor);

unassignCurator GVAR(curator);

// reassign previous curator
if !(isNull GVAR(curatorExternal)) then {
    [
        {
            (_this select 0) assignCurator GVAR(curatorExternal);
            GVAR(curatorExternal) = objNull;
        },
        [_unit],
        2
    ] call CBA_fnc_waitAndExecute;
};

GVAR(respawnPos) call BIS_fnc_removeRespawnPosition;
