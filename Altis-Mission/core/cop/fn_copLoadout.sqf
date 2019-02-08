/*
    File: fn_copLoadout.sqf
    Author: Bryan "Tonic" Boardwine
    Edited: Itsyuka

    Description:
    Loads the cops out with the default gear.
*/
private ["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
if((call life_coplevel) isEqualTo 1) then {
	player forceaddUniform "U_Rangemaster";
	player addVest "V_TacVest_blk_POLICE";
	player addBackpack "B_Carryall_cbr";
};

if((call life_coplevel) in [2,3,4]) then {
	player forceaddUniform "U_B_CombatUniform_mcam";
	player addVest "V_TacVest_blk_POLICE";
	player addBackpack "B_Carryall_cbr";
};

if((call life_coplevel) > 4) then {
	player forceaddUniform "U_I_CombatUniform";
	player addVest "V_TacVest_blk_POLICE";
	player addBackpack "B_Carryall_cbr";
};

player addMagazine "11Rnd_45ACP_Mag";
player addWeapon "hgun_Pistol_heavy_01_snds_F";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";

/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";

call life_fnc_playerSkins;
call life_fnc_saveGear;
