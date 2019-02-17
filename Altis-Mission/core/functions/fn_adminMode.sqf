/*
  Author: Natic | Simon Maddahi | Technic-Zone.de
*/
private ["_type","_player","_pid"];

_player = name player;
_pid = getPlayerUID player;

if ((call life_adminlevel) == 0) exitWith {["Diese Funktion ist deaktiviert!", false, "fast"] spawn ESG_fnc_notify;};
if ((call life_adminlevel) >= 1) then {
    ["Du hast deinen Adminmodus aktiviert!", false, "fast"] spawn ESG_fnc_notify;
	sleep 1;
	player allowDamage false;
	[1,format["[INFO] %1 hat seinen Adminmodus aktiviert!", _player]] remoteExec ["life_fnc_broadcast",west,civilian,independent,east];
    [player] call life_fnc_saveGear;
	sleep 1;
	/*player addUniform "U_B_CombatUniform_mcam";
    player addBackpack "TK_RPG_Backpack_EP1"; 
    player addMagazine "30Rnd_556x45_Stanag";
    player addWeapon "BAF_L85A2_RIS_SUSAT";
	*/
	 player setUnitLoadout [["LMG_03_F","muzzle_snds_M","","optic_ERCO_blk_F",["200Rnd_556x45_Box_F",40000],[],""],[],["hgun_P07_F","","","",["30Rnd_9x21_Mag",40000],[],""],["U_I_HeliPilotCoveralls",[]],[],["B_Carryall_cbr",[]],"","",[],["","ItemGPS","ItemRadio","","","NVGoggles"]];
	sleep 1;
    profileNamespace setVariable ["admin_mode",false,true];
} else {
        profileNamespace setVariable ["admin_mode",false,false];
        [1,format["[INFO] %1 hat seinen Adminmodus deaktiviert!", _player]] remoteExec ["life_fnc_broadcast",west,civilian,independent,east];
	//addEventHandler ["HandleDamage", {1}]
	player allowDamage true;
	[] call life_fnc_Loadgear;
};
[] call life_fnc_updateClothing;