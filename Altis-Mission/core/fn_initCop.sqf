#include "..\script_macros.hpp"
/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Cop Initialization file.
*/
player addRating 9999999;

if (life_blacklisted) exitWith {
    ["Blacklisted",false,true] call BIS_fnc_endMission;
    sleep 30;
};



if ((FETCH_CONST(life_copLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
 ["Notwhitelisted",false,true] call BIS_fnc_endMission;
 sleep 35;
};

if(player in [cop_1]) && ((FETCH_CONST(life_copLevel)) < 10) exitWith {
 ["Notwhitelisted",false,true] call BIS_fnc_endMission;
 sleep 35;
 };


player setVariable ["rank",(FETCH_CONST(life_coplevel)),true];

