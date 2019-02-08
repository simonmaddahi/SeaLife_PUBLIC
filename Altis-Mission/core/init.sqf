/*
    File: init.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Master client initialization file
*/
private ["_handle","_timeStamp","_extDB_notLoaded"];
life_firstSpawn = true;
life_session_completed = false;
_timeStamp = diag_tickTime;
_extDB_notLoaded = "";
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------ Version 5.0.0 -------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player isEqualTo player};
sleep 2;
createDialog "ESG_spawnBefore";
waitUntil {!isNull (findDisplay 88214)};

[1, "Überprüfe den Client", 1, 15] call life_fnc_ladeSpieler;

private _BIUnits = squadParams player;
if !(_BIUnits isEqualTo []) exitWith {
	"units" call BIS_fnc_endMission;
};

call compile preprocessFileLineNumbers "core\clientValidator.sqf";
enableSentences false;


if (!((profileName find "[") isEqualTo -1) || !((profileName find "]") isEqualTo -1) || !((profileName find "(") isEqualTo -1) || !((profileName find ")") isEqualTo -1) || !((profileName find "{") isEqualTo -1) || !((profileName find "}") isEqualTo -1) || !((profileName find '"') isEqualTo -1) || !((profileName find ':') isEqualTo -1) || !((profileName find '#') isEqualTo -1)) exitWith {
	"wrongname" call BIS_fnc_endMission;
};

private _nameArr = profileName splitString " ";
if ((count _nameArr) < 2) exitWith {
	"nameCount" call BIS_fnc_endMission;
};

[1, "Initialisiere Variabeln", 2, 15] call life_fnc_ladeSpieler;
diag_log format ["::Life Client:: Initialization Variables - %1", (diag_tickTime) - _timeStamp];
call compile preprocessFileLineNumbers "core\configuration.sqf";


[1, "Warte auf den Server", 3, 15] call life_fnc_ladeSpieler;
diag_log format ["::Life Client:: Waiting for the server to be ready.. - %1",(diag_tickTime) - _timeStamp];
waitUntil {!isNil "life_server_isReady"};
waitUntil {!isNil "life_HC_isActive" && {!isNil "life_server_extDB_notLoaded"}};


[1, "Lade Datenbank", 4, 15] call life_fnc_ladeSpieler;
if (life_server_extDB_notLoaded) exitWith {};

waitUntil {life_server_isReady};
"sperrzonensystem\" execVM "sperrzonensystem\main.sqf";

 
[1, "Lade Serverdaten", 5, 15] call life_fnc_ladeSpieler;
[player] remoteExecCall ["ESG_fnc_getServerStats", 2];

waitUntil {!(isNil "ZBG_ServerStats")};

[3] call life_fnc_ladeSpieler;

 
[1, "Lade Spielerdaten", 6, 15] call life_fnc_ladeSpieler;
call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};

 
[1, "Warte auf Serverfunktionen", 7, 15] call life_fnc_ladeSpieler;
diag_log format ["::Life Client:: User actions completed - %1", (diag_tickTime) - _timeStamp];
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil "TON_fnc_clientGangLeader")};

diag_log "::Life Client:: Received server functions.";

 
[1, "Lade Scrollradmenü", 8, 15] call life_fnc_ladeSpieler;
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
call life_fnc_setupEVH;

diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
call life_fnc_setupActions;

0 spawn life_fnc_escInterupt;

 
[1, "Setze Fraktionen", 9, 15] call life_fnc_ladeSpieler;
life_paycheck = 1200;

switch (playerSide) do {
    case west: {
        switch (call life_copLevel) do {
            case 1: {life_paycheck = 100; player setVariable ["rankaus","Polizeipraktikant",true];};
			case 2: {life_paycheck = 800; player setVariable ["rankaus","Polizeikommissaranwärter",true];};
            case 3: {life_paycheck = 2500; player setVariable ["rankaus","Polizeikommissar",true];};
            case 4: {life_paycheck = 3500; player setVariable ["rankaus","Polizeioberkommissar",true];};
            case 5: {life_paycheck = 4500; player setVariable ["rankaus","Polizeihauptkommissar (A11)",true];};
            case 6: {life_paycheck = 5500; player setVariable ["rankaus","Polizeihauptkommissar (A12)",true];};
            case 7: {life_paycheck = 7500; player setVariable ["rankaus","Erster Polizeihauptkommissar",true];};
            case 8: {life_paycheck = 8500; player setVariable ["rankaus","Polizeirat",true];};
            case 9: {life_paycheck = 9500; player setVariable ["rankaus","Polizeioberrat",true];};
            case 10: {life_paycheck = 10500; player setVariable ["rankaus","Polizeidirektor",true];};
            case 11: {life_paycheck = 11000; player setVariable ["rankaus","Leitender Polizeidirektor",true];};
            case 12: {life_paycheck = 13000; player setVariable ["rankaus","Landeskriminalbeamter",true];};
            default {life_paycheck = 100; player setVariable ["rankaus","Polizeikommissar/Anwärter",true];};
        };
    };
    case civilian: {
        life_paycheck = 6500;
    };
    case independent: {
        switch (call life_medicLevel) do {
            case 1: {life_paycheck = 2500; player setVariable ["rankaus","Feuerwehrmannanwärter",true];};
            case 2: {life_paycheck = 3000; player setVariable ["rankaus","Feuerwehrmann",true];};
            case 3: {life_paycheck = 4000; player setVariable ["rankaus","Hauptfeuerwehrmann",true];};
            case 4: {life_paycheck = 6000; player setVariable ["rankaus","Brandmeister",true];};
            case 5: {life_paycheck = 6500; player setVariable ["rankaus","Oberbrandmeister",true];};
            case 6: {life_paycheck = 7000; player setVariable ["rankaus","Hauptbrandmeister",true];};
            case 7: {life_paycheck = 8000; player setVariable ["rankaus","Brandinspektor",true];};
            case 8: {life_paycheck = 9000; player setVariable ["rankaus","Brandrat",true];};
            case 9: {life_paycheck = 9500; player setVariable ["rankaus","Oberbrandrat",true];};
            case 10: {life_paycheck = 10000; player setVariable ["rankaus","Branddirektor",true];};
            case 11: {life_paycheck = 10000; player setVariable ["rankaus","Leitender Branddirektor",true];};
            default {life_paycheck = 5000;  player setVariable ["rankaus","Rettungshelfer",true];};
        };
    };
};

life_paycheck = compileFinal (if (life_paycheck isEqualType "") then {life_paycheck} else {str(life_paycheck)});

 
[1, "Setze Spieler-Variabeln", 10, 15] call life_fnc_ladeSpieler;

player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
player setVariable ["playerSurrender",false,true];
player setVariable ["esg_bewusstlos",false,true];
player setVariable ["esg_damagestore",0,true];
player setVariable ["esg_bewusstlos_delay",0,true];
player setVariable ["istazed",false,true];
player setVariable ["esg_bewusstlos_stab",0,true];
player setVariable ["esg_stabinpro",false,true];
player setVariable ["esg_laststab",0,true];
player setVariable ["steam64ID",getPlayerUID player];
if ((group player getVariable ["gang_tag", ""]) isEqualTo "") then {
    player setVariable ["realname",profileName,true];
};

 
[1, "Lade Displays", 11, 15] call life_fnc_ladeSpieler;

diag_log "Past Settings Init";
execFSM "core\fsm\client.fsm";

diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};

diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;

[player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC", 2];
call life_fnc_hudSetup;

 
[1, "Lade andere Spieler", 12, 15] call life_fnc_ladeSpieler;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

life_fnc_moveIn = compileFinal
"
    life_disable_getIn = false;
    player moveInCargo (_this select 0);
    life_disable_getOut = true;
";

life_fnc_RequestClientId = player;
publicVariableServer "life_fnc_RequestClientId";

 
[1, "Setze Spieler auf", 13, 15] call life_fnc_ladeSpieler;
[] spawn life_fnc_survival;
[] spawn life_fnc_initmapfilter;
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil {(!isNull (findDisplay 49)) && {(!isNull (findDisplay 602))}}; 
        (findDisplay 49) closeDisplay 2; 
        (findDisplay 602) closeDisplay 2; 
    };
};

player enableFatigue false;
enableEnvironment false;
setCurrentChannel 5;
0 enableChannel false;
1 enableChannel false;
2 enableChannel false;
6 enableChannel [true, false];
7 enableChannel [true, false];
8 enableChannel [true, false];

[getPlayerUID player,player getVariable ["realname",name player]] remoteExec ["life_fnc_wantedProfUpdate", 2];

if (profileNamespace getVariable ["zbg_settings_Logo", true]) then {
    profileNamespace setVariable ["zbg_settings_Logo", true];
    ((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 8888) ctrlSetFade 0.5;
    ((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 8888) ctrlCommit 0;
} else {
    profileNamespace setVariable ["zbg_settings_Logo", false];
    ((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 8888) ctrlSetFade 1;
    ((uiNamespace getVariable ["playerHUD",displayNull]) displayCtrl 8888) ctrlCommit 0;
};

if (profileNamespace getVariable ["zbg_settings_gras", true]) then {
    profileNamespace setVariable ["zbg_settings_gras", true];
    setTerrainGrid 25;
} else {
    profileNamespace setVariable ["zbg_settings_gras", false];
    setTerrainGrid 50;
};

life_hideoutBuildings = [];
{
    private _building = nearestBuilding getMarkerPos _x;
    life_hideoutBuildings pushBack _building;
    false
} count ["gang_area_1","gang_area_2","gang_area_3"];

 
[1, "Gleich bist du fertig", 14, 15] call life_fnc_ladeSpieler;
switch (playerSide) do {
    case west: {
        _handle = [] spawn life_fnc_initCop;
        waitUntil {scriptDone _handle};
    };
    case civilian: {
        _handle = [] spawn life_fnc_initCiv;
        waitUntil {scriptDone _handle};
    };
    case independent: {
        _handle = [] spawn life_fnc_initMedic;
        waitUntil {scriptDone _handle};
    };
	case east: {
		_handle = [] spawn life_fnc_initArc;
        waitUntil {scriptDone _handle};
	};
};
 
[1, "Fertig!", 15, 15] call life_fnc_ladeSpieler;

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";
0 call life_fnc_locker_inoutfunctions;