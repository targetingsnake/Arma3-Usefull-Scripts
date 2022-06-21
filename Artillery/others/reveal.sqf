if (!isServer) exitWith {};

if (count TS_ArtilleryPositions <= 0) exitWith {
	if (MissionDebug) then {
		"All artillery positions has been revealed" remoteExec ["systemChat",0,false] ;
	}
};
_randomSelected = selectRandom TS_ArtilleryPositions;
_namePart = count TS_ArtilleryPositions;
TS_ArtilleryPositions = TS_ArtilleryPositions - [_randomSelected];


_pos = getMarkerPos _randomSelected;
_name = "arti_vis_" + str _namePart;

_marker = createMarkerLocal [_name, _pos];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerType "o_art";

[[west, "HQ"],"All units be advised artillery position has been found. Details can be seen on map."] remoteExec ["sideChat",0,false] ;