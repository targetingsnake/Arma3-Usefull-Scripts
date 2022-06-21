if (!isServer) exitWith {};

_markerName = _this select 0;
_markerAOPos = getMarkerPos _markerName;
_taskID = _this select 1;
_taskType = _this select 2;
_distance = 200;

switch (_taskType) do {
	case 0: {
		[true, _taskID, "MoveToMark", _markerAOPos, "CREATED", -1, true, "getin", false] call BIS_fnc_taskCreate;
	};
	case 1: {
		[true, _taskID, "RetreatToMark", _markerAOPos, "CREATED", -1, true, "danger", false] call BIS_fnc_taskCreate;
	};
	case 2: {
		[true, _taskID, "ReturnToBase", _markerAOPos, "CREATED", -1, true, "getout", false] call BIS_fnc_taskCreate;
	};
	case 3: {
		[true, _taskID, "MoveToEnemyHQ", _markerAOPos, "CREATED", -1, true, "scout", false] call BIS_fnc_taskCreate;
		_distance = 1000;
	};
};

_playerArrived = false;

waitUntil{
	sleep 2;
	_playersTotal = TS_Infantry_Players;
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