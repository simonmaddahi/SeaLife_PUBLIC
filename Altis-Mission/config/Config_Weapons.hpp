/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*
*    items: { Classname, Itemname, BuyPrice, SellPrice }
*
*    Itemname only needs to be filled if you want to rename the original object name.
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    //Medic Shops
    class med_basic {
        name = "Rettungsdienst Ausrüstung";
        side = "med";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
              { "ItemWatch", "", 0, 0, "" },
              { "ItemCompass", "", 0, 0, "" },
              { "ItemGPS", "", 0, 0, "" },
              { "ItemRadio", "", 0, 0, "" },
              { "ItemMap", "", 0, 0, "" },
              { "ItemWatch", "", 0, 0, "" },
              { "NVGoggles", "", 0, 0, "" },
              { "Binocular", "", 0, 0, "" },
              { "ToolKit", "", 0, 0, "" },
	          { "SmokeShellPurple", "",0, 0, "" }
        };
    };

	class civ_gun {
        name = "Waffenladen";
        side = "civ";
        conditions = "license_civ_gun";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "hgun_ACPC2_F", "", 50000, 0, "" }, //ACP-C2 .45 ACP
			{ "9Rnd_45ACP_Mag", "", 1000, 0, "" },
			{ "hgun_P07_F", "", 42000, 0, "" }, //P07
			{ "16Rnd_9x21_Mag", "", 1000, 0, "" },
			{ "30Rnd_9x21_Mag", "", 2000, 0, "" },
			{ "hgun_P07_khk_F", "", 42000, 0, "" },	//P07
			{ "16Rnd_9x21_Mag", "", 1000, 0, "" },
			{ "30Rnd_9x21_Mag", "", 2000, 0, "" },
			{ "hgun_Pistol_heavy_02_F", "", 60000, 0, "" }, //Zubr .45 ACP
			{ "6Rnd_45ACP_Cylinder", "", 1000, 0, "" },
			{ "SMG_02_F", "", 95000, 0, "" },	//Sting
			{ "30Rnd_9x21_Mag", "", 2000, 0, "" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 2000, 0, "" },
			{ "hgun_PDW2000_F", "", 95000, 0, "" },	//PDW
			{ "30Rnd_9x21_Mag", "", 2000, 0, "" },
			{ "SMG_05_F", "", 110000, 0, "" }, //Protector 9mm
			{ "30Rnd_9x21_Mag_SMG_02", "", 2000, 0, "" },
			{ "SMG_01_F", "", 125000, 0, "" }, //Vermin SMG .45 ACP
			{ "30Rnd_45ACP_Mag_SMG_01", "", 2000, 0, "" }
		};
	};

	class cop_weap {
        name = "Polizei Waffenladen";
        side = "cop";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemWatch", "", 0, 0, "" },
            { "ItemCompass", "", 0, 0, "" },
            { "ItemGPS", "", 0, 0, "" },
            { "ItemRadio", "", 0, 0, "" },
            { "ItemMap", "", 0, 0, "" },
            { "Rangefinder", "", 0, 0, "" },
            { "ToolKit", "", 0, 0, "" },
            { "NVGoggles_OPFOR", "", 0, 0, "" },
			//Waffen >>
			//Level 01 -> ->  PKa
                        { "hgun_Pistol_heavy_01_f", "", 0, 0, "call life_coplevel >= 1" },
                        { "11Rnd_45ACP_Mag", "", 0, 0, "" },
                        { "acc_flashlight_pistol", "", 0, 0, "" },
			{ "SMG_05_F", "", 0, 0, "call life_coplevel >= 1" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0, 0, "" },
			{ "hgun_PDW2000_F", "", 0, 0, "call life_coplevel >= 1" },
			{ "30Rnd_9x21_Mag", "", 0, 0, "" },
			{ "SMG_01_F", "", 0, 0, "call life_coplevel >= 1" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0, 0, "" },
			{ "arifle_SDAR_F", "", 0, 0, "call life_coplevel >= 1" },
                        { "20Rnd_556x45_UW_mag", "", 0, 0, "" },
			{ "SMG_02_F", "", 0, 0, "call life_coplevel >= 1" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 0, 0, "" },
			{ "arifle_Katiba_C_F", "", 0, 0, "call life_coplevel >= 1" },
                        { "30Rnd_65x39_caseless_green", "", 0, 0, "" },
			//Level 02 -> ->  PK
			{ "arifle_MK20_plain_F ", "", 0, 0, "call life_coplevel >= 2" },
			{ "30Rnd_556x45_Stanag", "", 0, 0, "" },
			{ "arifle_TRG_20_F", "", 0, 0, "call life_coplevel >= 2" },
			{ "30Rnd_556x45_Stanag", "", 0, 0, "" },
			{ "srifle_DMR_01_F", "", 0, 0, "call life_coplevel >= 2" },
			{ "10Rnd_762x54_Mag", "", 0, 0, "" },
			//Level 03 -> ->  POK
			{ "arifle_SPAR_01_blk_F", "", 0, 0, "call life_coplevel >= 3" },
			{ "30Rnd_556x45_Stanag", "", 0, 0, "" },
			{ "arifle_MXM_Black_F", "", 0, 0, "call life_coplevel >= 3" },
			{ "30Rnd_65x39_caseless_mag", "", 0, 0, "" },
			{ "arifle_ARX_blk_F", "", 0, 0, "call life_coplevel >= 3" },
                        { "30Rnd_65x39_caseless_green", "", 0, 0, "" },
			{ "LMG_03_F", "", 0, 0, "call life_coplevel >= 3" },
                        { "200Rnd_556x45_Box_F", "", 0, 0, "" },
			{ "srifle_DMR_06_olive_F", "", 0, 0, "call life_coplevel >= 3" },
                        { "20Rnd_762x51_Mag", "", 0, 0, "" },	
			{ "arifle_CTAR_blk_F", "", 0, 0, "call life_coplevel >= 3" },
                        { "30Rnd_580x42_Mag_F", "", 0, 0, "" },			
                        { "100Rnd_580x42_Mag_F", "", 0, 0, "" },							
			//Level 04 -> ->  PHK A11
			{ "arifle_MX_SW_Black_F", "", 0, 0, "call life_coplevel >= 4" },
                        { "100Rnd_65x39_caseless_mag", "", 0, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 0, 0, "" },
			{ "srifle_DMR_06_olive_F", "", 0, 0, "call life_coplevel >= 4" },
                        { "10Rnd_338_Mag", "", 0, 0, "" },
			{ "LMG_Mk200_F", "", 0, 0, "call life_coplevel >= 4" },
                        { "200Rnd_65x39_cased_Box", "", 0, 0, "" },
			
			//Level 05 -> ->  PHK A12
			{ "srifle_DMR_03_F", "", 0, 0, "call life_coplevel >= 5" },
                        { "20Rnd_762x51_Mag", "", 0, 0, "" },
			{ "arifle_SPAR_02_blk_F", "", 0, 0, "call life_coplevel >= 5" },
                        { "150Rnd_556x45_Drum_Mag_F", "", 0, 0, "" },
			{ "arifle_AK12_F", "", 0, 0, "call life_coplevel >= 5" },
                        { "30Rnd_762x39_Mag_F", "", 0, 0, "" },
			//Level 06 -> ->  1. PHK
			{ "srifle_EBR_F", "", 0, 0, "call life_coplevel >= 6" },
                        { "20Rnd_762x51_Mag", "", 0, 0, "" },
			{ "arifle_MXM_Black_F", "", 0, 0, "call life_coplevel >= 6" },
                        { "30Rnd_65x39_caseless_mag", "", 0, 0, "" },
			{ "srifle_LRR_F", "", 0, 0, "call life_coplevel >= 6" },
                        { "7Rnd_408_Mag", "", 0, 0, "" },
			//Level 07
			{ "arifle_MX_SW_Black_F", "", 0, 0, "call life_coplevel >= 7" },
                        { "100Rnd_65x39_caseless_mag", "", 0, 0, "" },
			//Level 08
			{ "arifle_ARX_blk_F", "", 0, 0, "call life_coplevel >= 8" },
                        { "30Rnd_65x39_caseless_green", "", 0, 0, "" },
			{ "srifle_DMR_05_blk_F", "", 0, 0, "call life_coplevel >= 8" },
                        { "10Rnd_93x64_DMR_05_Mag", "", 0, 0, "" },
			//Anderes >>
            { "HandGrenade_Stone", "", 0, 0, "call life_coplevel >= 4" },
            { "SmokeShell", "", 0, 0, "call life_coplevel >= 1" },
            { "SmokeShellOrange", "", 0, 0, "call life_coplevel >= 1" },
            { "NVGoggles_OPFOR", "", 0, 0, "" },
            { "acc_flashlight", "",  0, 0, "" },
            { "acc_pointer_IR", "",  0, 0, "" },
            { "bipod_01_F_blk", "",  0, 0, "" },
            { "muzzle_snds_acp", "",  0, 0, "" },
            { "muzzle_snds_L", "",  0, 0, "" },
            { "muzzle_snds_H", "",  0, 0, "" },
            { "muzzle_snds_M", "",  0, 0, "" },
            { "muzzle_snds_58_blk_F", "",  0, 0, "" },
            { "muzzle_snds_H_MG_blk_F", "",  0, 0, "" },
            { "muzzle_snds_M", "",  0, 0, "" },
            { "muzzle_snds_H_snd_F", "",  0, 0, "" },
			{ "muzzle_snds_65_TI_blk_F", "",  0, 0, "" },
			{ "muzzle_snds_B", "",  0, 0, "" },
            { "optic_MRD", "", 0, 0, "" },
            { "optic_Aco", "", 0, 0, "" },
            { "optic_ACO_grn", "", 0, 0, "" },
            { "optic_Aco_smg", "", 0, 0, "" },
            { "optic_ACO_grn_smg", "", 0, 0, "" },
            { "optic_Arco", "", 0, 0, "" },
            { "optic_Holosight", "", 0, 0, "" },
            { "optic_Holosight_smg", "", 0, 0, "" },
            { "optic_MRCO", "", 0, 0, "" },
            { "optic_DMS", "", 0, 0, "" },
            { "optic_DMS_ghex_F", "", 0, 0, "" },
            { "optic_AMS", "", 0, 0, "" },
            { "optic_AMS_khk", "", 0, 0, "" },
            { "optic_AMS_snd", "", 0, 0, "" },
            { "optic_ERCO_blk_F", "", 0, 0, "" },
            { "optic_ERCO_khk_F", "", 0, 0, "" },
            { "optic_ERCO_snd_F", "", 0, 0, "" }
		};
	};

	
    class rocker {
        name = "Rocker Waffenladen";
        side = "civ";
        conditions = "license_civ_rocker";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "arifle_AKS_F", "", 175000, 0, "" },
			{ "30Rnd_545x39_Mag_F", "", 3500, 0, "" },
			{ "arifle_Mk20_plain_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_Mk20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_TRG20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "LMG_03_F", "", 750000, 0, "" },
			{ "200Rnd_556x45_Box_F", "", 75000, 0, "" },
			{ "arifle_CTAR_hex_F", "", 225000, 0, "" },
			{ "30Rnd_580x42_Mag_F", "", 5000, 0, "" },
			{ "arifle_CTARS_ghex_F", "", 400000, 0, "" },
			{ "100Rnd_580x42_Mag_F", "", 25000, 0, "" },
			{ "arifle_Katiba_C_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "arifle_Katiba_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "srifle_DMR_07_ghex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			{ "srifle_DMR_07_hex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			{ "arifle_TRG21_GL_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_MX_GL_F", "", 190000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 3500, 0, "" },
			
			{ "arifle_MXC_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MXC_khk_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },//
			{ "arifle_MX_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_khk_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_SW_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },
			{ "arifle_MX_SW_khk_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },//
			//MK1
			{ "srifle_DMR_03_tan_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_khaki_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_multicam_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			//Mk14
			{ "srifle_DMR_06_olive_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_06_camo_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			
			{ "arifle_AKM_F", "", 800000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },
			{ "arifle_AK12_F", "", 950000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },

            { "acc_flashlight", "",  10000, 1, "" },
            { "acc_pointer_IR", "",  10000, 1, "" },
            { "bipod_01_F_blk", "",  50000, 1, "" },
			{ "muzzle_snds_M", "",  215000, 1, "" },
			{ "muzzle_snds_m_khk_F", "",  215000, 1, "" },
            { "muzzle_snds_m_snd_F", "",  215000, 1, "" },
			{ "muzzle_snds_58_hex_F", "",  215000, 1, "" },
            { "muzzle_snds_58_ghex_F", "",  215000, 1, "" },
            { "muzzle_snds_H", "",  215000, 1, "" },
            { "muzzle_snds_H_MG", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_hex_F", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_ghex_F", "",  300000, 1, "" },
            { "muzzle_snds_H_MG_blk_F", "",  300000, 1, "" },

            { "optic_Aco", "", 10000, 50, "" },
            { "optic_ACO_grn", "", 10000, 50, "" },
            { "optic_Aco_smg", "", 10000, 50, "" },
            { "optic_ACO_grn_smg", "", 10000, 50, "" },
            { "optic_Arco", "", 45000, 50, "" },
            { "optic_Hamr", "", 45000, 50, "" },
            { "optic_Hamr_khk_F", "", 45000, 50, "" },
            { "optic_Holosight", "", 10000, 50, "" },
            { "optic_Holosight_smg", "", 10000, 50, "" },
            { "optic_SOS", "", 350000, 50, "" },
            { "optic_SOS_khk_F", "", 350000, 50, "" },
            { "optic_MRCO", "", 45000, 50, "" },
            { "optic_DMS", "", 250000, 50, "" },
            { "optic_DMS_ghex_F", "", 250000, 50, "" },
            { "optic_ERCO_blk_F", "", 45000, 50, "" },
            { "optic_ERCO_khk_F", "", 45000, 50, "" },
            { "optic_ERCO_snd_F", "", 45000, 50, "" }
           };
   };
	
	class reb {
        name = "Rebellen Waffenladen";
        side = "civ";
        conditions = "license_civ_rebel";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "arifle_AKS_F", "", 175000, 0, "" },
			{ "30Rnd_545x39_Mag_F", "", 3500, 0, "" },
			{ "arifle_Mk20_plain_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_Mk20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_TRG20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "LMG_03_F", "", 750000, 0, "" },
			{ "200Rnd_556x45_Box_F", "", 75000, 0, "" },
			{ "arifle_CTAR_hex_F", "", 225000, 0, "" },
			{ "30Rnd_580x42_Mag_F", "", 5000, 0, "" },
			{ "arifle_CTARS_ghex_F", "", 400000, 0, "" },
			{ "100Rnd_580x42_Mag_F", "", 25000, 0, "" },
			{ "arifle_Katiba_C_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "arifle_Katiba_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "srifle_DMR_07_ghex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			{ "srifle_DMR_07_hex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			
			{ "arifle_MXC_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MXC_khk_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },//
			{ "arifle_MX_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_khk_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_SW_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },
			{ "arifle_MX_SW_khk_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },//
			//MK1
			{ "srifle_DMR_03_tan_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_khaki_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_multicam_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			//Mk14
			{ "srifle_DMR_06_olive_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_06_camo_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			
			{ "arifle_AKM_F", "", 800000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },
			{ "arifle_AK12_F", "", 950000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },

            { "acc_flashlight", "",  10000, 1, "" },
            { "acc_pointer_IR", "",  10000, 1, "" },
            { "bipod_01_F_blk", "",  50000, 1, "" },
			{ "muzzle_snds_M", "",  215000, 1, "" },
			{ "muzzle_snds_m_khk_F", "",  215000, 1, "" },
            { "muzzle_snds_m_snd_F", "",  215000, 1, "" },
			{ "muzzle_snds_58_hex_F", "",  215000, 1, "" },
            { "muzzle_snds_58_ghex_F", "",  215000, 1, "" },
            { "muzzle_snds_H", "",  215000, 1, "" },
            { "muzzle_snds_H_MG", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_hex_F", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_ghex_F", "",  300000, 1, "" },
            { "muzzle_snds_H_MG_blk_F", "",  300000, 1, "" },

            { "optic_Aco", "", 10000, 50, "" },
            { "optic_ACO_grn", "", 10000, 50, "" },
            { "optic_Aco_smg", "", 10000, 50, "" },
            { "optic_ACO_grn_smg", "", 10000, 50, "" },
            { "optic_Arco", "", 45000, 50, "" },
            { "optic_Hamr", "", 45000, 50, "" },
            { "optic_Hamr_khk_F", "", 45000, 50, "" },
            { "optic_Holosight", "", 10000, 50, "" },
            { "optic_Holosight_smg", "", 10000, 50, "" },
            { "optic_SOS", "", 350000, 50, "" },
            { "optic_SOS_khk_F", "", 350000, 50, "" },
            { "optic_MRCO", "", 45000, 50, "" },
            { "optic_DMS", "", 250000, 50, "" },
            { "optic_DMS_ghex_F", "", 250000, 50, "" },
            { "optic_ERCO_blk_F", "", 45000, 50, "" },
            { "optic_ERCO_khk_F", "", 45000, 50, "" },
            { "optic_ERCO_snd_F", "", 45000, 50, "" }
           };
   };

   	class yakuza {
        name = "Yakuza Waffenladen";
        side = "civ";
        conditions = "license_civ_yakuza";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "arifle_AKS_F", "", 175000, 0, "" },
			{ "30Rnd_545x39_Mag_F", "", 3500, 0, "" },
			{ "arifle_Mk20_plain_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_Mk20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_TRG20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "LMG_03_F", "", 750000, 0, "" },
			{ "200Rnd_556x45_Box_F", "", 75000, 0, "" },
			{ "arifle_CTAR_hex_F", "", 225000, 0, "" },
			{ "30Rnd_580x42_Mag_F", "", 5000, 0, "" },
			{ "arifle_CTARS_ghex_F", "", 400000, 0, "" },
			{ "100Rnd_580x42_Mag_F", "", 25000, 0, "" },
			{ "arifle_Katiba_C_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "arifle_Katiba_GL_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "arifle_Katiba_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "srifle_DMR_07_ghex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			{ "srifle_DMR_07_hex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			{ "arifle_CTAR_GL_blk_F", "", 600000, 0, "" },
			{ "30Rnd_580x42_Mag_F", "", 30000, 0, "" },
			
			{ "arifle_MXC_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MXC_GL_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MXC_khk_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },//
			{ "arifle_MX_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_khk_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_SW_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },
			{ "arifle_MX_SW_khk_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },//
			//MK1
			{ "srifle_DMR_03_tan_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_khaki_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_multicam_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			//Mk14
			{ "srifle_DMR_06_olive_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_06_camo_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			
			{ "arifle_AKM_F", "", 800000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },
			{ "arifle_AK12_F", "", 950000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },

            { "acc_flashlight", "",  10000, 1, "" },
            { "acc_pointer_IR", "",  10000, 1, "" },
            { "bipod_01_F_blk", "",  50000, 1, "" },
			{ "muzzle_snds_M", "",  215000, 1, "" },
			{ "muzzle_snds_m_khk_F", "",  215000, 1, "" },
            { "muzzle_snds_m_snd_F", "",  215000, 1, "" },
			{ "muzzle_snds_58_hex_F", "",  215000, 1, "" },
            { "muzzle_snds_58_ghex_F", "",  215000, 1, "" },
            { "muzzle_snds_H", "",  215000, 1, "" },
            { "muzzle_snds_H_MG", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_hex_F", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_ghex_F", "",  300000, 1, "" },
            { "muzzle_snds_H_MG_blk_F", "",  300000, 1, "" },

            { "optic_Aco", "", 10000, 50, "" },
            { "optic_ACO_grn", "", 10000, 50, "" },
            { "optic_Aco_smg", "", 10000, 50, "" },
            { "optic_ACO_grn_smg", "", 10000, 50, "" },
            { "optic_Arco", "", 45000, 50, "" },
            { "optic_Hamr", "", 45000, 50, "" },
            { "optic_Hamr_khk_F", "", 45000, 50, "" },
            { "optic_Holosight", "", 10000, 50, "" },
            { "optic_Holosight_smg", "", 10000, 50, "" },
            { "optic_SOS", "", 350000, 50, "" },
            { "optic_SOS_khk_F", "", 350000, 50, "" },
            { "optic_MRCO", "", 45000, 50, "" },
            { "optic_DMS", "", 250000, 50, "" },
            { "optic_DMS_ghex_F", "", 250000, 50, "" },
            { "optic_ERCO_blk_F", "", 45000, 50, "" },
            { "optic_ERCO_khk_F", "", 45000, 50, "" },
            { "optic_ERCO_snd_F", "", 45000, 50, "" }
           };
   };
   
    class mafia {
        name = "Mafia Waffenladen";
        side = "civ";
        conditions = "license_civ_mafia";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "arifle_AKS_F", "", 175000, 0, "" },
			{ "30Rnd_545x39_Mag_F", "", 3500, 0, "" },
			{ "arifle_Mk20_plain_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_Mk20_GL_plain_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_Mk20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_TRG20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "LMG_03_F", "", 750000, 0, "" },
			{ "200Rnd_556x45_Box_F", "", 75000, 0, "" },
			{ "arifle_CTAR_hex_F", "", 225000, 0, "" },
			{ "30Rnd_580x42_Mag_F", "", 5000, 0, "" },
			{ "arifle_CTARS_ghex_F", "", 400000, 0, "" },
			{ "100Rnd_580x42_Mag_F", "", 25000, 0, "" },
			{ "arifle_Katiba_C_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "arifle_Katiba_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "srifle_DMR_07_ghex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			{ "srifle_DMR_07_hex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			
			{ "arifle_MXC_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MXC_khk_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },//
			{ "arifle_MX_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_khk_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_SW_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },
			{ "arifle_MX_SW_khk_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },//
			//MK1
			{ "srifle_DMR_03_tan_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_khaki_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_multicam_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			//Mk14
			{ "srifle_DMR_06_olive_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_06_camo_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			
			{ "arifle_AKM_F", "", 800000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },
			{ "arifle_AK12_F", "", 950000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },

            { "acc_flashlight", "",  10000, 1, "" },
            { "acc_pointer_IR", "",  10000, 1, "" },
            { "bipod_01_F_blk", "",  50000, 1, "" },
			{ "muzzle_snds_M", "",  215000, 1, "" },
			{ "muzzle_snds_m_khk_F", "",  215000, 1, "" },
            { "muzzle_snds_m_snd_F", "",  215000, 1, "" },
			{ "muzzle_snds_58_hex_F", "",  215000, 1, "" },
            { "muzzle_snds_58_ghex_F", "",  215000, 1, "" },
            { "muzzle_snds_H", "",  215000, 1, "" },
            { "muzzle_snds_H_MG", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_hex_F", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_ghex_F", "",  300000, 1, "" },
            { "muzzle_snds_H_MG_blk_F", "",  300000, 1, "" },

            { "optic_Aco", "", 10000, 50, "" },
            { "optic_ACO_grn", "", 10000, 50, "" },
            { "optic_Aco_smg", "", 10000, 50, "" },
            { "optic_ACO_grn_smg", "", 10000, 50, "" },
            { "optic_Arco", "", 45000, 50, "" },
            { "optic_Hamr", "", 45000, 50, "" },
            { "optic_Hamr_khk_F", "", 45000, 50, "" },
            { "optic_Holosight", "", 10000, 50, "" },
            { "optic_Holosight_smg", "", 10000, 50, "" },
            { "optic_SOS", "", 350000, 50, "" },
            { "optic_SOS_khk_F", "", 350000, 50, "" },
            { "optic_MRCO", "", 45000, 50, "" },
            { "optic_DMS", "", 250000, 50, "" },
            { "optic_DMS_ghex_F", "", 250000, 50, "" },
            { "optic_ERCO_blk_F", "", 45000, 50, "" },
            { "optic_ERCO_khk_F", "", 45000, 50, "" },
            { "optic_ERCO_snd_F", "", 45000, 50, "" }
           };
   };
   
    class izentrum {
        name = "Illegales Zentrum Waffenladen";
        side = "civ";
        conditions = "license_civ_izentrum";
        level[] = { "", "", -1, "" };
        items[] = {
			{ "arifle_AKS_F", "", 175000, 0, "" },
			{ "30Rnd_545x39_Mag_F", "", 3500, 0, "" },
			{ "arifle_Mk20_plain_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_Mk20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "arifle_TRG20_F", "", 190000, 0, "" },
			{ "30Rnd_556x45_Stanag", "", 3500, 0, "" },
			{ "LMG_03_F", "", 750000, 0, "" },
			{ "200Rnd_556x45_Box_F", "", 75000, 0, "" },
			{ "arifle_CTAR_hex_F", "", 225000, 0, "" },
			{ "30Rnd_580x42_Mag_F", "", 5000, 0, "" },
			{ "arifle_CTARS_ghex_F", "", 400000, 0, "" },
			{ "100Rnd_580x42_Mag_F", "", 25000, 0, "" },
			{ "arifle_Katiba_C_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "arifle_Katiba_F", "", 300000, 0, "" },
			{ "30Rnd_65x39_caseless_green", "", 5000, 0, "" },
			{ "srifle_DMR_07_ghex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			{ "srifle_DMR_07_hex_F", "", 600000, 0, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 30000, 0, "" },
			
			{ "arifle_MXC_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MXC_khk_F", "", 315000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },//
			{ "arifle_MX_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_khk_F", "", 350000, 0, "" },
			{ "30Rnd_65x39_caseless_mag", "", 5000, 0, "" },
			{ "arifle_MX_SW_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },
			{ "arifle_MX_SW_khk_F", "", 575000, 0, "" },
			{ "100Rnd_65x39_caseless_mag", "", 50000, 0, "" },//
			//MK1
			{ "srifle_DMR_03_tan_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_khaki_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_03_multicam_F", "", 850000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			//Mk14
			{ "srifle_DMR_06_olive_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			{ "srifle_DMR_06_camo_F", "", 700000, 0, "" },
			{ "20Rnd_762x51_Mag", "", 75000, 0, "" },
			
			{ "arifle_AKM_F", "", 800000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },
			{ "arifle_AK12_F", "", 950000, 0, "" },
			{ "30Rnd_762x39_Mag_F", "", 50000, 0, "" },

            { "acc_flashlight", "",  10000, 1, "" },
            { "acc_pointer_IR", "",  10000, 1, "" },
            { "bipod_01_F_blk", "",  50000, 1, "" },
			{ "muzzle_snds_M", "",  215000, 1, "" },
			{ "muzzle_snds_m_khk_F", "",  215000, 1, "" },
            { "muzzle_snds_m_snd_F", "",  215000, 1, "" },
			{ "muzzle_snds_58_hex_F", "",  215000, 1, "" },
            { "muzzle_snds_58_ghex_F", "",  215000, 1, "" },
            { "muzzle_snds_H", "",  215000, 1, "" },
            { "muzzle_snds_H_MG", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_hex_F", "",  300000, 1, "" },
            { "muzzle_snds_65_TI_ghex_F", "",  300000, 1, "" },
            { "muzzle_snds_H_MG_blk_F", "",  300000, 1, "" },

            { "optic_Aco", "", 10000, 50, "" },
            { "optic_ACO_grn", "", 10000, 50, "" },
            { "optic_Aco_smg", "", 10000, 50, "" },
            { "optic_ACO_grn_smg", "", 10000, 50, "" },
            { "optic_Arco", "", 45000, 50, "" },
            { "optic_Hamr", "", 45000, 50, "" },
            { "optic_Hamr_khk_F", "", 45000, 50, "" },
            { "optic_Holosight", "", 10000, 50, "" },
            { "optic_Holosight_smg", "", 10000, 50, "" },
            { "optic_SOS", "", 350000, 50, "" },
            { "optic_SOS_khk_F", "", 350000, 50, "" },
            { "optic_MRCO", "", 45000, 50, "" },
            { "optic_DMS", "", 250000, 50, "" },
            { "optic_DMS_ghex_F", "", 250000, 50, "" },
            { "optic_ERCO_blk_F", "", 45000, 50, "" },
            { "optic_ERCO_khk_F", "", 45000, 50, "" },
            { "optic_ERCO_snd_F", "", 45000, 50, "" }
           };
   };
   
	class genstore {
        name = "Baumarkt";
        side = "civ";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemWatch", "", 100, 0, "" },
      		{ "ItemCompass", "", 150, 0, "" },
      		{ "ItemGPS", "", 300, 0, "" },
      		{ "ItemRadio", "", 300, 0, "" },
      		{ "ItemMap", "", 100, 0, "" },
      		{ "ItemWatch", "", 100, 0, "" },
      		{ "NVGoggles", "", 5000, 0, "" },
      		{ "Binocular", "", 2500, 0, "" },
		{ "ToolKit", "", 4000, 0, "" }
		};
	};

	class gang {
        name = "Gang-Waffenarsenal";
        side = "civ";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemWatch", "", 100, 0, "" },
            { "ItemCompass", "", 150, 0, "" },
            { "ItemGPS", "", 300, 0, "" },
            { "ItemRadio", "", 300, 0, "" },
            { "ItemMap", "", 100, 0, "" },
            { "ItemWatch", "", 100, 0, "" },
            { "NVGoggles", "", 25000, 0, "" },
            { "Binocular", "", 10000, 0, "" },
            { "ToolKit", "", 7500, 0, "" },
			{ "hgun_ACPC2_F", "", 25000, 0, "" }, //ACP-C2 .45 ACP
			{ "9Rnd_45ACP_Mag", "", 300, 0, "" },
			{ "hgun_P07_F", "", 25000, 0, "" }, //P07
			{ "16Rnd_9x21_Mag", "", 300, 0, "" },
			{ "30Rnd_9x21_Mag", "", 300, 0, "" },
			{ "hgun_P07_khk_F", "", 25000, 0, "" },	//P07
			{ "16Rnd_9x21_Mag", "", 300, 0, "" },
			{ "30Rnd_9x21_Mag", "", 300, 0, "" },
			{ "hgun_Pistol_heavy_02_F", "", 25000, 0, "" }, //Zubr .45 ACP
			{"30Rnd_9x21_Mag", "", 300, 0, "" },
			{ "hgun_Pistol_01_F", "", 25000, 0, "" }, //PM ???
			{ "10Rnd_9x21_Mag", "", 300, 0, "" },
			{ "hgun_Pistol_Signal_F", "", 25000, 0, "" }, //Starterp. ???
			{ "6Rnd_RedSignal_F", "", 300, 0, "" },
			{ "6Rnd_GreenSignal_F", "", 300, 0, "" },
			{ "SMG_02_F", "", 25000, 0, "" },	//Sting
			{ "30Rnd_9x21_Mag", "", 300, 0, "" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 300, 0, "" },
			{ "hgun_PDW2000_F", "", 25000, 0, "" },	//PDW
			{ "30Rnd_9x21_Mag", "", 300, 0, "" },
			{ "SMG_05_F", "", 25000, 0, "" }, //Protector 9mm
			{ "30Rnd_9x21_Mag_SMG_02", "", 300, 0, "" },
			{ "SMG_01_F", "", 25000, 0, "" }, //Vermin SMG .45 ACP
			{ "30Rnd_45ACP_Mag_SMG_01", "", 300, 0, "" },		
			//Visier
			{"optic_Yorris", "", 300, 0, "" },
		};
	};

	class f_station_store {
        name = "Tankstellenshop";
        side = "civ";
        conditions = "";
        level[] = { "", "", -1, "" };
        items[] = {
            { "ItemWatch", "", 200, 0, "" },
            { "ItemCompass", "", 300, 0, "" },
            { "ItemGPS", "", 600, 0, "" },
            { "ItemRadio", "", 600, 0, "" },
            { "ItemMap", "", 200, 0, "" },
            { "ItemWatch", "", 200, 0, "" },
            { "NVGoggles", "", 10000, 0, "" },
            { "Binocular", "", 10000, 0, "" },
            { "ToolKit", "", 6000, 0, "" }
		   };
    };
};