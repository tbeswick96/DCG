/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

if !(CHECK_INIT) exitWith {};

ADDON = false;

PREP(handleUnit);
PREP(handleVehicle);
PREP(spawnUnit);
PREP(spawnVehicle);

GVAR(drivers) = [];
GVAR(blacklist) = [];