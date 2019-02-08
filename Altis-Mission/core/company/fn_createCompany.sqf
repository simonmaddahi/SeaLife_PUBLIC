/*
		File: fn_robMarktet.sqf
		Author : Natic
		Help: Tonic Gangsystem
		Date: 18.12.2018
		Reclaimer: Nobody is allowed too use/edit this Script, without Natics permissions!
		Description: Create your own Company
		
		ACHTUNG: Folgende Variabeln texte müssen festgelegt werden in den Datein: Stringtable, Configuration
		1: TON_fnc_insertCompany
		2: STR_DL_AL_createdCompany_BEF
		3: STR_DL_AL_createdCompany
		4: life_action_companyInUse

*/
#include "..\..\script_macros.hpp"
disableSerialization;


private ["_companyName","_length","_badChar","_chrByte","_allowed"];
private _company_price = getNumber(missionConfigFile >> "CFGcompany" >> "company_price");
private _max_employers = getNumber(missionConfigFile >> "CFGmarket" >> "employers" >> "max_employers");
private _max_vehicles = getNumber(missionConfigFile >> "CFGmarket" >> "garage" >> "max_vehicles");
private _company_warehouse = getNumber(missionConfigFile >> "CFGmarket" >> "warehouse" >> "company_warehouse");


//Error Abfragen
if (playerside != civilian) exitWith {
	hint format["Du kannst dich nicht selbstständig machen, du dienst dem Staat"];
};

if (_player distance _shop > 5) exitWith {
	hint format["Du stehst zu weit weg, um den Vertrag zu unterschreiben"];
};

if (vehicle player != _player) exitWith {
	hint format["Du must erst aus dem Fahrzeug aussteigen"];
};

//Main Code - Tonic Gangsystem - edited by Natic
_companyName = ctrlText (CONTROL(2520,2522));
_length = count (toArray(_companyName));
_chrByte = toArray (_companyName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if (_length > 32) exitWith {hint localize "STR_GNOTF_Over32"};
_badChar = false;
{if (!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if (_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if (BANK < (LIFE_SETTINGS(getNumber,"company_price"))) exitWith {hint format [localize "STR_GNOTF_NotEnoughMoney",[((LIFE_SETTINGS(getNumber,"company_price")) - BANK)] call life_fnc_numberText];};

if (life_HC_isActive) then {
    [player,getPlayerUID player,_companyName] remoteExec ["HC_fnc_insertCompany",HC_Life];
} else {
    [player,getPlayerUID player,_companyName] remoteExec ["TON_fnc_insertCompany",RSERV];
};

if (LIFE_SETTINGS(getNumber,"player_advancedLog") isEqualTo 1) then {
    if (LIFE_SETTINGS(getNumber,"battlEye_friendlyLogging") isEqualTo 1) then {
        advanced_log = format [localize "STR_DL_AL_createdCompany_BEF",_companyName,(LIFE_SETTINGS(getNumber,"company_price"))];
    } else {
        advanced_log = format [localize "STR_DL_AL_createdCompany",profileName,(getPlayerUID player),_companyName,(LIFE_SETTINGS(getNumber,"company_price"))];
    };
    publicVariableServer "advanced_log";
};

hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;
/*
life_action_inUse = true;
_action = [
 format ["Möchtest du dein eigenes Konzept erstellen?"],
 "Nummernschild - Generator",
 localize "STR_Global_Yes",
 localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	hint format["Dein Firma wurde eingetragen, du kannst nun deine Firma aufbauen"];
} else {
	hint format["Dir werden deine Dinge bereitgestellt"];
	createDialog displayctrl 1548;
*/
