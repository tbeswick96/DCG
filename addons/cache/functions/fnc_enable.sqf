/*
Author:
Nicholas Clark (SENSEI)

Description:
enable caching for group

Arguments:
0: group <GROUP>

Return:
nothing
__________________________________________________________________*/
#include "script_component.hpp"

if !(isServer) exitWith {};

params [
    ["_grp",grpNull,[grpNull]]
];

_grp setVariable ["uksf_caching_excluded", false, true];

nil
