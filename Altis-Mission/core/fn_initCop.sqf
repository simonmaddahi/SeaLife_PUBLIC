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

[] spawn life_fnc_placeablesInit;

//Whitelist
if ((FETCH_CONST(life_copLevel)) < 1 && (FETCH_CONST(life_adminlevel) isEqualTo 0)) exitWith {
    ["Notwhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

//Reserved Slots
if ((str(player) in ["cop_1"])) then {
 if ((FETCH_CONST(life_coplevel)) < 10) then {
 ["sidechief",false,true] call BIS_fnc_endMission;
 sleep 35;
 };
};

if ((str(player) in ["cop_26","cop_27","cop_28"])) then {
 if ((FETCH_CONST(life_donorlevel)) < 1) then {
 ["premiumslot",false,true] call BIS_fnc_endMission;
 sleep 35;
 };
};

player setVariable ["rank",(FETCH_CONST(life_coplevel)),true];

//Weil die Cops sonst nichts können :D
//player setUnitRecoilCoefficient 0.8;
//player setAnimSpeedCoef 1.1;
