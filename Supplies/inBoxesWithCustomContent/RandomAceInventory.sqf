if (!isServer) exitWith {};

_crate = _this select 0;
_inventory = _this select 1;

_space = true;
_inventoryPoints = 20;
_loaded = 0;

_crate allowDamage false;
sleep 1;
while {_space} do {
	_space = false;
	_possible = [];
	{
		_newLoad = _loaded + (_x select 1);
		if (_newLoad < (_inventoryPoints + 1)) then {
			_possible pushBack _x;
			_space = true;
		}
	} forEach _inventory;
	if (_space) then {
		_spawnIn = selectRandom _possible;
		_spawnInClass = _spawnIn select 0;
		_spawnInValue = _spawnIn select 1;		 
		_loaded = _loaded + _spawnInValue;
		[_spawnInClass, _crate] call ace_cargo_fnc_loadItem;
	};
};

_crate allowDamage true;