scriptName "fn_locker_weapons";
/*
 *
 *	@File:		fn_locker_weapons.sqf
 *	@Author: 	AllianceApps
 *	@Date:		19.02.2018
 *
 *	You are not allowed to use this script or remove the credits of the script without written permission of the author.
 *  You are not allowed to use this script without a valid license. License terms apply.
 *
 *  Du darfst dieses Script nicht nutzen oder diesen Copyright-Hinweis nicht entfernen, wenn du keine schriftliche Bestätigung des Autors hast.
 *  Du darfst dieses Script nicht ohne gültige Lizenz nutzen. Die Lizenzbestimmungen für Scripts sind zu beachten.
 *  
 */
{
	ctrlShow[_x, true];
} forEach [1000002,1000005,1000006,1000007,1000008,1000009,1000010,1000011,1000012,1000013,
1000014,1000015,1000016,1000017,1000018,1000019,1000020,1000021,1000022,1000023,1000024,1000025,1000026,1000027,
1000028,1000029,1000030,1000031,1000032,1000033,1000034,1000035,1000036];
lbclear 1000006;
_var = 0;
{
	(_display displayCtrl 1000006) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
	lbSetData[1000006, _var, (_x select 1)];
	lbSetPicture[1000006, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
	lbSetValue[1000006,_var,(_x select 0)];
	_var = _var + 1;
} forEach locker_primary;
if(_var isEqualTo 0) then {
	(_display displayCtrl 1000006) lbadd localize "STR_locker_noweaponsfound";
	lbSetData[1000006, 0, "error"];
} else {
	lbSort (_display displayCtrl 1000006);
};
lbclear 1000008;
_var = 0;
{
	(_display displayCtrl 1000008) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
	lbSetData[1000008, _var, (_x select 1)];
	lbSetPicture[1000008, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
	lbSetValue[1000008,_var,(_x select 0)];
	_var = _var + 1;
} forEach locker_dbhangun;
if(_var isEqualTo 0) then {
	(_display displayCtrl 1000008) lbadd localize "STR_locker_nohandgunsfound";
	lbSetData[1000008, 0, "error"];
} else {
	lbSort (_display displayCtrl 1000008);
};
lbclear 1000010;
_var = 0;
{
	(_display displayCtrl 1000010) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
	lbSetData[1000010, _var, (_x select 1)];
	lbSetPicture[1000010, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
	lbSetValue[1000010,_var,(_x select 0)];
	_var = _var + 1;
} forEach locker_dbattach;
if(_var isEqualTo 0) then {
	(_display displayCtrl 1000010) lbadd localize "STR_locker_noattachfound";
	lbSetData[1000010, 0, "error"];
} else {
	lbSort (_display displayCtrl 1000010);
};
_1 = primaryWeapon player;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000011) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
	(_display displayCtrl 1000025) ctrlSetText (((getText(configFile >> "CfgWeapons" >> _1 >> "displayName")) splitString "([") select 0);
} else {
	(_display displayCtrl 1000025) ctrlSetText localize "STR_locker_noweapon";
};
_1 = (primaryWeaponItems player) select 0;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000015) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
};
_1 = (primaryWeaponItems player) select 2;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000020) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
};
_1 = (primaryWeaponItems player) select 3;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000019) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
};
_1 = handgunweapon player;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000014) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
	(_display displayCtrl 1000026) ctrlSetText (((getText(configFile >> "CfgWeapons" >> _1 >> "displayName")) splitString "([") select 0);
} else {
	(_display displayCtrl 1000026) ctrlSetText localize "STR_locker_noweapon";
};
_1 = (handgunitems player) select 0;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000023) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
};
_1 = (handgunitems player) select 2;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000024) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
};