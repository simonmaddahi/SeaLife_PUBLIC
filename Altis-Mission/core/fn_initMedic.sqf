#include "..\script_macros.hpp"
/*
    File: fn_initMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the medic..
*/
player addRating 99999999;

if ((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

//Reserved Slots
if ((str(player) in ["medic_1","medic_2"])) then {
 if ((FETCH_CONST(life_mediclevel)) < 10) then {
 ["sidechief",false,true] call BIS_fnc_endMission;
 sleep 35;
 };
};

player setVariable ["rank",(FETCH_CONST(life_mediclevel)),true];
0 spawn life_fnc_icons;