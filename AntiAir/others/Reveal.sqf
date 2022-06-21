if (!isServer) exitWith {};

if (count TS_AA_Positions <= 0) exitWith {
	if (MissionDebug) then {
		"All AA positions has been revealed" remoteExec ["systemChat",0,false] ;
	}
};
_randomSelected = selectRandom TS_AA_Positions;
_namePart = count TS_AA_Positions;
TS_AA_Positions = TS_AA_Positions - [_randomSelected];


_pos = getMarkerPos _randomSelected;
_name = "aa_vis_" + str _namePart;

_marker = createMarkerLocal [_name, _pos];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerType "o_antiair";


[[west, "BLU"],"All units be advised anti-air position has been found. Details can be seen on map."] remoteExec ["sideChat",0,false] ;