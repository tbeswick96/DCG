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

(!(isNull GVAR(location))) &&
((locationPosition EGVAR(main,baseLocation)) distance2D (position player) > 2000) &&
((locationPosition GVAR(location)) distance2D (position player) > 500) &&
(count (GVAR(pbanchors) select {isNull _x}) > 0) &&
(isNull (objectParent player)) &&
(((getPosATL player) select 2) < 10)