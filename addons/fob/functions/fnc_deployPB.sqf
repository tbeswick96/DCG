/*
Author:
Tim Beswick

Description:
deploy PB

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"
#define ANIM "AinvPknlMstpSnonWnonDnon_medic4"
#define ANIM_TIME 9

[player,ANIM] call EFUNC(main,setAnim);

[{
	["PB Deployed",true] call EFUNC(main,displayText);

	missionNamespace setVariable [PVEH_DEPLOYPB,player];
	publicVariableServer PVEH_DEPLOYPB;
}, [], ANIM_TIME] call CBA_fnc_waitAndExecute;