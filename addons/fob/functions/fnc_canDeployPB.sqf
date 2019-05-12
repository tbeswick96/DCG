/*
Author:
Tim Beswick

Description:
check if player can deploy PB

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

(!(isNull GVAR(anchor))) &&
{(locationPosition EGVAR(main,baseLocation)) distance2D (position player) > 2000 &&
{(position GVAR(anchor)) distance2D (position player) > 500 &&
{count (GVAR(pbAnchors) select {isNull _x}) > 0 &&
{isNull (objectParent player) &&
{((getPosATL player) select 2) < 10}}}}}
