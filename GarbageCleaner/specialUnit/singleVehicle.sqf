if(!isServer) exitWith {};

_vehicle = _this;

waitUntil {
	sleep 3;
	_crew = [];
	{
		_ai = _x select 0;
		_crew pushBack _ai;
	} forEach fullCrew _vehicle;
	_aliveCrew = {alive _x} count _crew;
	_crewDead = _aliveCrew == 0;
	!alive _vehicle || _vehicle isEqualTo objNull || _crewDead
};

if !(_vehicle isEqualTo objNull) then {
	_vehicle remoteExec ["deleteVehicleCrew", _vehicle]; 
	deleteVehicle _vehicle;
};

if(MissionDebug) then {
	"Single Vehicle Deleted" remoteExec ["systemChat",0,false] ;
};
