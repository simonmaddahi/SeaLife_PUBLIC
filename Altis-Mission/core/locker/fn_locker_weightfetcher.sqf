scriptName "fn_locker_weightfetcher";
/*
 *
 *	@File:		fn_locker_weightfetcher.sqf
 *	@Author: 	AllianceApps
 *	@Date:		25.02.2018
 *
 *	You are not allowed to use this script or remove the credits of the script without written permission of the author.
 *  You are not allowed to use this script without a valid license. License terms apply.
 *
 *  Du darfst dieses Script nicht nutzen oder diesen Copyright-Hinweis nicht entfernen, wenn du keine schriftliche Bestätigung des Autors hast.
 *  Du darfst dieses Script nicht ohne gültige Lizenz nutzen. Die Lizenzbestimmungen für Scripts sind zu beachten.
 *  
 */
_itemclass = [_this, 0, ""] call bis_fnc_param;
_returned = 0;
if(!(_itemclass isEqualTo "")) then {
	call {
		if(isClass(configFile >> "CfgWeapons" >> _itemclass)) exitWith {
			_returned = if(getNumber(configFile >> "CfgWeapons" >> _itemclass >> "type") isEqualTo 4096) then {
				round(getNumber(configfile >> "CfgWeapons" >> _itemclass >> "WeaponSlotsInfo" >> "mass")/10);
			} else {
				if(getNumber(configfile >> "CfgWeapons" >> _itemclass >> "ItemInfo" >> "type") in [101,201,302]) then {
					1
				} else {
					getNumber(configFile >> "CfgWeapons" >> _itemclass >> "value");
				};
			};
		};
		if(isClass(configFile >> "CfgVehicles" >> _itemclass)) exitWith {
			_returned = if(getText(configFile >> "CfgVehicles" >> _itemclass >> "vehicleClass") isEqualTo "Backpacks") then {
				round(getNumber(configFile >> "CfgVehicles" >> _itemclass >> "mass")/20);
			} else {
				getNumber(configFile >> "CfgVehicles" >> _itemclass >> "value");
			};
		};
		if(isClass(configFile >> "CfgGlasses" >> _itemclass)) exitWith {
			_returned = 1;
		};
		if(isClass(configFile >> "CfgMagazines" >> _itemclass)) exitWith {
			_returned = getNumber(configFile >> "CfgMagazines" >> _itemclass >> "value");
		};
		if(isClass(missionConfigFile >> "VirtualItems" >> _itemclass)) exitWith {
			_returned = round(getNumber(missionConfigFile >> "VirtualItems" >> _itemclass >> "weight")/2);
		};
	};
} else {
	_total = 0;
	{
		_amount = _x select 0;
		_cfg = _x select 1;
		_total = _total + (_amount * ([_cfg] call life_fnc_locker_weightfetcher));
	} forEach (locker_primary + locker_dbhangun + locker_dbattach + locker_clothing + locker_vest + locker_backpack + locker_other + locker_items + locker_virtitems);
	_returned = _total;
};
_returned;