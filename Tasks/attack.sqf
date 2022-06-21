if (!isServer) exitWith {};

_markerAO = _this select 0;
_taskID = _this select 1;

_markerAoPos = getMarkerPos _markerAO;

_markerName = "Attack_Task_" + _taskID;

_markerEnemyHQ = createMarkerLocal [_markerName, _markerAoPos];
_markerEnemyHQ setMarkerShapeLocal "ICON";
_markerEnemyHQ setMarkerTypeLocal "o_hq";
_markerEnemyHQ setMarkerText "EnemyHQ";

[true, _taskID, "AttackEnemyHQ", _markerAoPos, "CREATED", -1, true, "attack", false] call BIS_fnc_taskCreate;

waitUntil {
	sleep 5;
	_unitsAvailable = true;
	{
		_unitSide = side _x;
		if (_unitSide == east) then {
			_pos = getPos _x;
			_dst = _markerAoPos distance2D _pos;
			if (_dst <= 500) then {
				if (isDamageAllowed _x) then {
					_unitsAvailable = false;
				};
			};
		};
	} forEach allUnits;
	_unitsAvailable
};

waitUntil{
	_playerArrived = false;
	sleep 2;
	_playersTotal = TS_Infantry_Players;
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