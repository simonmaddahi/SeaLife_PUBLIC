scriptName "fn_locker_changedialog";
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
disableSerialization;
_display = findDisplay 1000001;
{
	ctrlShow[_x, false];
} forEach [1000070,1000002,1000003,1000005,1000006,1000007,1000008,1000009,1000010,1000011,1000012,1000013,
1000014,1000015,1000016,1000017,1000018,1000019,1000020,1000021,1000022,1000023,1000024,1000025,1000026,1000027,
1000028,1000029,1000030,1000031,1000032,1000033,1000034,1000035,1000036,1000037,1000038,1000039,1000040,1000041,
1000041,1000042,1000043,1000044,1000045,1000046,1000047,1000048,1000049,1000050,1000051,1000052,1000053,1000054,
1000055,1000056,1000057,1000058,1000059,1000060,1000061,1000062,1000063,1000064,1000065,1000066,1000067,1000068,
1000069,1000071,1000072,1000073,1000074,1000075,1000076,1000078,1000080,1000081];
if(_this isEqualTo 0) exitWith {
	call life_fnc_locker_gear;
};
if(_this isEqualTo 1) exitWith {
	call life_fnc_locker_weapons;
};
if(_this isEqualTo 2) exitWith {
	call life_fnc_locker_items;
};
if(_this isEqualTo 3) exitWith {
	call life_fnc_locker_virt;
};