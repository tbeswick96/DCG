#define COMPONENT fob
#define COMPONENT_PRETTY FOB

#include "\d\dcg\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\d\dcg\addons\main\script_macros.hpp"

#define FOB_DEPLOYED !(GVAR(anchor) isEqualTo objNull)
#define FOB_POSITION (getPos GVAR(anchor))
#define FOB_CREATE_ANIM 'AinvPknlMstpSnonWnonDnon_medic4'

#define PVEH_CREATE QGVAR(pveh_create)
#define PVEH_DELETE QGVAR(pveh_delete)
#define PVEH_DEPLOYPB QGVAR(pveh_deploypb)
#define PVEH_DELETEPB QGVAR(pveh_deletepb)

#define CREATE_ID QUOTE(DOUBLES(ADDON,create))
#define CREATE_NAME "Deploy FOB"
#define CREATE_STATEMENT \
    [player,FOB_CREATE_ANIM] call EFUNC(main,setAnim); \
    [{ \
        _format = format ["Forward Operating Base Deployed \n \nPress [%1] to start building",call FUNC(getKeybind)]; \
        [_format,true] call EFUNC(main,displayText); \
    	missionNamespace setVariable [PVEH_CREATE,player]; \
    	publicVariableServer PVEH_CREATE; \
    }, [], 9] call CBA_fnc_waitAndExecute

#define CREATE_COND !(FOB_DEPLOYED) && {isNull (objectParent player)} && {((getPosATL player) select 2) < 10} && {!(COMPARE_STR(animationState player,FOB_CREATE_ANIM))} && {[player] call FUNC(isAllowedOwner)}
#define CREATE_KEYCODE \
	if (CREATE_COND) then { \
		CREATE_STATEMENT \
	}

#define DELETE_ID QUOTE(DOUBLES(ADDON,delete))
#define DELETE_NAME "Dismantle FOB"
#define DELETE_STATEMENT \
    [ \
        "Are you sure you want to dismantle the Forward Operating Base?", \
        TITLE, \
        "Forward Operating Base dismantled.", \
        {missionNamespace setVariable [(_this select 0),true]; publicVariableServer (_this select 0);}, \
        [PVEH_DELETE] \
    ] call EFUNC(main,displayGUIMessage)
#define DELETE_COND GVAR(anchor) distance2D (position player) < 10 && {cameraOn isEqualTo player} && {!(visibleMap)}
#define DELETE_KEYCODE \
	if (DELETE_COND) then { \
		DELETE_STATEMENT \
	}

#define PB_DEPLOY_ID QUOTE(DOUBLES(ADDON,deployPB))
#define PB_DEPLOY_NAME "Deploy PB"
#define PB_DEPLOY_STATEMENT call FUNC(deployPB)
#define PB_DEPLOY_COND call FUNC(canDeployPB)

#define PB_DISMANTLE_ID QUOTE(DOUBLES(ADDON,deletePB))
#define PB_DISMANTLE_NAME "Dismantle PB"
#define PB_DISMANTLE_STATEMENT call FUNC(deletePB)
#define PB_DISMANTLE_COND call FUNC(canDeletePB)
