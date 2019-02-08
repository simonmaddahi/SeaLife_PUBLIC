#include "..\..\script_macros.hpp"
scriptName "fn_locker_initLocker";
/*
 *
 *	@File:		fn_locker_initLocker.sqf
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
if(!((count _this) isEqualto 10)) exitWith {hint "Wrong DB Array passed."};
createDialog "virt_locker";
(findDisplay 1000001) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {hint localize 'STR_locker_pressesc';true}"]; //Block the ESC menu
_locker_killedevh = getNumber(missionConfigFile >> "locker_config" >> "locker_killedevh");
if(_locker_killedevh isEqualto 1) then {
	locker_killedevh = player addEventHandler ["killed", {
		closeDialog 0;
		removeAllWeapons player;
		removeAllItems player;
		removeGoggles player;
		removeHeadgear player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		{
			if(_x isEqualType "") then {_item = _x} else {_item = configName _x};
			_itemName = ITEM_VARNAME(_item);
			missionNamespace setVariable [_itemName,0];
		} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
		hint localize "STR_locker_items_del";
	}];
};
if(getNumber(missionConfigFile >> "locker_config" >> "locker_converter") isEqualTo 1) then {
	call life_fnc_locker_converter;
};
locker_primary = _this select 0;
locker_dbhangun = _this select 1;
locker_dbattach = _this select 2;
locker_clothing = _this select 3;
locker_vest = _this select 4;
locker_backpack = _this select 5;
locker_other = _this select 6;
locker_items = _this select 7;
locker_virtitems = _this select 8;
locker_level = _this select 9;
if(locker_level isEqualTo count(getArray(missionConfigFile >> "locker_config" >> "locker_levels"))) then {
	ctrlShow[1000079,false];
};
locker_limit = if(getNumber(missionConfigFile >> "locker_config" >> "locker_lvl_bool") isEqualTo 1) then {
	(getArray(missionConfigFile >> "locker_config" >> "locker_levels") select (locker_level - 1)) select 0;
} else {
	ctrlShow[1000079,false];getNumber(missionConfigFile >> "locker_config" >> "locker_limit")
};
locker_space = [] call life_fnc_locker_weightfetcher;
ctrlSetText[1000077, format[localize "STR_locker_trunk",locker_space,locker_limit]];
{
	lbclear _x;
} foreach [1000038,1000040,1000042,1000047,1000006,1000008,1000010,1000074];
hint localize "STR_locker_dontdisco";
0 spawn life_fnc_locker_changedialog;