/*
Author:
Nicholas Clark (SENSEI)

Description:
add armory to object

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

private ["_obj","_armory_state","_radio_state","_pack_state"];

_obj = _this select 0;

_armory_state = format ["if (%1) then {{player removeItem _x} forEach (call acre_api_fnc_getCurrentRadioList);}; ['Open',true] spawn %2;",CHECK_ADDON_1("acre_main"),QFUNC(arsenal)];

[format ["%1_%2_armory", QUOTE(ADDON),_obj],"Open Armory",_armory_state,QUOTE(true),"",_obj,0,["ACE_MainActions"]] call FUNC(setAction);
