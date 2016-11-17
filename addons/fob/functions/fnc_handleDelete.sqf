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

[FOB_POSITION,AV_FOB*-1] call EFUNC(approval,addValue);
unassignCurator GVAR(curator);
deleteMarker (GETVAR(GVAR(anchor),GVAR(marker),""));
deleteVehicle GVAR(anchor);

GVAR(respawnPos) call BIS_fnc_removeRespawnPosition;
