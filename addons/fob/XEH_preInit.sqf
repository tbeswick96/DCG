/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

if !(CHECK_INIT) exitWith {};

ADDON = false;

PREP(deploy);
PREP(delete);
PREP(request);
PREP(handleRequest);
PREP(setup);
PREP(getChildren);
PREP(canDeploy);
PREP(deployPB);
PREP(canDeployPB);
PREP(setupPB);
PREP(canDeletePB);
PREP(deletePB);

GVAR(location) = locationNull;
GVAR(respawnPos) = [];
GVAR(requestReady) = 1;
GVAR(UID) = "";
GVAR(response) = -1;
GVAR(anchor) = objNull;
GVAR(side) = createCenter sideLogic;
GVAR(group) = createGroup GVAR(side);
GVAR(curator) = GVAR(group) createUnit ["ModuleCurator_F",[0,0,0], [], 0, "FORM"];
LOG_DEBUG_1("Creating curator %1.",GVAR(curator));
GVAR(pbanchors) = [objNull,objNull,objNull];

publicVariable QFUNC(request);
publicVariable QFUNC(getChildren);
publicVariable QFUNC(deploy);
publicVariable QFUNC(delete);
publicVariable QFUNC(canDeploy);
publicVariable QFUNC(deployPB);
publicVariable QFUNC(canDeployPB);
publicVariable QFUNC(canDeletePB);
publicVariable QFUNC(deletePB);

publicVariable QGVAR(location);
publicVariable QGVAR(requestReady);
publicVariable QGVAR(UID);
publicVariable QGVAR(response);
publicVariable QGVAR(side);
publicVariable QGVAR(group);
publicVariable QGVAR(curator);
publicVariable QGVAR(pbanchors);