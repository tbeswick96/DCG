/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

PREINIT;

PREP(initSettings);
PREP(init);
PREP(initClient);
PREP(handleAssign);
PREP(handleCreate);
PREP(handleDelete);
PREP(handleLoadData);
PREP(handleRecon);
PREP(getKeybind);
PREP(getChildren);
PREP(isAllowedOwner);
PREP(deployPB);
PREP(canDeployPB);
PREP(setupPB);
PREP(canDeletePB);
PREP(deletePB);

GVAR(respawnPos) = [];
GVAR(anchor) = objNull;
GVAR(marker) = "";
GVAR(pbanchors) = [objNull,objNull,objNull,objNull,objNull];
GVAR(pbRespawnPos) = [];

// headless client exit 
if (!isServer) exitWith {};

// define location via remoteExec instead of publicVariable to avoid SimpleSerialization warning
[[],{
    GVAR(location) = locationNull;
}] remoteExecCall [QUOTE(call),0];

publicVariable QFUNC(getKeybind);
publicVariable QFUNC(getChildren);
publicVariable QFUNC(isAllowedOwner);
publicVariable QFUNC(initClient);
publicVariable QFUNC(deployPB);
publicVariable QFUNC(canDeployPB);
publicVariable QFUNC(canDeletePB);
publicVariable QFUNC(deletePB);

publicVariable QGVAR(respawnPos);
publicVariable QGVAR(anchor);
publicVariable QGVAR(pbanchors);

SETTINGS_INIT;
