/*
Author : Natic 
Created : 03.01.2019
File : fn_AirBag.sqf
Description : You can built / put a Airbag on your Car, if you crash you will become lower damage.
*/

private ["_action","_title","_titleText","_ui","_progressBar","_cP"];

#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {
		["Du montirst bereits einen AirBag", true, "fast"] spawn ESG_fnc_notify;
};
if(!(vehicle player == player)) exitWith {
	["Du musst aussteigen, um den AirBag einzubauen!", true, "fast"] spawn ESG_fnc_notify;
};
_unit = cursorTarget;
if (count (_unit getVariable ["vehicle_info_owners", []]) < 1 || !(_unit isKindOf "Car")) exitWith {
	["Das Fahrzeug ist abgeschlossen, somit kannst du hier kein AirBag einbauen!", true, "fast"] spawn ESG_fnc_notify;
	;

life_action_inUse = true;
_action = [
 format ["AirBag einbauen?"],
 "AirBag - Menu",
 localize "STR_Global_Yes",
 localize "STR_Global_No"
] call BIS_fnc_guiMessage;

_title = format[localize "STR_ISTR_AirBag_Process",];

if (_action) then {
 [false,"airbag",1] call life_fnc_handleinv;
 player playMove "AwopPercMstpSgthWnonDnon_throw";
 disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
 sleep 3;
 life_action_inUse = false;
} else {
 ["Der AirBag konnte aus einem unbekannen Grund nicht eingebaut werden!", true, "fast"] spawn ESG_fnc_notify;
 closeDialog 0;
 life_action_inUse = false;
};