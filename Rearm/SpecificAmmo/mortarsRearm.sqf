if (!isServer) exitWith {};

_box = _this select 0;

_mortars = [mortar01, mortar02];

{
	_posBox = getPos _box;
	_posMortar = getPos _x;
	_dst = _posMortar distance2D _posBox;
	if ( _dst <= 250 ) then {
		[_x,"scripts\mortarRearm.sqf"] remoteExec ["BIS_fnc_execVM",_x,false]
	};
} forEach _mortars;

deleteVehicle (_box);