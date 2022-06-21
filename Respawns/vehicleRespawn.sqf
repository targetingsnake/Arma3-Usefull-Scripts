
if (!isServer) exitWith {};

_position = getPos _this;
_type = typeOf _this;
_vehicle = _this;
_direction = getDir _this;

while {true} do {
	if(!alive _vehicle) then {
		sleep 60;
		if (MissionDebug) then {
			systemChat "Vehicle Down";
		};
		deleteVehicleCrew _vehicle;
		deleteVehicle _vehicle;
		_vehicle = _type createVehicle _position;
		_vehicle setDir _direction;
		clearItemCargoGlobal _vehicle;
		clearMagazineCargoGlobal _vehicle;
		clearWeaponCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
		{  
			_x addCuratorEditableObjects [[_vehicle], true]; 
		} forEach allCurators;
		if (MissionDebug) then {
			"Vehicle Respawned" remoteExec ["systemChat",0,false] ;
		};
		_rnd = random 1;
		if (_rnd <= 0.4) then {
			execVm "scripts\AntiAir\others\Reveal.sqf";
		}
	};
	sleep 30;
};