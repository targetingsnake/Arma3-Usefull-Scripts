if (!isServer) exitWith {};

if(MissionDebug || !MissionIntro) then {
	sleep 30;
} else {
	sleep 60;
};

_markerAreaAO1 = createMarkerLocal ["AO_1_Circle", getMarkerPos MarkerAO_ao_1];
_markerAreaAO1 setMarkerShapeLocal "ELLIPSE";
_markerAreaAO1 setMarkerSizeLocal [150,150];
_markerAreaAO1 setMarkerBrushLocal "Grid";
_markerAreaAO1 setMarkerColor "ColorGreen";
_markerAreaAO2 = createMarkerLocal ["AO_2_Circle", getMarkerPos MarkerAO_ao_2];
_markerAreaAO2 setMarkerShapeLocal "ELLIPSE";
_markerAreaAO2 setMarkerSizeLocal [150,150];
_markerAreaAO2 setMarkerBrushLocal "Grid";
_markerAreaAO2 setMarkerColor "ColorGreen";

Mission_AO_1_Data = [
	MarkerAO_ao_1,
	MarkerEnemies_ao_1,
	MarkerCarSpawn_ao_1,
	MarkerNaval_ao_1,
	TS_OpforEnemiesLight,
	TS_OpforEnemiesHeavy,
	TS_OpforVehiclesLight,
	TS_OpforVehiclesMedium,
	TS_OpforNavalLight,
	TS_OpforNavalHeavy,
	6,
	"2",
	[3,8],
	[0,2],
	[1,3],
	[3,9],
	[3,6],
	[10,20],
	Marker_ao_1_landing_unload,
	true
	];

Mission_AO_2_Data = [
	MarkerAO_ao_2,
	MarkerEnemies_ao_2,
	MarkerCarSpawn_ao_2,
	MarkerNaval_ao_1,
	TS_OpforEnemiesLight,
	TS_OpforEnemiesHeavy,
	TS_OpforVehiclesLight,
	TS_OpforVehiclesMedium,
	TS_OpforNavalLight,
	TS_OpforNavalHeavy,
	6,
	"4",
	[6,10],
	[1,4],
	[1,3],
	[7,10],
	[5,8],
	[10,20],
	Marker_ao_1_landing_unload,
	false
	];

execFSM "scripts\fsm\tasks.fsm";