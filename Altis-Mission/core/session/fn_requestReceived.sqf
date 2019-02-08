#include "..\..\script_macros.hpp"
/*
    File: fn_requestReceived.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Called by the server saying that we have a response so let's
    sort through the information, validate it and if all valid
    set the client up.
*/
private _count = count _this;
life_session_tries = life_session_tries + 1;
if (life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if (life_session_tries > 3) exitWith {/*cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;*/};

//0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and junk..
if (isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (_this isEqualType "") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (count _this isEqualTo 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if ((_this select 0) isEqualTo "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if (!(getPlayerUID player isEqualTo (_this select 0))) exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if (!isServer && (!isNil "life_adminlevel" || !isNil "life_coplevel" || !isNil "life_donorlevel")) exitWith {
    [profileName, getPlayerUID player,"VariablesAlreadySet"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
    [profileName, format ["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donorlevel: %3",life_adminlevel,life_coplevel,life_donorlevel]] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
    sleep 0.9;
    failMission "SpyGlass";
};

//Parse basic player information.
life_cash = _this select 3;
life_atmbank = _this select 4;
CONST(life_adminlevel,(_this select 5));

//Donatorlevel
//Falls gewünscht, hier einfügen
CONST(life_donorlevel,0);

//Loop through licenses
if !((_this select 7) isEqualTo []) then {
    {missionNamespace setVariable [(_x select 0),(_x select 1)];} forEach (_this select 7);
};

//Parse side specific information.
switch (playerSide) do {
    case west: {
        CONST(life_coplevel,(_this select 8));
        CONST(life_medicLevel,0);
		CONST(life_arcLevel,0);
        life_blacklisted = _this select 10;
        life_hunger = ((_this select 11) select 0);
        life_thirst = ((_this select 11) select 1);
        player setDamage ((_this select 11) select 2);
        CONST(ESG_DBID, (_this select 1));
		ESG_loadout = _this select 13;
        ESG_ausweis = _this select 14;
		ESG_skill = _this select 15;
        life_is_arrested = false;
    };

    case civilian: {
        life_is_arrested = _this select 15;
        CONST(life_coplevel, 0);
        CONST(life_medicLevel, 0);
		CONST(life_arcLevel,0);
        life_houses = _this select (_count - 3);
        life_hunger = ((_this select 8) select 0);
        ife_thirst = ((_this select 8) select 1);
        player setDamage ((_this select 8) select 2);

        {
            _house = nearestObject [(call compile format ["%1",(_x select 0)]), "House"];
            life_vehicles pushBack _house;
        } forEach life_houses;

        CONST(ESG_DBID, (_this select 1));
        ESG_loadout = _this select 11;
        ESG_ausweis = _this select 14;
		ESG_skill = _this select 13;
        life_gangData = _this select (_count - 2);

        life_is_alive = _this select 12;
        life_civ_position = _this select 18;
        if (life_is_alive) then {
            if !(count life_civ_position isEqualTo 3) then {diag_log format ["[requestReceived] Bad position received. Data: %1",life_civ_position];life_is_alive =false;};
            if (life_civ_position distance (getMarkerPos "respawn_civilian") < 300) then {life_is_alive = false;};
        };

        if (!(count life_gangData isEqualTo 0)) then {
            0 spawn life_fnc_initGang;
        };

        0 spawn life_fnc_initHouses;
        //player setVariable ["gang_id", (_this select 19), true];
    };

    case independent: {
        CONST(life_medicLevel,(_this select 8));
        CONST(life_coplevel,0);
		CONST(life_arcLevel,0);
        life_blacklisted = _this select 10;
        life_hunger = ((_this select 11) select 0);
        life_thirst = ((_this select 11) select 1);
        player setDamage ((_this select 11) select 2);
        CONST(ESG_DBID, (_this select 1));
        ESG_loadout = _this select 13;
        ESG_ausweis = _this select 14;
        ESG_skill = _this select 15;
        life_is_arrested = false;
    };
	
	case east: {
        CONST(life_medicLevel,0);
        CONST(life_coplevel,0);
		CONST(life_arcLevel,(_this select 8));
        life_blacklisted = _this select 10;
        life_hunger = ((_this select 11) select 0);
        life_thirst = ((_this select 11) select 1);
        player setDamage ((_this select 11) select 2);
        CONST(ESG_DBID, (_this select 1));
        ESG_loadout = _this select 13;
        ESG_ausweis = _this select 14;
        ESG_skill = _this select 15;
        life_is_arrested = false;
	};
};

life_gear = _this select 9;
[true] call life_fnc_loadGear;

if !((_this select (_count - 1)) isEqualTo []) then {
    {life_vehicles pushBack _x;} forEach (_this select (_count - 1));
};

life_session_completed = true;