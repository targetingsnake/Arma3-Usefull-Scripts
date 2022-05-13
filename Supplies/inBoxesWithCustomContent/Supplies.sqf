if (!isServer) exitWith {};

_supplyAmmoBox = ["sa_supply", "CargoNet_01_box_F", 
	[["hlc_100Rnd_762x51_T_MG3", 10], 
	["1Rnd_HE_Grenade_shell", 40], 
	["CUP_1Rnd_SmokeRed_M203", 8],
	["CUP_1Rnd_Smoke_M203", 8],
	["CUP_FlareWhite_M203", 16],
	["CUP_FlareRed_M203", 16],
	["rhs_grenade_mki_mag", 48],
	["HandGrenade", 72],
	["SmokeShell", 48],
	["SmokeShellRed", 48],
	["rhs_weap_M136", 5],
	["rhs_weap_M136_hedp", 5]]
	, 0 ];

_lightAmmoBox = ["la_supply", "B_supplyCrate_F", 
	[["hlc_20rnd_762x51_T_G3", 100], 
	["rhsusf_mag_17Rnd_9x19_FMJ", 48], 
	["rhs_grenade_mki_mag", 12],
	["HandGrenade", 12],
	["SmokeShell", 12],
	["SmokeShellRed", 12],
	["rhs_weap_m72a7", 5]]
	, 0 ];

_medicalAmmoBox = ["me_supply", "C_IDAP_supplyCrate_F", 
	[["ACE_elasticBandage", 40], 
	["ACE_packingBandage", 40], 
	["ACE_tourniquet", 40],
	["ACE_splint", 40],
	["ACE_epinephrine", 30],
	["ACE_morphine", 20],
	["ACE_adenosine", 10],
	["ACE_bloodIV_250", 20],
	["ACE_bloodIV_500", 10],
	["ACE_bloodIV", 5],
	["ACE_personalAidKit", 5]]
	, 0 ];

_nvgAmmoBox = ["marker_nvg", "B_CargoNet_01_ammo_F", [["ACE_NVG_Wide_Black", 40]], 0];

_mortarAmmoBox = ["mo_supply", "Box_NATO_AmmoVeh_F", [], 1 ];
_BuildingAmmoBox = ["bl_supply", "B_Slingload_01_Ammo_F", [], 2 ];

[_supplyAmmoBox,"scripts\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;
[_lightAmmoBox,"scripts\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;
[_medicalAmmoBox,"scripts\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;
[_mortarAmmoBox,"scripts\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;
[_BuildingAmmoBox,"scripts\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;

waitUntil{
	sleep 30;
	SetNvgAvailable
};

_markerNVG = createMarkerLocal ["NVG_SupplyMarker", getMarkerPos "marker_nvg"];
_markerNVG setMarkerShapeLocal "ICON";
_markerNVG setMarkerTypeLocal "b_support";
_markerNVG setMarkerText "NVG Supplies";
[_nvgAmmoBox,"scripts\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;