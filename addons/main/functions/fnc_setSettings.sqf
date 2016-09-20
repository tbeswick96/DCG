/*
Author:
esteldunedain, SENSEI

Description:
loads server parameters

Arguments:

Return:
none
__________________________________________________________________*/
#include "script_component.hpp"

_settings = [
	["dcg_main_debug", 0],
	["dcg_main_loadData", true],
	["dcg_main_baseName", "UKSF"],
	["dcg_main_baseRadius", (worldSize * 0.055)],
	["dcg_main_baseSafezone", true],
	["dcg_main_blacklistLocations", []],
	["dcg_main_simpleWorlds", ["Chernarus", "Chernarus_Summer"]],
	["dcg_main_unitPoolEast", ["GENFOR_R", "GENFOR_S", "GENFOR_SL", "GENFOR_O", "GENFOR_MED", "GENFOR_AR", "GENFOR_MG", "GENFOR_Mark", "GENFOR_AA", "GENFOR_AT_18", "GENFOR_AT_7", "GENFOR_AT", "GENFOR_Sniper", "GENFOR_Sniper_AM", "GENFOR_Spotter", "GENFOR_RTO", "GENFOR_P_R", "GENFOR_P_SL", "GENFOR_P_O", "GENFOR_P_B", "GENFOR_P_MG", "GENFOR_P_Mark", "GENFOR_P_AT", "GENFOR_P_ATR", "GENFOR_P_AA", "GENFOR_SF_R", "GENFOR_SF_A", "GENFOR_SF_Patrol", "GENFOR_SF_SL", "GENFOR_SF_MED", "GENFOR_SF_MG", "GENFOR_SF_Mark", "GENFOR_SF_AT", "GENFOR_Res", "GENFOR_Res_R", "GENFOR_Res_L"]],
	["dcg_main_vehPoolEast", ["Genfor_Apc_BMP1", "Genfor_Apc_BMP1P", "Genfor_Apc_BMP2", "Genfor_Apc_BMP2HQ", "Genfor_Apc_BMP2Ambul", "Genfor_Brdm_BRDM2", "Genfor_Brdm_BTR60", "Genfor_Hilux_Unarmed", "Genfor_Hilux_Unarmed_Populated", "Genfor_Hilux_Unarmed_Reserves", "Genfor_Hilux_Unarmed_Reserves_Populated", "Genfor_Hilux_MG", "Genfor_Hilux_MG_Reserves", "Genfor_Hilux_50", "Genfor_Hilux_50_Reserves", "Genfor_Hilux_Grenade", "Genfor_Hilux_Grenade_Reserves", "Genfor_Hilux_Med", "Genfor_Hilux_SPG9", "Genfor_Hilux_Rockets", "Genfor_Hmmwv_MG_SF", "Genfor_Hmmwv_M134_SF", "Genfor_Hmmwv_SOVGL_SF", "Genfor_Hmmwv_SOVM134_SF", "Genfor_Hmmwv_TOW_SF", "Genfor_Hmmwv_Stinger_SF", "Genfor_Hmmwv_GL_SF", "Genfor_Hmmwv_Unarmed_SF", "Genfor_Hmmwv_Unarmed_SF_Populated", "Genfor_Hmmwv_Medical_SF", "Genfor_Hmmwv_MG_Desert_SF", "Genfor_Hmmwv_M134_Desert_SF", "Genfor_Hmmwv_SOVGL_Desert_SF", "Genfor_Hmmwv_SOVM134_Desert_SF", "Genfor_Hmmwv_TOW_Desert_SF", "Genfor_Hmmwv_Stinger_Desert_SF", "Genfor_Hmmwv_GL_Desert_SF", "Genfor_Hmmwv_Unarmed_Desert_SF", "Genfor_Hmmwv_Unarmed_Desert_SF_Populated", "Genfor_Hmmwv_Medical_Desert_SF", "Genfor_LandRover_Unarmed", "Genfor_LandRover_Unarmed_Populated", "Genfor_LandRover_Unarmed_Para", "Genfor_LandRover_Unarmed_Para_Populated", "Genfor_LandRover_Medical", "Genfor_LandRover_Medical_Para", "Genfor_LandRover_MG", "Genfor_LandRover_MG_Para", "Genfor_LandRover_GL", "Genfor_LandRover_GL_Para", "Genfor_LandRover_TOW", "Genfor_LandRover_TOW_Para", "Genfor_LandRover_Stinger", "Genfor_LandRover_Stinger_Para", "Genfor_LandRover_SPG9", "Genfor_LandRover_SPG9_Para", "Genfor_Uaz_DSHKM", "Genfor_Uaz_50cal", "Genfor_Uaz_GL", "Genfor_Uaz_Unarmed", "Genfor_Uaz_Unarmed_Populated", "Genfor_Uaz_Medical", "Genfor_Uaz_SPG9", "Genfor_Ural_Transport", "Genfor_Ural_Transport_Populated", "Genfor_Ural_TransportOpen", "Genfor_Ural_TransportOpen_Populated", "Genfor_Ural_Ammo", "Genfor_Ural_Repair", "Genfor_Ural_Fuel", "Genfor_Ural_BM21", "Genfor_Ural_ZSU", "Genfor_Tank_T72A", "Genfor_Tank_T7BEarly", "Genfor_Tank_T72B", "Genfor_Tank_T72BM", "Genfor_Tank_T55A", "Genfor_Tank_T34", "Genfor_Tank_ZSU"]],
	["dcg_main_airPoolEast", ["Genfor_Air_MI8", "Genfor_Air_MI8_Populated", "Genfor_Air_MI8MTV", "Genfor_Air_MI8MTV_Populated", "Genfor_Air_MI24", "Genfor_Air_SU25K", "Genfor_Air_SU25T", "Genfor_Air_SU34"]],
	["dcg_main_sniperPoolEast", ["GENFOR_Sniper", "GENFOR_Sniper_AM", "GENFOR_Spotter", "GENFOR_RTO"]],
	["dcg_main_officerPoolEast", ["GENFOR_O", "GENFOR_P_O", "GENFOR_Res_L"]],
	["dcg_main_staticPoolEast", ["Genfor_Static_ZU23", "Genfor_Static_DSHKM", "Genfor_Static_DSHKMMiniTripod", "Genfor_Static_KORD", "Genfor_Static_KORDHigh", "Genfor_Static_M2", "Genfor_Static_M2MiniTripod", "Genfor_Static_AGS", "Genfor_Static_GMG", "Genfor_Static_MK19", "Genfor_Static_Metis", "Genfor_Static_TOW", "Genfor_Static_SPG9", "Genfor_Static_Igla", "Genfor_Static_Stinger", "Genfor_Static_D30", "Genfor_Static_D30AT", "Genfor_Static_M119", "Genfor_Static_M119AT"]],
	["dcg_main_mortarPoolEast", ["Genfor_Static_2B14", "Genfor_Static_M252"]],
	["dcg_main_unitPoolInd", ["I_soldier_AR_F","I_medic_F","I_soldier_exp_F","I_soldier_GL_F","I_soldier_AT_F","I_soldier_repair_F","I_soldier_AAR_F","I_soldier_M_F","I_soldier_F","I_support_AMG_F","I_support_MG_F","I_engineer_F","I_Soldier_AA_F"]],
	["dcg_main_vehPoolInd", ["I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Quadbike_01_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_Truck_02_covered_F","I_Truck_02_transport_F"]],
	["dcg_main_airPoolInd", ["I_Heli_light_03_F","I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_AA_F"]],
	["dcg_main_sniperPoolInd", ["I_sniper_F"]],
	["dcg_main_officerPoolInd", ["I_officer_F"]],
	["dcg_main_unitPoolWest", ["B_Soldier_SL_F","B_medic_F","B_soldier_AR_F","B_soldier_M_F","B_Soldier_AA_F","B_soldier_AT_F","B_soldier_F"]],
	["dcg_main_vehPoolWest", ["B_mrap_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"]],
	["dcg_main_airPoolWest", ["B_Heli_Transport_03_F","B_Heli_Transport_01_F","B_Heli_Light_01_F","B_Plane_CAS_01_F","B_Heli_Attack_01_F","B_Heli_Light_01_armed_F"]],
	["dcg_main_sniperPoolWest", ["B_sniper_F"]],
	["dcg_main_officerPoolWest", ["B_officer_F"]],
	["dcg_main_unitPoolCiv", ["C_journalist_F", "C_man_1", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_hunter_1_F", "C_man_p_beggar_F", "C_man_p_beggar_F_afro", "C_man_p_beggar_F_asia", "C_man_p_beggar_F_euro", "C_man_p_fugitive_F", "C_man_p_fugitive_F_afro", "C_man_p_fugitive_F_asia", "C_man_p_fugitive_F_euro", "C_man_p_shorts_1_F", "C_man_p_shorts_1_F_afro", "C_man_p_shorts_1_F_asia", "C_man_p_shorts_1_F_euro", "C_man_pilot_F", "C_man_polo_1_F", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia", "C_man_polo_1_F_euro", "C_man_polo_2_F", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia", "C_man_polo_2_F_euro", "C_man_polo_3_F", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia", "C_man_polo_3_F_euro", "C_man_polo_4_F", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia", "C_man_polo_4_F_euro", "C_man_polo_5_F", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia", "C_man_polo_5_F_euro", "C_man_polo_6_F", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia", "C_man_polo_6_F_euro", "C_man_shorts_1_F", "C_man_shorts_1_F_afro", "C_man_shorts_1_F_asia", "C_man_shorts_1_F_euro", "C_man_shorts_2_F", "C_man_shorts_2_F_afro", "C_man_shorts_2_F_asia", "C_man_shorts_2_F_euro", "C_man_shorts_3_F", "C_man_shorts_3_F_afro", "C_man_shorts_3_F_asia", "C_man_shorts_3_F_euro", "C_man_shorts_4_F", "C_man_shorts_4_F_afro", "C_man_shorts_4_F_asia", "C_man_shorts_4_F_euro", "C_man_w_worker_F", "C_Marshal_F", "C_Nikos", "C_Nikos_aged", "C_Orestes", "C_scientist_F"]],
	["dcg_main_vehPoolCiv", ["C_Hatchback_01_beigecustom_F", "C_Hatchback_01_black_F", "C_Hatchback_01_blue_F", "C_Hatchback_01_bluecustom_F", "C_Hatchback_01_dark_F", "C_Hatchback_01_F", "C_Hatchback_01_green_F", "C_Hatchback_01_grey_F", "C_Hatchback_01_sport_blue_F", "C_Hatchback_01_sport_F", "C_Hatchback_01_sport_green_F", "C_Hatchback_01_sport_grey_F", "C_Hatchback_01_sport_orange_F", "C_Hatchback_01_sport_red_F", "C_Hatchback_01_sport_white_F", "C_Hatchback_01_white_F", "C_Hatchback_01_yellow_F", "C_Offroad_01_blue_F", "C_Offroad_01_bluecustom_F", "C_Offroad_01_darkred_F", "C_Offroad_01_F", "C_Offroad_01_red_F", "C_Offroad_01_repair_F", "C_Offroad_01_sand_F", "C_Offroad_01_white_F", "C_Offroad_default_F", "C_Offroad_luxe_F", "C_Offroad_stripped_F", "C_Quadbike_01_black_F", "C_Quadbike_01_blue_F", "C_Quadbike_01_F", "C_Quadbike_01_red_F", "C_Quadbike_01_white_F", "C_Truck_02_covered_F", "C_Truck_02_transport_F", "C_SUV_01_F", "C_Truck_02_box_F", "C_Truck_02_fuel_F", "C_Van_01_box_F", "C_Van_01_box_red_F", "C_Van_01_box_white_F", "C_Van_01_fuel_F", "C_Van_01_fuel_red_F", "C_Van_01_fuel_red_v2_F", "C_Van_01_fuel_white_F", "C_Van_01_fuel_white_v2_F", "C_Van_01_transport_F", "C_Van_01_transport_red_F", "C_Van_01_transport_white_F"]],
	["dcg_main_airPoolCiv", ["C_Heli_Light_01_civil_F", "C_Plane_Civil_01_F", "C_Plane_Civil_01_racing_F"]],
	["dcg_occupy_enable", 1],
	["dcg_occupy_cooldown", 600],
	["dcg_occupy_locationCount", 2],
	["dcg_occupy_infCountCapital", 5],
	["dcg_occupy_vehCountCapital", 8],
	["dcg_occupy_airCountCapital", 3],
	["dcg_occupy_infCountCity", 3],
	["dcg_occupy_vehCountCity", 5],
	["dcg_occupy_airCountCity", 1],
	["dcg_occupy_infCountVillage", 2],
	["dcg_occupy_vehCountVillage", 3],
	["dcg_occupy_airCountVillage", 0],
	["dcg_patrol_enable", 1],
	["dcg_patrol_cooldown", 900],
	["dcg_patrol_groupsMaxCount", 40],
	["dcg_patrol_vehChance", 0.4],
	["dcg_respawn_enable", 1],
	["dcg_task_enable", 1],
	["dcg_task_cooldown", 480],
	["dcg_task_primaryTasks", ["dcg_task_fnc_prim_vip","dcg_task_fnc_prim_cache","dcg_task_fnc_prim_officer","dcg_task_fnc_prim_defend"]],
	["dcg_task_secondaryTasks", ["dcg_task_fnc_sec_deliver","dcg_task_fnc_sec_repair","dcg_task_fnc_sec_officer","dcg_task_fnc_sec_intel01","dcg_task_fnc_sec_intel02"]],
	["dcg_transport_enable", 0],
	["dcg_transport_maxCount", 3],
	["dcg_transport_cooldown", 300],
	["dcg_weather_enable", 1],
	["dcg_weather_season", -1],
	["dcg_weather_time", -1],
	["dcg_weather_mapData", ["ALTIS",0.67,0.65,0.56,0.52,0.44,0.34,0.26,0.27,0.33,0.47,0.54,0.62],["STRATIS",0.67,0.65,0.56,0.52,0.44,0.34,0.26,0.27,0.33,0.47,0.54,0.62],["TAKISTAN",0.54,0.6,0.55,0.46,0.32,0.19,0.15,0.15,0.12,0.15,0.25,0.41],["MOUNTAINS_ACR",0.54,0.6,0.55,0.46,0.32,0.19,0.15,0.15,0.12,0.15,0.25,0.41],["CHERNARUS",0.98,0.94,0.85,0.76,0.7,0.74,0.7,0.64,0.73,0.84,0.93,0.97],["CHERNARUS_SUMMER",0.73,0.72,0.7,0.72,0.74,0.7,0.68,0.65,0.64,0.69,0.7,0.75],["TANOA",0.8,0.78,0.7,0.63,0.57,0.55,0.48,0.49,0.57,0.64,0.71,0.79]],
	["dcg_approval_enable", 1],
	["dcg_approval_multiplier", 1],
	["dcg_approval_hostileCooldown", 900],
	["dcg_cache_enable", 1],
	["dcg_cache_dist", 2000],
	["dcg_civilian_enable", 1],
	["dcg_civilian_spawnDist", 400],
	["dcg_civilian_countCapital", 30],
	["dcg_civilian_countCity", 20],
	["dcg_civilian_countVillage", 15],
	["dcg_civilian_vehMaxCount", 8],
	["dcg_civilian_vehCooldown", 180],
	["dcg_fob_enable", 1],
	["dcg_fob_name", "FOB Lion"],
	["dcg_fob_range", 100],
	["dcg_fob_placingMultiplier", -0.025],
	["dcg_fob_deletingMultiplier", 0.025],
	["dcg_ied_enable", 1]
];

{
	_x params ["_name", "_value"];
	missionNamespace setVariable [_name,_value];
} forEach _settings;

dcg_settings_done = true;
publicVariable "dcg_settings_done";
