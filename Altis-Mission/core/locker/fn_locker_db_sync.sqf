scriptName "fn_locker_db_sync";
/*
 *
 *	@File:		fn_locker_db_sync.sqf
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
if(!(isNull objectParent player)) exitWith {hint localize "STR_locker_vehicle"};
if(!((str playerside) in getArray(missionConfigFile >> "locker_config" >> "locker_sides"))) exitWith {hint localize "STR_locker_noaccess"};
if(locker_loaddelay) exitWith {hint localize "STR_locker_wait"};
[getplayerUID player,playerSide] remoteExecCall ["ton_fnc_locker_initlocker",2];
locker_loaddelay = true;
sleep 15;
locker_loaddelay = false;