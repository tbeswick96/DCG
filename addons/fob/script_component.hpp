#define COMPONENT fob

#include "\d\dcg\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\d\dcg\addons\main\script_macros.hpp"

#define FOB_DEPLOYED !(GVAR(anchor) isEqualTo objNull)
#define FOB_POSITION (getPos GVAR(anchor))

#define PVEH_CREATE QGVAR(pveh_create)
#define PVEH_DELETE QGVAR(pveh_delete)
#define PVEH_TRANSFER QGVAR(pveh_transfer)
#define PVEH_ASSIGN QGVAR(PVEH_ASSIGN)
#define PVEH_DEPLOYPB QGVAR(pveh_deploypb)
#define PVEH_DELETEPB QGVAR(pveh_deletepb)

#define CREATE_ID QUOTE(DOUBLES(ADDON,create))
#define CREATE_NAME "Deploy FOB"
#define CREATE_STATEMENT call FUNC(createOnClient)
#define CREATE_COND call FUNC(canCreate)
#define CREATE_KEYCODE \
	if (CREATE_COND) then { \
		CREATE_STATEMENT \
	}

#define TRANSFER_ID QUOTE(DOUBLES(ADDON,transfer))
#define TRANSFER_NAME "Transfer FOB Control"
#define TRANSFER_STATEMENT \
    if ([cursorObject] call FUNC(canAddAction)) then { \
        missionNamespace setVariable [PVEH_TRANSFER,[player,cursorObject]]; \
        publicVariableServer PVEH_TRANSFER; \
        [format ["FOB control transferred to %1", name cursorObject],true] call EFUNC(main,displayText); \
    } else { \
        [ \
            format ["%1 is not a whitelisted player. Are you sure you want to transfer FOB control to %1?", name cursorObject], \
            TITLE, \
            format ["FOB control transferred to %1", name cursorObject], \
            { \
                missionNamespace setVariable [PVEH_TRANSFER,[player,_this select 0,true]]; \
                publicVariableServer PVEH_TRANSFER; \
            }, \
            [cursorObject] \
        ] call EFUNC(main,displayGUIMessage); \
    }
#define TRANSFER_STATEMENT_ACE \
    if ([_target] call FUNC(canAddAction)) then { \
        missionNamespace setVariable [PVEH_TRANSFER,[player,_target]]; \
        publicVariableServer PVEH_TRANSFER; \
        [format ["FOB control transferred to %1", name _target],true] call EFUNC(main,displayText); \
    } else { \
        [ \
            format ["%1 is not a whitelisted player. Are you sure you want to transfer FOB control to %1?", name _target], \
            TITLE, \
            format ["FOB control transferred to %1", name _target], \
            { \
                missionNamespace setVariable [PVEH_TRANSFER,[player,_this select 0,true]]; \
                publicVariableServer PVEH_TRANSFER; \
            }, \
            [_target] \
        ] call EFUNC(main,displayGUIMessage); \
    }
#define TRANSFER_COND FOB_DEPLOYED && {player isEqualTo getAssignedCuratorUnit GVAR(curator)} && {isPlayer cursorObject} && {cursorObject isKindOf 'CAManBase'}
#define TRANSFER_COND_ACE FOB_DEPLOYED && {player isEqualTo getAssignedCuratorUnit GVAR(curator)} && {isPlayer _target} && {_target isKindOf 'CAManBase'}
#define TRANSFER_KEYCODE \
    if (CHECK_ADDON_1('ace_interact_menu')) then { \
        if (TRANSFER_COND_ACE) then { \
            TRANSFER_STATEMENT_ACE \
        } \
    } else { \
        if (TRANSFER_COND) then { \
    		TRANSFER_STATEMENT \
    	} \
    }

#define CONTROL_ID QUOTE(DOUBLES(ADDON,control))
#define CONTROL_NAME "Assume FOB Control"
#define CONTROL_STATEMENT \
    missionNamespace setVariable [PVEH_ASSIGN,player]; \
    publicVariableServer PVEH_ASSIGN; \
    call FUNC(curatorEH); \
    [format ["You've taken control of %1",GVAR(name)],true] call EFUNC(main,displayText)
#define CONTROL_COND FOB_DEPLOYED && {isNull (getAssignedCuratorUnit GVAR(curator))}
#define CONTROL_KEYCODE \
	if (CONTROL_COND) then { \
		CONTROL_STATEMENT \
	}

#define DELETE_ID QUOTE(DOUBLES(ADDON,delete))
#define DELETE_NAME "Dismantle FOB"
#define DELETE_STATEMENT call FUNC(deleteOnClient)
#define DELETE_COND player isEqualTo getAssignedCuratorUnit GVAR(curator) && {cameraOn isEqualTo player} && {!(visibleMap)}
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