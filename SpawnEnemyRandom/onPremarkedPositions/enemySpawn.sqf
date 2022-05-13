if (!isServer) exitWith {};

_markerAO = _this select 0;
_markerEnemies = _this select 1;
_markerCarSpawn = _this select 2;
_UnitTypes_light = _this select 3;
_UnitTypes_heavy = _this select 4;
_vehicleTypes_light = _this select 5;
_vehicleTypes_heavy = _this select 6;
_waveGoals = _this select 7;
_taskID = _this select 8;
_minMaxGroup = _this select 9;
_minMaxVehicle = _this select 10;
_groupSizeInf = _this select 11;
_groupSizeVic = _this select 12;

_heavyTendence = 0;
_heavyVehicleTendence = 0;
if (count _UnitTypes_light == 0) then {
	_heavyTendence = 2;
};
if (count _vehicleTypes_light == 0) then {
	_heavyVehicleTendence = 2;
};
_markerAOPos = getMarkerPos _markerAO;

[true, _taskID, "DefendArea", _markerAOPos, "ASSIGNED", -1, true, "defend", false] call BIS_fnc_taskCreate;

_waveCounter = 0;
_playerNear = true;

_respawnTaskID = "10" + _taskID;
[missionNamespace, _markerAO] call BIS_fnc_addRespawnPosition;
[true, [_respawnTaskID,_taskID], "RespawnCreated", _markerAOPos, "SUCCEEDED", -1, true, "Respawn", false] call BIS_fnc_taskCreate;

while {_playerNear} do {
	_pilotsActive = [];
	if ( !isNull (missionNamespace getVariable ["pilot1", objNull])) then {
		_pilotsActive pushBack pilot1;
	};
	if ( !isNull (missionNamespace getVariable ["pilot2", objNull])) then {
		_pilotsActive pushBack pilot2;
	};
	if ( !isNull (missionNamespace getVariable ["pilot3", objNull])) then {
		_pilotsActive pushBack pilot3;
	};
	if ( !isNull (missionNamespace getVariable ["pilot4", objNull])) then {
		_pilotsActive pushBack pilot4;
	};
	_playersTotal = [];
	if (MissionDebug) then {
		_playersTotal = allPlayers;
		_playersTotal = _playersTotal - _pilotsActive;
	} else {
		_zeuses = [];
		{
			_unit = getAssignedCuratorUnit _x; 
			_zeuses pushBack _unit;
		} forEach allCurators;
		_playersTotal = allPlayers - _zeuses;
		_playersTotal = _playersTotal - _pilotsActive;
	};
	_playerNear = false;
	{
		_dst = _x distance2D _markerAOPos;
		if (_dst <= 400) then {
			_playerNear = true;
		};
	} forEach _playersTotal;
	if (_playerNear) then {
		_players = [];
		if ( count _playersTotal > 0) then {
			{
				if ((_x distance2D _markerAOPos) < 250 ) then {
					_players pushBack _x
				}
			} forEach _playersTotal;
		};
		_enemieGroups = _minMaxGroup call BIS_fnc_randomInt;
		_groups = [];
		_vehicles = [];
		_vehicleGroups = [];
		_totalEnemy = 0;
		for "_i" from 0 to _enemieGroups do {
			_group = createGroup east;
			_EnemyNumber = _groupSizeInf call BIS_fnc_randomInt;
			_spawnPos = selectRandom _markerEnemies;
			_spawnPos = getMarkerPos _spawnPos;
			_totalEnemy = _totalEnemy + _EnemyNumber;
			for "_j" from 0 to _EnemyNumber do {
				_ChanceHeavyTypeGuess = random 1;
				_unitRandom = "";
				if (_ChanceHeavyTypeGuess < _heavyTendence) then {
					_unitRandom = selectRandom _UnitTypes_heavy;
				} else {
					_unitRandom = selectRandom _UnitTypes_light;
				};
				if (_unitRandom != "") then {
					_spawnedUnit = _group createUnit [_unitRandom, _spawnPos, [], 20, "FORM"];
					{  
						_x addCuratorEditableObjects [[_spawnedUnit], true]; 
					} forEach allCurators;
				};
			};
			_playerSelected = false;
			_player = objNull;
			_position = objNull;
			if (count _players > 0) then {
				_player = selectRandom allPlayers;
				_position = getPos _player;
			} else {
				_position = _markerAOPos;
			};
			_wp = _group addWaypoint [_position, 15];
			_wp setWaypointBehaviour "AWARE";
			_wp setWaypointCombatMode "RED";
			_wp setWaypointForceBehaviour true;
			_wp setWaypointSpeed "FULL";
			_wp setWaypointType "GUARD";
			_groups pushBack _group;
			if (SpawnDelay) then {
				sleep 2;
			};
		};
		_vehiclesNumber = _minMaxVehicle call BIS_fnc_randomInt;
		if (_vehiclesNumber > 0) then {
			for "_i" from 0 to _vehiclesNumber do {
				_EnemyNumber = _groupSizeVic call BIS_fnc_randomInt;
				_heavyVehicleTypeGuess = random 1;
				_vehicleType = "";
				if (_heavyVehicleTypeGuess < _heavyVehicleTendence) then {
					_vehicleType = selectRandom _vehicleTypes_heavy;
				} else {
					_vehicleType = selectRandom _vehicleTypes_light;
				};
				_spawnPos = selectRandom _markerCarSpawn;
				_spawnPos = getMarkerPos _spawnPos;
				_vehicle = _vehicleType createVehicle _spawnPos;
				clearItemCargoGlobal _vehicle;
				clearMagazineCargoGlobal _vehicle;
				clearWeaponCargoGlobal _vehicle;
				clearBackpackCargoGlobal _vehicle;
				_group = createVehicleCrew _vehicle;
				{  
						_x addCuratorEditableObjects [[_vehicle], true]; 
				} forEach allCurators;
				_totalEnemy = _totalEnemy + _EnemyNumber;
				for "_j" from 0 to _EnemyNumber do {
					_unitRandom = "";
					if (_heavyVehicleTypeGuess < _heavyVehicleTendence) then {
						_unitRandom = selectRandom _UnitTypes_heavy;
					} else {
						_unitRandom = selectRandom _UnitTypes_light;
					};
					if (_unitRandom != "") then {
						_spawnedUnit = _group createUnit [_unitRandom, _vehicle, [], 20, "CARGO"];
						{  
							_x addCuratorEditableObjects [[_spawnedUnit], true]; 
						} forEach allCurators;
					};
				};
				_playerSelected = false;
				_player = objNull;
				_player = objNull;
				_position = objNull;
				if (count _players > 0) then {
					_player = selectRandom allPlayers;
					_position = getPos _player;
				} else {
					_position = _markerAOPos;
				};
				_wp = _group addWaypoint [getPos _player, 15];
				_wp setWaypointBehaviour "AWARE";
				_wp setWaypointCombatMode "RED";
				_wp setWaypointForceBehaviour true;
				_wp setWaypointSpeed "FULL";
				_wp setWaypointType "GUARD";
				_vehicleGroups pushBack [_group, _vehicle];
				if (SpawnDelay) then {
					sleep 2;
				}
			};
		};
		waitUntil {
			sleep 5;
			_WaveRunning = 0;
			for "_i" from 0 to _enemieGroups do {
				_WaveRunning = _WaveRunning + ({ alive _x } count units (_groups select _i));
			};
			if (_vehiclesNumber > 0) then {
				for "_i" from 0 to _vehiclesNumber do {
					_group = _vehicleGroups select _i;
					_WaveRunning = _WaveRunning + ({ alive _x } count units (_group select 0));
				};
			};
			(_WaveRunning / _totalEnemy) < 0.25
		};
		if (DeleteRestWave) then {
			for "_i" from 0 to _enemieGroups do {
				{
					deleteVehicle _x;
				} forEach units (_groups select _i);
				deleteGroup (_groups select _i);
			};
			if (_vehiclesNumber > 0) then {
				for "_i" from 0 to _vehiclesNumber do {
					{
						_vehicle = _x select 1;
						_group = _x select 0;
						{
							_vehicle deleteVehicleCrew _x;
						} forEach units _group;
						deleteVehicle _vehicle;
					} forEach _vehicleGroups;
				};
			};
		};
		_waveCounter = _waveCounter + 1;
		if (MissionDebug) then {
			_textDebug = "Wave " + str _waveCounter + " from " + str _waveGoals + " over";
			_textDebug remoteExec ["systemChat",0,false] ;
		};
		if (_waveCounter >= _waveGoals) then {
			[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
		};
		_artilleryChoosen = random 1;
		if(_artilleryChoosen >= 0.50) then {
			_script = _markerAO execVM "scripts\artillery.sqf";
			sleep 10;
		} else {
			sleep 10;
		};
		_heavyTendence = _heavyTendence + 0.2;
		_heavyVehicleTendence = _heavyVehicleTendence + 0.2;
	} else {
		sleep 30;
		_TSKstate = "2" call BIS_fnc_taskState;
		_TSKstate = (_TSKstate == "SUCCEEDED");
		if (!_TSKstate) exitWith {
			if (MissionDebug) then {
				"Spawnscript aborted" remoteExec ["systemChat",0,false] ;
			};
		};
	};
};