if (!isServer) exitWith {};

_endType = _this; //true is win, false is lose

sleep 30;

if (_endType) then {
	["endGood", true, true, true, true] call BIS_fnc_endMission;
} else {
	["endBad", true, true, true, true] call BIS_fnc_endMission;
};