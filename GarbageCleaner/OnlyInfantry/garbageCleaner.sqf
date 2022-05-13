if (!isServer) exitWith{};

while {true} do {
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
	{
		_pos = getPos _x;
		_deletable = true;
		{
			_playerPos = getPos _x;
			_dst = _pos distance2D _playerPos;
			if (_dst < 200) then {
				_deletable = false;
			} else {

			};
		} forEach _playersTotal;
		_saveZone = getMarkerPos "marker_ao_3";
		_dst = _saveZone distance2D _pos;
		if (_dst < 1000) then {
			_deletable = false;
		};
		if (_deletable) then {
			deleteVehicle _x;
		};
		if (DelayDespawnType) then {
			sleep 30;
		};
	} forEach allDeadMen;
	if (!DelayDespawnType) then {
		sleep 30;
	}
}