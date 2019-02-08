scriptName "fn_locker_converter";
/*
 *
 *	@File:		fn_locker_converter.sqf
 *	@Author: 	AllianceApps
 *	@Date:		27.02.2018
 *
 *	You are not allowed to use this script or remove the credits of the script without written permission of the author.
 *  You are not allowed to use this script without a valid license. License terms apply.
 *
 *  Du darfst dieses Script nicht nutzen oder diesen Copyright-Hinweis nicht entfernen, wenn du keine schriftliche Bestätigung des Autors hast.
 *  Du darfst dieses Script nicht ohne gültige Lizenz nutzen. Die Lizenzbestimmungen für Scripts sind zu beachten.
 *  
 */
if(((_this select 0) isEqualTo []) && {(_this select 1) isEqualTo []} && {(_this select 2) isEqualTo []} && {(_this select 3) isEqualTo []} && {(_this select 4) isEqualTo []} && {(_this select 5) isEqualTo []} && {(_this select 6) isEqualTo []} && {(_this select 7) isEqualTo []} && {(_this select 8) isEqualTo []}) exitWith {};
_new = false;
for '_i' from 0 to 8 do {
	_index = _this select _i;
	if(!(_index isEqualTo []) && {(_index select 0) isEqualType []}) exitWith {_new = true};
};
if(_new) exitWith {};
_call = {
	_found = false;
	{
		if((_x select 1) isEqualTo _class) exitWith {
			_temp = _arr select _forEachIndex;
			_calc = (_temp select 0)+1;
			_temp set[0,_calc];
			_arr set[_forEachIndex,_temp];
			_found = true;
		};
	} forEach _arr;
	if(!_found) then {
		_arr pushBack [1,_class];
	};
};
for '_i' from 0 to 8 do {
	_arr = [];
	{
		_class = _x;
		call _call;
	} forEach (_this select _i);
	_this set [_i,_arr];
};