#include "script_component.hpp"
/*
Author:
Nicholas Clark (SENSEI)

Description:
initialize settings via CBA framework

Arguments:

Return:
bool
__________________________________________________________________*/
#define ERROR_SAMESIDE format ["%1 cannot be equal to %2!",QGVAR(enemySide),QGVAR(playerSide)]
#define CATEGORY_FACTION [COMPONENT_NAME,"Faction Settings"]
#define CATEGORY_SAVE [COMPONENT_NAME,"Save System Settings"]
#define CATEGORY_SAFE [COMPONENT_NAME,"Safezone Settings"]
#define CATEGORY_HC [COMPONENT_NAME,"Headless Client Settings"]

[
    QGVAR(enable),
    "CHECKBOX",
    format ["Enable %1", toUpper QUOTE(PREFIX)],
    COMPONENT_NAME,
    true,
    true,
    {},
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(loadData),
    "CHECKBOX",
    ["Load Mission Data","Load mission data from server profile."],
    CATEGORY_SAVE,
    false,
    true,
    {},
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(autoSave),
    "CHECKBOX",
    ["Autosave Mission Data","Autosave mission data to server profile."],
    CATEGORY_SAVE,
    false,
    true,
    {}
] call CBA_Settings_fnc_init;

[
    QGVAR(sides),
    "LIST",
    ["Player and Enemy Sides","Player side should be equal to the side of playable units."],
    COMPONENT_NAME,
    [
        [
            [WEST,EAST],
            [WEST,INDEPENDENT],
            [EAST,WEST],
            [EAST,INDEPENDENT],
            [INDEPENDENT,WEST],
            [INDEPENDENT,EAST]
        ],
        [
            "West, East",
            "West, Independent",
            "East, West",
            "East, Independent",
            "Independent, West",
            "Independent, East"
        ],
        0
    ],
    true,
    {
        GVAR(playerSide) = _this#0;
        GVAR(enemySide) = _this#1;
    },
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(factionsEast),
    "EDITBOX",
    ["East Factions","Entities from the listed factions will be included. Factions must be separated by a comma."],
    CATEGORY_FACTION,
    "OPF_F",
    true,
    {
        if (!isServer) exitWith {};
        
        [0] call FUNC(setPool);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(filtersEast),
    "EDITBOX",
    ["East Filters","Exclude entities by listing display names. Names must be separated by a comma and partial names are allowed."],
    CATEGORY_FACTION,
    "diver,vr ,pilot,survivor,crew,rifleman (unarmed),competitor",
    true,
    {
        if (!isServer) exitWith {};
        
        [0] call FUNC(setPool);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(factionsWest),
    "EDITBOX",
    ["West Factions","Entities from the listed factions will be included. Factions must be separated by a comma."],
    CATEGORY_FACTION,
    "BLU_F",
    true,
    {
        if (!isServer) exitWith {};
        
        [1] call FUNC(setPool);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(filtersWest),
    "EDITBOX",
    ["West Filters","Exclude entities by listing display names. Names must be separated by a comma and partial names are allowed."],
    CATEGORY_FACTION,
    "diver,vr ,pilot,survivor,crew,rifleman (unarmed),competitor",
    true,
    {
        if (!isServer) exitWith {};
        
        [1] call FUNC(setPool);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(factionsInd),
    "EDITBOX",
    ["Independent Factions","Entities from the listed factions will be included. Factions must be separated by a comma."],
    CATEGORY_FACTION,
    "IND_F",
    true,
    {
        if (!isServer) exitWith {};
        
        [2] call FUNC(setPool);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(filtersInd),
    "EDITBOX",
    ["Independent Filters","Exclude entities by listing display names. Names must be separated by a comma and partial names are allowed."],
    CATEGORY_FACTION,
    "diver,vr ,pilot,survivor,crew,rifleman (unarmed),competitor",
    true,
    {
        if (!isServer) exitWith {};
        
        [2] call FUNC(setPool);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(factionsCiv),
    "EDITBOX",
    ["Civilian Factions","Entities from the listed factions will be included. Factions must be separated by a comma."],
    CATEGORY_FACTION,
    "CIV_F",
    true,
    {
        if (!isServer) exitWith {};
        
        [3] call FUNC(setPool);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(filtersCiv),
    "EDITBOX",
    ["Civilian Filters","Exclude entities by listing display names. Names must be separated by a comma and partial names are allowed."],
    CATEGORY_FACTION,
    "driver,vr ,pilot,construction,kart",
    true,
    {
        if (!isServer) exitWith {};
        
        [3] call FUNC(setPool);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(safezoneEnable),
    "CHECKBOX",
    "Enable Safezones",
    CATEGORY_SAFE,
    true,
    true,
    {},
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(safezoneMarkersDisplay),
    "LIST",
    ["Safezone Markers", "Safezone map marker display settings."],
    CATEGORY_SAFE,
    [
        [0,1,2],
        ["Off", "Solid", "Border"],
        0
    ],
    true,
    {
        if (!isServer) exitWith {};
        
        switch (_this) do {
            case 0: {
                GVAR(safezoneMarkers) apply {_x setMarkerAlpha 0};
            };
            case 1: {
                GVAR(safezoneMarkers) apply {
                    _x setMarkerAlpha 0.4;
                    _x setMarkerBrush "SolidBorder";
                };
            };
            case 2: {
                GVAR(safezoneMarkers) apply {
                    _x setMarkerAlpha 1;
                    _x setMarkerBrush "Border";
                };
            };
            default {};
        };
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(baseRadius),
    "SLIDER",
    ["Main Operating Base Radius","Base radius."],
    COMPONENT_NAME,
    [
        100,
        2000,
        (worldSize*0.05) min 2000,
        0
    ],
    false,
    {}
] call CBA_Settings_fnc_init;

[
    QGVAR(baseName),
    "EDITBOX",
    "Main Base Name",
    COMPONENT_NAME,
    "MOB Lion",
    true,
    {}
] call CBA_Settings_fnc_init;

[
    QGVAR(staticPoolEastString),
    "EDITBOX",
    ["Static Pool East","Class names for East statics. Names must be separated by a comma and wrapped in single quotes."],
    CATEGORY_FACTION,
    "['O_static_AT_F','O_GMG_01_F','O_GMG_01_high_F','O_GMG_01_A_F','O_HMG_01_F','O_HMG_01_high_F','O_HMG_01_A_F']",
    true,
    {
        GVAR(staticPoolEast) = call compile GVAR(staticPoolEastString);
    }
] call CBA_Settings_fnc_init;

[
    QGVAR(mortarPoolEastString),
    "EDITBOX",
    ["Mortar Pool East","Class names for East mortars. Names must be separated by a comma and wrapped in single quotes."],
    CATEGORY_FACTION,
    "[]'O_Mortar_01_F']",
    true,
    {
        GVAR(mortarPoolEast) = call compile GVAR(mortarPoolEastString);
    }
] call CBA_Settings_fnc_init;
