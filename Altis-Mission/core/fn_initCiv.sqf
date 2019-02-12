#include "..\script_macros.hpp"
/*
    File: fn_initCiv.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the civilian.
*/
if(!(str(player) in ["civ_1","civ_2","civ_3","civ_4","civ_5"]) && ((FETCH_CONST(life_donorlevel)) < 1) exitWith {
 ["noslotpermission",false,true] call BIS_fnc_endMission;
 sleep 35;
 };

private _altisArray = ["Land_i_Shop_01_V1_F","Land_i_Shop_01_V2_F","Land_i_Shop_01_V3_F","Land_i_Shop_02_V1_F","Land_i_Shop_02_V2_F","Land_i_Shop_02_V3_F"];
private _tanoaArray = ["Land_House_Small_01_F"];
private _spawnBuildings = [[["Altis", _altisArray], ["Tanoa", _tanoaArray]]] call TON_fnc_terrainSort;

civ_spawn_1 = nearestObjects[getMarkerPos "civ_spawn_1", _spawnBuildings,350];
civ_spawn_2 = nearestObjects[getMarkerPos "civ_spawn_2", _spawnBuildings,350];
civ_spawn_3 = nearestObjects[getMarkerPos "civ_spawn_3", _spawnBuildings,350];
civ_spawn_4 = nearestObjects[getMarkerPos "civ_spawn_4", _spawnBuildings,350];
civ_spawn_5 = nearestObjects[getMarkerPos "civ_spawn_5", _spawnBuildings,350];

player addRating 9999999;

{
	_x setVariable ["bis_disabled_Door_1",1];
	//_x setVariable ["bis_disabled_Door_2",1];
}foreach [cop_tor_1,cop_tor_2,cop_tor_3,cop_tor_4,cop_tor_5,cop_tor_6,cop_tor_7,cop_tor_8,cop_tor_9,cop_tor_10,cop_tor_11,cop_tor_14,cop_tor_15,cop_tor_16,cop_tor_17,cop_tor_18,cop_tor_19,cop_tor_20,cop_tor_21,cop_tor_22,cop_tor_23,cop_tor_24,cop_tor_25,cop_tor_26,cop_tor_27,cop_tor_28,cop_tor_29,cop_tor_30,cop_tor_31,cop_tor_32,cop_tor_33,cop_tor_34,cop_tor_35,cop_tor_36,cop_tor_37,cop_tor_38,cop_tor_39,cop_tor_40,cop_tor_41,cop_tor_42,cop_tor_43,cop_tor_44,cop_tor_45,cop_tor_46,cop_tor_47,cop_tor_48,cop_tor_49];

call life_fnc_newBe; //Activate Newbews
