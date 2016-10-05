/*
Author:
Tim Beswick

Description:
check if player can delete PB

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

(count (GVAR(pbanchors) select {(position _x) distance2D (position player) < 10}) > 0) &&
((serverCommandAvailable "#logout") || (player isEqualTo (getAssignedCuratorUnit GVAR(curator)))) &&
(cameraOn isEqualTo player)