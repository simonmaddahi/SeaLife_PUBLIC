scriptName "fn_locker_terminate";
/*
 *
 *	@File:		fn_locker_terminate.sqf
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
if(locker_antispam) exitWith {hint localize "STR_locker_wait"};
closeDialog 0;
hint localize "STR_Session_SyncData";
[getplayeruid player,playerSide,locker_primary,locker_dbhangun,locker_dbattach,locker_clothing,locker_vest,locker_backpack,locker_other,locker_items,locker_virtitems] remoteExecCall ["ton_fnc_locker_terminatelocker",2];
0 call SOCK_fnc_updateRequest;
if(!isNil "locker_killedevh") then {
	player removeEventHandler ["killed", locker_killedevh]
};
locker_loaddelay = true;
sleep 5;
locker_loaddelay = false;