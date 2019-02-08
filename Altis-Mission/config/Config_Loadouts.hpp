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

SACHEN DIE MAN IM LOADOUT SPEICHERN KANN!!!
PREISE MÜSSEN AN ANDERE KONFIGS ANGEPASST WERDEN!!!
*/
class Loadouts {
	class guer {
		class ItemGPS {preis = 100;};
		class Binocular {preis = 150;};
		class FirstAidKit {preis = 150;};
		class Medikit {preis = 150;};
		class NVGoggles {preis = 1200;};
		class SmokeShellPurple {preis = 5000;};
		class Default {preis = 1000;};
	};
	
	class west {
		class ItemGPS {preis = 100;};
		class Binocular {preis = 150;};
		class FirstAidKit {preis = 150;};
		class NVGoggles {preis = 2000;};
		class hgun_Pistol_heavy_02_Yorris_F {preis = 1000;};
		class arifle_SDAR_F {preis = 20000;};
		class SMG_01_F {preis = 20000;};
		class SMG_02_F {preis = 20000;};
		class SMG_05_F {preis = 20000;};
		class arifle_Mk20_plain_F {preis = 20000;};
		class arifle_Katiba_C_F {preis = 30000;};
		class arifle_Katiba_F {preis = 30000;};
		class arifle_MXC_Black_F {preis = 40000;};
		class arifle_MX_Black_F {preis = 40000;};
		class arifle_MX_SW_Black_F {preis = 90000;};
		class arifle_MXM_Black_F {preis = 35000;};
		class srifle_DMR_07_blk_F {preis = 30000;};
		class arifle_SPAR_01_blk_F {preis = 30000;};
		class arifle_SPAR_02_blk_F {preis = 60000;};
		class arifle_CTARS_blk_F {preis = 55000;};
		class arifle_CTAR_blk_F {preis = 35000;};
		class srifle_EBR_F {preis = 65000;};
		class arifle_SPAR_03_blk_F {preis = 65000;};
		class srifle_DMR_03_F {preis = 65000;};
		class srifle_DMR_06_F {preis = 65000;};
		class LMG_Mk200_F {preis = 100000;};
		class LMG_Zafir_F {preis = 150000;};
		class LMG_03_F {preis = 100000;};
		class srifle_DMR_05_blk_F {preis = 200000;};
		class srifle_DMR_04_F {preis = 200000;};
		class srifle_DMR_02_F {preis = 250000;};
		class arifle_ARX_blk_F {preis = 65000;};
		class arifle_AK12_F {preis = 95000;};
		class srifle_LRR_F {preis = 250000;};
		class srifle_GM6_F {preis = 300000;};
		class MMG_01_hex_F {preis = 300000;};
		class MMG_02_black_F {preis = 350000;};
		class launch_RPG32_F {preis = 500000;};
		class 20Rnd_556x45_UW_mag {preis = 1500;};
		class 30Rnd_45ACP_Mag_SMG_01 {preis = 1500;};
		class 30Rnd_9x21_Mag_SMG_02 {preis = 1500;};
		class 30Rnd_556x45_Stanag {preis = 1500;};
		class 30Rnd_65x39_caseless_green {preis = 1500;};
		class 30Rnd_65x39_caseless_mag {preis = 1500;};
		class 100Rnd_65x39_caseless_mag {preis = 1500;};
		class 20Rnd_650x39_Cased_Mag_F {preis = 1500;};
		class 150Rnd_556x45_Drum_Mag_F {preis = 1500;};
		class 100Rnd_580x42_Mag_F {preis = 1500;};
		class 30Rnd_580x42_Mag_F {preis = 1500;};
		class 20Rnd_762x51_Mag {preis = 1500;};
		class 200Rnd_65x39_cased_Box {preis = 1500;};
		class 150Rnd_762x54_Box {preis = 1500;};
		class 200Rnd_556x45_Box_F {preis = 1500;};
		class 10Rnd_93x64_DMR_05_Mag {preis = 1500;};
		class 10Rnd_127x54_Mag {preis = 1500;};
		class 10Rnd_338_Mag {preis = 1500;};
		class 30Rnd_762x39_Mag_F {preis = 1500;};
		class 7Rnd_408_Mag {preis = 1500;};
		class 5Rnd_127x108_Mag {preis = 1500;};
		class 150Rnd_93x64_Mag {preis = 1500;};
		class 130Rnd_338_Mag {preis = 1500;};
		class RPG32_F {preis = 100000;};
		class RPG32_HE_F {preis = 100000;};
		class optic_Aco {preis = 1000;};
		class optic_ACO_grn {preis = 1000;};
		class optic_Aco_smg {preis = 1000;};
		class optic_ACO_grn_smg {preis = 1000;};
		class optic_Holosight {preis = 1000;};
		class optic_Holosight_smg {preis = 1000;};
		class optic_Arco {preis = 1000;};
		class optic_Hamr {preis = 1000;};
		class optic_MRCO {preis = 1000;};
		class optic_SOS {preis = 1000;};
		class optic_DMS {preis = 1000;};
		class optic_AMS {preis = 1000;};
		class optic_KHS_blk {preis = 1000;};
		class muzzle_snds_acp {preis = 5000;};
		class muzzle_snds_L {preis = 5000;};
		class muzzle_snds_H {preis = 5000;};
		class muzzle_snds_M {preis = 5000;};
		class muzzle_snds_58_blk_F {preis = 5000;};
		class muzzle_snds_B {preis = 5000;};
		class muzzle_snds_H_MG_blk_F {preis = 5000;};
		class muzzle_snds_93mmg {preis = 5000;};
		class muzzle_snds_338_black {preis = 5000;};
		class muzzle_snds_H_snd_F {preis = 5000;};
		class muzzle_snds_93mmg_tan {preis = 5000;};
	};

	class civ {
		class ItemGPS {preis = 100;};
		class Binocular {preis = 150;};
		class FirstAidKit {preis = 150;};
		class NVGoggles {preis = 2000;};
		class hgun_Pistol_heavy_01_F {preis = 25000;};
		class hgun_P07_F {preis = 25000;};
		class hgun_Pistol_01_F {preis = 25000;};
		class hgun_Rook40_F {preis = 25000;};
		class hgun_PDW2000_F {preis = 25000;};
		class SMG_01_F {preis = 25000;};
		class arifle_Katiba_F {preis = 150000;};
		class arifle_Katiba_C_F {preis = 150000;};
		class arifle_Mk20_F {preis = 160000;};
		class arifle_Mk20C_F {preis = 160000;};
		class arifle_MXC_F {preis = 180000;};
		class arifle_MX_F {preis = 180000;};
		class arifle_MXM_F {preis = 200000;};
		class arifle_MX_SW_F {preis = 300000;};
		class arifle_SDAR_F {preis = 100000;};
		class arifle_TRG21_F {preis = 170000;};
		class arifle_TRG20_F {preis = 170000;};
		class srifle_DMR_01_BI_F {preis = 220000;};
		class srifle_DMR_02_camo_F {preis = 800000;};
		class srifle_DMR_02_sniper_F {preis = 800000;};
		class srifle_DMR_03_khaki_F {preis = 700000;};
		class srifle_DMR_03_tan_F {preis = 700000;};
		class srifle_DMR_03_multicam_F {preis = 700000;};
		class srifle_DMR_03_woodland_F {preis = 700000;};
		class srifle_DMR_04_Tan_F {preis = 650000;};
		class srifle_DMR_05_hex_F {preis = 750000;};
		class srifle_DMR_05_tan_f {preis = 750000;};
		class srifle_DMR_06_camo_khs_F {preis = 500000;};
		class srifle_EBR_F {preis = 500000;};
		class LMG_Mk200_F {preis = 1000000;};
		class MMG_01_hex_F {preis = 5000000;};
		class MMG_02_camo_F {preis = 4000000;};
		class MMG_02_sand_F {preis = 4000000;};
		class srifle_LRR_F {preis = 2000000;};
		class srifle_LRR_tna_F {preis = 2000000;};
		class srifle_GM6_ghex_F {preis = 3000000;};
		class srifle_DMR_07_hex_F {preis = 300000;};
		class srifle_DMR_07_ghex_F {preis = 300000;};
		class LMG_03_F {preis = 900000;};
		class arifle_AK12_F {preis = 750000;};
		class arifle_AKM_F {preis = 400000;};
		class arifle_AKS_F {preis = 250000;};
		class arifle_ARX_ghex_F {preis = 300000;};
		class arifle_ARX_hex_F {preis = 340000;};
		class arifle_CTAR_hex_F {preis = 300000;};
		class arifle_CTAR_ghex_F {preis = 300000;};
		class arifle_CTARS_hex_F {preis = 500000;};
		class arifle_CTARS_ghex_F {preis = 500000;};
		class arifle_SPAR_01_khk_F {preis = 340000;};
		class arifle_SPAR_01_snd_F {preis = 340000;};
		class arifle_SPAR_02_khk_F {preis = 600000;};
		class arifle_SPAR_02_snd_F {preis = 600000;};
		class arifle_SPAR_03_khk_F {preis = 650000;};
		class arifle_SPAR_03_snd_F {preis = 650000;};
		class launch_RPG7_F {preis = 2500000;};
		class 11Rnd_45ACP_Mag {preis = 2000;};
		class 6Rnd_45ACP_Cylinder {preis = 2000;};
		class 10Rnd_9x21_Mag {preis = 2000;};
		class 16Rnd_9x21_Mag {preis = 2000;};
		class 30Rnd_9x21_Mag {preis = 2000;};
		class 30Rnd_45ACP_Mag_SMG_01 {preis = 2000;};
		class 30Rnd_65x39_caseless_green {preis = 2000;};
		class 30Rnd_556x45_Stanag {preis = 2000;};
		class 100Rnd_65x39_caseless_mag {preis = 2000;};
		class 20Rnd_556x45_UW_mag {preis = 2000;};
		class 10Rnd_762x54_Mag {preis = 2000;};
		class 10Rnd_338_Mag {preis = 2000;};
		class 20Rnd_762x51_Mag {preis = 2000;};
		class 10Rnd_127x54_Mag {preis = 2000;};
		class 10Rnd_93x64_DMR_05_Mag {preis = 2000;};
		class 200Rnd_65x39_cased_Box {preis = 2000;};
		class 150Rnd_93x64_Mag {preis = 2000;};
		class 130Rnd_338_Mag {preis = 2000;};
		class 7Rnd_408_Mag {preis = 2000;};
		class 5Rnd_127x108_Mag {preis = 2000;};
		class 20Rnd_650x39_Cased_Mag_F {preis = 2000;};
		class 200Rnd_556x45_Box_F {preis = 2000;};
		class 30Rnd_762x39_Mag_F {preis = 2000;};
		class 30Rnd_545x39_Mag_F {preis = 2000;};
		class 30Rnd_580x42_Mag_F {preis = 2000;};
		class 100Rnd_580x42_Mag_F {preis = 2000;};
		class 150Rnd_556x45_Drum_Mag_F {preis = 2000;};
		class RPG7_F  {preis = 500000;};
		class muzzle_snds_H {preis = 20000;};
		class muzzle_snds_M {preis = 20000;};
		class muzzle_snds_H_MG {preis = 20000;};
		class muzzle_snds_B {preis = 20000;};
		class muzzle_snds_338_green {preis = 20000;};
		class muzzle_snds_338_sand {preis = 20000;};
		class muzzle_snds_B_khk_F {preis = 20000;};
		class muzzle_snds_B_snd_F {preis = 20000;};
		class muzzle_snds_93mmg {preis = 20000;};
		class muzzle_snds_93mmg_tan {preis = 20000;};
		class muzzle_snds_65_TI_hex_F {preis = 20000;};
		class muzzle_snds_65_TI_ghex_F {preis = 20000;};
		class muzzle_snds_H_MG_blk_F {preis = 20000;};
		class muzzle_snds_58_hex_F {preis = 20000;};
		class muzzle_snds_58_ghex_F {preis = 20000;};
		class muzzle_snds_m_khk_F {preis = 20000;};
		class muzzle_snds_m_snd_F {preis = 20000;};
		class optic_Aco {preis = 1000;};
		class optic_ACO_grn {preis = 1000;};
		class optic_Aco_smg {preis = 1000;};
		class optic_ACO_grn_smg {preis = 1000;};
		class optic_Arco {preis = 2000;};
		class optic_Hamr {preis = 2000;};
		class optic_Hamr_khk_F {preis = 2000;};
		class optic_Holosight {preis = 2000;};
		class optic_Holosight_smg {preis = 2000;};
		class optic_SOS {preis = 2000;};
		class optic_SOS_khk_F {preis = 2000;};
		class optic_MRCO {preis = 2000;};
		class optic_DMS {preis = 2000;};
		class optic_DMS_ghex_F {preis = 2000;};
		class optic_AMS {preis = 2000;};
		class optic_AMS_khk {preis = 2000;};
		class optic_AMS_snd {preis = 2000;};
		class optic_KHS_blk {preis = 2000;};
		class optic_KHS_hex {preis = 2000;};
		class optic_KHS_old {preis = 2000;};
		class optic_KHS_tan {preis = 2000;};
		class optic_ERCO_blk_F {preis = 2000;};
		class optic_ERCO_khk_F {preis = 2000;};
		class optic_ERCO_snd_F {preis = 2000;};
	};
};