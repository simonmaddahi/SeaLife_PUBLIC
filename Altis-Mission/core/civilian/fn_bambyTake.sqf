#include "..\..\script_macros.hpp"
/*
	File: fn_bambyTake.sqf
	Author: Natic
	
	# Author bitte nicht entfernen!
	# Veränderungen an dieser Datei sind erlaubt.
	# Diese Datei wurde unter Auftrag erstellt.
*/
private["_unit", "_container", "_item", "_check"];

_unit = _this select 0;
_container = _this select 1;
_item = _this select 2;
_check = false;

life_fnc_bambyRemove = {
	hint parseText "<t color='#139822' size='1.2'>Bamby-Schutz</t><br/><br/>Du hast deinen Bamby-Schutz verloren da du ein unerlaubtes Item oder eine Waffe aufgenommen hast!";

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
