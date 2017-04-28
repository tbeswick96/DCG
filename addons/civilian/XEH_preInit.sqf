/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

CHECK_PREINIT;

ADDON = false;

PREP(initSettings);
PREP(handleUnit);
PREP(handleVehicle);
PREP(spawnUnit);
PREP(spawnVehicle);
PREP(setPatrol);

GVAR(drivers) = [];
GVAR(blacklist) = [];

publicVariable QFUNC(initSettings);

SETTINGS_INIT;
