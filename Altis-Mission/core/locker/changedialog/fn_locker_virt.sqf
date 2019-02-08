#include "..\..\..\script_macros.hpp"
/*
 *
 *	@File:		fn_locker_virt.sqf
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
scriptName "fn_locker_virt";
{
	ctrlShow[_x, true];
} forEach [1000071,1000072,1000073,1000074,1000075,1000076,1000078,1000080,1000081];
lbclear 1000072;
lbclear 1000074;
_inv_locker = _display displayCtrl 1000072;
_inv_player = _display displayCtrl 1000074;
_temp = 0;
{
	if((ITEM_VALUE(configName _x)) > 0) then {
		_inv_player lbAdd format["%1x %2",(ITEM_VALUE(configName _x)),(localize (getText(_x >> "displayName")))];
		_inv_player lbSetData [_temp,configName _x];
		_icon = M_CONFIG(getText,"VirtualItems",configName _x,"icon");
		_inv_player lbSetPicture [_temp,_icon];
		_inv_player lbsetValue[_temp,(ITEM_VALUE(configName _x))];
		_temp = _temp + 1;
	};
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
if(_temp isEqualTo 0) then {
	_inv_player lbadd localize "STR_locker_novirtsfound";
	_inv_player lbSetData[0, "error"];
} else {
	lbSort _inv_player;
	_temp = 0;
};
{
	_inv_locker lbAdd format["%1x %2",(_x select 0),(localize (getText(missionConfigFile >> "VirtualItems" >> (_x select 1) >> "displayName")))];
	_inv_locker lbSetData [_temp,(_x select 1)];
	_icon = getText(missionConfigFile >> "VirtualItems" >> (_x select 1) >> "icon");
	_inv_locker lbSetPicture [_temp,_icon];
	_inv_locker lbSetValue [_temp,(_x select 0)];
	_temp = _temp + 1;
} forEach locker_virtitems;
if(_temp isEqualTo 0) then {
	_inv_locker lbadd localize "STR_locker_novirtsfound";
	_inv_locker lbSetData[0, "error"];
} else {
	lbSort _inv_locker;
};
(_display displayCtrl 1000071) ctrlSetEventHandler
[
	"ButtonDown",
	"
		[3,1] spawn life_fnc_locker_putinout
	"
];
(_display displayCtrl 1000076) ctrlSetEventHandler
[
	"ButtonDown",
	"
		[3,0] spawn life_fnc_locker_putinout
	"
];