//if (!isServer) then {
//	systemChat "No Server.";
//	};
if (!isServer) exitWith{};

_designatedPos = _this select 0 ; 
_type = _this select 1 ; 
_executionSide = _this select 2;
_playerChar = _this select 3;

if (artilleryScriptRunning) then {
	[[_executionSide, "PAPA_BEAR"],"Artillery still firing."] remoteExec ["sideChat",0,false] ;
};

if (artilleryScriptRunning) exitWith{};

artilleryScriptRunning = true;
publicVariable "artilleryScriptRunning";

_pos_x = _designatedPos select 0;
_pos_y = _designatedPos select 1;

_mapPos = mapGridPosition _designatedPos;
_strReq = format ["Reqesting artillery support on Grid %1 .", _mapPos];
[_playerChar,_strReq] remoteExec ["sideChat",0,false] ;

// create marker for artillery target
_marker = createMarker ["ArtilleryTarget", _designatedPos, 1, _playerChar];
_marker setMarkerType "hd_destroy";
_marker setMarkerShape "ICON";
_marker setMarkerColor "ColorRed";
_marker setMarkerText "Artillery Target";

_artillerys = [] ;
_RocketArti = [] ;
_mortarRhsRU = [mortar1_1] ;

_delayNextStrike = 0;
_delayNextRocketStrike = 0;

if ( _pos_x == 0 ) exitWith {
	[[_executionSide, "PAPA_BEAR"],"Turn on your Laser"] remoteExec ["sideChat",0,false] ;
	artilleryScriptRunning = false;
	publicVariable "artilleryScriptRunning";
	};
	
if ( _pos_y == 0 ) exitWith {
	[[_executionSide, "PAPA_BEAR"],"Turn on your Laser"] remoteExec ["sideChat",0,false] ;
	artilleryScriptRunning = false;
	publicVariable "artilleryScriptRunning";
	};

if ( targetingsnakesArtilleryCooldown - 1320 > servertime ) then {
	targetingsnakesArtilleryCooldown = servertime - 100;
	};
if ( targetingsnakesRocketCooldown - 1320 > servertime ) then {
	targetingsnakesRocketCooldown = servertime - 100;
	};
	
if ( targetingsnakesArtilleryCooldown - 1320 > servertime ) then {
	targetingsnakesArtilleryCooldown = servertime - 100;
	};

if ( targetingsnakesArtilleryCooldown > servertime && _type <= 4) exitWith {
	[[_executionSide, "PAPA_BEAR"],"Artillery not Availible"] remoteExec ["sideChat",0,false] ;
	};

if ( targetingsnakesRocketCooldown > servertime && _type >= 5 && _type <= 6 ) exitWith {
	[[_executionSide, "PAPA_BEAR"],"Rockets not Availible"] remoteExec ["sideChat",0,false] ;
	};

if ( targetingsnakesArtilleryCooldown > servertime && targetingsnakesRocketCooldown > servertime && _type == 7 ) exitWith {
	[[_executionSide, "PAPA_BEAR"],"Emergency ARS not Availible"] remoteExec ["sideChat",0,false] ;
	};

if ( targetingsnakesArtilleryCooldown > servertime && _type >= 8 && _type <= 13 ) exitWith {
	[[_executionSide, "PAPA_BEAR"],"Artillery not Availible"] remoteExec ["sideChat",0,false] ;
	};	

if (isNil "_designatedPos") then { 
	[[_executionSide, "PAPA_BEAR"],"Use Laserdesignator"] remoteExec ["sideChat",0,false] ; 
	artilleryScriptRunning = false;
	publicVariable "artilleryScriptRunning";
};
if (isNil "_type") then { 
	[[_executionSide, "PAPA_BEAR"],"We've got our own Problems."] remoteExec ["sideChat",0,false] ; 
	artilleryScriptRunning = false;
	publicVariable "artilleryScriptRunning";
};

{ _x setVehicleAmmo 1 } foreach _artillerys ;
{ _x setVehicleAmmo 1 } foreach _RocketArti ;
{ 
	_NetId = groupOwner group _x;
	[ vehicle _x , 1 ] remoteExec ["setVehicleAmmo", _NetId, false];
} foreach _mortarRhsRU ;

sleep 1;

_strAmmoType = "";
_intArtiRounds = 0;

// case 1-5 vanilla m4 scorcher artillery
// case 5-6 vanilla rocket artillery american sideChat
// case 7 fire artillery m4 and rockets from vanilla with he and cluster
// case 8-10 fire 2B14 Podnos HE
// case 11-13 fire 2B14 Podnos Smoke

switch ( _type ) do {
	case 0: {
		_strAmmoType = "2Rnd_155mm_Mo_LG";
		_intArtiRounds = 2 ;
		_delayNextStrike = 360;
		};
	case 1: {
		_strAmmoType = "4Rnd_155mm_Mo_guided";
		_intArtiRounds = 4 ;
		_delayNextStrike = 420;
		};
	case 2: {
		_strAmmoType = "32Rnd_155mm_Mo_shells";
		_intArtiRounds = 4 ;
		_delayNextStrike = 420;
		};
	case 3: {
		_strAmmoType = "32Rnd_155mm_Mo_shells";
		_intArtiRounds = 8 ;
		_delayNextStrike = 540;
		};
	case 4: {
		_strAmmoType = "32Rnd_155mm_Mo_shells";
		_intArtiRounds = 16 ;
		_delayNextStrike = 780;
		};
	case 5: {
		_strAmmoType = "12Rnd_230mm_rockets";
		_intArtiRounds = 12 ;
		_delayNextRocketStrike = 840;
		};
	case 6: {
		_strAmmoType = "12Rnd_230mm_rockets";
		_intArtiRounds = 12 ;
		_delayNextRocketStrike = 960;
		};
	case 7: {
		_strAmmoType = "32Rnd_155mm_Mo_shells";
		_intArtiRounds = 32 ;
		_delayNextRocketStrike = 1320;
		_delayNextStrike = 1320;
		};
	case 8: {
		_strAmmoType = "rhs_mag_3vo18_10";
		_intArtiRounds = 1 ;
		_delayNextStrike = 30;
		};
	case 9: {
		_strAmmoType = "rhs_mag_3vo18_10";
		_intArtiRounds = 2 ;
		_delayNextStrike = 60;
		};
	case 10: {
		_strAmmoType = "rhs_mag_3vo18_10";
		_intArtiRounds = 4 ;
		_delayNextStrike = 120;
		};
	case 11: {
		_strAmmoType = "rhs_mag_d832du_10";
		_intArtiRounds = 1 ;
		_delayNextStrike = 30;
		};
	case 12: {
		_strAmmoType = "rhs_mag_d832du_10";
		_intArtiRounds = 2 ;
		_delayNextStrike = 60;
		};
	case 13: {
		_strAmmoType = "rhs_mag_d832du_10";
		_intArtiRounds = 4 ;
		_delayNextStrike = 120;
		};
};

if ( _type <= 4 || _type >= 7 ) then {
	targetingsnakesArtilleryCooldown = servertime + _delayNextStrike;
	publicVariable "targetingsnakesRocketCooldown";
};
if ( _type >= 5 && _type <= 7 ) then {
	targetingsnakesRocketCooldown = serverTime + _delayNextRocketStrike;
	publicVariable "targetingsnakesArtilleryCooldown";
};

//create String
_strStartAnnounce = "";
switch (_type) do{
	case 0: {_strStartAnnounce = "Preparing Artillery, Firing 155mm 2 Rounds Laser-Guided!";};
	case 1: {_strStartAnnounce = "Preparing Artillery, Firing 155mm 4 Rounds Guided!";};
	case 2: {_strStartAnnounce = "Preparing Artillery, Firing 155mm 4 Rounds High-Explosiv!";};
	case 3: {_strStartAnnounce = "Preparing Artillery, Firing 155mm 8 Rounds High-Explosiv!";};
	case 4: {_strStartAnnounce = "Preparing Artillery, Firing 155mm 16 Rounds High-Explosiv!";};
	case 5: {_strStartAnnounce = "Preparing Artillery, Firing 12 Rockets High-Explosiv!";};
	case 6: {_strStartAnnounce = "Preparing Artillery, Firing 24 Rockets High-Explosiv!";};
	case 7: {_strStartAnnounce = "Preparing Artillery, Starting protocol for emergency artillery support now.!";};
	case 8: {_strStartAnnounce = "Preparing Artillery, Firing 82mm 1 Round HE!";};
	case 9: {_strStartAnnounce = "Preparing Artillery, Firing 82mm 2 Rounds HE!";};
	case 10: {_strStartAnnounce = "Preparing Artillery, Firing 82mm 4 Rounds HE!";};
	case 11: {_strStartAnnounce = "Preparing Artillery, Firing 82mm 1 Round Smoke!";};
	case 12: {_strStartAnnounce = "Preparing Artillery, Firing 82mm 2 Round Smoke!";};
	case 13: {_strStartAnnounce = "Preparing Artillery, Firing 82mm 4 Round Smoke!";};
};

[[_executionSide, "PAPA_BEAR"],_strStartAnnounce] remoteExec ["sideChat",0,false] ;

sleep 1;

if ( _type <= 4 ) then {
	_randomArti = selectRandom _artillerys;
	while { _isInRange = _designatedPos inRangeOfArtillery [[_randomArti], _strAmmoType];  ! _isInRange } do {
		_randomArti = selectRandom _artillerys;
		};
	_eta1 = _randomArti getArtilleryETA [_designatedPos, _strAmmoType];
	_str1 = format ["ETA: %1 , actual time: %2", _eta1 , servertime];
	[_randomArti,_str1] remoteExec ["sideChat",0,false] ;
	[_randomArti,"Firing Now."] remoteExec ["sideChat",0,false] ;
	_randomArti doArtilleryFire   [_designatedPos, _strAmmoType, _intArtiRounds];
	_strend = format ["Artillery Shells on way. Next possible artillery strike at %1", targetingsnakesArtilleryCooldown ];
	[[_executionSide, "PAPA_BEAR"],_strend] remoteExec ["sideChat",0,false] ;
};

if ( _type >= 5 && _type <= 6 ) then
{
	[[_executionSide, "PAPA_BEAR"],"Firing Rockets."] remoteExec ["sideChat",0,false] ;
	_randomArti = selectRandom _RocketArti;
	_isInRange = _designatedPos inRangeOfArtillery [[_randomArti], _strAmmoType];
	if ( _isInRange ) then {
		_eta1 = _randomArti getArtilleryETA [_designatedPos, _strAmmoType];
		_str1 = format ["ETA: %1 , actual time: %2", _eta1 , servertime];
		[_randomArti,_str1] remoteExec ["sideChat",0,false] ;
		for [{_count = 0}, {_count < 12}, {_count = _count + 1}] do {
			_randomTargetPos = _designatedPos getPos [200 * (random [0,0,100] / 100) , random 360];
			while { _isInRange = _randomTargetPos inRangeOfArtillery [[_randomArti], _strAmmoType];  ! _isInRange } do {
				_randomTargetPos = _designatedPos getPos [250 * (random [0,0,100] / 100), random 360];
				};
			_rocketStart = format ["Firing %1", _count + 1];
			[_randomArti,_rocketStart] remoteExec ["sideChat",0,false] ;
			_randomArti doArtilleryFire [_randomTargetPos, _strAmmoType, 1];
			sleep 10;
			};
		} else {
			[_randomArti,"Out of Rangearrea."] remoteExec ["sideChat",0,false] ;
			targetingsnakesRocketCooldown = servertime - 100;
			publicVariable "targetingsnakesRocketCooldown";
	};
	if ( _type != 6 ) then {
		_strend = format ["Artillery Rockets on way. Next possible Rocket strike at %1", targetingsnakesRocketCooldown ];
		[[_executionSide, "PAPA_BEAR"],_strend] remoteExec ["sideChat",0,false] ;
		};
};

if ( _type == 6 ) then {
	
	_randomArti = selectRandom _RocketArti;
	_isInRange = _designatedPos inRangeOfArtillery [[_randomArti], _strAmmoType];
	if ( _isInRange ) then {
		_eta1 = _randomArti getArtilleryETA [_designatedPos, _strAmmoType];
		_str1 = format ["ETA: %1 , actual time: %2", _eta1 , servertime];
		[_randomArti,_str1] remoteExec ["sideChat",0,false] ;
		for [{_count = 0}, {_count < 12}, {_count = _count + 1}] do {
			_randomTargetPos = _designatedPos getPos [200 * (random [0,0,100] / 100) , random 360];
			while { _isInRange = _randomTargetPos inRangeOfArtillery [[_randomArti], _strAmmoType];  ! _isInRange } do {
				_randomTargetPos = _designatedPos getPos [250 * (random [0,0,100] / 100), random 360];
				};
			_rocketStart = format ["Firing %1", _count + 1];
			[_randomArti,_rocketStart] remoteExec ["sideChat",0,false] ;
			_randomArti doArtilleryFire [_randomTargetPos, _strAmmoType, 1];
			sleep 10;
			};
		} else {
			[_randomArti,"Out of Rangearrea."] remoteExec ["sideChat",0,false] ;
			targetingsnakesRocketCooldown = servertime - 100;
			publicVariable "targetingsnakesRocketCooldown";
	};
	_strend = format ["Artillery Rockets on way. Next possible Rocket strike at %1", targetingsnakesRocketCooldown ];
	[[_executionSide, "PAPA_BEAR"],_strend] remoteExec ["sideChat",0,false] ;
};

if ( _type == 7 ) then {

	for [{_i = 0}, {_i < count _artillerys}, {_i = _i + 1 }] do {
		_unit = _artillerys select _i;
		_isInRange = _designatedPos inRangeOfArtillery [[_unit], "32Rnd_155mm_Mo_shells"];
		if ( _isInRange ) then {
			_randomTargetPos = _designatedPos getPos [200 * (random [0,10,100] / 100) , random 360];
			while { _isInRange = _randomTargetPos inRangeOfArtillery [[_unit], "32Rnd_155mm_Mo_shells"];  ! _isInRange } do {
				_randomTargetPos = _designatedPos getPos [200 * (random [0,10,100] / 100), random 360];
				};
			_eta1 = _unit getArtilleryETA [_designatedPos, "32Rnd_155mm_Mo_shells"];
			_str1 = format ["ETA: %1 , actual time: %2", _eta1 , servertime];
			[_unit,_str1] remoteExec ["sideChat",0,false] ;
			[_unit,"Firing Now."] remoteExec ["sideChat",0,false] ;
			_unit doArtilleryFire [_randomTargetPos, "32Rnd_155mm_Mo_shells", 32];
			};
		};
	[[_executionSide, "PAPA_BEAR"],"Waiting finishing 155mm Rounds estimated 5 minutes."] remoteExec ["sideChat",0,false] ;
	sleep 180;
	for [{_i = 0}, {_i < count _RocketArti}, {_i = _i + 1 }] do {
		_unit = _RocketArti select _i;
		_isInRange = _designatedPos inRangeOfArtillery [[_unit], "12Rnd_230mm_rockets"];
		if ( _isInRange ) then {
			_randomTargetPos = _designatedPos getPos [100 * (random [0,30,100] / 100) , random 360];
			while { _isInRange = _randomTargetPos inRangeOfArtillery [[_unit], "12Rnd_230mm_rockets"];  ! _isInRange } do {
				_randomTargetPos = _designatedPos getPos [100 * (random [0,10,100] / 100), random 360];
				};
			_eta1 = _unit getArtilleryETA [_designatedPos, "12Rnd_230mm_rockets"];
			_str1 = format ["ETA: %1 , actual time: %2", _eta1 , servertime];
			[_unit,_str1] remoteExec ["sideChat",0,false] ;
			for [{_count = 0}, {_count < 12}, {_count = _count + 1}] do {
				_randomTargetPos1 = _randomTargetPos getPos [200 * (random [0,0,100] / 100) , random 360];
				while { _isInRange = _randomTargetPos1 inRangeOfArtillery [[_unit], "12Rnd_230mm_rockets"];  ! _isInRange } do {
					_randomTargetPos1 = _randomTargetPos getPos [200 * (random [0,0,100] / 100), random 360];
					};
				_rocketStart = format ["Firing %1", _count + 1];
				[_unit,_rocketStart] remoteExec ["sideChat",0,false] ;
				_unit doArtilleryFire [_randomTargetPos1, "12Rnd_230mm_rockets", 1];
				sleep 10;
				};
			};
		};	
	[[_executionSide, "PAPA_BEAR"],"Waiting for impact missiles, estimated 100 seconds."] remoteExec ["sideChat",0,false] ;
	sleep 100;	
	for [{_i = 0}, {_i < count _artillerys}, {_i = _i + 1 }] do {
		_unit = _artillerys select _i;
		_isInRange = _designatedPos inRangeOfArtillery [[_unit], "2Rnd_155mm_Mo_Cluster"];
		if ( _isInRange ) then {
			_randomTargetPos = _designatedPos getPos [200 * (random [0,10,100] / 100) , random 360];
			while { _isInRange = _randomTargetPos inRangeOfArtillery [[_unit], "2Rnd_155mm_Mo_Cluster"];  ! _isInRange } do {
				_randomTargetPos = _designatedPos getPos [200 * (random [0,10,100] / 100), random 360];
				};
			_eta1 = _unit getArtilleryETA [_designatedPos, "2Rnd_155mm_Mo_Cluster"];
			_str1 = format ["ETA: %1 , actual time: %2", _eta1 , servertime];
			[_unit,_str1] remoteExec ["sideChat",0,false] ;
			[_unit,"Firing Now."] remoteExec ["sideChat",0,false] ;
			_unit doArtilleryFire [_randomTargetPos, "2Rnd_155mm_Mo_Cluster", 2];
			};
		};	
		_strend = format ["Artillery Shells on way. Next possible artillery strike at %1", targetingsnakesArtilleryCooldown ];
		[[_executionSide, "PAPA_BEAR"],_strend] remoteExec ["sideChat",0,false] ;
		_strend = format ["Artillery Rockets on way. Next possible Rocket strike at %1", targetingsnakesRocketCooldown ];
		[[_executionSide, "PAPA_BEAR"],_strend] remoteExec ["sideChat",0,false] ;
		[[_executionSide, "PAPA_BEAR"],"Finishing protocol for emergency artillery support now."] remoteExec ["sideChat",0,false] ;
	};

if ( _type >= 8 && _type <= 13 ) then {
	_randomArti = _mortarRhsRU select 0;
	_cnt = count _mortarRhsRU;
	if ( _cnt > 1 ) then {
		_randomArti = selectRandom _mortarRhsRU;
		while { _isInRange = _designatedPos inRangeOfArtillery [[_randomArti], _strAmmoType];  ! _isInRange } do {
			_randomArti = selectRandom _mortarRhsRU;
			};
	} else {
		if ( _designatedPos inRangeOfArtillery [[_randomArti], _strAmmoType] == false ) then {
			[[_executionSide, "PAPA_BEAR"],"Mortar not in Range!"] remoteExec ["sideChat",0,false] ;		
		};
	};
	if ( _designatedPos inRangeOfArtillery [[_randomArti], _strAmmoType] ) then {
		_NetId = groupOwner group _randomArti;
		_eta1 = vehicle _randomArti getArtilleryETA [_designatedPos, _strAmmoType];
		_str1 = format ["Firing Now. ETA: %1 , actual time: %2", _eta1 , servertime];
		[_randomArti,_str1] remoteExec ["sideChat",0,false] ;
		[_randomArti, [_designatedPos, _strAmmoType, _intArtiRounds]] remoteExec ["doArtilleryFire", _NetId, false];
		_strend = format ["Artillery Shells on way. Next possible artillery strike available in %1 seconds. Current time: %2 .", _delayNextStrike, servertime ];
		[[_executionSide, "PAPA_BEAR"],_strend] remoteExec ["sideChat",0,false] ;
		sleep _eta1;
		[_randomArti,"Splash Out."] remoteExec ["sideChat",0,false] ;
	};
};

sleep 3;
deleteMarker "ArtilleryTarget";
artilleryScriptRunning = false;
publicVariable "artilleryScriptRunning";