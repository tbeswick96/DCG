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
	["dcg_main_init", ["ALL"]],
	["dcg_main_debug", 0],
	["dcg_main_loadData", true],
	["dcg_main_baseName", "MOB Tiger"],
	["dcg_main_baseRadius", (worldSize * 0.055)],
	["dcg_main_baseSafezone", true],
	["dcg_main_blacklistLocations", []],
	["dcg_main_simpleWorlds", ["Chernarus", "Chernarus_Summer"]],
	["dcg_main_unitPoolEast", ["Inegal_F","Inegal_C","Inegal_O","Inegal_MED","Inegal_MG","Inegal_Mark","Inegal_AA","Inegal_ATE","Inegal_ATJ","Inegal_FAC","Inegal_FDF_S","Inegal_FDF_V","Inegal_FDF_B","Inegal_FDF_Sh","Inegal_FDF_A","Inegal_FDF_Se","Inegal_Diablerie_S","Inegal_Diablerie_C","Inegal_Diablerie_G","Inegal_Diablerie_Su","Inegal_Diablerie_B","Inegal_Diablerie_Sh","Inegal_Diablerie_A","Inegal_Diablerie_Se","Inegal_Recrues_C","Inegal_Recrues_L","Inegal_Recrues_R","Inegal_Crew_HP","Inegal_Crew_HC","Inegal_Crew_C","Inegal_Crew_P"]],
	["dcg_main_vehPoolEast", ["Inegal_LandRover_Unarmed","Inegal_LandRover_MG","Inegal_LandRover_GL","Inegal_LandRover_FDF_Unarmed","Inegal_LandRover_FDF_MG","Inegal_LandRover_FDF_GL","Inegal_VAB_Unarmed","Inegal_VAB_HMG","Inegal_VAB_GMG","Inegal_VAB_D_Unarmed","Inegal_VAB_D_HMG","Inegal_VAB_D_GMG","Inegal_LandRover_Unarmed","Inegal_LandRover_MG","Inegal_LandRover_GL","Inegal_LandRover_FDF_Unarmed","Inegal_LandRover_FDF_MG","Inegal_LandRover_FDF_GL","Inegal_VAB_Unarmed","Inegal_VAB_HMG","Inegal_VAB_GMG","Inegal_VAB_D_Unarmed","Inegal_VAB_D_HMG","Inegal_VAB_D_GMG","Inegal_APC_VBCI","Inegal_TRM_Covered","Inegal_TRM_Open","Inegal_TRM_D_Covered","Inegal_TRM_D_Open","Inegal_TRM_R_Covered","Inegal_TRM_R_Open","Inegal_TRM_Ammo","Inegal_TRM_Repair","Inegal_TRM_Fuel","Inegal_Tank_Leclerc"]],
	["dcg_main_airPoolEast", ["Inegal_Heli_AW101", "Inegal_Heli_AH6", "Inegal_Heli_MH6", "Inegal_Heli_FDF_MH6", "Inegal_Heli_D_MH6", "Inegal_Jet_L159"]],
	["dcg_main_sniperPoolEast", ["Inegal_Mark", "Inegal_FDF_Sh", "Inegal_Diablerie_As", "Inegal_Sniper"]],
	["dcg_main_officerPoolEast", ["Inegal_O", "Inegal_Diablerie_G", "Inegal_FDF_V"]],
	["dcg_main_staticPoolEast", ["Inegal_Static_HMG", "Inegal_Static_GMG"]],
	["dcg_main_mortarPoolEast", ["Inegal_Static_Mortar"]],
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
	["dcg_main_vehPoolCiv", ["C_Offroad_02_unarmed_F_orange", "C_Offroad_02_unarmed_F_green", "C_Offroad_02_unarmed_F_blue", "C_Offroad_02_unarmed_F_black", "C_Offroad_02_unarmed_F", "C_Hatchback_01_beigecustom_F", "C_Hatchback_01_black_F", "C_Hatchback_01_blue_F", "C_Hatchback_01_bluecustom_F", "C_Hatchback_01_dark_F", "C_Hatchback_01_F", "C_Hatchback_01_green_F", "C_Hatchback_01_grey_F", "C_Hatchback_01_sport_blue_F", "C_Hatchback_01_sport_F", "C_Hatchback_01_sport_green_F", "C_Hatchback_01_sport_grey_F", "C_Hatchback_01_sport_orange_F", "C_Hatchback_01_sport_red_F", "C_Hatchback_01_sport_white_F", "C_Hatchback_01_white_F", "C_Hatchback_01_yellow_F", "C_Offroad_01_blue_F", "C_Offroad_01_bluecustom_F", "C_Offroad_01_darkred_F", "C_Offroad_01_F", "C_Offroad_01_red_F", "C_Offroad_01_repair_F", "C_Offroad_01_sand_F", "C_Offroad_01_white_F", "C_Offroad_default_F", "C_Offroad_luxe_F", "C_Offroad_stripped_F", "C_Quadbike_01_black_F", "C_Quadbike_01_blue_F", "C_Quadbike_01_F", "C_Quadbike_01_red_F", "C_Quadbike_01_white_F", "C_Truck_02_covered_F", "C_Truck_02_transport_F", "C_SUV_01_F", "C_Truck_02_box_F", "C_Truck_02_fuel_F", "C_Van_01_box_F", "C_Van_01_box_red_F", "C_Van_01_box_white_F", "C_Van_01_fuel_F", "C_Van_01_fuel_red_F", "C_Van_01_fuel_red_v2_F", "C_Van_01_fuel_white_F", "C_Van_01_fuel_white_v2_F", "C_Van_01_transport_F", "C_Van_01_transport_red_F", "C_Van_01_transport_white_F"]],
	["dcg_main_airPoolCiv", ["C_Heli_Light_01_civil_F", "C_Plane_Civil_01_F", "C_Plane_Civil_01_racing_F"]],
	["dcg_occupy_enable", 1],
	["dcg_occupy_cooldown", 180],
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
	["dcg_patrol_cooldown", 180],
	["dcg_patrol_groupsMaxCount", 40],
	["dcg_patrol_vehChance", 0.4],
	["dcg_respawn_enable", 1],
	["dcg_task_enable", 1],
	["dcg_task_cooldown", 180],
	["dcg_task_primaryTasks", ["dcg_task_fnc_prim_vip","dcg_task_fnc_prim_cache","dcg_task_fnc_prim_officer","dcg_task_fnc_prim_arty","dcg_task_fnc_prim_defend"]],
	["dcg_task_secondaryTasks", ["dcg_task_fnc_sec_deliver","dcg_task_fnc_sec_repair","dcg_task_fnc_sec_officer","dcg_task_fnc_sec_intel01","dcg_task_fnc_sec_intel02"]],
	["dcg_task_primaryBlacklist", []],
	["dcg_task_secondaryBlacklist", []],
	["dcg_transport_enable", 1],
	["dcg_transport_maxCount", 3],
	["dcg_transport_cooldown", 180],
	["dcg_approval_enable", 1],
	["dcg_approval_multiplier", 1],
	["dcg_approval_hostileCooldown", 180],
	["dcg_cache_enable", 1],
	["dcg_cache_dist", 1250],
	["dcg_civilian_enable", 1],
	["dcg_civilian_spawnDist", 400],
	["dcg_civilian_countCapital", 30],
	["dcg_civilian_countCity", 20],
	["dcg_civilian_countVillage", 15],
	["dcg_civilian_vehMaxCount", 8],
	["dcg_civilian_vehCooldown", 180],
	["dcg_fob_enable", 1],
	["dcg_fob_name", "FOB Butterfly"],
	["dcg_fob_placingMultiplier", -0.005],
	["dcg_fob_deletingMultiplier", 0.005],
	["dcg_fob_range", 200]
];

{
	_x params ["_name", "_value"];
	missionNamespace setVariable [_name,_value];
} forEach _settings;

dcg_settings_done = true;
publicVariable "dcg_settings_done";
