/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

PREINIT;

PREP(initSettings);
PREP(initClient);
PREP(handleCreate);
PREP(handleDelete);
PREP(handleLoadData);
PREP(getChildren);
PREP(isAllowedOwner);
PREP(canDeployPB);
PREP(setupPB);
PREP(canDeletePB);
PREP(deletePB);

GVAR(respawnPos) = [];
GVAR(anchor) = objNull;
GVAR(marker) = "";
GVAR(pbAnchors) = [objNull,objNull,objNull,objNull,objNull];
GVAR(pbRespawnPos) = [];

// headless client exit 
if (!isServer) exitWith {};

// define location via remoteExec instead of publicVariable to avoid SimpleSerialization warning
[[],{
    GVAR(location) = locationNull;
}] remoteExecCall [QUOTE(call),0];

publicVariable QFUNC(getChildren);
publicVariable QFUNC(isAllowedOwner);
publicVariable QFUNC(initClient);
publicVariable QFUNC(canDeployPB);
publicVariable QFUNC(canDeletePB);
publicVariable QFUNC(deletePB);

publicVariable QGVAR(respawnPos);
publicVariable QGVAR(anchor);
publicVariable QGVAR(pbAnchors);
publicVariable QGVAR(pbRespawnPos);

SETTINGS_INIT;
