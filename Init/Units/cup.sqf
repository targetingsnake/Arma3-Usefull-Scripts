if(!isServer) exitWith {};

_unitTypes_heavy_CUP = [
	"CUP_O_RU_Soldier_A_M_EMR_V2", 
	"CUP_O_RU_Soldier_AAR_M_EMR_V2", 
	"CUP_O_RU_Soldier_AHAT_M_EMR_V2", 
	"CUP_O_RU_Soldier_AAT_M_EMR_V2", 
	"CUP_O_RU_Soldier_AR_M_EMR_V2", 
	"CUP_O_RU_Soldier_Medic_M_EMR_V2", 
	"CUP_O_RU_Soldier_Crew_M_EMR_V2", 
	"CUP_O_RU_Soldier_Engineer_M_EMR_V2", 
	"CUP_O_RU_Soldier_Exp_M_EMR_V2", 
	"CUP_O_RU_Soldier_GL_M_EMR_V2", 
	"CUP_O_RU_Soldier_MG_M_EMR_V2", 
	"CUP_O_RU_Soldier_LAT_M_EMR_V2", 
	"CUP_O_RU_Officer_M_EMR_V2", 
	"CUP_O_RU_Soldier_Repair_M_EMR_V2", 
	"CUP_O_RU_Soldier_M_EMR_V2", 
	"CUP_O_RU_Soldier_AT_M_EMR_V2", 
	"CUP_O_RU_Soldier_HAT_M_EMR_V2", 
	"CUP_O_RU_Soldier_Lite_M_EMR_V2", 
	"CUP_O_RU_Soldier_Saiga_M_EMR_V2", 
	"CUP_O_RU_Soldier_Marksman_M_EMR_V2", 
	"CUP_O_RU_Sniper_M_EMR", 
	"CUP_O_RU_Sniper_KSVK_M_EMR", 
	"CUP_O_RU_Spotter_M_EMR", 
	"CUP_O_RU_Soldier_SL_M_EMR_V2", 
	"CUP_O_RU_Soldier_TL_M_EMR_V2"
];

_unitTypes_light_CUP = [
	"CUP_O_INS_Soldier_Ammo", 
	"CUP_O_INS_Soldier_AT", 
	"CUP_O_INS_Soldier_AR", 
	"CUP_O_INS_Story_Lopotev", 
	"CUP_O_INS_Commander", 
	"CUP_O_INS_Crew", 
	"CUP_O_INS_Soldier_Engineer", 
	"CUP_O_INS_Soldier_GL", 
	"CUP_O_INS_Story_Bardak", 
	"CUP_O_INS_Soldier_MG", 
	"CUP_O_INS_Medic", 
	"CUP_O_INS_Officer", 
	"CUP_O_INS_Soldier", 
	"CUP_O_INS_Soldier_AK74", 
	"CUP_O_INS_Soldier_LAT", 
	"CUP_O_INS_Saboteur", 
	"CUP_O_INS_Soldier_Exp", 
	"CUP_O_INS_Sniper"
];

_vehicleTypes_heavy_CUP = [
	"CUP_O_BTR60_Green_RU", 
	"CUP_O_BTR60_RU", 
	"CUP_O_BTR80_CAMO_RU", 
	"CUP_O_BTR80_DESERT_RU", 
	"CUP_O_BTR80_GREEN_RU", 
	"CUP_O_BTR80_WINTER_RU", 
	"CUP_O_BTR60_Winter_RU", 
	"CUP_O_GAZ_Vodnik_PK_RU", 
	"CUP_O_GAZ_Vodnik_BPPU_RU", 
	"CUP_O_BTR80A_CAMO_RU", 
	"CUP_O_BTR80A_DESERT_RU", 
	"CUP_O_BTR80A_GREEN_RU", 
	"CUP_O_BTR80A_WINTER_RU", 
	"CUP_O_BTR90_RU", 
	"CUP_O_BTR90_HQ_RU", 
	"CUP_O_GAZ_Vodnik_KPVT_RU", 
	"CUP_O_MTLB_pk_WDL_RU", 
	"CUP_O_MTLB_pk_Green_RU", 
	"CUP_O_MTLB_pk_Winter_RU", 
	"CUP_O_T72_RU", 
	"CUP_O_BMP2_CHDKZ", 
	"CUP_O_BMP_HQ_CHDKZ", 
	"CUP_O_BRDM2_CHDKZ", 
	"CUP_O_BRDM2_ATGM_CHDKZ", 
	"CUP_O_BTR60_CHDKZ", 
	"CUP_O_BTR80_CHDKZ", 
	"CUP_O_BTR80A_CHDKZ", 
	"CUP_O_MTLB_pk_ChDKZ"
];

_vehicleTypes_heavy_naval_CUP = [
	"CUP_O_LCVP_SLA"
];

_vehicleTypes_light_CUP = [
	"CUP_O_Kamaz_RU", 
	"CUP_O_Kamaz_Open_RU", 
	"CUP_O_UAZ_Unarmed_RU", 
	"CUP_O_UAZ_MG_RU", 
	"CUP_O_UAZ_METIS_RU", 
	"CUP_O_UAZ_Open_RU", 
	"CUP_O_UAZ_SPG9_RU", 
	"CUP_O_Ural_RU", 
	"CUP_O_Ural_Open_RU", 
	"CUP_O_Datsun_PK", 
	"CUP_O_Datsun_PK_Random", 
	"CUP_O_Datsun_4seat", 
	"CUP_O_Hilux_unarmed_CHDKZ", 
	"CUP_O_Hilux_DSHKM_CHDKZ", 
	"CUP_O_Hilux_metis_CHDKZ", 
	"CUP_O_Hilux_MLRS_CHDKZ", 
	"CUP_O_Hilux_podnos_CHDKZ", 
	"CUP_O_Hilux_SPG9_CHDKZ", 
	"CUP_O_Hilux_UB32_CHDKZ", 
	"CUP_O_UAZ_Unarmed_CHDKZ", 
	"CUP_O_UAZ_MG_CHDKZ", 
	"CUP_O_UAZ_METIS_CHDKZ", 
	"CUP_O_UAZ_Open_CHDKZ", 
	"CUP_O_UAZ_SPG9_CHDKZ", 
	"CUP_O_Ural_CHDKZ", 
	"CUP_O_Ural_Open_CHDKZ",
	"CUP_O_GAZ_Vodnik_Unarmed_RU"
];

_vehicleTypes_light_naval_CUP = [
	"CUP_O_LCVP_SLA"
];