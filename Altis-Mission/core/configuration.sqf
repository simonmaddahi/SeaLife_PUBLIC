#include "..\script_macros.hpp"
/*
    File: configuration.sqf
    Author:

    Description:
    Master Life Configuration File
    This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_newbe = false;
life_action_delay = time;
life_trunk_vehicle = objNull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_yelp_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = objNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
tawvd_addon_disable = true;
life_bambyTakeHandler = -1;
life_bambyDamageHandler = -1;
life_bamby_broke = false;
life_god = false;
life_frozen = false;
life_save_gear = [];
life_container_activeObj = objNull;
life_disable_getIn = false;
life_disable_getOut = false;
life_admin_debug = false;
life_preview_3D_vehicle_cam = objNull;
life_preview_3D_vehicle_object = objNull;
life_preview_light = objNull;
life_pos_exist = false;
life_pos_attach = [];
life_civ_position = [];
life_markers = false;
life_canpay_bail = true;
life_open_notifications = [];
//life_oldmsg = [];
life_actions = [];
ESG_Neu = false;
ESG_ausweis = [];
ESG_Bekannte = [];
ESG_aim = false;
ESG_sos_cooldown = false;
ESG_sitzen = false;
ESG_stop_dupe = false;
ESG_skill = [
  0, //Reparieren 0
  0, //Heilung 1
  0, //Stabilisierung 2
  0, //Sammeln Früchte 3
  0, //Verarbeiten Früchte 4
  0, //Sammeln Drogen 5
  0, //Verarbeiten Drogen 6
  0, //Sammeln Schwarzarbeit 7
  0, //Verarbeiten Schwarzarbeit 8
  0, //Sammeln Erze 9
  0, //Verarbeiten Erze 10
  0, //Knacken von Fahrzeugen 11
  0, //Bolzenschneider 12
  0, //Beschlagnahmen 13
  0, //Wiederbeleben 14
  0, //Häuser aufbrechen 15
  0, //Abtasten 16
  0, //Sammeln Diverse 17
  0  //Verarbeiten Diverse 18
];

ZB_GangRecht = [];

//Medicsystem
ESG_medicInteract = objNull;
ESG_medicSelected = ["Beine", ["legs"]];

//Settings
zbg_settings_Logo = profileNamespace getVariable ["zbg_settings_Logo",true];
zbg_settings_gras = profileNamespace getVariable ["zbg_settings_gras", false];
life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
life_settings_tagson = profileNamespace getVariable ["life_settings_tagson",true];
life_settings_revealObjects = profileNamespace getVariable ["life_settings_revealObjects",true];
life_settings_viewDistanceFoot = 1000;
life_settings_viewDistanceCar = 1000;
life_settings_viewDistanceAir = 1500;
life_settings_viewDistanceBoat = 1000;

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 74;
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).


//Natic Variables 
life_seatbelt = false;
life_bonus_Astatus = false;
life_bonus_status = false;
life_sidechat = profileNamespace getVariable["life_sidechat",true];
life_tagson = profileNamespace getVariable["life_settings_tagson",true];
life_revealObjects = profileNamespace getVariable["life_revealObjects",true];
life_skipintro = profileNamespace getVariable["life_skipintro",false];
life_screenshot = profileNamespace getVariable["life_screenshot",false];
natic_company_bactive = false;
natic_company = false;
natic_company_bStart = 50000; //Company Bank ---Start Amount---
life_adminmode_active = false;

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_is_alive = false;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
CASH = 0;

life_isknocked = false;
life_vehicles = [];

/*
    Master Array of items?
*/
//Setup variable inv vars.
{
    missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
    _varName = getText(_x >> "variable");
    _sideFlag = getText(_x >> "side");

    missionNamespace setVariable [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));

locker_loaddelay = false; 
locker_antispam = false;

/*
**************************************
****** Placeables Variables *****
**************************************
*/
life_definePlaceables = //Array aller Absperrungen (Cop + Medic)
[
 "RoadCone_F",
 "RoadCone_L_F",
 "RoadBarrier_F",
 "RoadBarrier_small_F",
 "PlasticBarrier_03_orange_F",
 "Land_CncBarrier_stripes_F",
 "Land_PortableLight_single_F",
 "Land_PortableLight_double_F",
 "Land_BarGate_F"
];
life_bar_limit = 15; //Maximale Anzahl Absperrungen pro Person