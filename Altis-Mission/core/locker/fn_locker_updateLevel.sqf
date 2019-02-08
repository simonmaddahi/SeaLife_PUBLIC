#include "..\..\script_macros.hpp"
/*
 *
 *	@File:		fn_locker_updateLevel.sqf
 *	@Author: 	AllianceApps
 *	@Date:		25.02.2018
 *
 *	You are not allowed to use this script or remove the credits of the script without written permission of the author.
 *  You are not allowed to use this script without a valid license. License terms apply.
 *
 *  Du darfst dieses Script nicht nutzen oder diesen Copyright-Hinweis nicht entfernen, wenn du keine schriftliche Bestätigung des Autors hast.
 *  Du darfst dieses Script nicht ohne gültige Lizenz nutzen. Die Lizenzbestimmungen für Scripts sind zu beachten.
 *  
 */
scriptName "fn_locker_updateLevel";
if(getNumber(missionConfigFile >> "locker_config" >> "locker_lvl_bool") isEqualTo 0) exitWith {};
_index = getArray(missionConfigFile >> "locker_config" >> "locker_levels") select locker_level;
_trunk = _index select 0;
_price = _index select 1;
_result = [format[localize "STR_locker_upgrademsg",[_price] call life_fnc_numberText,_trunk], localize "STR_locker_upgradetitle", localize "STR_Global_Yes", localize "STR_Global_No"] call BIS_fnc_guiMessage;
if(!_result) exitWith {};
if(CASH < _price) exitWith {hint localize "STR_ATM_NotEnoughCash"};
CASH = CASH - _price;
locker_level = locker_level + 1;
[getplayeruid player,playerSide,locker_level] remoteExecCall ["ton_fnc_locker_signuplocker",2];
locker_limit = _trunk;
if(locker_level isEqualTo count(getArray(missionConfigFile >> "locker_config" >> "locker_levels"))) then {
	ctrlShow[1000079,false];
};
ctrlSetText[1000077, format[localize "STR_locker_trunk",locker_space,locker_limit]];
hint localize "STR_locker_upgradenotf";