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

[FOB_POSITION,AP_FOB*-1] call EFUNC(approval,addValue);
deleteMarker GVAR(marker);
GVAR(respawnPos) call BIS_fnc_removeRespawnPosition;
deleteVehicle GVAR(anchor);
