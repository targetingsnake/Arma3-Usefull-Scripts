if (!isServer) exitWith {};

_systemsAndRange = _this;

while {true} do {
	{
		_system = _x select 0;
		_range = _x select 1;
		_range = _range * 1000;
		_commandCenter = _x select 2;
		_targets = [];
		_activate = false;
		{
			_dist = _x distance _system;
			if (_dist <= _range) then {
				if !(isNull objectParent _x) then {
					_activate = true;
					_targets pushBack _x;
				};
			};
		} forEach TS_Pilots;
		{
			_dist = _x distance _system;
			if (_dist <= _range) then {
				if !(isNull objectParent _x) then {
					_activate = true;
					_targets pushBack _x;
				};
			}
		} forEach TS_Zeuses;
		_system enableSimulation _activate;
		if (count _targets > 0) then {
			if ({_x == _system} count TS_AA_hasTarget == 0) then {
				TS_AA_hasTarget pushBack _system;
				_tgt = selectRandom _targets;
				[_system, _tgt, _commandCenter, _range] execVm "scripts\AntiAir\targeting\targetDialouge.sqf";
				[_system, _tgt, _range] execVm "scripts\AntiAir\targeting\aimAtTArget.sqf";
			}
		};
	} forEach _systemsAndRange;
	sleep 1;
}