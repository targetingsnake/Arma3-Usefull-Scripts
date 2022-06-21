if(!isServer) exitWith {};

_groupInf = _this select 0;
_groupVic = _this select 1;
_vehicle = _this select 2;
_dismointPos = _this select 3;
_vehicleDeletePos = _this select 4;

_dismountPos2D = getMarkerPos _dismointPos;

_deletePosition = getMarkerPos _vehicleDeletePos;

_vehicle execVm "scripts\GarbageCleaner\specialUnit\singleVehicle.sqf";

if (!alive _vehicle) exitWith {};

waitUntil {
	sleep 10;
	_distance = _vehicle distance2D _dismountPos2D;
	_distanceGood = false;
	if (typeOf _vehicle == "CUP_O_ZUBR_RU") then {
		_distanceGood = _distance < 51
	} else {
		_distanceGood = _distance < 26;
	};
	if (!alive _vehicle) then {
		_distanceGood = true;
	};
	_distanceGood
};

if (!alive _vehicle) exitWith {};

_fuel = fuel _vehicle;
_vehicle setFuel 0;

_smokeShell = [
	"Smoke_82mm_AMOS_White",
	"Smoke_120mm_AMOS_White"
];

_smokeShellAdditional = [
	"G_40mm_SmokeRed", 
	"G_40mm_SmokeGreen", 
	"G_40mm_SmokeYellow", 
	"G_40mm_SmokePurple", 
	"G_40mm_SmokeBlue", 
	"G_40mm_SmokeOrange",
	"SmokeShellRed",
	"SmokeShellGreen",
	"SmokeShellYellow",
	"SmokeShellPurple",
	"SmokeShellBlue",
	"SmokeShellOrange"
];

_innerRadius = 10;
_middleRadius = 20;
_outerRadius = 40;
_amount = 5;

if (typeOf _vehicle == "CUP_O_ZUBR_RU") then {
	_innerRadius = 40;
	_middleRadius = 50;
	_outerRadius = 70;
	_amount = 7;
};

for "_i" from 0 to 3 do {
	_AmmoType = selectRandom _smokeShell;
	if (_i > 1) then {
		_AmmoType = selectRandom _smokeShellAdditional;
	};
	if (_i > 1) then {
		_fire = [getPos _vehicle, _AmmoType, _outerRadius, _amount, 0, { false }, _middleRadius, 0] spawn BIS_fnc_fireSupportVirtual;
	} else {
		_fire = [getPos _vehicle, _AmmoType, _middleRadius, _amount, 0, { false }, _innerRadius] spawn BIS_fnc_fireSupportVirtual;
	}
};

sleep 10;

if (!alive _vehicle) exitWith {};
{
	moveOut _x;
} forEach units _groupInf;
_groupInf leaveVehicle _vehicle;

sleep 120;
if (!alive _vehicle) exitWith {};
_vehicle setFuel _fuel;

_wp = _groupVic addWaypoint [getMarkerPos _vehicleDeletePos, 0];
_wp setWaypointBehaviour "AWARE";
_wp setWaypointCombatMode "RED";
_wp setWaypointForceBehaviour true;
_wp setWaypointSpeed "FULL";
_wp setWaypointType "MOVE";


sleep 60;

if (!alive _vehicle) exitWith {};
waitUntil {
	sleep 10;
	_distance = _vehicle distance2D _deletePosition;
	_distanceGood = _distance < 150;
	if (!alive _vehicle) then {
		_distanceGood = true;
	};
	_distanceGood
};
if (!alive _vehicle) exitWith {};
deleteVehicleCrew _vehicle;
deleteVehicle _vehicle;

if (MissionDebug) then {
	"Boat has been despawned" remoteExec ["systemChat",0,false] ;
}