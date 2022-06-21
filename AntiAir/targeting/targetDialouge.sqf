if(!isServer) exitWith {};

_system = _this select 0;
_tgt = _this select 1;
_commandCenter = _this select 2;
_range = _this select 3;

_dir = _system getDir _tgt;
_directionCommand = "";

// from North
if (_dir <= 45 || _dir >= 315) then {
	_directionCommand = "north";
};

// From South
if (_dir >= 135 && _dir <= 225) then {
	_directionCommand = "south";
};

// From East
if (_dir > 45 && _dir < 135) then {
	_directionCommand = "east";
};

// From West
if (_dir > 225 && _dir < 315) then {
	_directionCommand = "west";
};

_playerCallsign = groupId group _tgt;
_callerCallsign = groupId group _commandCenter;

_callout = _playerCallsign + " this is " + _callerCallsign + " you are in restricted air space continue your flight to " + _directionCommand + " otherwise you will get shotdown within next 20 seconds.";

[_commandCenter, [TS_AviationChannel, _callout]] remoteExec ["customChat", 0, false] ;

sleep 20;

_dst = _tgt distance _system;
_callout = "";
if (_dst <= _range) then {
	_callout = _playerCallsign + " your time is over. You will get shot down!";
} else {
	_callout = _playerCallsign + " your out of restricted Airspace.";
};

[_commandCenter, [TS_AviationChannel, _callout]] remoteExec ["customChat", 0, false] ;