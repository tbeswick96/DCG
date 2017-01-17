/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"
#define TYPE_EXP ["R_TBG32V_F","HelicopterExploSmall"]

CHECK_POSTINIT;

[
	{DOUBLES(PREFIX,main) && {CHECK_POSTBRIEFING}},
	{
		_data = QUOTE(ADDON) call EFUNC(main,loadDataAddon);
		[_data] call FUNC(handleLoadData);

        if !(CHECK_ADDON_1("ace_explosives")) then {
    		[{
    			if (GVAR(list) isEqualTo []) exitWith {
    				[_this select 1] call CBA_fnc_removePerFrameHandler;
    			};

    			{
    				_near = _x nearEntities [["Man", "LandVehicle"], 4];
    				_near = _near select {isPlayer _x};

    				if !(_near isEqualTo []) then {
    					GVAR(list) deleteAt (GVAR(list) find _x);
    					(selectRandom TYPE_EXP) createVehicle (getPosATL _x);
    					deleteVehicle _x;
    				};

    				false
    			} count GVAR(list);
    		}, 1, []] call CBA_fnc_addPerFrameHandler;
        };

        {
            _mrk = createMarker [str _x,getPos _x];
        	_mrk setMarkerType "mil_triangle";
        	_mrk setMarkerSize [0.5,0.5];
        	_mrk setMarkerColor "ColorRed";
        	[_mrk] call EFUNC(main,setDebugMarker);
            false
        } count GVAR(list);
	}
] call CBA_fnc_waitUntilAndExecute;

ADDON = true;
