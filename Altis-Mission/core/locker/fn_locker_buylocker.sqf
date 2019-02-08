#include "..\..\script_macros.hpp"
/*
 *
 *	@File:		fn_locker_changedialog.sqf
 *	@Author: 	AllianceApps
 *	@Date:		24.06.2017
 *
 *	You are not allowed to use this script or remove the credits of the script without written permission of the author.
 *  You are not allowed to use this script without a valid license. License terms apply.
 *
 *  Du darfst dieses Script nicht nutzen oder diesen Copyright-Hinweis nicht entfernen, wenn du keine schriftliche Bestätigung des Autors hast.
 *  Du darfst dieses Script nicht ohne gültige Lizenz nutzen. Die Lizenzbestimmungen für Scripts sind zu beachten.
 *  
 */
scriptName "fn_locker_buylocker";
_price = if(getNumber(missionConfigFile >> "locker_config" >> "locker_lvl_bool") isEqualTo 1) then {
	(getArray(missionConfigFile >> "locker_config" >> "locker_levels") select 0) select 1;
} else {
	getNumber(missionConfigFile >> "locker_config" >> "locker_price")
};
_result = [format[localize "STR_locker_buymsg",[_price] call life_fnc_numberText], localize "STR_locker_upgradetitle", localize "STR_Global_Yes", localize "STR_Global_No"] call BIS_fnc_guiMessage;
if(!_result) exitWith {};
if(CASH < _price) exitWith {hint localize "STR_ATM_NotEnoughCash"};
CASH = CASH - _price;
[getplayeruid player,playerSide] remoteExecCall ["ton_fnc_locker_signuplocker",2];
locker_loaddelay = false;
