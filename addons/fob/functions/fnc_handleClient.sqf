/*
Author:
Nicholas Clark (SENSEI)

Description:
handle client setup

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[QUOTE(ADDON),"Forward Operating Base",{},{true},{call FUNC(getChildren)}] call EFUNC(main,setAction);

// if ace interaction menu is enabled add transfer action to receiving unit's menu, instead of self menu
if (CHECK_ADDON_1("ace_interact_menu")) then {
    _action = [TRANSFER_ID, TRANSFER_NAME, "", {TRANSFER_STATEMENT_ACE}, {TRANSFER_COND_ACE}, {}, []] call ace_interact_menu_fnc_createAction;
    ["CAManBase", 0, ["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};

[COMPONENT_NAME, CREATE_ID, CREATE_NAME, {CREATE_KEYCODE}, ""] call CBA_fnc_addKeybind;
[COMPONENT_NAME, DELETE_ID, DELETE_NAME, {DELETE_KEYCODE}, ""] call CBA_fnc_addKeybind;

INFO("Client setup finished");
