/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"
#define ITERATIONS 2

CHECK_POSTINIT;

[
	{DOUBLES(PREFIX,main) && {CHECK_POSTBRIEFING}},
	{
		_locations = +EGVAR(main,locations);

		_locations = [_locations,(count _locations)*ITERATIONS] call EFUNC(main,shuffle);

        [FUNC(handleUnit), HANDLER_DELAY, _locations] call CBA_fnc_addPerFrameHandler;
        [FUNC(handleVehicle), GVAR(vehCooldown), []] call CBA_fnc_addPerFrameHandler;

        {
            _mrk = createMarker [LOCATION_ID(_x select 0),_x select 1];
            _mrk setMarkerColor ([CIVILIAN,true] call BIS_fnc_sideColor);
            _mrk setMarkerShape "ELLIPSE";
            _mrk setMarkerBrush "Solid";
            _mrk setMarkerSize [GVAR(spawnDist),GVAR(spawnDist)];
            [_mrk] call EFUNC(main,setDebugMarker);

            false
        } count _locations;
	}
] call CBA_fnc_waitUntilAndExecute;

ADDON = true;
