scriptName "fn_locker_putinout";
/*
 *
 *	@File:		fn_locker_putinout.sqf
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
_type = [_this, 0, -1] call bis_fnc_param;
if(_type isEqualTo -1) exitwith {};
sleep (random 0.3);
if(locker_antispam) exitWith {hint localize "STR_locker_wait"};
locker_antispam = true;
disableSerialization;
_display = findDisplay 1000001;
_return = 0;
switch(_type) do {
	case 0: {
		if((_this select 1) isEqualTo 0) then {
			_this call locker_fnc_clothing_in;
		} else {
			_this call locker_fnc_clothing_out;
		};
	};
	case 1: {
		if((_this select 1) isEqualTo 0) then {
			_this call locker_fnc_weapon_in;
		} else {
			_this call locker_fnc_weapon_out;
		};
	};
	case 2: {
		if((_this select 1) isEqualTo 0) then {
			_this call locker_fnc_item_in;
		} else {
			_this call locker_fnc_item_out;
		};
	};
	case 3: {
		if((_this select 1) isEqualTo 0) then {
			_this call locker_fnc_virt_in;
		} else {
			_this call locker_fnc_virt_out;
		};
	};
};
if(_return isEqualTo 0 OR {(_return isEqualType true) && {_return}}) exitWith {locker_antispam = false};
locker_space = locker_space + _return;
ctrlSetText[1000077, format[localize "STR_locker_trunk",locker_space,locker_limit]];
locker_antispam = false;
