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
{!([position player] call EFUNC(main,inSafezones)) &&
{(position GVAR(anchor)) distance2D (position player) > 500 &&
{count (GVAR(pbAnchors) select {isNull _x}) > 0 &&
{isNull (objectParent player) &&
{((getPosATL player) select 2) < 10}}}}}
