/*
Author: SENSEI

Last modified: 10/30/2015

Description:
__________________________________________________________________*/
#include "script_component.hpp"

if !(isServer) exitWith {};

ADDON = false;

PREP(findLocation);
PREP(PFH);
PREP(setOccupied);
PREP(addIntel);

GVAR(locations) = [];