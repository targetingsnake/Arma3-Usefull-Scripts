if (!isServer) exitWith {};

_markerName = _this select 0;
_markerAOPos = getMarkerPos _markerName;
_taskID = _this select 1;
_taskType = _this select 2;
_distance = 200;

switch (_taskType) do {
	case 0: {
		[true, _taskID, "MoveToMark", _markerAOPos, "ASSIGNED", -1, true, "getin", false] call BIS_fnc_taskCreate;
	};
	case 1: {
		[true, _taskID, "RetreatToMark", _markerAOPos, "ASSIGNED", -1, true, "danger", false] call BIS_fnc_taskCreate;
	};
	case 2: {
		[true, _taskID, "ReturnToBase", _markerAOPos, "ASSIGNED", -1, true, "exit", false] call BIS_fnc_taskCreate;
	};
	case 3: {
		[true, _taskID, "MoveToEnemyHQ", _markerAOPos, "ASSIGNED", -1, true, "scout", false] call BIS_fnc_taskCreate;
		_distance = 1000;
	};
};

_playerArrived = false;

waitUntil{
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
			if ((_x distance2D _markerAOPos) <  _distance ) then {
				_playerArrived = true;
			}
		} forEach _playersTotal;
	};
	_playerArrived
};

[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;