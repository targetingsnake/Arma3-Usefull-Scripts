if (!isServer) exitWith {};

_centerObj = _this select 0;
_baseOrientation = _this select 1;
_positionOffSetX = _this select 2;
_positionOffSetY = _this select 3;
_positionOffSetZ = _this select 4;
_rotation = _this select 5;
_objectType = _this select 6;
_simulation = _this select 7;

_rot = _rotation;
_rot = _rotation + _baseOrientation;

if ( _rot > 360 ) then {
	_rot = _rot - 360;
};

if (_rot < 0) then {
	_rot = _rot + 360;
};

_wpos = _centerObj modelToWorld [_positionOffSetX, _positionOffSetY, _positionOffSetZ];

_endPos = [_wpos select 0, _wpos select 1, _positionOffSetZ ];
_vehicle = createVehicle [_objectType, _endPos, [], 0, "CAN_COLLIDE"];
_vehicle setDir _rot;

if (!_simulation) then {
	_vehicle enableSimulationGlobal false;
};

if (count _this > 8 ) then {
	_script = _this select 8;
	if (count _this > 9) then {
		_arguments = _this select 9;
		[_vehicle, _arguments] execVM _script;
	} else {
		_arguments execVM _script;
	};
	systemChat "script";
};