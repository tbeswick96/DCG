/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

if !(CHECK_INIT) exitWith {};

ADDON = false;

PREP(handleCreate);
PREP(handleDelete);
PREP(handleTransfer);
PREP(handleLoadData);
PREP(handleClient);
PREP(getKeybind);
PREP(getChildren);
PREP(getCuratorCost);
PREP(canCreate);
PREP(canAddAction);
PREP(curatorEH);
PREP(recon);
PREP(createOnClient);
PREP(deleteOnClient);
PREP(deployPB);
PREP(canDeployPB);
PREP(setupPB);
PREP(canDeletePB);
PREP(deletePB);

GVAR(respawnPos) = [];
GVAR(anchor) = objNull;
GVAR(side) = createCenter sideLogic;
GVAR(group) = createGroup GVAR(side);
GVAR(curator) = GVAR(group) createUnit ["ModuleCurator_F",[0,0,0], [], 0, "FORM"];
GVAR(pbanchors) = [objNull,objNull,objNull];

INFO_1("Init curator %1",GVAR(curator));

publicVariable QFUNC(getKeybind);
publicVariable QFUNC(getChildren);
publicVariable QFUNC(getCuratorCost);
publicVariable QFUNC(canCreate);
publicVariable QFUNC(canAddAction);
publicVariable QFUNC(curatorEH);
publicVariable QFUNC(createOnClient);
publicVariable QFUNC(deleteOnClient);
publicVariable QFUNC(handleClient);
publicVariable QFUNC(deployPB);
publicVariable QFUNC(canDeployPB);
publicVariable QFUNC(canDeletePB);
publicVariable QFUNC(deletePB);

publicVariable QGVAR(side);
publicVariable QGVAR(group);
publicVariable QGVAR(curator);
publicVariable QGVAR(pbanchors);