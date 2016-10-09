#define COMPONENT fob

#include "\d\dcg\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\d\dcg\addons\main\script_macros.hpp"

#define PVEH_DEPLOY QGVAR(pveh_deploy)
#define PVEH_DELETE QGVAR(pveh_delete)
#define PVEH_REQUEST QGVAR(pveh_request)
#define PVEH_REASSIGN QGVAR(pveh_reassign)
#define PVEH_DEPLOYPB QGVAR(pveh_deploypb)
#define PVEH_DELETEPB QGVAR(pveh_deletepb)

#define SET_PATROL \
	{ \
		if (_x isKindOf 'Man' && {_x isEqualTo leader group _x} && {!(_x getVariable ['dcg_isOnPatrol',-1] isEqualTo 1)}) then { \
			[units group _x,GVAR(range),false] call EFUNC(main,setPatrol); \
			_x addEventHandler ['Local',{ \
				if (_this select 1) then { \
					_x setVariable ['dcg_isOnPatrol',0]; \
					[units group (_this select 0),GVAR(range),false] call EFUNC(main,setPatrol); \
				}; \
			}]; \
		}; \
	} forEach (curatorEditableObjects GVAR(curator));

#define DEPLOY_ID QUOTE(DOUBLES(ADDON,deploy))
#define DEPLOY_NAME "Deploy FOB"
#define DEPLOY_STATEMENT call FUNC(deploy)
#define DEPLOY_COND call FUNC(canDeploy)

#define REQUEST_ID QUOTE(DOUBLES(ADDON,request))
#define REQUEST_NAME "Request Control of FOB"
#define REQUEST_STATEMENT call FUNC(request)
#define REQUEST_COND !(GVAR(location) isEqualTo locationNull) && {!(player isEqualTo (getAssignedCuratorUnit GVAR(curator)))} && {GVAR(requestReady) isEqualTo 1}

#define DISMANTLE_ID QUOTE(DOUBLES(ADDON,dismantle))
#define DISMANTLE_NAME "Dismantle FOB"
#define DISMANTLE_STATEMENT call FUNC(delete)
#define DISMANTLE_COND player isEqualTo (getAssignedCuratorUnit GVAR(curator)) && {cameraOn isEqualTo player}

#define PATROL_ID QUOTE(DOUBLES(ADDON,patrol))
#define PATROL_NAME "Set FOB Groups on Patrol"
#define PATROL_STATEMENT SET_PATROL
#define PATROL_COND player isEqualTo (getAssignedCuratorUnit GVAR(curator))

#define BUILD_ID QUOTE(DOUBLES(ADDON,build))
#define BUILD_NAME "Build FOB"
#define BUILD_STATEMENT \
	if (isNull (findDisplay 312)) then { \
		openCuratorInterface; \
	} else { \
		findDisplay 312 closeDisplay 2; \
	}
#define BUILD_COND player isEqualTo (getAssignedCuratorUnit GVAR(curator)) && {isNull (objectParent player)} && {cameraOn isEqualTo player} && {!(visibleMap)}

#define PB_DEPLOY_ID QUOTE(DOUBLES(ADDON,deployPB))
#define PB_DEPLOY_NAME "Deploy PB"
#define PB_DEPLOY_STATEMENT call FUNC(deployPB)
#define PB_DEPLOY_COND call FUNC(canDeployPB)

#define PB_DISMANTLE_ID QUOTE(DOUBLES(ADDON,deletePB))
#define PB_DISMANTLE_NAME "Dismantle PB"
#define PB_DISMANTLE_STATEMENT call FUNC(deletePB)
#define PB_DISMANTLE_COND call FUNC(canDeletePB)