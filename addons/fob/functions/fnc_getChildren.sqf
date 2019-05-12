/*
Author:
Nicholas Clark (SENSEI)

Description:
get action children

Arguments:

Return:
array
__________________________________________________________________*/
#include "script_component.hpp"

private ["_action"];
private _actions = [];

_action = [QGVAR(create), FOB_CREATE_NAME, "", {FOB_CREATE_STATEMENT}, {FOB_CREATE_COND}, {}, []] call ace_interact_menu_fnc_createAction;
_actions pushBack [_action, [], player];

_action = [QGVAR(delete), FOB_DELETE_NAME, "", {FOB_DELETE_STATEMENT}, {FOB_DELETE_COND}, {}, []] call ace_interact_menu_fnc_createAction;
_actions pushBack [_action, [], player];

_action = [QGVAR(pbBuild), PB_DEPLOY_NAME, "", {PB_DEPLOY_STATEMENT}, {PB_DEPLOY_COND}, {}, []] call ace_interact_menu_fnc_createAction;
_actions pushBack [_action, [], player];

_action = [QGVAR(pbDelete), PB_DISMANTLE_NAME, "", {PB_DISMANTLE_STATEMENT}, {PB_DISMANTLE_COND}, {}, []] call ace_interact_menu_fnc_createAction;
_actions pushBack [_action, [], player];

_actions
