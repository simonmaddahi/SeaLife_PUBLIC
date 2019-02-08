#include "..\..\script_macros.hpp"
/*
    File: fn_sirenLights.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Lets play a game! Can you guess what it does? I have faith in you, if you can't
    then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private ["_vehicle"];
_vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {}; //Bad entry!
if(isNil {_vehicle getVariable "lights"})exitWith{};

_trueorfalse = _vehicle getVariable ["lights",false];

if (_trueorfalse) then {
    _vehicle setVariable ["lights",false,true];
	titletext["Sondersignal AUS","PLAIN"];
} else {
    _vehicle setVariable ["lights",true,true];
    [_vehicle] remoteExec ["life_fnc_copLights",RCLIENT];
	titletext["Sondersignal AN","PLAIN"];
};