/* 
	Author: Natic [naticclips@gmail.com]
	Date: 25.01.2019

*/
private ["_taxi", "_security", "_new", "_action"];

life_action_inUse = true;
_action = [
 format ["Möchtest du ein Taxiunternehmer werden?"],
 "Firmensystem - Konzeptwahl",
 localize "STR_Global_Yes",
 localize "STR_Global_No"
] call BIS_fnc_guiMessage;
if (_action) then { 
	profileNamespace setVariable ["natic_company_taxi",true];
} else { 
_action = [
 format ["Möchtest du ein Sicherheitsdienst - Unternehmer werden?"],
 "Firmensystem - Konzeptwahl",
 localize "STR_Global_Yes",
 localize "STR_Global_No"
] call BIS_fnc_guiMessage;
if (_action) then {
	profileNamespace setVariable ["natic_company_security",true];
} else {
	["Du gründest dein Eigenes Konzept, viel Glück!", true, "fast"] spawn ESG_fnc_notify;
};
};
