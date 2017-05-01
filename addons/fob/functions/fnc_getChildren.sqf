/*
Author:
Nicholas Clark (SENSEI)

Description:
get action children

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

private ["_action"];
private _actions = [];

if (CHECK_ADDON_1("ace_interact_menu")) then {
	_action = [CREATE_ID, CREATE_NAME, "", {CREATE_STATEMENT}, {CREATE_COND}, {}, []] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], player];

	_action = [DELETE_ID, DELETE_NAME, "", {DELETE_STATEMENT}, {DELETE_COND}, {}, []] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], player];

	_action = [PB_DEPLOY_ID, PB_DEPLOY_NAME, "", {PB_DEPLOY_STATEMENT}, {PB_DEPLOY_COND}, {}, []] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], player];

	_action = [PB_DISMANTLE_ID, PB_DISMANTLE_NAME, "", {PB_DISMANTLE_STATEMENT}, {PB_DISMANTLE_COND}, {}, []] call ace_interact_menu_fnc_createAction;
	_actions pushBack [_action, [], player];
} else {
	_action = player addAction [CREATE_NAME, {CREATE_STATEMENT}, [], 0, false, true, "", QUOTE(CREATE_COND)];
	_actions pushBack _action;

	_action = player addAction [DELETE_NAME, {DELETE_STATEMENT}, [], 0, false, true, "", QUOTE(DELETE_COND)];
	_actions pushBack _action;

	_action = player addAction [PB_DEPLOY_NAME, {PB_DEPLOY_STATEMENT}, [], 0, false, true, "", QUOTE(PB_DEPLOY_COND)];
	_actions pushBack _action;

	_action = player addAction [PB_DISMANTLE_NAME, {PB_DISMANTLE_STATEMENT}, [], 0, false, true, "", QUOTE(PB_DISMANTLE_COND)];
	_actions pushBack _action;
};

_actions
