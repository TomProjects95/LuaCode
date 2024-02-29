

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7000)
        if NetworkIsInSpectatorMode() then
            TriggerServerEvent("SpectateAlert")
        end
    end
end)

local blockedModels = { -- change this list and add the cars you want.
        "zentorno",
        "turismor",
        "CARGOBOB",
        "TITAN",
        "LAZER",
        "rhino",
        "cargoplane",
        "titan",
        "Freight", 
        "Rhino", 
        "Vigilante",
        "avenger",
        "blimp",
        "blimp2",
        "blimp3",
        "jet",
        --"maverick",
        --"luxor",
        "miljet",
        "Hauler2",
        --"Phantom2",
        "Phantom3",
        --"Stockade3",
        --"PoliceOld1",
        --"PoliceOld2",
        "Annihilator",
        "Buzzard" ,
        "Cargobob",
        "Cargobob2",
        "Cargobob3",
        "Cargobob4",
        "Savage",
        "Skylift",
        "Valkyrie",
        "Valkyrie2",
        "APC",
        "Halftrack",
        "Rhino",
        "Trailersmall2",
        "Oppressor",
        "Oppressor2",
        "Ruiner2",
        "Sadler2",
        "Tampa3",
        "Blazer5",
        "Dune2",
        "Dune3",
        "Dune4",
        "Dune5",
        "Insurgent",
        "Insurgent3",
        "Mesa2",
        "Nightshark",
        "RancherXL2",
        "Technical",
        "Technical2",
        "Technical3",
        "Blimp",
        "Blimp2",
        "CargoPlane",
        "Hydra",
        "Jet",
        "Lazer",
        "Titan",
        "Asea2",
        "Emperor3",
        "Limo2",
        "Ardent",
        "Voltic2",
        "TrailerLarge",
        "TrailerS4",
        "Tractor3",
        "Boxville5",
        "Burrito5",
        "hunter",
        "bombushka",
        "nokota",
        "akula",
        "barrage",
        "chernobog",
        "khanjali",
        "cerberus",
        "cerberus3",
        "cerberus2",
        "menacer",
        "deluxo",
        "avenger2",
        "riot2",
        "caracara",
        "bruiser",
        "bruiser2",
        "bruiser3",
        "revolter",
        "frogger"
    }

    --need to figure out a way to whitelist plate for some qa planes etc

local blockedProps = { -- change this list and add the props you want.
    "stt_prop_track_stop_sign",
    "prop_windmill_01",
    "p_spinning_anus_s",
    "prop_weed_01",
    "p_crahsed_heli_s",
    "prop_rock_4_big2",
    "prop_beachflag_le",
    "prop_container_01a",
    "stt_prop_stunt_track_start",
    "prop_contnr_pile_01a",
    "ce_xr_ctr2",
    "stt_prop_ramp_jump_xxl",
    "hei_prop_carrier_jet",
    --"prop_parking_hut_2",
    "csx_seabed_rock3_",
    "db_apart_03_",
    "db_apart_09_",

    "prop_abat_slide",
    "prop_fireescape_02b",
    "prop_air_cargoloader_01",
    "prop_air_bridge02",
    "prop_air_bridge02",
    "prop_fnclink_05crnr1",
    "xs_prop_hamburgher_wl",
    "sr_prop_spec_tube_xxs_01a",
    "stt_prop_stunt_track_dwslope30",
    "hei_prop_carrier_radar_1_l1",
    "v_res_mexball",
    "prop_rock_1_a",
    "prop_rock_1_b",
    "prop_rock_1_c",
    "prop_rock_1_d",
    "prop_player_gasmask",
    "prop_rock_1_e",
    "prop_rock_1_f",
    "prop_rock_1_g",
    "prop_rock_1_h",
    "prop_test_boulder_01",
    "prop_test_boulder_02",
    "prop_test_boulder_03",
    "prop_test_boulder_04",
    "apa_mp_apa_crashed_usaf_01a",
    "ex_prop_exec_crashdp",
    "apa_mp_apa_yacht_o1_rail_a",
    "apa_mp_apa_yacht_o1_rail_b",
    "apa_mp_h_yacht_armchair_01",
    "apa_mp_h_yacht_armchair_03",
    "apa_mp_h_yacht_armchair_04",
    "apa_mp_h_yacht_barstool_01",
    "apa_mp_h_yacht_bed_01",
    "apa_mp_h_yacht_bed_02",
    "apa_mp_h_yacht_coffee_table_01",
    "apa_mp_h_yacht_coffee_table_02",
    "apa_mp_h_yacht_floor_lamp_01",
    "apa_mp_h_yacht_side_table_01",
    "apa_mp_h_yacht_side_table_02",
    "apa_mp_h_yacht_sofa_01",
    "apa_mp_h_yacht_sofa_02",
    "apa_mp_h_yacht_stool_01",
    "apa_mp_h_yacht_strip_chair_01",
    "apa_mp_h_yacht_table_lamp_01",
    "apa_mp_h_yacht_table_lamp_02",
    "apa_mp_h_yacht_table_lamp_03",
    "prop_flag_columbia",
    "apa_mp_apa_yacht_o2_rail_a",
    "apa_mp_apa_yacht_o2_rail_b",
    "apa_mp_apa_yacht_o3_rail_a",
    "apa_mp_apa_yacht_o3_rail_b",
    "apa_mp_apa_yacht_option1",
    "proc_searock_01",
    "apa_mp_h_yacht_",
    "apa_mp_apa_yacht_option1_cola",
    "apa_mp_apa_yacht_option2",
    "apa_mp_apa_yacht_option2_cola",
    "apa_mp_apa_yacht_option2_colb",
    "apa_mp_apa_yacht_option3",
    "apa_mp_apa_yacht_option3_cola",
    "apa_mp_apa_yacht_option3_colb",
    "apa_mp_apa_yacht_option3_colc",
    "apa_mp_apa_yacht_option3_cold",
    "apa_mp_apa_yacht_option3_cole",
    "apa_mp_apa_yacht_jacuzzi_cam",
    "apa_mp_apa_yacht_jacuzzi_ripple003",
    "apa_mp_apa_yacht_jacuzzi_ripple1",
    "apa_mp_apa_yacht_jacuzzi_ripple2",
    "apa_mp_apa_yacht_radar_01a",
    "apa_mp_apa_yacht_win",
    "prop_crashed_heli",
    "apa_mp_apa_yacht_door",
    "prop_shamal_crash",
    "xm_prop_x17_shamal_crash",
    "apa_mp_apa_yacht_door2",
    "apa_mp_apa_yacht",
    "prop_flagpole_2b",
    "prop_flagpole_2c",
    "prop_flag_canada",
    "apa_prop_yacht_float_1a",
    "apa_prop_yacht_float_1b",
    "apa_prop_yacht_glass_01",
    "apa_prop_yacht_glass_02",
    "apa_prop_yacht_glass_03",
    "apa_prop_yacht_glass_04",
    "apa_prop_yacht_glass_05",
    "apa_prop_yacht_glass_06",
    "apa_prop_yacht_glass_07",
    "apa_prop_yacht_glass_08",
    "apa_prop_yacht_glass_09",
    "apa_prop_yacht_glass_10",
    "prop_flag_canada_s",
    "prop_flag_eu",
    "prop_flag_eu_s",
    "prop_target_blue_arrow",
    "prop_target_orange_arrow",
    "prop_target_purp_arrow",
    "prop_target_red_arrow",
    "apa_prop_flag_argentina",
    "apa_prop_flag_australia",
    "apa_prop_flag_austria",
    "apa_prop_flag_belgium",
    "apa_prop_flag_brazil",
    "apa_prop_flag_canadat_yt",
    "apa_prop_flag_china",
    "apa_prop_flag_columbia",
    "apa_prop_flag_croatia",
    "apa_prop_flag_czechrep",
    "apa_prop_flag_denmark",
    "apa_prop_flag_england",
    "apa_prop_flag_eu_yt",
    "apa_prop_flag_finland",
    "apa_prop_flag_france",
    "apa_prop_flag_german_yt",
    "apa_prop_flag_hungary",
    "apa_prop_flag_ireland",
    "apa_prop_flag_israel",
    "apa_prop_flag_italy",
    "apa_prop_flag_jamaica",
    "apa_prop_flag_japan_yt",
    "apa_prop_flag_canada_yt",
    "apa_prop_flag_lstein",
    "apa_prop_flag_malta",
    "apa_prop_flag_mexico_yt",
    "apa_prop_flag_netherlands",
    "apa_prop_flag_newzealand",
    "apa_prop_flag_nigeria",
    "apa_prop_flag_norway",
    "apa_prop_flag_palestine",
    "apa_prop_flag_poland",
    "apa_prop_flag_portugal",
    "apa_prop_flag_puertorico",
    "apa_prop_flag_russia_yt",
    "apa_prop_flag_scotland_yt",
    "apa_prop_flag_script",
    "apa_prop_flag_slovakia",
    "apa_prop_flag_slovenia",
    "apa_prop_flag_southafrica",
    "apa_prop_flag_southkorea",
    "apa_prop_flag_spain",
    "apa_prop_flag_sweden",
    "apa_prop_flag_switzerland",
    "apa_prop_flag_turkey",
    "apa_prop_flag_uk_yt",
    "apa_prop_flag_us_yt",
    "apa_prop_flag_wales",
    "prop_flag_uk",
    "prop_flag_uk_s",
    "prop_flag_us",
    "prop_flag_usboat",
    "prop_flag_us_r",
    "prop_flag_us_s",
    "prop_flag_france",
    "prop_flag_france_s",
    "prop_flag_german",
    "prop_flag_german_s",
    "prop_flag_ireland",
    "prop_flag_ireland_s",
    "prop_flag_japan",
    "prop_flag_japan_s",
    "prop_flag_ls",
    "prop_flag_lsfd",
    "prop_flag_lsfd_s",
    "prop_flag_lsservices",
    "prop_flag_lsservices_s",
    "prop_flag_ls_s",
    "prop_flag_mexico",
    "prop_flag_mexico_s",
    "prop_flag_russia",
    "prop_flag_russia_s",
    "prop_flag_s",
    "prop_flag_sa",
    "prop_flag_sapd",
    "prop_flag_sapd_s",
    "prop_flag_sa_s",
    "prop_flag_scotland",
    "prop_flag_scotland_s",
    "prop_flag_sheriff",
    "prop_flag_sheriff_s",
    "prop_flag_uk",
    "prop_flag_uk_s",
    "prop_flag_us",
    "prop_flag_usboat",
    "prop_flag_us_r",
    "prop_flag_us_s",
    "prop_flamingo",
    "prop_swiss_ball_01",
    "prop_air_bigradar_l1",
    "prop_air_bigradar_l2",
    "prop_air_bigradar_slod",
    "p_fib_rubble_s",
    "prop_money_bag_01",
    "p_cs_mp_jet_01_s",
    "prop_poly_bag_money",
    "prop_air_radar_01",
    "hei_prop_carrier_radar_1",
    "prop_air_bigradar",
    "prop_carrier_radar_1_l1",
    "prop_asteroid_01",
    --"prop_xmas_ext",
    "p_oil_pjack_01_amo",
    "p_oil_pjack_01_s",
    "p_oil_pjack_02_amo",
    "p_oil_pjack_03_amo",
    "p_oil_pjack_02_s",
    "p_oil_pjack_03_s",
    "prop_aircon_l_03",
    "prop_med_jet_01",
    "p_med_jet_01_s",
    "hei_prop_carrier_jet",
    "bkr_prop_biker_bblock_huge_01",
    "bkr_prop_biker_bblock_huge_02",
    "bkr_prop_biker_bblock_huge_04",
    "bkr_prop_biker_bblock_huge_05",
    "hei_prop_heist_emp",
    "prop_weed_01",
    "prop_air_bigradar",
    "prop_juicestand",
    "prop_lev_des_barge_02",
    "hei_prop_carrier_defense_01",
    "prop_aircon_m_04",
    "prop_mp_ramp_03",
    "ch3_12_animplane1_lod",
    "ch3_12_animplane2_lod",
    "hei_prop_hei_pic_pb_plane",
    "light_plane_rig",
    "prop_cs_plane_int_01",
    "prop_dummy_plane",
    "prop_mk_plane",
    "v_44_planeticket",
    "prop_planer_01",
    "ch3_03_cliffrocks03b_lod",
    "ch3_04_rock_lod_02",
    "csx_coastsmalrock_01_",
    "csx_coastsmalrock_02_",
    "csx_coastsmalrock_03_",
    "csx_coastsmalrock_04_",
    "mp_player_introck",
    "Heist_Yacht",
    "csx_coastsmalrock_05_",
    "mp_player_int_rock",
    "mp_player_introck",
    "prop_flagpole_1a",
    "prop_flagpole_2a",
    "prop_flagpole_3a",
    "prop_a4_pile_01",
    "cs2_10_sea_rocks_lod",
    "cs2_11_sea_marina_xr_rocks_03_lod",
    "prop_gold_cont_01",
    "prop_hydro_platform",
    "ch3_04_viewplatform_slod",
    "ch2_03c_rnchstones_lod",
    "proc_mntn_stone01",
    "prop_beachflag_le",
    "proc_mntn_stone02",
    "cs2_10_sea_shipwreck_lod",
    "des_shipsink_02",
    "prop_dock_shippad",
    "des_shipsink_03",
    "des_shipsink_04",
    "prop_mk_flag",
    "prop_mk_flag_2",
    "proc_mntn_stone03",
    "FreeModeMale01",
    "rsn_os_specialfloatymetal_n",
    "rsn_os_specialfloatymetal",
    "cs1_09_sea_ufo",
    "rsn_os_specialfloaty2_light2",
    "rsn_os_specialfloaty2_light",
    "rsn_os_specialfloaty2",
    "rsn_os_specialfloatymetal_n",
    "rsn_os_specialfloatymetal",
    "P_Spinning_Anus_S_Main",
    "P_Spinning_Anus_S_Root",
    "cs3_08b_rsn_db_aliencover_0001cs3_08b_rsn_db_aliencover_0001_a",
    "sc1_04_rnmo_paintoverlaysc1_04_rnmo_paintoverlay_a",
    "rnbj_wallsigns_0001",
    "proc_sml_stones01",
    "proc_sml_stones02",
    "maverick",
    "Miljet",
    "proc_sml_stones03",
    "proc_stones_01",
    "proc_stones_02",
    "proc_stones_03",
    "proc_stones_04",
    "proc_stones_05",
    "proc_stones_06",
    "prop_coral_stone_03",
    "prop_coral_stone_04",
    "prop_gravestones_01a",
    "prop_gravestones_02a",
    "prop_gravestones_03a",
    "prop_gravestones_04a",
    "prop_gravestones_05a",
    "prop_gravestones_06a",
    "prop_gravestones_07a",
    "prop_gravestones_08a",
    "prop_gravestones_09a",
    "prop_gravestones_10a",
    "prop_prlg_gravestone_05a_l1",
    "prop_prlg_gravestone_06a",
    "test_prop_gravestones_04a",
    "test_prop_gravestones_05a",
    "test_prop_gravestones_07a",
    "test_prop_gravestones_08a",
    "test_prop_gravestones_09a",
    "prop_prlg_gravestone_01a",
    "prop_prlg_gravestone_02a",
    "prop_prlg_gravestone_03a",
    "prop_prlg_gravestone_04a",
    "prop_stoneshroom1",
    "prop_stoneshroom2",
    "v_res_fa_stones01",
    "test_prop_gravestones_01a",
    "test_prop_gravestones_02a",
    "prop_prlg_gravestone_05a",
    "FreemodeFemale01",
    "p_cablecar_s",
    "stt_prop_stunt_tube_l",
    "stt_prop_stunt_track_dwuturn",
    "p_spinning_anus_s",
    "prop_windmill_01",
    "hei_prop_heist_tug",
    "prop_air_bigradar",
    "p_oil_slick_01",
    "prop_dummy_01",
    "hei_prop_heist_emp",
    "p_tram_cash_s",
    "hw1_blimp_ce2",
    "prop_fire_exting_1a",
    "prop_fire_exting_1b",
    "prop_fire_exting_2a",
    "prop_fire_exting_3a",
    "hw1_blimp_ce2_lod",
    "hw1_blimp_ce_lod",
    "hw1_blimp_cpr003",
    "hw1_blimp_cpr_null",
    "hw1_blimp_cpr_null2",
    "prop_lev_des_barage_02",
    "hei_prop_carrier_defense_01",
    "prop_juicestand",
    "u_m_y_babyd",
    "CS_Orleans",
    "A_M_Y_ACult_01",
    "U_M_Y_Zombie_01",
    "v_ilev_found_cranebucket",
    "p_cs_sub_hook_01_s",
    "hei_prop_heist_hook_01",
    "prop_rope_hook_01",
    "prop_sub_crane_hook",
    "prop_vehicle_hook",
    "prop_v_hook_s",
    "prop_dock_crane_02_hook",
    "prop_winch_hook_long",
    "prop_coathook_01",
    "prop_cs_sub_hook_01",
    "CS_Orleans",
    "prop_windmill_01",
    "prop_Ld_ferris_wheel",
    "p_tram_crash_s",
    "p_oil_slick_01",
    "p_ld_stinger_s",
    "p_ld_soc_ball_01",
    "p_parachute1_s",
    "prop_beach_fire",
    "prop_lev_des_barge_02",
    "prop_lev_des_barge_01",
    "prop_sculpt_fix",
    "prop_flagpole_2b",
    "prop_flagpole_2c",
    "prop_winch_hook_short",
    "prop_flag_canada",
    "prop_flag_canada_s",
    "prop_flag_eu",
    "prop_flag_eu_s",
    "prop_flag_france",
    "prop_flag_france_s",
    "prop_flag_german",
    "prop_ld_hook",
    "prop_flag_german_s",
    "prop_flag_ireland",
    "prop_flag_ireland_s",
    "prop_flag_japan",
    "prop_flag_japan_s",
    "prop_flag_ls",
    "prop_flag_lsfd",
    "prop_flag_lsfd_s",
    "prop_cable_hook_01",
    "prop_flag_lsservices",
    "prop_flag_lsservices_s",
    "prop_flag_ls_s",
    "prop_flag_mexico",
    "prop_flag_mexico_s",
    "csx_coastboulder_00",
    "des_tankercrash_01",
    "des_tankerexplosion_01",
    "des_tankerexplosion_02",
    "des_trailerparka_02",
    "des_trailerparkb_02",
    "des_trailerparkc_02",
    "des_trailerparkd_02",
    "des_traincrash_root2",
    "des_traincrash_root3",
    "des_traincrash_root4",
    "des_traincrash_root5",
    "des_finale_vault_end",
    "des_finale_vault_root001",
    "des_finale_vault_root002",
    "des_finale_vault_root003",
    "des_finale_vault_root004",
    "des_finale_vault_start",
    "des_vaultdoor001_root001",
    "des_vaultdoor001_root002",
    "des_vaultdoor001_root003",
    "des_vaultdoor001_root004",
    "des_vaultdoor001_root005",
    "des_vaultdoor001_root006",
    "des_vaultdoor001_skin001",
    "des_vaultdoor001_start",
    "des_traincrash_root6",
    "prop_ld_vault_door",
    "prop_vault_door_scene",
    "prop_vault_door_scene",
    "prop_vault_shutter",
    "p_fin_vaultdoor_s",
    "v_ilev_bk_vaultdoor",
    "prop_gold_vault_fence_l",
    "prop_gold_vault_fence_r",
    "prop_gold_vault_gate_01",
    "prop_bank_vaultdoor",
    "des_traincrash_root7",
    "prop_flag_russia",
    "prop_flag_russia_s",
    "prop_flag_s",
    "ch2_03c_props_rrlwindmill_lod",
    "prop_flag_sa",
    "prop_flag_sapd",
    "prop_flag_sapd_s",
    "prop_flag_sa_s",
    "prop_flag_scotland",
    "prop_flag_scotland_s",
    "prop_flag_sheriff",
    "prop_flag_sheriff_s",
    "prop_flag_uk",
    "prop_yacht_lounger",
    "prop_yacht_seat_01",
    "prop_yacht_seat_02",
    "prop_yacht_seat_03",
    "marina_xr_rocks_02",
    "marina_xr_rocks_03",
    "prop_test_rocks01",
    "prop_test_rocks02",
    "prop_test_rocks03",
    "prop_test_rocks04",
    "marina_xr_rocks_04",
    "marina_xr_rocks_05",
    "marina_xr_rocks_06",
    "prop_yacht_table_01",
    "csx_searocks_02",
    "csx_searocks_03",
    "csx_searocks_04",
    "csx_searocks_05",
    "csx_searocks_06",
    "p_yacht_chair_01_s",
    "p_yacht_sofa_01_s",
    "prop_yacht_table_02",
    "csx_coastboulder_00",
    "csx_coastboulder_01",
    "csx_coastboulder_02",
    "csx_coastboulder_03",
    "csx_coastboulder_04",
    "csx_coastboulder_05",
    "csx_coastboulder_06",
    "csx_coastboulder_07",
    "csx_coastrok1",
    "csx_coastrok2",
    "csx_coastrok3",
    "csx_coastrok4",
    "csx_coastsmalrock_01",
    "csx_coastsmalrock_02",
    "csx_coastsmalrock_03",
    "csx_coastsmalrock_04",
    "csx_coastsmalrock_05",
    "prop_yacht_table_03",
    "prop_flag_uk_s",
    "prop_flag_us",
    "prop_flag_usboat",
    "prop_flag_us_r",
    "prop_flag_us_s",
    "p_gasmask_s",
    "prop_flamingo",
    "prop_sec_barier_02b",
    "prop_sec_barier_02a",
    "stt_prop_ramp_adj_loop",
    "stt_prop_ramp_multi_loop_rb",
    "stt_prop_stunt_jump_loop",
    "stt_prop_ramp_adj_hloop",
    "stt_prop_stunt_wideramp",
    "stt_prop_stunt_ramp",
    "stt_prop_ramp_spiral_xxl",
    "stt_prop_ramp_spiral_s",
    "stt_prop_ramp_spiral_m",
    "stt_prop_ramp_spiral_l_xxl",
    "stt_prop_ramp_spiral_l_m",
    "stt_prop_ramp_spiral_l_s",
    "stt_prop_ramp_spiral_l_l",
    "stt_prop_ramp_spiral_l"
}


local BlacklistedObjects = {}

for i = 1, #blockedProps do
    local modelName = GetHashKey(blockedProps[i])
    BlacklistedObjects[modelName] = true
end

-- ##Delete blacklisted props##
Citizen.CreateThread(function()
    while true do 
        Wait(5000)
        for prop in EnumerateObjects() do
            if DoesEntityExist(prop) then
                if BlacklistedObjects[GetEntityModel(prop)] then
                    NetworkRequestControlOfEntity(prop)
                    SetEntityAsMissionEntity(prop)
                    DeleteEntity(prop)
                end
            end
        end
    end
end)

local blockedPeds = { -- change this list and add the peds you want
    "a_m_o_acult_01",
    --"a_c_killerwhale", 
    --"a_c_sharktiger", 
    "csb_stripper_01",
    "s_m_y_swat_01",
    --"a_c_boar",
    --"a_c_cat_01",
    --"a_c_chickenhawk",
    --"a_c_chimp",
    --"a_c_chop",
    --"a_c_cormorant",
    --"a_c_cow",
    --"a_c_coyote",
    --"a_c_crow",
    --"a_c_dolphin",
    --"a_c_fish",
    --"a_c_hen",
    --"a_c_humpback",
    --"a_c_husky",
    --"a_c_mtlion",
    --"a_c_pigeon",
    --"a_c_poodle",
    --"a_c_pug",
    --"a_c_rabbit_01",
    --"a_c_rat",
    --"a_c_retriever",
    --"a_c_rhesus",
    --"a_c_rottweiler",
    --"a_c_sharkhammer",
    --"a_c_shepherd",
    --"a_c_stingray",
    --"a_c_westy",
    "S_M_M_MovAlien_01",
    "s_m_m_movalien_01",
    "s_m_m_movallien_01",
    "S_M_M_MovSpace_01",
    "s_m_y_blackops_01",
    "a_f_y_topless_01",
    "s_f_y_hooker_03",
    "s_f_y_hooker_01",
}

local blockedWeapons = { -- change this list and add the weapons you want
    --"WEAPON_MICROSMG",
    "WEAPON_MINISMG",
    --"WEAPON_SMG",
    "WEAPON_SMG_MK2",
    "WEAPON_ASSAULTSMG",
    "WEAPON_MG",
    "WEAPON_COMBATMG",
    "WEAPON_COMBATMG_MK2",
    "WEAPON_COMBATPDW",
    "WEAPON_GUSENBERG",
    --"WEAPON_ASSAULTRIFLE",
    "WEAPON_ASSAULTRIFLE_MK2",
    --"WEAPON_CARBINERIFLE",
    --"WEAPON_CARBINERIFLE_MK2",
    "WEAPON_ADVANCEDRIFLE",
    --"WEAPON_SPECIALCARBINE",
    --"WEAPON_BULLPUPRIFLE",
    "WEAPON_COMPACTRIFLE",
    --"WEAPON_PUMPSHOTGUN",
    "WEAPON_SWEEPERSHOTGUN",
    --"WEAPON_SAWNOFFSHOTGUN",
    "WEAPON_BULLPUPSHOTGUN",
    "WEAPON_ASSAULTSHOTGUN",
    "WEAPON_MUSKET",
    "WEAPON_HEAVYSHOTGUN",
    "WEAPON_DBSHOTGUN",
    "WEAPON_SNIPERRIFLE",
    "WEAPON_HEAVYSNIPER",
    "WEAPON_HEAVYSNIPER_MK2",
    "WEAPON_MARKSMANRIFLE",
    "WEAPON_GRENADELAUNCHER",
    "WEAPON_GRENADELAUNCHER_SMOKE",
    "WEAPON_RPG",
    "WEAPON_MINIGUN",
    --"WEAPON_FIREWORK",
    "WEAPON_RAILGUN",
    "WEAPON_HOMINGLAUNCHER",
    "WEAPON_COMPACTLAUNCHER",
    --"WEAPON_SPECIALCARBINE_MK2",
    "WEAPON_BULLPUPRIFLE_MK2",
    --"WEAPON_PUMPSHOTGUN_MK2",
    "WEAPON_MARKSMANRIFLE_MK2",
    "WEAPON_RAYPISTOL",
    "WEAPON_RAYCARBINE",
    "WEAPON_RAYMINIGUN",
    "WEAPON_DIGISCANNER",
    "WEAPON_REVOLVER",
    --"WEAPON_PISTOL",
    "WEAPON_PISTOL_MK2",
    --"WEAPON_COMBATPISTOL",
    --"WEAPON_APPISTOL",
    --"WEAPON_PISTOL50",
    --"WEAPON_SNSPISTOL",
    --"WEAPON_HEAVYPISTOL",
    --"WEAPON_VINTAGEPISTOL",
    --"WEAPON_STUNGUN",
    "WEAPON_FLAREGUN",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
    "WEAPON_PROXMINE",
    "WEAPON_BZGAS",
    "WEAPON_PIPEBOMB",
    --"WEAPON_SMOKEGRENADE",
    "WEAPON_MOLOTOV",
    --"WEAPON_FIREEXTINGUISHER",
    --"WEAPON_PETROLCAN",
    "WEAPON_SNOWBALL",
    --"WEAPON_FLARE",
    "WEAPON_BALL",
    "WEAPON_GRENADE",
    --"WEAPON_STICKYBOMB",
    --"WEAPON_KNIFE",
    --"WEAPON_KNUCKLE",
    --"WEAPON_NIGHTSTICK",
    --"WEAPON_HAMMER",
    --"WEAPON_BAT",
    --"WEAPON_GOLFCLUB",
    --"WEAPON_CROWBAR",
    --"WEAPON_BOTTLE",
    --"WEAPON_DAGGER",
    --"WEAPON_HATCHET",
    --"WEAPON_MACHETE",
    --"WEAPON_FLASHLIGHT",
    --"WEAPON_SWITCHBLADE",
    --"WEAPON_POOLCUE",
    --"WEAPON_PIPEWRENCH"
}
 local foundblacklisted = false
-- black listed weapons check
Citizen.CreateThread(function()
    while true do
        foundblacklisted = false
        for _, theWeapon in ipairs(blockedWeapons) do
            if HasPedGotWeapon(PlayerPedId(), GetHashKey(theWeapon), false) == 1 then
                RemoveWeaponFromPed(PlayerPedId(), GetHashKey(theWeapon))
                foundblacklisted = true
                Wait(200)
            end
        end
        if foundblacklisted then
            TriggerServerEvent('weaponalert')
        end
        Citizen.Wait(8000)
    end
end)

local modelHashes = { -- add prop hex here
        0x34315488,
        0x6A27FEB1, 0xCB2ACC8,
        0xC6899CDE, 0xD14B5BA3,
        0xD9F4474C, 0x32A9996C,
        0x69D4F974, 0xCAFC1EC3,
        0x79B41171, 0x1075651,
        0xC07792D4, 0x781E451D,
        0x762657C6, 0xC2E75A21,
        0xC3C00861, 0x81FB3FF0,
        0x45EF7804, 0xE65EC0E4,
        0xE764D794, 0xFBF7D21F,
        0xE1AEB708, 0xA5E3D471,
        0xD971BBAE, 0xCF7A9A9D,
        0xC2CC99D8, 0x8FB233A4,
        0x24E08E1F, 0x337B2B54,
        0xB9402F87, 0x4F2526DA,
        0x745F3383, 0xFA2E099C,
        0x4F2A07DE, 0x2FEA25BF,
        0x79C0A750, 0xDA76FE6E,
        0xF75A749A
}

Citizen.CreateThread(function()

    while true do

        Citizen.Wait(10000)

        SetPedInfiniteAmmoClip(PlayerPedId(), false, GetSelectedPedWeapon(PlayerPedId()))

        SetEntityInvincible(PlayerPedId(), false)

        SetEntityCanBeDamaged(PlayerPedId(), true)

        local fallin = IsPedFalling(PlayerPedId())

        local ragg = IsPedRagdoll(PlayerPedId())

        local parac = GetPedParachuteState(PlayerPedId())

        if parac >= 0 or ragg or fallin then

            SetEntityMaxSpeed(PlayerPedId(), 80.0)

        else

            SetEntityMaxSpeed(PlayerPedId(), 7.1)

        end

    end

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        SetWeaponDamageModifier(539292904, 0.0) -- isis explode
        SetWeaponDamageModifier(-842959696, 0.0) -- vdm?
        SetWeaponDamageModifier(133987706, 0.0)
        SetWeaponDamageModifier(3452007600, 0.0)
        SetWeaponDamageModifier(3750660587, 0.0)
        SetWeaponDamageModifier(-544306709, 0.0)
        --SetAiWeaponDamageModifier(0.0) -- probably why money truck is so easy
        SetWeaponDamageModifier(507170720, 0.0) -- tank
        SetWeaponDamageModifier(-1312131151,0.0)
        SetWeaponDamageModifier(-1660422300,0.0)

        SetWeaponDamageModifier(GetHashKey("WEAPON_FIRE"),0.0)
    end
end)


local BLModels = {}

for i = 1, #blockedModels do
    local modelN = GetHashKey(blockedModels[i])
    BLModels[modelN] = true
end

local vehdelete = 1500

Citizen.CreateThread(function()
    local sleep
    while true do
        sleep = 1000
        if modderdetected then
            vehdelete = 100
            sleep = 10000
            modderdetected = false
        else
            vehdelete = 1500
            sleep = 2000
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        for veh in EnumerateVehicles() do
            if DoesEntityExist(veh) then
                local vh = GetVehicleClass(veh)
                if  vh == 10 or vh == 11 or vh == 14 or vh == 15 or vh == 16 or vh == 17 or vh == 18 or vh == 19 or vh == 20 or vh == 21 then
                    local hp = GetEntityHealth(veh)
                    if hp <= 100 then
                        SetEntityAsMissionEntity(veh)
                        DeleteEntity(veh)
                    end 
                end
            end
        end
        Citizen.Wait(2000)
    end
end)

whitelistVEHICLE = false
RegisterNetEvent('blacklist:whitelistVEHICLE')
AddEventHandler('blacklist:whitelistVEHICLE', function()
    ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank)
        Wait(500)
        if playerRank == "superadmin" then
            whitelistVEHICLE = true
        end
    end)
end)

-- ##Delete blacklisted vehicles##
Citizen.CreateThread(function()
    while true do
        if not whitelistVEHICLE then
            for veh in EnumerateVehicles() do
                if DoesEntityExist(veh) then
                    if BLModels[GetEntityModel(veh)] then
                        modderdetected = true
                        NetworkRequestControlOfEntity(veh)
                        SetEntityAsMissionEntity(veh)
                        DeleteEntity(veh)
                    end
                end
            end
        end
        Wait(vehdelete)
    end
end)

--[[
Citizen.CreateThread(function()
    while true do
        for veh in EnumerateVehicles() do
            local model = GetEntityModel(veh)           
            for _,car in pairs(blockedModels) do
                vh = GetVehicleClass(theveh)
                if GetHashKey(car) == model then          
                    --if model == GetHashKey("maverick") or model == GetHashKey("luxor") then
                        --if GetPedInVehicleSeat(veh, -1) == 0 then

                            --print(GetPedInVehicleSeat(veh, -1),print("found"))
                            --SetEntityAsMissionEntity(veh, true, true)
                            --DeleteVehicle(veh)

                        --end
                    --else
                        --TriggerServerEvent('prp-admin:blacklist')
                        SetEntityAsMissionEntity(veh)
                        DeleteVehicle(veh)

                    --end
                    --if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
                        --add server kick here
                    --end
                    --SetEntityAsMissionEntity(veh, true, true)
                    --DeleteVehicle(veh)                    
                end
                if vh == 10 or vh == 11 or vh == 14 or vh == 15 or vh == 16 or vh == 17 or vh == 18 or vh == 19 or vh == 20 or vh == 21 then
                    SetEntityAsMissionEntity(veh)
                    DeleteVehicle(veh)
                end
            end
        end
        Citizen.Wait(600)
    end
end)
]]

local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end
    
    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)
    
    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next
    
    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

--[[
-- ##Delete blacklisted props##
Citizen.CreateThread(function()
    while true do 
        local prop1
        local ped1
        for prop in EnumerateObjects() do
            prop1 = GetEntityModel(prop)
            for _,blockedprop in pairs(blockedProps) do
                local prop2 = GetHashKey(blockedprop)
                if prop1 == prop2 then
                    SetEntityAsMissionEntity(prop, false, false)
                    DeleteEntity(prop)
                end
            end
        end
        
        Citizen.Wait(6000)
    end
end)
]]--

local Whitelistedpeds = {
    "s_m_m_security_01",
    "s_m_y_dealer_01",
    "G_M_Y_MexGang_01",
    "G_M_Y_SalvaBoss_01",
    "G_M_Y_Lost_02",
    "a_m_m_beach_02",
    "u_m_m_partytarget",
    "s_m_y_pilot_01"
}

local WhitelistedPedsTable = {}

for i = 1, #Whitelistedpeds do
    local modelName = GetHashKey(Whitelistedpeds[i])
    WhitelistedPedsTable[modelName] = true
end

whitelistPED = false
RegisterNetEvent('blacklist:whitelistPED')
AddEventHandler('blacklist:whitelistPED', function(model)
    ESX.TriggerServerCallback("esx_marker:fetchUserRank", function(playerRank)
        Wait(500)
        if playerRank == "superadmin" then
            whitelistPED = true
        end
    end)
end)

-- ##Delete blacklisted Peds##
Citizen.CreateThread(function()
    while true do 
        Wait(6000)
        if not whitelistPED then
            local ped1
            for ped in EnumeratePeds() do
                ped1 = GetEntityModel(ped)
                if IsPedArmed(ped, 7) then
                    if not IsPedAPlayer(ped) then
                        if not WhitelistedPedsTable[GetEntityModel(ped)] then
                            SetEntityAsMissionEntity(ped)
                            DeleteEntity(ped)
                        end
                    end
                end
                for _,blockedped in pairs(blockedPeds) do
                    local ped2 = GetHashKey(blockedped)
                    if ped1 == ped2 then
                        if IsPedInAnyVehicle(ped, false) then
                            local vehi = GetVehiclePedIsIn(ped, true)
                            SetEntityAsMissionEntity(vehi)
                            DeleteEntity(vehi)
                        end
                        SetEntityAsMissionEntity(ped)
                        DeleteEntity(ped)
                    end
                end
            end
            ped2 = nil
            ped = nil
            ped1 = nil
        end
    end
end)

--[[
Citizen.CreateThread(function()
    local fly
    while true do
        for flying in EnumerateVehicles() do
            if GetEntityHealth(flying) <= 100 then
                fly = GetVehicleClass(flying)
                if fly == 16 or fly == 15 or fly == 19 or fly == 21 or fly == 14 then
                    --if GetPedInVehicleSeat(theveh, -1) == 0 then
                        SetEntityAsMissionEntity(flying)
                        DeleteEntity(flying)
                    --end
                end
            end
        end
        fly = nil
        flying = nil
        Citizen.Wait(2000)
    end
end)
]]

--clean up cars after 20 minutes (blown up ones and broken down)
Citizen.CreateThread(function()
    local vh
    while true do
        print("Cleaning up vehicles.")
        for theveh in EnumerateVehicles() do
            if GetEntityHealth(theveh) <= 100 then
				vh = GetVehicleClass(theveh)
				if vh ~= 16 or vh ~= 15 or vh ~= 19 or vh ~= 21 or vh ~= 14 then
                    --if GetPedInVehicleSeat(theveh, -1) == 0 then
                        SetEntityAsMissionEntity(theveh)
                        DeleteEntity(theveh)
                    --end
				end
            end
        end
        Citizen.Wait(1200000)
    end
end)


