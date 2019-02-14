#include "..\..\script_macros.hpp"
/*
	File: fn_bambyInit.sqf
	Author: Natic
*/
private["_script", "_time", "_check"];

if(playerSide != civilian) exitWith {};

if(isNil{profileNamespace getVariable "bamby"}) then {
	profileNamespace setVariable ["bamby", getNumber(missionConfigFile >> "Life_Settings" >> "bamby_time")];
	saveProfileNamespace;
};

_check = false;
if(getNumber(missionConfigFile >> "Life_Settings" >> "bamby_weapons") == 1 && count (weapons player) > 0) then {_check = true;};
{
	if(_x in (items player + assignedItems player)) exitWith {_check = true;};
} forEach (getArray(missionConfigFile >> "Life_Settings" >> "bamby_items"));

if(_check) exitWith {player setVariable ["isBamby",false,true];};
if((profileNamespace getVariable "bamby") == 0) exitWith {player setVariable ["isBamby",false,true];};

player setVariable ["isBamby",true,true];

life_bambyTakeHandler = player addEventHandler ["Take", {_this call life_fnc_bambyTake}];

_time = (profileNamespace getVariable "bamby");
for "_i" from 1 to _time do {
	sleep 60;
	profileNamespace setVariable ["bamby",(profileNamespace getVariable "bamby") - 1];
	saveProfileNamespace;
	if(life_bamby_broke) exitWith {};
	if((profileNamespace getVariable "bamby") <= 0) exitWith {};
};

if(life_bamby_broke) exitWith {};

hint parseText "<t color='#139822' size='1.2'>Bamby-Schutz</t><br/><br/>Dein Neuling-Schutz ist nun abgelaufen und du bist verwundbar!";

profileNamespace setVariable ["bamby", 0];
saveProfileNamespace;
player setVariable ["isBamby",false,true];
player removeEventHandler ["Take", life_bambyTakeHandler];
