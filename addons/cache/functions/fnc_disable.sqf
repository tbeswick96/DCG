/*
Author:
Nicholas Clark (SENSEI)

Description:
disable caching for group

Arguments:
0: group <GROUP>

Return:
nothing
__________________________________________________________________*/
#include "script_component.hpp"

if !(isServer) exitWith {};

params [
    ["_group",grpNull,[grpNull]]
];

["uksf_caching_disableCache", [_group]] call CBA_fnc_serverEvent;

nil
