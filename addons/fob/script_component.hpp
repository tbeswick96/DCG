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
#define PVEH_TRANSFER QGVAR(pveh_transfer)
#define PVEH_ASSIGN QGVAR(pveh_assign)
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

#define CREATE_COND !(FOB_DEPLOYED) && {isNull getAssignedCuratorUnit GVAR(curator)} && {isNull (objectParent player)} && {((getPosATL player) select 2) < 10} && {!(COMPARE_STR(animationState player,FOB_CREATE_ANIM))} && {[player] call FUNC(isAllowedOwner)}
#define CREATE_KEYCODE \
	if (CREATE_COND) then { \
		CREATE_STATEMENT \
	}

#define TRANSFER_ID QUOTE(DOUBLES(ADDON,transfer))
#define TRANSFER_NAME "Transfer FOB Control"
#define TRANSFER_STATEMENT \
    missionNamespace setVariable [PVEH_TRANSFER,[player,cursorTarget]]; \
    publicVariableServer PVEH_TRANSFER; \
    [format ["FOB control transferred to %1", name cursorTarget],true] call EFUNC(main,displayText)
#define TRANSFER_STATEMENT_ACE \
    missionNamespace setVariable [PVEH_TRANSFER,[player,_target]]; \
    publicVariableServer PVEH_TRANSFER; \
    [format ["FOB control transferred to %1", name _target],true] call EFUNC(main,displayText)
#define TRANSFER_COND FOB_DEPLOYED && {player isEqualTo getAssignedCuratorUnit GVAR(curator)} && {isPlayer cursorTarget} && {cursorTarget isKindOf 'CAManBase'} && {[cursorTarget] call FUNC(isAllowedOwner)}
#define TRANSFER_COND_ACE FOB_DEPLOYED && {player isEqualTo getAssignedCuratorUnit GVAR(curator)} && {isPlayer _target} && {_target isKindOf 'CAManBase'} && {[_target] call FUNC(isAllowedOwner)}
#define TRANSFER_KEYCODE \
    if (TRANSFER_COND) then { \
        TRANSFER_STATEMENT \
    }

#define CONTROL_ID QUOTE(DOUBLES(ADDON,control))
#define CONTROL_NAME "Assume FOB Control"
#define CONTROL_STATEMENT \
    missionNamespace setVariable [PVEH_ASSIGN,player]; \
    publicVariableServer PVEH_ASSIGN; \
    [ \
        {getAssignedCuratorUnit GVAR(curator) isEqualTo player}, \
        { \
            [format ["You've taken control of %1",GVAR(name)],true] call EFUNC(main,displayText) \
        }, \
        [] \
    ] call CBA_fnc_waitUntilAndExecute
#define CONTROL_COND FOB_DEPLOYED && {isNull (getAssignedCuratorUnit GVAR(curator))} && {[player] call FUNC(isAllowedOwner)}
#define CONTROL_KEYCODE \
	if (CONTROL_COND) then { \
		CONTROL_STATEMENT \
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
#define DELETE_COND GVAR(anchor) distance2D (position player) < 10 && {player isEqualTo getAssignedCuratorUnit GVAR(curator)} && {cameraOn isEqualTo player} && {!(visibleMap)}
#define DELETE_KEYCODE \
	if (DELETE_COND) then { \
		DELETE_STATEMENT \
	}

#define BUILD_ID QUOTE(DOUBLES(ADDON,build))
#define BUILD_NAME "Build FOB"
#define BUILD_STATEMENT \
	if (isNull (findDisplay 312)) then { \
		openCuratorInterface; \
	} else { \
		findDisplay 312 closeDisplay 2; \
	}
#define BUILD_COND player isEqualTo getAssignedCuratorUnit GVAR(curator) && {isNull (objectParent player)} && {cameraOn isEqualTo player} && {!(visibleMap)}
#define BUILD_KEYCODE \
	if (BUILD_COND) then { \
		BUILD_STATEMENT \
	}

#define PB_DEPLOY_ID QUOTE(DOUBLES(ADDON,deployPB))
#define PB_DEPLOY_NAME "Deploy PB"
#define PB_DEPLOY_STATEMENT call FUNC(deployPB)
#define PB_DEPLOY_COND call FUNC(canDeployPB)

#define PB_DISMANTLE_ID QUOTE(DOUBLES(ADDON,deletePB))
#define PB_DISMANTLE_NAME "Dismantle PB"
#define PB_DISMANTLE_STATEMENT call FUNC(deletePB)
#define PB_DISMANTLE_COND call FUNC(canDeletePB)