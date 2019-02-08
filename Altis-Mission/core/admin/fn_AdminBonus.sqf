/*
	Author: Natic
	Date: 25.01.2019
	Disclaimer: Nobody is allowed to use/edit this Script
*/
private ["_action"];
if (life_adminlevel <= 2) exitWith {
		hint format["Du besitzt nicht die Berechtigung"];
};

if (life_adminlevel >= 3 && !life_bonus_status) then {
		life_action_inUse = true;
		_action = [
		format ["Soll der Bonus manuell Aktiviert werden?"],
		"Admin  Anfrage - BonusEvent",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
		] call BIS_fnc_guiMessage;
	if (_action) then {
		hint format["Du hast den Bonus Manuell Aktiviert!"];
		life_bonus_Astatus = true;
	};
} else {
		_action = [
		format ["Der Bonus ist bereits aktiviert, möchtest du ihn Deaktivieren?"],
		"Admin  Anfrage - BonusEvent",
		localize "STR_Global_Yes",
		localize "STR_Global_No"
		] call BIS_fnc_guiMessage;
	if (_action) then {
		hint format["Du hast den Bonus Manuell Deaktiviert!"];
		life_bonus_Astatus = true;
	};
};