/*
Author:
Nicholas Clark (SENSEI)

Description:
initialize settings via CBA framework

Arguments:

Return:
bool
__________________________________________________________________*/
#include "script_component.hpp"

[
    QGVAR(enable),
    "CHECKBOX",
    format ["Enable %1", COMPONENT_NAME],
    COMPONENT_NAME,
    true,
    true,
    {},
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(allow),
    "LIST",
    "Allowed Forward Operating Base Owners",
    COMPONENT_NAME,
    [
        [0,1],
        ["All Players", "Group Leaders"],
        0
    ],
    true,
    {}
] call CBA_Settings_fnc_init;

[
    QGVAR(range),
    "SLIDER",
    "Forward Operating Base Range",
    COMPONENT_NAME,
    [
        50,
        500,
        100,
        0
    ],
    true,
    {}
] call CBA_Settings_fnc_init;

[
    QGVAR(pbrange),
    "SLIDER",
    "Patrol Base Range",
    COMPONENT_NAME,
    [
        20,
        250,
        100,
        0
    ],
    true,
    {}
] call CBA_Settings_fnc_init;

[
    QGVAR(pbrange),
    "SLIDER",
    "Patrol Base Range",
    COMPONENT_NAME,
    [
        20,
        250,
        100,
        0
    ],
    true,
    {}
] call CBA_Settings_fnc_init;

[
    QGVAR(name),
    "EDITBOX",
    "FOB Name",
    COMPONENT_NAME,
    "FOB Tiger",
    true,
    {},
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(pbnames),
    "EDITBOX",
    ["PB Names", "Maximum 5, separate by commas with no spaces between (copy the default)"],
    COMPONENT_NAME,
    "PB Leopard,PB Jaguar,PB Cougar,PB Cheetah,PB Lynx",
    true,
    {},
    true
] call CBA_Settings_fnc_init;
