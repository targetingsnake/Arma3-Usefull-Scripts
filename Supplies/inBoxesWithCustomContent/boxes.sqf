if (!isServer) exitWith {};
_ammo = _this select 2;
_crate = _this select 1;
_marker = _this select 0;
_typeOfCrate = _this select 3;
_position = getMarkerPos _marker; 
_jeep = objNull;
_distance = 1000;
while {true} do {
	if (! isNull _jeep) then {
		_distance = _position distance2D getPos _jeep
	} else {
		_distance = 10000;
	};
	if (_distance > 100) then { 
		_jeep = _crate createVehicle _position;
		_jeep allowDamage false;
		clearItemCargoGlobal _jeep;
		clearMagazineCargoGlobal _jeep;
		clearWeaponCargoGlobal _jeep;
		clearBackpackCargoGlobal _jeep;
		switch (_typeOfCrate) do {
			case 0: {
				[_jeep, true, [0,2,0]] call ace_dragging_fnc_setDraggable; //disable dragging
				[_jeep, true, [0,2,0]] call ace_dragging_fnc_setCarryable; //disable carrying
				_detailArray = [
					_jeep,
					"<t color='#FF0000'>Delete Crate</t>",
					"", "",
					"true", "true",
					{},
					{},
					{deleteVehicle (_this select 0);},
					{},
					[], 10, nil, true, false, false
				];
				[_detailArray, BIS_fnc_holdActionAdd] remoteExec ["call",0,false] ;
				{
					_jeep addItemCargoGlobal _x;
				} forEach _ammo;
			};
			case 1: { //mortar ammo
				[_jeep, true, [0,2,0]] call ace_dragging_fnc_setDraggable; //disable dragging
				[_jeep, true, [0,2,0]] call ace_dragging_fnc_setCarryable; //disable carrying
				[_jeep, -1] call ace_rearm_fnc_setSupplyCount;
				_addActionArray = [
					"<t color='#C9C900'>Add Mortar Ammo</t>", 
					{ [_this,"scripts\mortarsRearm.sqf"] remoteExec ["BIS_fnc_execVM",2,false] },
					nil, 
					1, 
					true, 
					true, 
					"", 
					"(( getPos _target distance2D getPos mortar01) <= 250) || (( getPos _target distance2D getPos mortar02) <= 250)"];
				[_jeep, _addActionArray] remoteExec ["addAction",0,false] ;
			};
			case 2: { //building supplies ammo
				[_jeep, true, [0,6,0]] call ace_dragging_fnc_setDraggable; //disable dragging
				[_jeep, true, [0,6,0]] call ace_dragging_fnc_setCarryable; //disable carrying
				_addActionArray = [
					"<t color='#C9C900'>Add Building Supplies</t>", 
					{ [west, 1500, false] remoteExec ["acex_fortify_fnc_updateBudget", 2, false] ; deleteVehicle (_this select 0); }, 
					nil, 
					1, 
					true, 
					true, 
					"", 
					"(( getPos _target distance2D getMarkerPos 'marker_ao_1') <= 600) || (( getPos _target distance2D getMarkerPos 'marker_ao_2') <= 600) || (( getPos _target distance2D getMarkerPos 'marker_ao_3') <= 1200)"];
				[_jeep, _addActionArray] remoteExec ["addAction",0,false] ;
			}; 
			case 3: { //random loot via ace
				[_jeep, true, [0,6,0]] call ace_dragging_fnc_setDraggable; //disable dragging
				[_jeep, true, [0,6,0]] call ace_dragging_fnc_setCarryable; //disable carrying
				_detailArray = [
					_jeep,
					"<t color='#FF0000'>Delete Crate</t>",
					"", "",
					"true", "true",
					{},
					{},
					{deleteVehicle (_this select 0);},
					{},
					[], 10, nil, true, false, false
				];
				[_detailArray, BIS_fnc_holdActionAdd] remoteExec ["call",0,false] ;
				[_jeep, _ammo] execVm "scripts\Supplies\inBoxesWithCustomContent\RandomAceInventory.sqf";
			};
		};
		{  
			_x addCuratorEditableObjects [[_jeep], true]; 
		} forEach allCurators; 
		if (MissionDebug) then {
			"Box Respawned" remoteExec ["systemChat",0,false] ;
		};
	}; 
	sleep 30;
};