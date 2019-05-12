/*
Author:
Nicholas Clark (SENSEI)

Description:
handle client setup

Arguments:

Return:
nothing
__________________________________________________________________*/
#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

if (!hasInterface) exitWith {};

[QUOTE(ADDON),"Forward Operating Base",{},{true},{call FUNC(getChildren)}] call EFUNC(main,setAction);

nil
