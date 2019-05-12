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

count (GVAR(pbAnchors) select {(position _x) distance2D (position player) < 10}) > 0 &&
{(serverCommandAvailable "#logout") &&
{cameraOn isEqualTo player}}
