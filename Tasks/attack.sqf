if (!isServer) exitWith {};

_markerAO = _this select 0;
_taskID = _this select 1;

_markerAoPos = getMarkerPos _markerAO;

[true, _taskID, "AttackEnemyHQ", _markerAoPos, "ASSIGNED", -1, true, "attack", false] call BIS_fnc_taskCreate;

waitUntil {
	sleep 20;
	_unitsAvailable = true;
	{
		_unitSide = side _x;
		if (_unitSide == east) then {
			_pos = getPos _x;
			_dst = _markerAoPos distance2D _pos;
			if (_dst > 750) then {
				_unitsAvailable = false;
			}
		}
	} forEach allUnits;
	_unitsAvailable
};

waitUntil{
	_playerArrived = false;
	sleep 2;
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
	if ( count _playersTotal > 0) then {
		{
			if ((_x distance2D _markerAOPos) <  75 ) then {
				_playerArrived = true;
			}
		} forEach _playersTotal;
	};
	_playerArrived
};

[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;