if (!isServer) exitWith {};

_prisonPos = getPos _this select 0;
_prisonOrientation = _this select 1;

_rotation_allowed = false;

if (!_rotation_allowed) then {
	_prisonOrientation = 0;
};

//_prisonPos = getPos nearestLocation [player, "FlatArea"];
//_prisonOrientation = 0;
_baseSurrounding = "Land_HBarrier_5_F";
_gate = "Land_City_Gate_F";
_speaker = "Land_Loudspeakers_F";
_backpack = "B_AssaultPack_blk";
_billboard = "Land_Billboard_F";

_pos = [_prisonPos, 0, 300, 20, 0, 0.1, 0] call BIS_fnc_findSafePos;

_vehicle = createVehicle [_speaker, _pos, [], 0, "CAN_COLLIDE"];
_vehicle setDir _prisonOrientation;

{
	[_x, true] remoteExec ["hideObject", 0, false];
} forEach nearestTerrainObjects [_vehicle, [], 25, false, true];

[_vehicle, _prisonOrientation, -2.5, 5, 0, 0, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, -2.5, 5, 1.388, 0, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, 2.5, 5, 0, 0, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, 2.5, 5, 1.388, 0, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";

[_vehicle, _prisonOrientation, 5, 2.5, 0, 90, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, 5, 2.5, 1.388, 90, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, 5, -2.5, 0, 90, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, 5, -2.5, 1.388, 90, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";

[_vehicle, _prisonOrientation, 2.5, -5, 0, 0, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, 2.5, -5, 1.388, 0, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, -2.5, -5, 0, 0, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, -2.5, -5, 1.388, 0, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";

[_vehicle, _prisonOrientation, -5, -2.5, 0, 90, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, -5, -2.5, 1.388, 90, _baseSurrounding, false] execVM "scripts\ObjectPlacing\placeByVector.sqf";

[_vehicle, _prisonOrientation, -2.5, 2.6, 0, 90, _gate, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, -4, 5, 0, 0, _speaker, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";
[_vehicle, _prisonOrientation, -15, 2.5, 0, 270, _billboard, false, "scripts\ObjectPlacing\afterPlacingScripts\SetBillboardTexture.sqf", [0, "Images\Antistasi.paa"]] execVM "scripts\ObjectPlacing\placeByVector.sqf";

_vehicle enableSimulationGlobal false;
[_vehicle, true] remoteExec ["hideObject", 0, false];