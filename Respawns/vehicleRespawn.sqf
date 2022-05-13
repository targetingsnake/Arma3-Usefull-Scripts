
if (!isServer) exitWith {};

_position = getPos _this;
_type = typeOf _this;
_vehicle = _this;

while {true} do {
	if(!alive _vehicle) then {
		sleep 60;
		if (MissionDebug) then {
			systemChat "Vehicle Down";
		};
		deleteVehicleCrew _vehicle;
		deleteVehicle _vehicle;
		_vehicle = _type createVehicle _position;
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
	};
	sleep 30;
};