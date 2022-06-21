if(!isServer) exitWith {};

_system = _this select 0;
_tgt = _this select 1;
_range = _this select 2;


if(MissionDebug) then {
	"Targeting started" remoteExec ["systemChat",0,false] ;
};

group _system setCombatMode "BLUE";
 
sleep 20;

group _system setCombatMode "RED";

_dist = _tgt distance _system;
if (_dist > _range && isNull objectParent _tgt) then {
	if(MissionDebug) then {
		"Targeting terminated" remoteExec ["systemChat",0,false] ;
	};
};
if (_dist > _range || isNull objectParent _tgt) exitWith {
	TS_AA_hasTarget = TS_AA_hasTarget - [_system];
};

_system enableSimulationGlobal true;

_inRange = true;
while {_inRange} do {
	_inRange = false;
	_dist = _tgt distance _system;
	if (_dist <= _range) then {
		if !(isNull objectParent _tgt) then {
			if (alive _tgt) then {
				_inRange = true;
			}
		};
	};
	_system doTarget vehicle _tgt;
	_system doFire _tgt;
	_system fireAtTarget [vehicle _tgt];
	sleep 5;
	_system setVehicleAmmo 1;
};

_system enableSimulationGlobal false;

TS_AA_hasTarget = TS_AA_hasTarget - [_system];

if(MissionDebug) then {
	"Targeting terminated" remoteExec ["systemChat",0,false] ;
};