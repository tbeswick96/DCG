/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

CHECK_INIT;

ADDON = false;

PREP(handleUnit);
PREP(handleVehicle);
PREP(spawnUnit);
PREP(spawnVehicle);

GVAR(drivers) = [];
GVAR(blacklist) = [];