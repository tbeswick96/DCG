/*
Author:
Nicholas Clark (SENSEI)
__________________________________________________________________*/
#include "script_component.hpp"

CHECK_POSTINIT;

[
	{DOUBLES(PREFIX,main) && {CHECK_POSTBRIEFING}},
	{
		_locations = EGVAR(main,locations) select {!(CHECK_DIST2D((_x select 1),locationPosition EGVAR(main,baseLocation),EGVAR(main,baseRadius)))};

		{
			_mrk = createMarker [LOCATION_ID(_x select 0),_x select 1];
			_mrk setMarkerColor "ColorCivilian";
			_mrk setMarkerShape "ELLIPSE";
			_mrk setMarkerBrush "Solid";
			_mrk setMarkerSize [GVAR(spawnDist),GVAR(spawnDist)];
			[_mrk] call EFUNC(main,setDebugMarker);

			false
		} count _locations;

		[FUNC(handleUnit), 15, [_locations]] call CBA_fnc_addPerFrameHandler;

		[FUNC(handleVehicle), GVAR(vehCooldown), []] call CBA_fnc_addPerFrameHandler;
	}
] call CBA_fnc_waitUntilAndExecute;

ADDON = true;
