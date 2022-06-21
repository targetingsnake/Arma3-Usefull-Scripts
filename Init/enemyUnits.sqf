if (!isServer) exitWith {};

TS_OpforEnemiesHeavy = [];
TS_OpforEnemiesLight = [];
TS_OpforVehiclesMedium = [];
TS_OpforVehiclesLight = [];
TS_OpforNavalHeavy = [];
TS_OpforNavalLight = [];

#include "Units\cup.sqf"
#include "Units\rhs.sqf"

if (TS_hasRHS) then {
	{
		TS_OpforEnemiesHeavy pushBack _x;	
	} forEach _unitTypes_heavy_RHS_AFRF;
	{
		TS_OpforEnemiesLight pushBack _x;
	} forEach _unitTypes_light_RHS_GREF;
	{
		TS_OpforVehiclesMedium pushBack _x;
	} forEach _vehicleTypes_heavy_RHS_AFRF;
	{
		TS_OpforVehiclesLight pushBack _x;
	} forEach _vehicleTypes_light_RHS_GREF;
	{
		TS_OpforNavalHeavy pushBack _x;
	} forEach _vehicleTypes_heavy_naval_RHS_AFRF;
	{
		TS_OpforNavalLight pushBack _x;
	} forEach _vehicleTypes_light_naval_RHS_AFRF;
};

if (TS_hasCUP) then {
	{
		TS_OpforEnemiesHeavy pushBack _x;	
	} forEach _unitTypes_heavy_CUP;
	{
		TS_OpforEnemiesLight pushBack _x;
	} forEach _unitTypes_light_CUP;
	{
		TS_OpforVehiclesMedium pushBack _x;
	} forEach _vehicleTypes_heavy_CUP;
	{
		TS_OpforVehiclesLight pushBack _x;
	} forEach _vehicleTypes_light_CUP;
	{
		TS_OpforNavalHeavy pushBack _x;
	} forEach _vehicleTypes_heavy_naval_CUP;
	{
		TS_OpforNavalLight pushBack _x;
	} forEach _vehicleTypes_light_naval_CUP;
};
