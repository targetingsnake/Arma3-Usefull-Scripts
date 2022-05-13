if (!isServer) exitWith {};

_ammoTypes = [
	["Sh_82mm_AMOS", 50, 200, 10, 30, 2],
	["Smoke_120mm_AMOS_White", 100, 300, 10, 20, 2],
	["Cluster_155mm_AMOS", 100, 300, 5, 15, 2],
	["Sh_155mm_AMOS", 100, 300, 10, 20, 2],
	["M_Mo_82mm_AT_LG", 30, 300, 10, 30, 1],
	["rhs_ammo_fab500", 500, 600, 3, 6, 1],
	["rhs_ammo_fab250", 500, 600, 4, 8, 1],
	["rhs_ammo_fab100", 100, 600, 7, 13, 1],
	["rhs_ammo_ofab250", 100, 600, 7, 13, 1]
];

_markername = _this;

_bombardmentRounds = [0,3] call BIS_fnc_randomInt;
if (MissionDebug) then {
		_text = "Bombardement Rounds: " + str _bombardmentRounds;
		_text remoteExec ["systemChat",0,false] ;;
	};
for "_j" from 0 to _bombardmentRounds do {
	_aoCenter = getMarkerPos _markername;
	_rndAmmo = selectRandom _ammoTypes;
	_AmmoType = _rndAmmo select 0;
	_saveDistance = _rndAmmo select 1;
	_maxDistance = _rndAmmo select 2; 
	_minRounds = _rndAmmo select 3;
	_maxRounds = _rndAmmo select 4;
	_FireType = _rndAmmo select 5;
	_target = _aoCenter;
	_RandomRoundNumber = [_minRounds,_maxRounds] call BIS_fnc_randomInt;
	if (MissionDebug) then {
		_text = "Round " + str _j + " of " + str _bombardmentRounds + "; Artillery Rounds: " + str _RandomRoundNumber + "; Choosen Ammo: " + _AmmoType;
		_text remoteExec ["systemChat",0,false] ;;
	};
	switch (_FireType) do {
		case 1: {
			for "_i" from 1 to 3 do {
				_target = _aoCenter;
				_distanceRnd = [_saveDistance,_maxDistance] call BIS_fnc_randomInt;
				_heading = random 360;
				_target = _target getPos [ _distanceRnd , _heading ];
				_bomb = _AmmoType createVehicle _target;
				_sleepSeconds = [0,2] call BIS_fnc_randomInt;
				sleep _sleepSeconds;
			};
		};
		case 2: {
			_fire = [_target, _AmmoType, _maxDistance, _RandomRoundNumber, [0, 2], { false }, _saveDistance, 400] spawn BIS_fnc_fireSupportVirtual;
			sleep 10;
		};
	};
};