scriptName "fn_locker_items";
/*
 *
 *	@File:		fn_locker_items.sqf
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
} forEach [1000003,1000071,1000072,1000073,1000074,1000075,1000076,1000080,1000081];
lbclear 1000072;
lbclear 1000074;

_check = {
	_found = false;
	if(isClass(configFile >> "CfgGlasses" >> _x)) then {
		_arr2 pushBack[1,_x,getText(configFile >> "CfgGlasses" >> _x >> "displayName"),getText(configFile >> "CfgGlasses" >> _x >> "picture")];
		_arr1 pushBack _x;
		_found = true;
	};
	if(isClass(configFile >> "CfgWeapons" >> _x) && !_found) then {
		_arr2 pushBack[1,_x,getText(configFile >> "CfgWeapons" >> _x >> "displayName"),getText(configFile >> "CfgWeapons" >> _x >> "picture")];
		_arr1 pushBack _x;
		_found = true;
	};
	if(isClass(configfile >> "CfgMagazines" >> _x) && !_found) then {
		_arr2 pushBack[1,_x,getText(configFile >> "CfgMagazines" >> _x >> "displayName"),getText(configFile >> "CfgMagazines" >> _x >> "picture")];
		_arr1 pushBack _x;
		//found is not needed #performance
	};
};

if(((uniformitems player) isEqualTo []) && {(vestitems player) isEqualTo []} && {(backpackitems player) isEqualTo []} && {(goggles player) isEqualTo ""} && {(headgear player) isEqualTo ""} && {(binocular player) isEqualTo ""}) then {
	(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
	lbSetData[1000074, 0, "error"];
} else {
	_arr1 = [];
	_arr2 = [];
	{
		_index = _arr1 find _x;
		if(_index > -1) then {
			_sub = _arr2 select _index;
			_sub set[0,(_sub select 0)+1];
			_arr2 set[_index,_sub];
		} else {call _check};
	} forEach ((uniformitems player) + (vestitems player) + (backpackitems player));
	_1 = headgear player;
	if(!(_1 isEqualTo "")) then {
		_index = _arr1 find _1;
		if(_index > -1) then {
			_temp = _arr2 select _index;
			_temp set[0,(_temp select 0)+1];
			_arr2 set[_index,_temp];
		} else {
			_arr2 pushBack[1,_1,getText(configFile >> "CfgWeapons" >> _1 >> "displayName"), getText(configFile >> "CfgWeapons" >> _1 >> "picture")];
			_arr1 pushBack _1;
		};
	};
	_1 = binocular player;
	if(!(_1 isEqualto "")) then {
		_index = _arr1 find _1;
		if(_index > -1) then {
			_temp = _arr2 select _index;
			_temp set[0,(_temp select 0)+1];
			_arr2 set[_index,_temp];
		} else {
			_arr2 pushBack[1,_1,getText(configFile >> "CfgWeapons" >> _1 >> "displayName"), getText(configFile >> "CfgWeapons" >> _1 >> "picture")];
			_arr1 pushBack _1;
		};
	};
	_1 = goggles player;
	if(!(_1 isEqualTo "")) then {
		_index = _arr1 find _1;
		if(_index > -1) then {
			_temp = _arr2 select _index;
			_temp set[0,(_temp select 0)+1];
			_arr2 set[_index,_temp];
		} else {
			_arr2 pushBack[1,_1,getText(configFile >> "CfgGlasses" >> _1 >> "displayName"), getText(configFile >> "CfgGlasses" >> _1 >> "picture")];
			_arr1 pushBack _1;
		};
	};
	_var = 0;
	for '_i' from 0 to ((count _arr1) -1) do {
		_arr = _arr2 select _i;
		(_display displayCtrl 1000074) lbadd format["%1x %2",_arr select 0,_arr select 2];
		lbSetData[1000074, _var, _arr select 1];
		lbSetPicture[1000074, _var, _arr select 3];
		lbSetValue[1000074, _var, _arr select 0];
		_var = _var + 1;
	};
	lbsort 1000074;
};
_var = 0;
if((locker_dbattach isEqualTo []) && {locker_other isEqualTo []} && {locker_items isEqualTo []}) then {
	(_display displayCtrl 1000072) lbadd localize "STR_locker_noitemsfound";
	lbSetData[1000072, 0, "error"];
} else {
	if(!(locker_dbattach isEqualTo [])) then {
		{
			(_display displayCtrl 1000072) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
			lbSetData[1000072, _var, (_x select 1)];
			lbSetPicture[1000072, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
			lbSetValue[1000072, _var, (_x select 0)];
			_var = _var + 1;
		} foreach locker_dbattach;
	};
	if(!(locker_other isEqualTo [])) then {
		{
			_found = false;
			if(isClass(configFile >> "CfgGlasses" >> (_x select 1))) then {
				(_display displayCtrl 1000072) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgGlasses" >> (_x select 1) >> "displayName")];
				lbSetPicture[1000072, _var, (getText(configFile >> "CfgGlasses" >> (_x select 1) >> "picture"))];
				_found = true;
			};
			if(getNumber(configFile >> "CfgWeapons" >> (_x select 1) >> "type") isEqualTo 4096) then {
				(_display displayCtrl 1000072) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
				lbSetPicture[1000072, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
				_found = true;
			};
			if(isClass(configFile >> "CfgWeapons" >> (_x select 1))) then {
				if(getNumber(configfile >> "CfgWeapons" >> (_x select 1) >> "ItemInfo" >> "type") isEqualTo 605) then {
					(_display displayCtrl 1000072) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
					lbSetPicture[1000072, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
					_found = true;
				};
			};
			if(_found) then {
				lbSetValue[1000072, _var, (_x select 0)];
				lbSetData[1000072, _var, (_x select 1)];
				_var = _var + 1;
			};
		} foreach locker_other;
	};
	if(!(locker_items isEqualTo [])) then {
		{
			_found = false;
			if(isclass(configFile >> "CfgMagazines" >> (_x select 1))) then {
				(_display displayCtrl 1000072) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgMagazines" >> (_x select 1) >> "displayName")];
				lbSetPicture[1000072, _var, (getText(configFile >> "CfgMagazines" >> (_x select 1) >> "picture"))];
				_found = true;
			};
			//"firstaidkit","medikit","toolkit";
			if(isClass(configFile >> "CfgWeapons" >> (_x select 1))) then {
				(_display displayCtrl 1000072) lbadd format["%1x %2",(_x select 0),getText(configFile >> "CfgWeapons" >> (_x select 1) >> "displayName")];
				lbSetPicture[1000072, _var, (getText(configFile >> "CfgWeapons" >> (_x select 1) >> "picture"))];
				_found = true;
			};
			if(_found) then {
				lbSetValue[1000072, _var, (_x select 0)];
				lbSetData[1000072, _var, (_x select 1)];
				_var = _var + 1;
			};
		} forEach locker_items;
	};
	lbSort 1000072;
};
(_display displayCtrl 1000071) ctrlSetEventHandler
[
	"ButtonDown",
	"
		[2,1] spawn life_fnc_locker_putinout
	"
];
(_display displayCtrl 1000076) ctrlSetEventHandler
[
	"ButtonDown",
	"
		[2,0] spawn life_fnc_locker_putinout
	"
];