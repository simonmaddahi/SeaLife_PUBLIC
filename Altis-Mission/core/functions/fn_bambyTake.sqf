#include "..\..\script_macros.hpp"
/*
	File: fn_bambyTake.sqf
	Author: Natic
  Helped by: Nflug
*/
private["_unit", "_container", "_item", "_check"];

_unit = _this select 0;
_container = _this select 1;
_item = _this select 2;
_check = false;

life_fnc_bambyRemove = {
  ["Du hast deinen Neulingschutz verloren, da du eine Aggressive Handlung unternommen oder einen Verbotenen Gegenstand aufgehoben hast.", true, "fast"] spawn ESG_fnc_notify;

	life_bamby_broke = true;
	profileNamespace setVariable ["bamby",0];
	saveProfileNamespace;
	player setVariable ["isBamby",false,true];
	player removeEventHandler ["Take", life_bambyTakeHandler];
	player removeEventHandler ["HandleDamage", life_bambyDamageHandler];
};

if(_item in (getArray(missionConfigFile >> "Life_Settings" >> "bamby_items"))) then {_check = true;};
if(getNumber(missionConfigFile >> "Life_Settings" >> "bamby_weapons") == 1 && count (weapons _unit) > 0) then {_check = true;};

if(_check) exitWith {remoteExec ["life_fnc_bambyRemove",_unit];};
