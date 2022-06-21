if (!isServer) exitWith {};

_supplyAmmoBox = ["sa_supply", "CargoNet_01_box_F", 
	[
		["hlc_100Rnd_792x57_T_MG42", 10], 
		["hlc_VOG25_AK", 40], 
		["hlc_GRD_Red", 16],
		["hlc_GRD_White", 16],
		["hlc_GRD_green", 16],
		["rhs_grenade_sthgr43_heerfrag_mag", 72],
		["rhs_grenade_nbhgr39B_mag", 48],
		["rhs_mag_maaws_HEAT", 8],
		["rhs_mag_maaws_HEDP", 4],
		["ACE_Canteen", 6]]
	, 0 ];

_lightAmmoBox = ["la_supply", "B_supplyCrate_F", 
	[
		["hlc_30Rnd_762x39_b_ak_6L10", 56], 
		["hlc_20Rnd_762x51_B_M14", 154],
		["rhsusf_mag_7x45acp_MHP", 48], 
		["rhs_grenade_sthgr43_heerfrag_mag", 12],
		["rhs_grenade_nbhgr39B_mag", 12]],
		0 
	];

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

_staticSupply = [
	"st_supply", "B_Slingload_01_Cargo_F",
	[["rhsgref_cdf_b_DSHKM",5], 
	["rhsgref_cdf_b_DSHKM_Mini_TriPod", 2],
	["rhsgref_cdf_b_NSV_TriPod", 5],
	["rhsgref_cdf_b_SPG9", 10],
	["rhsgref_cdf_b_SPG9M", 10],
	["rhsgref_hidf_m2_static", 5],
	["rhsgref_hidf_m2_static_minitripod", 2],
	["RHS_TOW_TriPod_WD", 10],
	["rhsgref_cdf_b_reg_d30_at", 18]
	],
	3
];

_nvgAmmoBox = ["marker_nvg", "B_CargoNet_01_ammo_F", [["ACE_NVG_Wide_Black", 40]], 0];

_mortarAmmoBox = ["mo_supply", "Box_NATO_AmmoVeh_F", [], 1 ];
_BuildingAmmoBox = ["bl_supply", "B_Slingload_01_Ammo_F", [], 2 ];

[_supplyAmmoBox,"scripts\Supplies\inBoxesWithCustomContent\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;
[_lightAmmoBox,"scripts\Supplies\inBoxesWithCustomContent\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;
[_medicalAmmoBox,"scripts\Supplies\inBoxesWithCustomContent\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;
[_mortarAmmoBox,"scripts\Supplies\inBoxesWithCustomContent\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;
[_BuildingAmmoBox,"scripts\Supplies\inBoxesWithCustomContent\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;
[_staticSupply,"scripts\Supplies\inBoxesWithCustomContent\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;

waitUntil{
	sleep 30;
	SetNvgAvailable
};

_markerNVG = createMarkerLocal ["NVG_SupplyMarker", getMarkerPos "marker_nvg"];
_markerNVG setMarkerShapeLocal "ICON";
_markerNVG setMarkerTypeLocal "b_support";
_markerNVG setMarkerText "NVG Supplies";
[_nvgAmmoBox,"scripts\Supplies\inBoxesWithCustomContent\boxes.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;