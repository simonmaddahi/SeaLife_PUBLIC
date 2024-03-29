#include "..\..\script_macros.hpp"
/*
    File: fn_medicSiren.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the medic siren sound for other players.
*/
private ["_vehicle"];
_vehicle = param [0,objNull,[objNull]];
private _distance = param [1,100,[0]];

if (isNull _vehicle) exitWith {};
if (isNil {_vehicle getVariable "siren"}) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if (!(_vehicle getVariable "siren")) exitWith {};
    if (count crew _vehicle isEqualTo 0) then {_vehicle setVariable ["siren",false,true]};
    if (!alive _vehicle) exitWith {};
    if (isNull _vehicle) exitWith {};
    _vehicle say3D ["fwsiren1", _distance];//Class name specified in description.ext
    sleep 6.58;//Exactly matches the length of the audio file.
    if (!(_vehicle getVariable "siren")) exitWith {};
};
