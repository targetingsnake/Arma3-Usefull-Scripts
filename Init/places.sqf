if (!isServer) exitWith {};

TS_City = nearestLocations [[0,0,0], ["NameCity"], 50000];
TS_Capital = nearestLocations [[0,0,0], ["NameCityCapital"], 50000];
TS_Village = nearestLocations [[0,0,0], ["NameVillage"], 50000];
TS_FlatArea = nearestLocations [[0,0,0], ["FlatArea"], 50000];