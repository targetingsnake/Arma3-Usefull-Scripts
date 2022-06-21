if (!isServer) exitWith {};

_prisonPos = getPos _this select 0;
_prisonOrientation = _this select 1;

_rotation_allowed = false;

if (!_rotation_allowed) then {
	_prisonOrientation = 0;
};

//_prisonPos = getPos nearestLocation [player, "FlatArea"];  
//_prisonOrientation = 0;  
_baseSurrounding = "Land_Mil_WallBig_4m_F";  
_baseSurroundingCorner = "Land_Mil_WallBig_Corner_F";  
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
  
[_vehicle, _prisonOrientation, -2, 5.3, 0, 0, _baseSurrounding, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
[_vehicle, _prisonOrientation, 2, 5.3, 0, 0, _baseSurrounding, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
[_vehicle, _prisonOrientation, 4, 4.4, 0, 180, _baseSurroundingCorner, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
[_vehicle, _prisonOrientation, -5.5, 4.4, 0, 90, _baseSurroundingCorner, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
 
[_vehicle, _prisonOrientation, -2, -5.3, 0, 180, _baseSurrounding, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
[_vehicle, _prisonOrientation, 2, -5.3, 0, 180, _baseSurrounding, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
[_vehicle, _prisonOrientation, 4, -4.9, 0, 270, _baseSurroundingCorner, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
[_vehicle, _prisonOrientation, -5.5, -4.9, 0, 0, _baseSurroundingCorner, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
 
[_vehicle, _prisonOrientation, 5.3, 2, 0, 90, _baseSurrounding, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
[_vehicle, _prisonOrientation, 5.3, -2, 0, 90, _baseSurrounding, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
 
[_vehicle, _prisonOrientation, -5.2, 2.8, 0, 270, _gate, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  
[_vehicle, _prisonOrientation, -5.3, -2, 0, 270, _baseSurrounding, true] execVM "scripts\ObjectPlacing\placeByVector.sqf";  

[_vehicle, _prisonOrientation, -15, 2.5, 0, 270, _billboard, false, "scripts\ObjectPlacing\afterPlacingScripts\SetBillboardTexture.sqf", [0, "Images\Antistasi.paa"]] execVM "scripts\ObjectPlacing\placeByVector.sqf";
 
_vehicle enableSimulationGlobal false;  
[_vehicle, true] remoteExec ["hideObject", 0, false];