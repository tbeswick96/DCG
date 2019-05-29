#define COMPONENT fob
#define COMPONENT_PRETTY FOB

#include "\d\dcg\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\d\dcg\addons\main\script_macros.hpp"

#define FOB_COST_MULTIPIER 0.5
#define FOB_DEPLOYED !(GVAR(anchor) isEqualTo objNull)
#define FOB_POSITION (getPos GVAR(anchor))
#define FOB_CREATE_ANIM 'AinvPknlMstpSnonWnonDnon_medic4'

#define FOB_CREATE_NAME "Deploy FOB"
#define FOB_CREATE_STATEMENT \
    [player,FOB_CREATE_ANIM] call EFUNC(main,setAnim); \
    [{ \
        ["Forward Operating Base Deployed",true] call EFUNC(main,displayText); \
        [QGVAR(create),[player]] call CBA_fnc_serverEvent; \
    }, [], 9] call CBA_fnc_waitAndExecute

#define FOB_CREATE_COND !(FOB_DEPLOYED) && {isNull (objectParent player) && {!([position player] call EFUNC(main,inSafezones)) && {((getPosATL player) select 2) < 10 && {!(COMPARE_STR(animationState player,FOB_CREATE_ANIM)) && {[player] call FUNC(isAllowedOwner)}}}}}

#define FOB_DELETE_NAME "Dismantle FOB"
#define FOB_DELETE_STATEMENT \
    [ \
        "Are you sure you want to dismantle the Forward Operating Base?", \
        TITLE, \
        "Forward Operating Base dismantled.", \
        {[_this select 0, []] call CBA_fnc_serverEvent}, \
        [QGVAR(delete)] \
    ] spawn EFUNC(main,displayGUIMessage)

#define FOB_DELETE_COND GVAR(anchor) distance2D (position player) < 10 && {cameraOn isEqualTo player} && {!(visibleMap)}

#define PB_DEPLOY_NAME "Deploy PB"
#define PB_DEPLOY_STATEMENT \
    [player,FOB_CREATE_ANIM] call EFUNC(main,setAnim); \
    [{ \
        ["PB Deployed",true] call EFUNC(main,displayText); \
        [QGVAR(setupPB),[player]] call CBA_fnc_serverEvent; \
    }, [], 9] call CBA_fnc_waitAndExecute

#define PB_DEPLOY_COND call FUNC(canDeployPB)

#define PB_DISMANTLE_NAME "Dismantle PB"
#define PB_DISMANTLE_STATEMENT \
    [ \
        "Are you sure you want to dismantle PB?", \
        TITLE, \
        "PB dismantled.", \
        {[_this select 0, []] call CBA_fnc_serverEvent}, \
        [QGVAR(deletePB)] \
    ] spawn EFUNC(main,displayGUIMessage)

#define PB_DISMANTLE_COND call FUNC(canDeletePB)
