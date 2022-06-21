while {true} do {
	_players = [];
    _pilotsActive = [];

    if ( !isNull (missionNamespace getVariable ["pilot_1", objNull])) then {
        _pilotsActive pushBack pilot_1;
    };
    if ( !isNull (missionNamespace getVariable ["pilot_2", objNull])) then {
        _pilotsActive pushBack pilot_2;
    };
    if ( !isNull (missionNamespace getVariable ["pilot_3", objNull])) then {
        _pilotsActive pushBack pilot_3;
    };
    if ( !isNull (missionNamespace getVariable ["pilot_4", objNull])) then {
        _pilotsActive pushBack pilot_4;
    };
    if ( !isNull (missionNamespace getVariable ["pilot_5", objNull])) then {
        _pilotsActive pushBack pilot_5;
    };
    if ( !isNull (missionNamespace getVariable ["pilot_6", objNull])) then {
        _pilotsActive pushBack pilot_6;
    };

	TS_Pilots = _pilotsActive;

	_zeuses = [];
	{
		_unit = getAssignedCuratorUnit _x; 
		_zeuses pushBack _unit;
	} forEach allCurators;

	TS_Zeuses = _zeuses;

    _playersInf = allPlayers - _pilotsActive;

    if (!MissionDebug) then {
        
        _players = _playersInf - _zeuses;
    } else {
		_players = _playersInf;
	};

	TS_Infantry_Players = _players;

	sleep 15;
};