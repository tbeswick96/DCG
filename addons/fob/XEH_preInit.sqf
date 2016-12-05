/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

CHECK_INIT;

ADDON = false;

PREP(init);
PREP(handleCreate);
PREP(handleDelete);
PREP(handleTransfer);
PREP(handleLoadData);
PREP(handleClient);
PREP(getKeybind);
PREP(getChildren);
PREP(canCreate);
PREP(canAddAction);
PREP(createOnClient);
PREP(deleteOnClient);
PREP(deployPB);
PREP(canDeployPB);
PREP(setupPB);
PREP(canDeletePB);
PREP(deletePB);

GVAR(respawnPos) = [];
GVAR(anchor) = objNull;
GVAR(curatorExternal) = objNull;
GVAR(pbanchors) = [objNull,objNull,objNull];

publicVariable QFUNC(getKeybind);
publicVariable QFUNC(getChildren);
publicVariable QFUNC(canCreate);
publicVariable QFUNC(canAddAction);
publicVariable QFUNC(createOnClient);
publicVariable QFUNC(deleteOnClient);
publicVariable QFUNC(handleClient);
publicVariable QFUNC(deployPB);
publicVariable QFUNC(canDeployPB);
publicVariable QFUNC(canDeletePB);
publicVariable QFUNC(deletePB);

publicVariable QGVAR(respawnPos);
publicVariable QGVAR(anchor);
publicVariable QGVAR(pbanchors);