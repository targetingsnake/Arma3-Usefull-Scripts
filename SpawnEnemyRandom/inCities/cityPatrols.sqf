if (!isServer) exitWith {};

_name_start = "CR_";
_number = 0;
_locs = _this;
{
	_markerName = _name_start + str _number;
	_number = _number + 1;
	_markerAreaAO2 = createMarkerLocal [_markerName, getPos _x];
	_markerAreaAO2 setMarkerShapeLocal "ELLIPSE";
	_markerAreaAO2 setMarkerSizeLocal [150,150];
	_markerAreaAO2 setMarkerBrushLocal "Grid";
	_markerAreaAO2 setMarkerColor "ColorGreen";
} forEach _locs;