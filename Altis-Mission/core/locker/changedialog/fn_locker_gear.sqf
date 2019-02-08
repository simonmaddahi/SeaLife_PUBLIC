scriptName "fn_locker_gear";
/*
 *
 *	@File:		fn_locker_gear.sqf
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
} forEach [1000070,1000037,1000038,1000039,1000040,1000041,1000041,1000042,1000043,1000044,1000045,1000046,1000047,
1000048,1000049,1000050,1000051,1000052,1000053,1000054,1000055,1000056,1000057,1000058,1000059,1000060,1000061,
1000062,1000063,1000064,1000065,1000066,1000067,1000068,1000069];
_1 = uniform player;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000067) ctrlSetText (((getText(configFile >> "CfgWeapons" >> _1 >> "displayName")) splitString "([") select 0);
	(_display displayCtrl 1000052) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
} else {
	(_display displayCtrl 1000067) ctrlSetText localize "STR_locker_nouniform";
	(_display displayCtrl 1000052) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa";
};
_1 = vest player;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000068) ctrlSetText (((getText(configFile >> "CfgWeapons" >> _1 >> "displayName")) splitString "([") select 0);
	(_display displayCtrl 1000053) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
} else {
	(_display displayCtrl 1000068) ctrlSetText localize "STR_locker_novest";
	(_display displayCtrl 1000053) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa";
};
_1 = backpack player;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000069) ctrlSetText (((getText(configFile >> "CfgVehicles" >> _1 >> "displayName")) splitString "([") select 0);
	(_display displayCtrl 1000051) ctrlSetText (getText(configFile >> "CfgVehicles" >> _1 >> "picture"));
} else {
	(_display displayCtrl 1000069) ctrlSetText localize "STR_locker_noback";
	(_display displayCtrl 1000051) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa";
};
_1 = headgear player;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000049) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
} else {
	(_display displayCtrl 1000049) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa";
};
_1 = goggles player;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000050) ctrlSetText (getText(configFile >> "CfgGlasses" >> _1 >> "picture"));
} else {
	(_display displayCtrl 1000050) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa";
};
_1 = binocular player;
if(!(_1 isEqualTo "")) then {
	(_display displayCtrl 1000060) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
} else {
	(_display displayCtrl 1000060) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa";
};
lbclear 1000038;
_var = 0;
{
	(_display displayCtrl 1000038) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
	lbSetData[1000038, _var, (_x select 1)];
	lbSetPicture[1000038, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
	lbSetValue[1000038, _var, (_x select 0)];
	_var = _var + 1;
} forEach locker_clothing;
if(_var isEqualTo 0) then {
	(_display displayCtrl 1000038) lbadd localize "STR_locker_noclothfound";
	lbSetData[1000038, 0, "error"];
} else {
	lbSort 1000038;
};
lbclear 1000040;
_var = 0;
{
	(_display displayCtrl 1000040) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
	lbSetData[1000040, _var, (_x select 1)];
	lbSetPicture[1000040, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
	lbSetValue[1000040, _var, (_x select 0)];
	_var = _var + 1;
} forEach locker_vest;
if(_var isEqualTo 0) then {
	(_display displayCtrl 1000040) lbadd localize "STR_locker_novestfound";
	lbSetData[1000040, 0, "error"];
} else {
	lbSort 1000040;
};
lbclear 1000042;
_var = 0;
{
	(_display displayCtrl 1000042) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgVehicles" >> (_x select 1) >> "displayName")];
	lbSetData[1000042, _var, (_x select 1)];
	lbSetPicture[1000042, _var, (getText(configFile >> "CfgVehicles" >> (_x select 1) >> "picture"))];
	lbSetValue[1000042, _var, (_x select 0)];
	_var = _var + 1;
} forEach locker_backpack;
if(_var isEqualTo 0) then {
	(_display displayCtrl 1000042) lbadd localize "STR_locker_nobackfound";
	lbSetData[1000042, 0, "error"];
} else {
	lbSort 1000040;
};
lbclear 1000047;
_var = 0;
{
	if (isClass(configFile >> "CfgGlasses" >> (_x select 1))) then {
		(_display displayCtrl 1000047) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgGlasses" >> (_x select 1) >> "displayName")];
		lbSetPicture[1000047, _var, (getText(configFile >> "CfgGlasses" >> (_x select 1) >> "picture"))];
	} else {
		(_display displayCtrl 1000047) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
		lbSetPicture[1000047, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
	};
	lbSetData[1000047, _var, (_x select 1)];
	lbSetValue[1000047, _var, (_x select 0)];
	_var = _var + 1;
} forEach locker_other;
if(_var isEqualTo 0) then {
	(_display displayCtrl 1000047) lbadd localize "STR_locker_noitemsfound";
	lbSetData[1000047, 0, "error"];
} else {
	lbSort 1000047;
};