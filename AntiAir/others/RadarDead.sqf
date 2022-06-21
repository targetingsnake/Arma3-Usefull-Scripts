if (!isServer) exitWith {};

_vehicle = _this;

waitUntil{
	sleep 5;
	_test = !alive _vehicle;
	_test
};

"Radar has been destroyed." remoteExec ["hint", 0];