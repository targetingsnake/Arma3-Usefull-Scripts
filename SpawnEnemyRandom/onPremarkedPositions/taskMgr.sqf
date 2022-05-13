#include "zones.sqf"
if (!isServer) exitWith {};

_markerAreaAO1 = createMarkerLocal ["AO_1_Circle", getMarkerPos _markerAO_ao_1];
_markerAreaAO1 setMarkerShapeLocal "ELLIPSE";
_markerAreaAO1 setMarkerSizeLocal [150,150];
_markerAreaAO1 setMarkerBrushLocal "Grid";
_markerAreaAO1 setMarkerColor "ColorGreen";
_markerAreaAO2 = createMarkerLocal ["AO_2_Circle", getMarkerPos _markerAO_ao_2];
_markerAreaAO2 setMarkerShapeLocal "ELLIPSE";
_markerAreaAO2 setMarkerSizeLocal [150,150];
_markerAreaAO2 setMarkerBrushLocal "Grid";
_markerAreaAO2 setMarkerColor "ColorGreen";
_markerAreaAO3 = createMarkerLocal ["AO_3_Circle", getMarkerPos _markerAO_ao_3];
_markerAreaAO3 setMarkerShapeLocal "ELLIPSE";
_markerAreaAO3 setMarkerSizeLocal [250,250];
_markerAreaAO3 setMarkerBrushLocal "Grid";
_markerAreaAO3 setMarkerColor "ColorRed";

_AO_1_Data = [
	_markerAO_ao_1,
	_markerEnemies_ao_1,
	_markerCarSpawn_ao_1,
	_UnitTypes_light,
	_UnitTypes_heavy,
	_vehicleTypes_light,
	_vehicleTypes_heavy,
	7,
	"2",
	[3,8],
	[0,2],
	[3,9],
	[3,6]
	];

_AO_2_Data = [
	_markerAO_ao_2,
	_markerEnemies_ao_2,
	_markerCarSpawn_ao_2,
	_UnitTypes_light,
	_UnitTypes_heavy,
	_vehicleTypes_light,
	_vehicleTypes_heavy,
	10,
	"4",
	[6,10],
	[1,3],
	[7,10],
	[3,6]
	];

[_markerAO_ao_1, "1", 0] execVM "scripts\move.sqf";

waitUntil {
	sleep 10;
	"1" call BIS_fnc_taskCompleted
};
_state = "1" call BIS_fnc_taskState;
if ((_state == "CANCELED") || (_state == "FAILED")) exitWith {};

_AO_1_Data execVM "scripts\enemySpawn.sqf";

waitUntil {
	sleep 10;
	"2" call BIS_fnc_taskCompleted
};
_state = "2" call BIS_fnc_taskState;
if ((_state == "CANCELED") || (_state == "FAILED")) exitWith {};

[_markerAO_ao_2, "3", 1] execVM "scripts\move.sqf";

waitUntil {
	sleep 10;
	"3" call BIS_fnc_taskCompleted
};
_state = "3" call BIS_fnc_taskState;
if ((_state == "CANCELED") || (_state == "FAILED")) exitWith {};

_AO_2_Data execVM "scripts\enemySpawn.sqf";

waitUntil {
	sleep 10;
	"4" call BIS_fnc_taskCompleted
};
_state = "4" call BIS_fnc_taskState;
if ((_state == "CANCELED") || (_state == "FAILED")) exitWith {};

[_markerAO_ao_HQ, "5", 2] execVM "scripts\move.sqf";

waitUntil {
	sleep 10;
	"5" call BIS_fnc_taskCompleted
};
_state = "5" call BIS_fnc_taskState;
if ((_state == "CANCELED") || (_state == "FAILED")) exitWith {};