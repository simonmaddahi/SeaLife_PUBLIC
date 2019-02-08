#include "..\script_macros.hpp"
/*
    File: fn_initARC.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the ARC..
*/
player addRating 99999999;

if ((FETCH_CONST(life_arcLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

player setVariable ["rank",(FETCH_CONST(life_arcLevel)),true];