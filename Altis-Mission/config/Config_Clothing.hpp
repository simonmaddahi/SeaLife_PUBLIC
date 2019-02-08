/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        4: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*   DLC Clothing Items added by [TIG] Alex
*
*/
class Clothing {
    class bruce {
        title = "STR_Shops_C_Bruce";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", "Kleidung entfernen", 0, "" },
			{ "U_C_Commoner1_1", "", 3750, "" },
			{ "U_C_Poloshirt_salmon", "", 3750, "" },
            { "U_C_Poloshirt_burgundy", "", 3750, "" },
            { "U_C_WorkerCoveralls", "", 3750, "" },
			{ "U_C_IDAP_Man_cargo_F", "", 3750, "" },
			{ "U_C_IDAP_Man_shorts_F", "", 3750, "" },
			{ "U_C_IDAP_Man_Tee_F", "", 3750, "" },
			{ "U_C_IDAP_Man_TeeShorts_F", "", 3750, "" },
			{ "U_I_C_Soldier_Bandit_4_F", "", 3750, "" },
			{ "U_I_C_Soldier_Bandit_5_F", "", 3750, "" },
			{ "U_I_C_Soldier_Bandit_1_F", "", 3750, "" },
			{ "U_I_C_Soldier_Bandit_3_F", "", 3750, "" },
			{ "U_I_C_Soldier_Bandit_2_F", "", 3750, "" },
			{ "U_C_ConstructionCoverall_Blue_F", "", 3750, "" },
			{ "U_C_ConstructionCoverall_Red_F", "", 3750, "" },
			{ "U_C_ConstructionCoverall_Black_F", "", 3750, "" },
			{ "U_C_ConstructionCoverall_Vrana_F", "", 3750, "" },
			{ "U_C_Poloshirt_blue", "", 3750, "" },
			{ "U_C_Poloshirt_redwhite", "", 3750, "" },
			{ "U_C_Poloshirt_strippe", "", 3750, "" },
			{ "U_C_Poloshirt_stripped", "", 3750, "" },
			{ "U_C_Poloshirt_tricolour", "", 3750, "" },
			{ "U_C_Poor_1", "", 3750, "" },
			{ "U_BG_Guerilla2_1", "", 3750, "" },
			{ "U_BG_Guerilla2_3", "", 3750, "" },
			{ "U_BG_Guerilla2_2", "", 3750, "" },
			{ "U_BG_Guerilla3_1", "", 3750, "" },
			{ "U_I_HeliPilotCoveralls", "", 3750, "" },
			{ "U_B_HeliPilotCoveralls", "", 3750, "" },
			{ "U_OrestesBody", "", 3750, "" },
			{ "U_C_HunterBody_grn", "", 3750, "" },
			{ "U_I_G_resistanceLeader_F", "", 3750, "" },
			{ "U_C_Man_casual_2_F", "", 3750, "" },
			{ "U_C_Man_casual_3_F", "", 3750, "" },
			{ "U_C_Mechanic_01_F", "", 3750, "" },
			{ "U_C_Man_casual_5_F", "", 3750, "" },
			{ "U_C_Man_casual_4_F", "", 3750, "" },
			{ "U_C_Man_casual_6_F", "", 3750, "" },
			{ "U_C_man_sport_3_F", "", 3750, "" },
			{ "U_C_man_sport_2_F", "", 3750, "" },
			{ "U_C_man_sport_1_F", "", 3750, "" },
			{ "U_C_Scientist", "", 3750, "" }
        };
		
        headgear[] = {
            { "NONE", "Kopfbedeckung entfernen", 0, "" },
            { "H_Bandanna_blu", "", 120, "" },
			{ "H_Bandanna_sand", "", 120, "" },
			{ "H_Bandanna_gry", "", 120, "" },
			{ "H_Bandanna_surfer_grn", "", 120, "" },
			{ "H_Bandanna_surfer_blk", "", 120, "" },
			{ "H_Bandanna_camo", "", 120, "" },
			{ "H_Watchcap_blk", "", 120, "" },
			{ "H_Watchcap_khk", "", 120, "" },
			{ "H_Watchcap_cbr", "", 120, "" },
			{ "H_Watchcap_camo", "", 120, "" },
			{ "H_Booniehat_khk_hs", "", 120, "" },
			{ "H_Booniehat_khk", "", 120, "" },
			{ "H_Booniehat_mcamo", "", 120, "" },
			{ "H_Booniehat_oli", "", 120, "" },
			{ "H_Booniehat_tan", "", 120, "" },
			{ "H_Booniehat_dgtl", "", 120, "" },
			{ "H_HeadSet_yellow_F", "", 120, "" },
			{ "H_HeadSet_orange_F", "", 120, "" },
			{ "H_HeadSet_red_F", "", 120, "" },
			{ "H_HeadSet_black_F", "", 120, "" },
			{ "H_HeadSet_white_F", "", 120, "" },
			{ "H_Hat_blue", "", 120, "" },
			{ "H_Hat_brown", "", 120, "" },
			{ "H_Hat_grey", "", 120, "" },
			{ "H_Hat_tan", "", 120, "" },
			{ "H_Hat_checker", "", 120, "" },
			{ "H_Hat_camo", "", 120, "" },
			{ "H_WirelessEarpiece_F", "", 120, "" },
			{ "H_Cap_Orange_IDAP_F", "", 120, "" },
			{ "H_Cap_White_IDAP_F", "", 120, "" },
			{ "H_HeadBandage_bloody_F", "", 120, "" },
			{ "H_HeadBandage_stained_F", "", 120, "" },
			{ "H_HeadBandage_clean_F", "", 120, "" },
			{ "H_Bandanna_cbr", "", 120, "" },
			{ "H_Bandanna_sgg", "", 120, "" },
			{ "H_Bandanna_khk_hs", "", 120, "" },
			{ "H_Bandanna_khk", "", 120, "" },
			{ "H_Bandanna_mcamo", "", 120, "" },
			{ "H_Bandanna_surfer", "", 120, "" },
			{ "H_Cap_marshal", "", 120, "" },
			{ "H_MilCap_blue", "", 120, "" },
			{ "H_MilCap_gen_F", "", 120, "" },
			{ "H_MilCap_gry", "", 120, "" },
			{ "H_MilCap_ghex_F", "", 120, "" },
			{ "H_MilCap_ocamo", "", 120, "" },
			{ "H_MilCap_mcamo", "", 120, "" },
			{ "H_MilCap_tna_F", "", 120, "" },
			{ "H_MilCap_dgtl", "", 120, "" },
			{ "H_Cap_grn_BI", "", 120, "" },
			{ "H_Cap_blu", "", 120, "" },
			{ "H_Cap_blk_CMMG", "", 120, "" },
			{ "H_Cap_grn", "", 120, "" },
			{ "H_Cap_tan", "", 120, "" },
			{ "H_Cap_blk_ION", "", 120, "" },
			{ "H_Cap_oli", "", 120, "" },
			{ "H_Cap_oli_hs", "", 120, "" },
			{ "H_Cap_press", "", 120, "" },
			{ "H_Cap_red", "", 120, "" },
			{ "H_Cap_blk", "", 120, "" },
			{ "H_Cap_surfer", "", 120, "" },
			{ "H_Cap_khaki_specops_UK", "", 120, "" },
			{ "H_Cap_tan_specops_US", "", 120, "" },
			{ "H_Cap_usblack", "", 120, "" },
			{ "H_Cap_blk_Raven", "", 120, "" },
			{ "H_Cap_brn_SPECOPS", "", 120, "" },
			{ "H_EarProtectors_yellow_F", "", 120, "" },
			{ "H_EarProtectors_orange_F", "", 120, "" },
			{ "H_EarProtectors_red_F", "", 120, "" },
			{ "H_EarProtectors_black_F", "", 120, "" },
			{ "H_EarProtectors_white_F", "", 120, "" },
			{ "H_PASGT_basic_blue_press_F", "", 120, "" },
			{ "H_PASGT_neckprot_blue_press_F", "", 120, "" },
			{ "H_Hat_Safari_olive_F", "", 120, "" },
			{ "H_Hat_Safari_sand_F", "", 120, "" },
			{ "H_Cap_headphones", "", 120, "" },
			{ "H_Construction_basic_yellow_F", "", 120, "" },
			{ "H_Construction_headset_yellow_F", "", 120, "" },
			{ "H_Construction_earprot_yellow_F", "", 120, "" },
			{ "H_Construction_basic_orange_F", "", 120, "" },
			{ "H_Construction_headset_orange_F", "", 120, "" },
			{ "H_Construction_earprot_orange_F", "", 120, "" },
			{ "H_Construction_basic_red_F", "", 120, "" },
			{ "H_Construction_headset_red_F", "", 120, "" },
			{ "H_Construction_earprot_red_F", "", 120, "" },
			{ "H_Construction_basic_black_F", "", 120, "" },
			{ "H_Construction_headset_black_F", "", 120, "" },
			{ "H_Construction_earprot_black_F", "", 120, "" },
			{ "H_Construction_basic_vrana_F", "", 120, "" },
			{ "H_Construction_headset_vrana_F", "", 120, "" },
			{ "H_Construction_earprot_vrana_F", "", 120, "" },
			{ "H_Construction_basic_white_F", "", 120, "" },
			{ "H_Construction_headset_white_F", "", 120, "" },
			{ "H_Construction_earprot_white_F", "", 120, "" },
			{ "H_Helmet_Skate", "", 120, "" },
			{ "H_PASGT_basic_blue_F", "", 120, "" },
			{ "H_PASGT_basic_olive_F", "", 120, "" },
			{ "H_PASGT_basic_black_F", "", 120, "" },
			{ "H_PASGT_basic_white_F", "", 120, "" },
			{ "H_StrawHat", "", 120, "" },
			{ "H_StrawHat_dark", "", 120, "" },
			{ "H_Booniehat_tna_F", "", 120, "" }
        };
		
        goggles[] = {
            { "NONE", "Brille entfernen", 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 200, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_WirelessEarpiece_F", "", 150, "" },
            { "G_EyeProtectors_F", "", 150, "" },
			{ "G_EyeProtectors_Earpiece_F", "", 150, "" }
        };
		
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
			{ "V_Safety_blue_F", "", 4500, "" },
			{ "V_Safety_orange_F", "", 4500, "" },
			{ "V_LegStrapBag_coyote_F", "", 4500, "" },
			{ "V_LegStrapBag_olive_F", "", 4500, "" },
			{ "V_LegStrapBag_black_F", "", 4500, "" },
			{ "V_Pocketed_coyote_F", "", 7500, "" },
			{ "V_Pocketed_olive_F", "", 7500, "" },
			{ "V_Pocketed_black_F", "", 7500, "" },
			{ "V_Press_F", "", 10500, "" }
        };
		
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" },
			{ "B_LegStrapBag_coyote_F", "", 3500, "" },
			{ "B_LegStrapBag_olive_F", "", 3500, "" },
			{ "B_LegStrapBag_black_F", "", 3500, "" },
            { "B_AssaultPack_khk", "", 4000, "" },
            { "B_AssaultPack_dgtl", "", 4000, "" },
            { "B_AssaultPack_rgr", "", 4000, "" },
            { "B_AssaultPack_sgg", "", 4000, "" },
            { "B_AssaultPack_blk", "", 4000, "" },
            { "B_AssaultPack_cbr", "", 4000, "" },
            { "B_AssaultPack_mcamo", "", 4000, "" },
			{ "B_Messenger_Gray_F", "", 4500, "" },
			{ "B_Messenger_Coyote_F", "", 4500, "" },
			{ "B_Messenger_Olive_F", "", 4500, "" },
			{ "B_Messenger_Black_F", "", 4500, "" },
			{ "B_Messenger_IDAP_F", "", 4500, "" },
			{ "B_FieldPack_blk", "", 5000, "" },
            { "B_FieldPack_ocamo", "", 5000, "" },
            { "B_FieldPack_oucamo", "", 5000, "" },
            { "B_FieldPack_ghex_f", "", 5000, "" }, //Apex DLC
			{ "B_OutdoorPack_blk", "", 5500, "" },
            { "B_TacticalPack_oli", "", 5500, "" },
            { "B_Bergen_sgg", "", 6500, "" },
            { "B_Bergen_mcamo", "", 6500, "" },
            { "B_Bergen_rgr", "", 6500, "" },
            { "B_Bergen_blk", "", 6500, "" },
			{ "B_ViperHarness_khk_F", "", 17500, "" },
			{ "B_ViperHarness_blk_F", "", 17500, "" },
			{ "B_ViperHarness_hex_F", "", 17500, "" },
			{ "B_ViperLightHarness_ghex_F", "", 17500, "" },
			{ "B_ViperLightHarness_blk_F", "", 17500, "" },
			{ "B_ViperLightHarness_hex_F", "", 17500, "" },
			{ "B_Kitbag_mcamo", "", 10000, "" },
            { "B_Kitbag_cbr", "", 10000, "" },
            { "B_Carryall_ocamo", "", 50000, "" },
            { "B_Carryall_oucamo", "", 50000, "" },
            { "B_Carryall_mcamo", "", 50000, "" },
            { "B_Carryall_oli", "", 50000, "" },
            { "B_Carryall_khk", "", 50000, "" },
            { "B_Carryall_cbr", "", 50000, "" },
            { "B_Carryall_ghex_f", "", 50000, "" }, //Apex DLC
            { "B_Bergen_dgtl_f", "", 125000, "" }, //Apex DLC
            { "B_Bergen_tna_f", "", 125000, "" } //Apex DLC
        };
    };

    class cop {
        title = "STR_Shops_C_Police";
        conditions = "";
        side = "cop";
        uniforms[] = {
			{ "U_Rangemaster", "Polizeikommissar Uniform (Lang)", 25, "call life_coplevel >= 1" },
            { "U_B_CTRG_3", "Polizei Uniform (Lang)", 25, "call life_coplevel >= 3" },
			{ "U_B_CTRG_1", "Polizei Uniform (Lang)", 25, "call life_coplevel >= 3" },
			{ "U_C_Man_casual_2_F", "Polizeileitung (Kurz)", 25, "call life_coplevel >= 8" },
            { "U_B_CTRG_Soldier_urb_1_F", "Polizeileitung (Lang)", 25, "call life_coplevel >= 8" },
			{ "U_B_CTRG_Soldier_urb_3_F", "Polizeileitung (Lang)", 25, "call life_coplevel >= 8" }
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "H_Cap_police", "", 25, "" },
            { "H_Beret_blk_POLICE", "", 25, "call life_coplevel >= 2" },
            { "H_Beret_02", "", 25, "call life_coplevel >= 5" },
            { "H_Beret_Colonel", "", 25, "call life_coplevel >= 9" },
            { "H_Watchcap_blk", "", 25, "call life_coplevel >= 3" },
            { "H_Watchcap_cbr", "", 25, "call life_coplevel >= 3" },
            { "H_Watchcap_khk", "", 25, "call life_coplevel >= 3" },
            { "H_Watchcap_camo", "", 25, "call life_coplevel >= 3" },
            { "H_Watchcap_sgg", "", 25, "call life_coplevel >= 3" },
            { "H_StrawHat", "", 25, "call life_coplevel >= 5" },
            { "H_StrawHat_dark", "", 25, "call life_coplevel >= 5" },
            { "H_Hat_grey", "", 25, "call life_coplevel >= 5" },
            { "H_Booniehat_tna_F", "", 25, "call life_coplevel >= 7" },
            { "H_HelmetSpecB_sand", "", 25, "call life_coplevel >= 5" },
            { "H_Booniehat_mcamo", "", 25, "call life_coplevel >= 7" },
            { "H_Booniehat_tan", "", 25, "call life_coplevel >= 7" }
        };
        goggles[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
			{ "G_Goggles_VR", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
			{ "V_Safety_yellow_F", "", 25, ""},
			{ "V_Safety_orange_F", "", 25, ""},
            { "V_TacVest_blk_POLICE", "", 25, "call life_coplevel >= 1" },
            { "V_PlateCarrier1_blk", "", 25, "call life_coplevel >= 3" },
            { "V_PlateCarrier2_blk", "", 25, "call life_coplevel >= 4" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" },
            { "B_FieldPack_cbr", "", 500, "" },
            { "B_AssaultPack_cbr", "", 700, "" },
            { "B_Kitbag_cbr", "", 800, "" },
            { "B_Bergen_sgg", "", 2500, "" },
            { "B_Carryall_cbr", "", 3500, "" },
			{ "B_Bergen_dgtl_f", "", 6000, "" }, //Apex DLC
            { "B_Bergen_tna_f", "", 6000, "" }
        };
    };

    class dive {
        title = "STR_Shops_C_Diving";
		conditions = "license_civ_dive";
        side = "civ";
        uniforms[] = {
            { "U_B_Wetsuit", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" }
        };
        goggles[] = {
            { "NONE", "Brille entfernen", 0, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
            { "V_RebreatherB", "", 5000, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" }
        };
    };

    class gun_clothing {
        title = "STR_Shops_C_Gun";
		      conditions = "license_civ_gun";
        side = "civ";
        uniforms[] = {
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" }
        };
        goggles[] = {
            { "NONE", "Brille entfernen", 0, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
            { "V_Rangemaster_belt", "", 4900, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" }
        };
    };

    class gang_clothing {
        title = "STR_Shops_C_Gang";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "U_C_Poloshirt_stripped", "", 125, "" },
            { "U_C_Poloshirt_redwhite", "", 150, "" },
            { "U_C_Poloshirt_salmon", "", 175, "" },
            { "U_C_Poloshirt_blue", "", 250, "" },
            { "U_C_Poor_2", "", 250, "" },
            { "U_C_Poloshirt_burgundy", "", 275, "" },
            { "U_C_Poloshirt_tricolour", "", 350, "" },
            { "U_IG_Guerilla2_2", "", 650, "" },
            { "U_IG_Guerilla3_1", "", 735, "" },
            { "U_OrestesBody", "", 1100, "" },
            { "U_IG_Guerilla2_3", "", 1200, "" },
            { "U_C_HunterBody_grn", "", 1500, "" },
            { "U_C_WorkerCoveralls", "", 2500, "" },
            { "U_C_Man_casual_1_F", "", 1000, "" },
            { "U_C_Man_casual_2_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_3_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_4_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_5_F", "", 1000, "" }, //Apex DLC
            { "U_C_Man_casual_6_F", "", 1000, "" }, //Apex DLC
            { "U_C_man_sport_1_F", "", 1000, "" }, //Apex DLC
            { "U_C_man_sport_2_F", "", 1000, "" }, //Apex DLC
            { "U_C_man_sport_3_F", "", 1000, "" } //Apex DLC
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "H_Bandanna_camo", "Camo Bandanna", 120, "" },
            { "H_Bandanna_surfer", "Surfer Bandanna", 130, "" },
            { "H_Bandanna_surfer", "", 135, "" },
            { "H_Bandanna_khk", "Khaki Bandanna", 145, "" },
            { "H_Cap_blu", "", 150, "" },
            { "H_Cap_grn", "", 150, "" },
            { "H_Cap_grn_BI", "", 150, "" },
            { "H_Cap_oli", "", 150, "" },
            { "H_Cap_red", "", 150, "" },
            { "H_Cap_tan", "", 150, "" },
            { "H_Helmet_Skate", "", 150, "" }, //Apex DLC
            { "H_Bandanna_gry", "Grey Bandanna", 150, "" },
            { "H_Bandanna_sgg", "Sage Bandanna", 160, "" },
            { "H_Bandanna_cbr", "", 165, "" },
            { "H_StrawHat", "Straw Fedora", 225, "" },
            { "H_Hat_tan", "", 265, "" },
            { "H_Hat_brown", "", 276, "" },
            { "H_Hat_grey", "", 280, "" },
            { "H_BandMask_blk", "Hat & Bandanna", 300, "" },
            { "H_Hat_blue", "", 310, "" },
            { "H_Hat_checker", "", 340, "" },
            { "H_Booniehat_grn", "", 425, "" }
        };
        goggles[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2500, "" },
            { "B_AssaultPack_dgtl", "", 2500, "" },
            { "B_AssaultPack_rgr", "", 2500, "" },
            { "B_AssaultPack_sgg", "", 2500, "" },
            { "B_AssaultPack_blk", "", 2500, "" },
            { "B_AssaultPack_cbr", "", 2500, "" },
            { "B_AssaultPack_mcamo", "", 2500, "" },
            { "B_AssaultPack_tna_f", "", 2500, "" }, //Apex DLC
            { "B_TacticalPack_oli", "", 3500, "" },
            { "B_Kitbag_mcamo", "", 4250, "" },
            { "B_Kitbag_sgg", "", 4250, "" },
            { "B_Kitbag_cbr", "", 4250, "" },
            { "B_FieldPack_blk", "", 3500, "" },
            { "B_FieldPack_ocamo", "", 3500, "" },
            { "B_FieldPack_oucamo", "", 3500, "" },
            { "B_FieldPack_ghex_f", "", 3500, "" }, //Apex DLC
            { "B_Bergen_sgg", "", 6000, "" },
            { "B_Bergen_mcamo", "", 6000, "" },
            { "B_Bergen_rgr", "", 6000, "" },
            { "B_Bergen_blk", "", 6000, "" },
            { "B_Carryall_ocamo", "", 5000, "" },
            { "B_Carryall_oucamo", "", 5000, "" },
            { "B_Carryall_mcamo", "", 5000, "" },
            { "B_Carryall_oli", "", 5000, "" },
            { "B_Carryall_khk", "", 5000, "" },
            { "B_Carryall_cbr", "", 5000, "" },
            { "B_Carryall_ghex_f", "", 5000, "" }, //Apex DLC
            { "B_Bergen_dgtl_f", "", 6000, "" }, //Apex DLC
            { "B_Bergen_tna_f", "", 6000, "" } //Apex DLC
        };
    };

    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        conditions = "";
        side = "med";
        uniforms[] = {
			{ "U_I_CombatUniform", "RD Uniform (Lang)", 0, "" },
            { "U_I_CombatUniform_shortsleeve", "RD Uniform (Kurz)", 0, "" }
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "H_Booniehat_khk", "", 100, "" },
      		{ "H_Cap_blu", "", 100, "" },
      		{ "H_Cap_oli", "", 100, "" },
      		{ "H_Cap_grn", "", 100, "" },
      		{ "H_Bandanna_mcamo", "", 100, "" },
      		{ "H_Watchcap_khk", "", 100, "" },
      		{ "H_StrawHat", "", 100, "" },
      		{ "H_Hat_blue", "", 100, "" },
      		{ "H_Hat_checker", "", 100, "" },
      		{ "H_Hat_grey", "", 100, "" },
      		{ "H_Watchcap_blk", "", 100, ""},
      		{ "H_Beret_red", "", 100, ""},
      		{ "H_Construction_basic_yellow_F", "", 0, ""},
      		{ "H_Construction_headset_yellow_F", "", 0, ""},
      		{ "H_Construction_earprot_yellow_F", "", 0, ""},
      		{ "H_Construction_basic_orange_F", "", 0, ""},
      		{ "H_Construction_headset_orange_F", "", 0, ""},
      		{ "H_Construction_earprot_orange_F", "", 0, ""},
      		{ "H_Construction_basic_red_F", "", 0, ""},
      		{ "H_Construction_headset_red_F", "", 0, ""},
      		{ "H_Construction_earprot_red_F", "", 0, ""}
        };
        goggles[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "G_Shades_Black", "", 100, "" },
      		{ "G_Shades_Blue", "", 100, "" },
      		{ "G_Sport_Blackred", "", 100, "" },
      		{ "G_Sport_Checkered", "", 100, "" },
      		{ "G_Sport_Blackyellow", "", 100, "" },
      		{ "G_Sport_BlackWhite", "", 100, "" },
      		{ "G_Squares", "", 100, "" },
      		{ "G_Aviator", "", 100, "" },
      		{ "G_Lady_Mirror", "", 100, "" },
      		{ "G_Lady_Dark", "", 100, "" },
      		{ "G_Lady_Blue", "", 100, "" },
      		{ "G_Lowprofile", "", 100, "" },
      		{ "G_Combat", "", 100, "" },
      		{ "G_Respirator_blue_F", "", 100, "" },
      		{ "G_Respirator_white_F", "", 100, "" },
      		{ "G_Respirator_yellow_F", "", 100, "" },
      		{ "G_EyeProtectors_Earpiece_F", "", 100, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" },
			{ "V_RebreatherIR", "", 0, "" },
			{ "V_Safety_yellow_F", "", 0, ""},
			{ "V_Safety_orange_F", "", 0, ""},
			{ "V_Safety_blue_F", "", 0, ""},
			{ "V_PlateCarrier1_blk", "", 0, "call life_mediclevel >= 10"}
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" },
            { "B_AssaultPack_cbr", "", 100, "" },
      		{ "B_Kitbag_mcamo", "", 100, "" },
      		{ "B_TacticalPack_oli", "", 100, "" },
      		{ "B_FieldPack_ocamo", "", 100, "" },
      		{ "B_Bergen_sgg", "", 100, "" },
      		{ "B_Kitbag_cbr", "", 100, "" },
      		{ "B_Carryall_oli", "", 100, "" },
      		{ "B_Carryall_khk", "", 100, "" },
			{ "B_Bergen_dgtl_f", "", 6000, "" }, //Apex DLC
			{ "B_Bergen_tna_f", "", 6000, "" }
        };
    };

    class kart {
        title = "STR_Shops_C_Kart";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "U_C_Driver_1_black", "", 1500, "" },
            { "U_C_Driver_1_blue", "", 1500, "" },
            { "U_C_Driver_1_red", "", 1500, "" },
            { "U_C_Driver_1_orange", "", 1500, "" },
            { "U_C_Driver_1_green", "", 1500, "" },
            { "U_C_Driver_1_white", "", 1500, "" },
            { "U_C_Driver_1_yellow", "", 1500, "" },
            { "U_C_Driver_2", "", 3500, "" },
            { "U_C_Driver_1", "", 3600, "" },
            { "U_C_Driver_3", "", 3700, "" },
            { "U_C_Driver_4", "", 3700, "" }
        };
        headgear[] = {
            { "NONE", "Hut entfernen", 0, "" },
            { "H_RacingHelmet_1_black_F", "", 1000, "" },
            { "H_RacingHelmet_1_red_F", "", 1000, "" },
            { "H_RacingHelmet_1_white_F", "", 1000, "" },
            { "H_RacingHelmet_1_blue_F", "", 1000, "" },
            { "H_RacingHelmet_1_yellow_F", "", 1000, "" },
            { "H_RacingHelmet_1_green_F", "", 1000, "" },
            { "H_RacingHelmet_1_F", "", 2500, "" },
            { "H_RacingHelmet_2_F", "", 2500, "" },
            { "H_RacingHelmet_3_F", "", 2500, "" },
            { "H_RacingHelmet_4_F", "", 2500, "" }
        };
        goggles[] = {
            { "NONE", "Brille entfernen", 0, "" }
        };
        vests[] = {
            { "NONE", "Weste entfernen", 0, "" }
        };
        backpacks[] = {
            { "NONE", "Rucksack entfernen", 0, "" }
        };
    };
};
