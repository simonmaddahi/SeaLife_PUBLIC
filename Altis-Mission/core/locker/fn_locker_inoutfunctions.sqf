scriptName "fn_locker_inoutfunctions";
/*
 *
 *	@File:		fn_locker_inoutfunctions.sqf
 *	@Author: 	AllianceApps
 *	@Date:		24.02.2018
 *
 *	You are not allowed to use this script or remove the credits of the script without written permission of the author.
 *  You are not allowed to use this script without a valid license. License terms apply.
 *
 *  Du darfst dieses Script nicht nutzen oder diesen Copyright-Hinweis nicht entfernen, wenn du keine schriftliche Bestätigung des Autors hast.
 *  Du darfst dieses Script nicht ohne gültige Lizenz nutzen. Die Lizenzbestimmungen für Scripts sind zu beachten.
 *  
 */
locker_fnc_additem = compileFinal '
	_var = missionnamespace getVariable [_this select 0,[]];
	_class = _this select 1;
	_vals = [_this, 2, 1] call bis_fnc_param;
	_found = false;
	{
		if((_x select 1) isEqualTo _class) exitWith {
			_temp = _var select _forEachIndex;
			_calc = (_temp select 0)+_vals;
			_temp set[0,_calc];
			_var set[_forEachIndex,_temp];
			_found = true;
		};
	} forEach _var;
	if(!_found) then {
		_var pushBack [_vals,_class];
	};
	missionnamespace setvariable [_this select 0, _var];
	_found
';
locker_fnc_removeitem = compileFinal '
	_var = missionnamespace getVariable [_this select 0,[]];
	_class = _this select 1;
	_vals = [_this, 2, 1] call bis_fnc_param;
	_found = false;
	{
		if((_x select 1) isEqualTo _class) exitWith {
			_temp = _var select _forEachIndex;
			_calc = (_temp select 0)-_vals;
			if(_calc > 0) then {
				_temp set[0,_calc];
				_var set[_forEachIndex,_temp];
			} else {
				_var deleteAt _forEachIndex;
			};
			_found = true;
		};
	} forEach _var;
	missionnamespace setvariable [_this select 0, _var];
	_found
';
locker_fnc_clothing_in = compileFinal '
	if((_this select 1) isEqualTo 0) exitWith {
		if(locker_space >= locker_limit) exitWith {hint localize "STR_locker_full"};
		if((_this select 2) isEqualTo 1) exitWith {
			_1 = uniform player;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_result = true;
				if(!((uniformitems player) isEqualTo [])) then {
					_result = [localize "STR_locker_uniformitems", localize "STR_locker_upgradetitle", localize "STR_Global_Yes", localize "STR_Global_No"] call BIS_fnc_guiMessage;
				};
				if(!_result) exitWith {};
				_found = -1;
				_2 = (lbSize 1000038) -1;
				if(lbdata[1000038,0] isEqualTo "error") then {
					lbclear 1000038;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000038,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				removeUniform player;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000038,_found]+1;
					lbDelete [1000038,_found];
				};
				(_display displayCtrl 1000038) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000038, _2, _1];
				lbSetPicture[1000038, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000038,_2,_val];
				["locker_clothing",_1] call locker_fnc_addItem;
				lbSort 1000038;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000067) ctrlSetText localize "STR_locker_nouniform";
				(_display displayCtrl 1000052) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa";
			} else {
				hint localize "STR_locker_nouniformsen";
			};
		};
		if((_this select 2) isEqualTo 2) exitWith {
			_1 = vest player;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_result = true;
				if(!(vestitems player isEqualTo [])) then {
					_result = [localize "STR_locker_vestitems", localize "STR_locker_upgradetitle", localize "STR_Global_Yes", localize "STR_Global_No"] call BIS_fnc_guiMessage;
				};
				if(!_result) exitWith {};
				_2 = (lbSize 1000040) -1;
				_found = -1;
				if(lbdata[1000040,0] isEqualTo "error") then {
					lbclear 1000040;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000040,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				removeVest player;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000040,_found]+1;
					lbDelete [1000040,_found];
				};
				(_display displayCtrl 1000040) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000040, _2, _1];
				lbSetPicture[1000040, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000040,_2,_val];
				["locker_vest",_1] call locker_fnc_addItem;
				lbSort 1000040;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000068) ctrlSetText localize "STR_locker_novest";
				(_display displayCtrl 1000053) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa";
			} else {
				hint localize "STR_locker_novestsen";
			};
		};
		if((_this select 2) isEqualTo 3) exitWith {
			_1 = backpack player;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_result = true;
				if(!(backpackitems player isEqualTo [])) then {
					_result = [localize "STR_locker_backitems", localize "STR_locker_upgradetitle", localize "STR_Global_Yes", localize "STR_Global_No"] call BIS_fnc_guiMessage;
				};
				if(!_result) exitWith {};
				_2 = (lbSize 1000042) -1;
				_found = -1;
				if(lbdata[1000042,0] isEqualTo "error") then {
					lbclear 1000042;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000042,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				removeBackpack player;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000042,_found]+1;
					lbDelete [1000042,_found];
				};
				(_display displayCtrl 1000042) lbadd format["%1x %2",_val,getText(configFile >> "CfgVehicles" >> _1 >> "displayName")];
				lbSetData[1000042, _2, _1];
				lbSetPicture[1000042, _2, (getText(configFile >> "CfgVehicles" >> _1 >> "picture"))];
				lbSetValue[1000042,_2,_val];
				["locker_backpack",_1] call locker_fnc_addItem;
				lbSort 1000042;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000069) ctrlSetText localize "STR_locker_noback";
				(_display displayCtrl 1000051) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa";
			} else {
				hint localize "STR_locker_nobacksen";
			};
		};
		if((_this select 2) isEqualTo 4) exitWith {
			_1 = headgear player;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_found = -1;
				_2 = (lbSize 1000047) -1;
				if(lbdata[1000047,0] isEqualTo "error") then {
					lbclear 1000047;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000047,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				removeHeadgear player;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000047,_found]+1;
					lbDelete [1000047,_found];
				};
				(_display displayCtrl 1000047) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000047, _2, _1];
				lbSetPicture[1000047, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000047,_2,_val];
				["locker_other",_1] call locker_fnc_addItem;
				lbSort 1000047;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000049) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa";
			} else {
				hint localize "STR_locker_nohat";
			};
		};
		if((_this select 2) isEqualTo 5) exitWith {
			_1 = goggles player;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_found = -1;
				_2 = (lbSize 1000047) -1;
				if(lbdata[1000047,0] isEqualTo "error") then {
					lbclear 1000047;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000047,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				removeGoggles player;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000047,_found]+1;
					lbDelete [1000047,_found];
				};
				(_display displayCtrl 1000047) lbadd format["%1x %2",_val,getText(configFile >> "CfgGlasses" >> _1 >> "displayName")];
				lbSetData[1000047, _2, _1];
				lbSetPicture[1000047, _2, (getText(configFile >> "CfgGlasses" >> _1 >> "picture"))];
				lbSetValue[1000047,_2,_val];
				["locker_other",_1] call locker_fnc_addItem;
				lbSort 1000047;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000050) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa";
			} else {
				hint localize "STR_locker_nogoggles";
			};
		};
		if((_this select 2) isEqualTo 6) exitWith {
			_1 = Binocular player;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_found = -1;
				_2 = (lbSize 1000047) -1;
				if(lbdata[1000047,0] isEqualTo "error") then {
					lbclear 1000047;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000047,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				player removeWeapon _1;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000047,_found]+1;
					lbDelete [1000047,_found];
				};
				(_display displayCtrl 1000047) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000047, _2, _1];
				lbSetPicture[1000047, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000047,_2,_val];
				["locker_other",_1] call locker_fnc_addItem;
				lbSort 1000047;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000060) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_Binocular_gs.paa";
			} else {
				hint localize "STR_locker_nobino";
			};
		};
	};
';
locker_fnc_clothing_out = compileFinal '
	if(locker_space <= 0) exitWith {hint "No items stored. #Bug prevention"};
	if((_this select 2) isEqualTo 1) exitWith {
		_cur = lbCurSel 1000038;
		if(!(_cur isEqualTo -1)) then {
			if(lbdata[1000038, _cur] isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
			if((uniform player) isEqualTo "") then {
				player forceadduniform (lbData[1000038, _cur]);
				{
					player removeItem _x;
				} foreach (uniformItems player);
				_1 = (lbData[1000038, _cur]);
				(_display displayCtrl 1000067) ctrlSetText (((getText(configFile >> "CfgWeapons" >> _1 >> "displayName")) splitString "([") select 0);
				(_display displayCtrl 1000052) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
				_val = lbValue[1000038,_cur];
				if(_val > 1) then {
					_dis = lbText[1000038,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-1];
					lbAdd[1000038,_dis joinString "x"];
					_2 = (lbSize 1000038)-1;
					lbSetData[1000038,_2,_1];
					lbSetPicture[1000038,_2,lbPicture[1000038,_cur]];
					lbSetValue[1000038,_2,_val-1];
				};
				lbDelete[1000038, _cur];
				if((lbSize 1000038) isEqualTo 0) then {
					(_display displayCtrl 1000038) lbadd localize "STR_locker_noclothfound";
					lbSetData[1000038, 0, "error"];
				};
				["locker_clothing",_1] call locker_fnc_removeItem;
				lbSort 1000038;
				_return = -([_1] call life_fnc_locker_weightfetcher);
			} else {
				hint localize "STR_locker_alruniform";
			};
		} else {
			hint localize "STR_locker_not_selected";
		};
	};
	if((_this select 2) isEqualTo 2) exitWith {
		_cur = lbCurSel 1000040;
		if(!(_cur isEqualTo -1)) then {
			if(lbdata[1000040, _cur] isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
			if((vest player) isEqualTo "") then {
				player addvest (lbData[1000040, _cur]);
				{
					player removeItem _x;
				} foreach (vestitems player);
				_1 = lbData[1000040, _cur];
				(_display displayCtrl 1000068) ctrlSetText (((getText(configFile >> "CfgWeapons" >> _1 >> "displayName")) splitString "([") select 0);
				(_display displayCtrl 1000053) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
				_val = lbValue[1000040,_cur];
				if(_val > 1) then {
					_dis = lbText[1000040,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-1];
					lbAdd[1000040,_dis joinString "x"];
					_2 = (lbSize 1000040)-1;
					lbSetData[1000040,_2,_1];
					lbSetPicture[1000040,_2,lbPicture[1000040,_cur]];
					lbSetValue[1000040,_2,_val-1];
				};
				lbDelete[1000040, _cur];
				if((lbSize 1000040) isEqualTo 0) then {
					(_display displayCtrl 1000040) lbadd localize "STR_locker_novestfound";
					lbSetData[1000040, 0, "error"];
				};
				["locker_vest",_1] call locker_fnc_removeItem;
				lbSort 1000040;
				_return = -([_1] call life_fnc_locker_weightfetcher);
			} else {
				hint localize "STR_locker_alrvest";
			};
		} else {
			hint localize "STR_locker_not_selected";
		};
	};
	if((_this select 2) isEqualTo 3) exitWith {
		_cur = lbCurSel 1000042;
		if(!(_cur isEqualTo -1)) then {
			if(lbdata[1000042, _cur] isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
			if((backpack player) isEqualTo "") then {
				player addbackpack (lbData[1000042, _cur]);
				{
					player removeItem _x;
				} foreach (backpackitems player);
				_1 = lbData[1000042, _cur];
				(_display displayCtrl 1000069) ctrlSetText (((getText(configFile >> "CfgVehicles" >> _1 >> "displayName")) splitString "([") select 0);
				(_display displayCtrl 1000051) ctrlSetText (getText(configFile >> "CfgVehicles" >> _1 >> "picture"));
				_val = lbValue[1000042,_cur];
				if(_val > 1) then {
					_dis = lbText[1000042,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-1];
					lbAdd[1000042,_dis joinString "x"];
					_2 = (lbSize 1000042)-1;
					lbSetData[1000042,_2,_1];
					lbSetPicture[1000042,_2,lbPicture[1000042,_cur]];
					lbSetValue[1000042,_2,_val-1];
				};
				lbDelete[1000042, _cur];
				if((lbSize 1000042) isEqualTo 0) then {
					(_display displayCtrl 1000042) lbadd localize "STR_locker_nobackfound";
					lbSetData[1000042, 0, "error"];
				};
				["locker_backpack",_1] call locker_fnc_removeItem;
				lbSort 1000042;
				_return = -([_1] call life_fnc_locker_weightfetcher);
			} else {
				hint localize "STR_locker_alrback";
			};
		} else {
			hint localize "STR_locker_not_selected";
		};
	};
	if((_this select 2) isEqualTo 4) exitWith {
		_cur = lbCurSel 1000047;
		if(!(_cur isEqualTo -1)) then {
			if(lbdata[1000047, _cur] isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
			_1 = lbData[1000047, _cur];
			_done = false;
			if(isClass(configFile >> "CfgGlasses" >> _1)) then {
				_done = true;
				if((goggles player) isEqualTo "") then {
					player addgoggles _1;
					(_display displayCtrl 1000050) ctrlSetText (getText(configFile >> "CfgGlasses" >> _1 >> "picture"));
					_val = lbValue[1000047,_cur];
					if(_val > 1) then {
						_dis = lbText[1000047,_cur];
						_dis = _dis splitString "x";
						_dis set[0,_val-1];
						lbAdd[1000047,_dis joinString "x"];
						_2 = (lbSize 1000047)-1;
						lbSetData[1000047,_2,_1];
						lbSetPicture[1000047,_2,lbPicture[1000047,_cur]];
						lbSetValue[1000047,_2,_val-1];
					};
					lbDelete[1000047, _cur];
					if((lbSize 1000047) isEqualTo 0) then {
						(_display displayCtrl 1000047) lbadd localize "STR_locker_noitemsfound";
						lbSetData[1000047, 0, "error"];
					};
					["locker_other",_1] call locker_fnc_removeItem;
					lbSort 1000047;
					_return = -([_1] call life_fnc_locker_weightfetcher);
				} else {
					hint localize "STR_locker_alrgoggle";
				};
			};
			if((getNumber(configFile >> "CfgWeapons" >> _1 >> "type") isEqualTo 4096) && !_done) then {
				_done = true;
				if((Binocular player) isEqualTo "") then {
					player addWeapon _1;
					(_display displayCtrl 1000060) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
					_val = lbValue[1000047,_cur];
					if(_val > 1) then {
						_dis = lbText[1000047,_cur];
						_dis = _dis splitString "x";
						_dis set[0,_val-1];
						lbAdd[1000047,_dis joinString "x"];
						_2 = (lbSize 1000047)-1;
						lbSetData[1000047,_2,_1];
						lbSetPicture[1000047,_2,lbPicture[1000047,_cur]];
						lbSetValue[1000047,_2,_val-1];
					};
					lbDelete[1000047, _cur];
					if((lbSize 1000047) isEqualTo 0) then {
						(_display displayCtrl 1000047) lbadd localize "STR_locker_noitemsfound";
						lbSetData[1000047, 0, "error"];
					};
					["locker_other",_1] call locker_fnc_removeItem;
					lbSort 1000047;
					_return = -([_1] call life_fnc_locker_weightfetcher);
				} else {
					hint localize "STR_locker_alrgoggle";
				};
			};
			if(getNumber(configfile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") isEqualTo 605 && !_done) then {
				_done = true;
				if((headgear player) isEqualTo "") then {
					player addheadgear _1;
					(_display displayCtrl 1000049) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
					_val = lbValue[1000047,_cur];
					if(_val > 1) then {
						_dis = lbText[1000047,_cur];
						_dis = _dis splitString "x";
						_dis set[0,_val-1];
						lbAdd[1000047,_dis joinString "x"];
						_2 = (lbSize 1000047)-1;
						lbSetData[1000047,_2,_1];
						lbSetPicture[1000047,_2,lbPicture[1000047,_cur]];
						lbSetValue[1000047,_2,_val-1];
					};
					lbDelete[1000047, _cur];
					if((lbSize 1000047) isEqualTo 0) then {
						(_display displayCtrl 1000047) lbadd localize "STR_locker_noitemsfound";
						lbSetData[1000047, 0, "error"];
					};
					["locker_other",_1] call locker_fnc_removeItem;
					lbSort 1000047;
					_return = -([_1] call life_fnc_locker_weightfetcher);
				} else {
					hint localize "STR_locker_alrhat";
				};
			};
		} else {
			hint localize "STR_locker_not_selected";
		};
	};
';
locker_fnc_weapon_in = compileFinal '
	if(locker_space >= locker_limit) exitWith {hint localize "STR_locker_full"};
	if((_this select 2) isEqualTo 1) exitWith {
		if((_this select 3) isEqualTo 0) exitWith {
			_1 = primaryWeapon player;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_result = true;
				if(!(((primaryWeaponItems player) select 0) isEqualTo "") OR {!(((primaryWeaponItems player) select 2) isEqualTo "")} OR {!(((primaryWeaponItems player) select 3) isEqualTo "")}) then {
					_result = [localize "STR_locker_weaponitems", localize "STR_locker_upgradetitle", localize "STR_Global_Yes", localize "STR_Global_No"] call BIS_fnc_guiMessage;
				};
				if(!_result) exitWith {};
				_2 = (lbSize 1000006) -1;
				_found = -1;
				if(lbdata[1000006,0] isEqualTo "error") then {
					lbclear 1000006;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000006,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				player removeWeapon _1;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000006,_found]+1;
					lbDelete [1000006,_found];
				};
				(_display displayCtrl 1000006) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000006, _2, _1];
				lbSetPicture[1000006, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000006,_2,_val];
				["locker_primary",_1] call locker_fnc_addItem;
				lbSort 1000006;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000011) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa";
				(_display displayCtrl 1000025) ctrlSetText "Keine Waffe";
				(_display displayCtrl 1000020) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
				(_display displayCtrl 1000019) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
				(_display displayCtrl 1000015) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			} else {
				hint localize "STR_locker_noweaponsen";
			};
		};
		if((_this select 3) isEqualTo 1) exitWith {
			_1 = (primaryWeaponItems player) select 0;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_found = -1;
				_2 = (lbSize 1000010) -1;
				if(lbdata[1000010,0] isEqualTo "error") then {
					lbclear 1000010;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000010,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				player removePrimaryWeaponItem _1;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000010,_found]+1;
					lbDelete [1000010,_found];
				};
				(_display displayCtrl 1000010) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000010, _2, _1];
				lbSetPicture[1000010, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000010,_2,_val];
				["locker_dbattach",_1] call locker_fnc_addItem;
				lbSort 1000010;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000015) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			} else {
				hint localize "STR_locker_noattachsen";
			};
		};
		if((_this select 3) isEqualTo 2) exitWith {
			_1 = (primaryWeaponItems player) select 2;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_found = -1;
				_2 = (lbSize 1000010) -1;
				if(lbdata[1000010,0] isEqualTo "error") then {
					lbclear 1000010;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000010,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				player removePrimaryWeaponItem _1;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000010,_found]+1;
					lbDelete [1000010,_found];
				};
				(_display displayCtrl 1000010) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000010, _2, _1];
				lbSetPicture[1000010, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000010,_2,_val];
				["locker_dbattach",_1] call locker_fnc_addItem;
				lbSort 1000010;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000020) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			} else {
				hint localize "STR_locker_noattachsen";
			};
		};
		if((_this select 3) isEqualTo 3) exitWith {
			_1 = (primaryWeaponItems player) select 3;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_found = -1;
				_2 = (lbSize 1000010) -1;
				if(lbdata[1000010,0] isEqualTo "error") then {
					lbclear 1000010;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000010,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				player removePrimaryWeaponItem _1;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000010,_found]+1;
					lbDelete [1000010,_found];
				};
				(_display displayCtrl 1000010) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000010, _2, _1];
				lbSetPicture[1000010, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000010,_2,_val];
				["locker_dbattach",_1] call locker_fnc_addItem;
				lbSort 1000010;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000019) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
			} else {
				hint localize "STR_locker_noattachsen";
			};
		};
	};
	if((_this select 2) isEqualTo 2) exitWith {
		if((_this select 3) isEqualTo 0) exitWith {
			_1 = handgunweapon player;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_result = true;
				if(!(((handgunItems player) select 0) isEqualTo "") OR {!(((handgunItems player) select 2) isEqualTo "")} OR {!(((handgunItems player) select 3) isEqualTo "")}) then {
					_result = [localize "STR_locker_weaponitems", localize "STR_locker_upgradetitle", localize "STR_Global_Yes", localize "STR_Global_No"] call BIS_fnc_guiMessage;
				};
				if(!_result) exitWith {};
				_found = -1;
				_2 = (lbSize 1000008) -1;
				if(lbdata[1000008,0] isEqualTo "error") then {
					lbclear 1000008;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000008,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				player removeWeapon _1;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000008,_found]+1;
					lbDelete [1000008,_found];
				};
				(_display displayCtrl 1000008) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000008, _2, _1];
				lbSetPicture[1000008, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000008,_2,_val];
				["locker_dbhangun",_1] call locker_fnc_addItem;
				lbSort 1000008;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000014) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa";
				(_display displayCtrl 1000026) ctrlSetText "Keine Waffe";
				(_display displayCtrl 1000024) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
				(_display displayCtrl 1000023) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			} else {
				hint localize "STR_locker_nohandgunsen";
			};
		};
		if((_this select 3) isEqualTo 1) exitWith {
			_1 = (handgunitems player) select 0;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_found = -1;
				_2 = (lbSize 1000010) -1;
				if(lbdata[1000010,0] isEqualTo "error") then {
					lbclear 1000010;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000010,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				player removehandgunitem _1;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000010,_found]+1;
					lbDelete [1000010,_found];
				};
				(_display displayCtrl 1000010) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000010, _2, _1];
				lbSetPicture[1000010, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000010,_2,_val];
				["locker_dbattach",_1] call locker_fnc_addItem;
				lbSort 1000010;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000023) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
			} else {
				hint localize "STR_locker_noattachsen";
			};
		};
		if((_this select 3) isEqualTo 2) exitWith {
			_1 = (handgunitems player) select 2;
			if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
			if(!(_1 isEqualTo "")) then {
				if((locker_space+([_1] call life_fnc_locker_weightfetcher)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
				_found = -1;
				_2 = (lbSize 1000010) -1;
				if(lbdata[1000010,0] isEqualTo "error") then {
					lbclear 1000010;
					_2 = -1;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000010,_i] isEqualto _1) exitWith {_found = _i};
					};
				};
				player removehandgunitem _1;
				_val = 1;
				if(_found isEqualTo -1) then {
					_2 = _2 + 1;
				} else {
					_val = lbValue[1000010,_found]+1;
					lbDelete [1000010,_found];
				};
				(_display displayCtrl 1000010) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000010, _2, _1];
				lbSetPicture[1000010, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000010,_2,_val];
				["locker_dbattach",_1] call locker_fnc_addItem;
				lbSort 1000010;
				_return = [_1] call life_fnc_locker_weightfetcher;
				(_display displayCtrl 1000024) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
			} else {
				hint localize "STR_locker_noattachsen";
			};
		};
	};
';
locker_fnc_weapon_out = compileFinal '
	if(locker_space <= 0) exitWith {hint "No items stored. #Bug prevention"};
	if((_this select 2) isEqualTo 1) exitWith {
		_cur = lbcursel 1000006;
		if(!(_cur isEqualTo -1)) then {
			if(lbData[1000006, _cur] isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
			_1 = primaryWeapon player;
			if(_1 isEqualTo "") then {
				player addWeapon (lbData[1000006, _cur]);
				_1 = primaryWeapon player;
				removeAllPrimaryWeaponItems player;
				_val = lbValue[1000006,_cur];
				if(_val > 1) then {
					_dis = lbText[1000006,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-1];
					lbAdd[1000006,_dis joinString "x"];
					_2 = (lbSize 1000006)-1;
					lbSetData[1000006,_2,_1];
					lbSetPicture[1000006,_2,lbPicture[1000006,_cur]];
					lbSetValue[1000006,_2,_val-1];
				};
				lbDelete[1000006, _cur];
				if((lbSize 1000006) isEqualTo 0) then {
					(_display displayCtrl 1000006) lbadd localize "STR_locker_noweaponsfound";
					lbSetData[1000006, 0, "error"];
				};
				(_display displayCtrl 1000011) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
				(_display displayCtrl 1000025) ctrlSetText (((getText(configFile >> "CfgWeapons" >> _1 >> "displayName")) splitString "([") select 0);
				(_display displayCtrl 1000020) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
				(_display displayCtrl 1000019) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa";
				(_display displayCtrl 1000015) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
				["locker_primary",_1] call locker_fnc_removeItem;
				lbSort 1000006;
				_return = -([_1] call life_fnc_locker_weightfetcher);
			} else {
				hint localize "STR_locker_alrweapon";
			};
		} else {
			hint localize "STR_locker_not_selected";
		};
	};
	if((_this select 2) isEqualTo 2) exitWith {
		_cur = lbCurSel 1000008;
		if(!(_cur isEqualTo -1)) then {
			if(lbData[1000008, _cur] isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
			_1 = handgunweapon player;
			if(_1 isEqualTo "") then {
				player addWeapon (lbData[1000008, _cur]);
				_1 = handgunweapon player;
				removeAllhandgunItems player;
				_val = lbValue[1000008,_cur];
				if(_val > 1) then {
					_dis = lbText[1000008,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-1];
					lbAdd[1000008,_dis joinString "x"];
					_2 = (lbSize 1000008)-1;
					lbSetData[1000008,_2,_1];
					lbSetPicture[1000008,_2,lbPicture[1000008,_cur]];
					lbSetValue[1000008,_2,_val-1];
				};
				lbDelete[1000008, _cur];
				if((lbSize 1000008) isEqualTo 0) then {
					(_display displayCtrl 1000008) lbadd localize "STR_locker_nohandgunsfound";
					lbSetData[1000008, 0, "error"];
				};
				(_display displayCtrl 1000014) ctrlSetText (getText(configFile >> "CfgWeapons" >> _1 >> "picture"));
				(_display displayCtrl 1000026) ctrlSetText (((getText(configFile >> "CfgWeapons" >> _1 >> "displayName")) splitString "([") select 0);
				(_display displayCtrl 1000024) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa";
				(_display displayCtrl 1000023) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa";
				["locker_dbhangun",_1] call locker_fnc_removeItem;
				lbSort 1000008;
				_return = -([_1] call life_fnc_locker_weightfetcher);
			} else {
				hint localize "STR_locker_alrhandgun";
			};
		} else {
			hint localize "STR_locker_not_selected";
		};
	};
	if((_this select 2) isEqualTo 3) exitWith {
		_cur = lbCurSel 1000010;
		if(!(_cur isEqualTo -1)) then {
			_1 = lbData[1000010, _cur];
			if(_1 isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
			if(!((weapons player) isEqualTo [])) then {
				_2 = (getNumber(configfile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type"));
				_5 = primaryweapon player;
				_6 = handgunweapon player;
				if(_2 isEqualTo 101) exitWith {
					_done = false;
					if((_1 in getArray(configfile >> "CfgWeapons" >> _5 >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")) && {(_1 in getArray(configfile >> "CfgWeapons" >> _6 >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems"))} && {((primaryWeaponItems player) select 0) isEqualTo ""} && {((handgunitems player) select 0) isEqualTo ""}) then {
						_result = [localize "STR_locker_selmuzzle", localize "STR_locker_upgradetitle", localize "STR_locker_primary", localize "STR_locker_handgun"] call BIS_fnc_guiMessage;
						if(_result) then {
							if((((primaryWeaponItems player) select 0) isEqualTo "") && !_done) then {
								player addprimaryweaponitem _1;
								(_display displayCtrl 1000015) ctrlSetText getText(configFile >> "CfgWeapons" >> _1 >> "picture");
								["locker_dbattach",_1] call locker_fnc_removeItem;
								_return = -([_1] call life_fnc_locker_weightfetcher);
								_val = lbValue[1000010,_cur];
								if(_val > 1) then {
									_dis = lbText[1000010,_cur];
									_dis = _dis splitString "x";
									_dis set[0,_val-1];
									lbAdd[1000010,_dis joinString "x"];
									_2 = (lbSize 1000010)-1;
									lbSetData[1000010,_2,_1];
									lbSetPicture[1000010,_2,lbPicture[1000010,_cur]];
									lbSetValue[1000010,_2,_val-1];
								};
								lbDelete[1000010, _cur];
								lbSort 1000010;
								_done = true;
								if((lbSize 1000010) isEqualTo 0) then {
									(_display displayCtrl 1000010) lbadd localize "STR_locker_noattachfound";
									lbSetData[1000010, 0, "error"];
								};
							};
						} else {
							if((((handgunitems player) select 0) isEqualTo "") && !_done) then {
								player addhandgunitem _1;
								(_display displayCtrl 1000023) ctrlSetText getText(configFile >> "CfgWeapons" >> _1 >> "picture");
								["locker_dbattach",_1] call locker_fnc_removeItem;
								_return = -([_1] call life_fnc_locker_weightfetcher);
								_val = lbValue[1000010,_cur];
								if(_val > 1) then {
									_dis = lbText[1000010,_cur];
									_dis = _dis splitString "x";
									_dis set[0,_val-1];
									lbAdd[1000010,_dis joinString "x"];
									_2 = (lbSize 1000010)-1;
									lbSetData[1000010,_2,_1];
									lbSetPicture[1000010,_2,lbPicture[1000010,_cur]];
									lbSetValue[1000010,_2,_val-1];
								};
								lbDelete[1000010, _cur];
								lbSort 1000010;
								_done = true;
								if((lbSize 1000010) isEqualTo 0) then {
									(_display displayCtrl 1000010) lbadd localize "STR_locker_noattachfound";
									lbSetData[1000010, 0, "error"];
								};
							};
						};
					};
					if((((primaryWeaponItems player) select 0) isEqualTo "") && {_1 in getArray(configfile >> "CfgWeapons" >> _5 >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")} && !_done) then {
						player addprimaryweaponitem _1;
						(_display displayCtrl 1000015) ctrlSetText getText(configFile >> "CfgWeapons" >> _1 >> "picture");
						["locker_dbattach",_1] call locker_fnc_removeItem;
						_return = -([_1] call life_fnc_locker_weightfetcher);
						_val = lbValue[1000010,_cur];
						if(_val > 1) then {
							_dis = lbText[1000010,_cur];
							_dis = _dis splitString "x";
							_dis set[0,_val-1];
							lbAdd[1000010,_dis joinString "x"];
							_2 = (lbSize 1000010)-1;
							lbSetData[1000010,_2,_1];
							lbSetPicture[1000010,_2,lbPicture[1000010,_cur]];
							lbSetValue[1000010,_2,_val-1];
						};
						lbDelete[1000010, _cur];
						lbSort 1000010;
						_done = true;
						if((lbSize 1000010) isEqualTo 0) then {
							(_display displayCtrl 1000010) lbadd localize "STR_locker_noattachfound";
							lbSetData[1000010, 0, "error"];
						};
					};
					if((((handgunitems player) select 0) isEqualTo "") && {_1 in getArray(configfile >> "CfgWeapons" >> _6 >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")} && !_done) then {
						player addhandgunitem _1;
						(_display displayCtrl 1000023) ctrlSetText getText(configFile >> "CfgWeapons" >> _1 >> "picture");
						["locker_dbattach",_1] call locker_fnc_removeItem;
						_return = -([_1] call life_fnc_locker_weightfetcher);
						_val = lbValue[1000010,_cur];
						if(_val > 1) then {
							_dis = lbText[1000010,_cur];
							_dis = _dis splitString "x";
							_dis set[0,_val-1];
							lbAdd[1000010,_dis joinString "x"];
							_2 = (lbSize 1000010)-1;
							lbSetData[1000010,_2,_1];
							lbSetPicture[1000010,_2,lbPicture[1000010,_cur]];
							lbSetValue[1000010,_2,_val-1];
						};
						lbDelete[1000010, _cur];
						lbSort 1000010;
						_done = true;
						if((lbSize 1000010) isEqualTo 0) then {
							(_display displayCtrl 1000010) lbadd localize "STR_locker_noattachfound";
							lbSetData[1000010, 0, "error"];
						};
					};
					if(!_done && !(_1 in ["muzzle_snds_acp","muzzle_snds_L"]) && {((primaryWeaponItems player) select 0) isEqualTo ""} && {_1 in getArray(configfile >> "CfgWeapons" >> _5 >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems")}) then {
						hint localize "STR_locker_already_taken";
						_done = true;
					};
					if(!_done) then {
						hint localize "STR_locker_doesntfit";
					};
				};
				if(_2 isEqualTo 201) exitWith {
					if(_1 in ["optic_Yorris","optic_MRD"]) then {
						if(_1 in getArray(configfile >> "CfgWeapons" >> _6 >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems")) then {
							if(((handgunItems player) select 2) isEqualTo "") then {
								player addhandgunitem _1;
								(_display displayCtrl 1000024) ctrlSetText getText(configFile >> "CfgWeapons" >> _1 >> "picture");
								["locker_dbattach",_1] call locker_fnc_removeItem;
								_return = -([_1] call life_fnc_locker_weightfetcher);
								_val = lbValue[1000010,_cur];
								if(_val > 1) then {
									_dis = lbText[1000010,_cur];
									_dis = _dis splitString "x";
									_dis set[0,_val-1];
									lbAdd[1000010,_dis joinString "x"];
									_2 = (lbSize 1000010)-1;
									lbSetData[1000010,_2,_1];
									lbSetPicture[1000010,_2,lbPicture[1000010,_cur]];
									lbSetValue[1000010,_2,_val-1];
								};
								lbDelete[1000010, _cur];
								lbSort 1000010;
								if((lbSize 1000010) isEqualTo 0) then {
									(_display displayCtrl 1000010) lbadd localize "STR_locker_noattachfound";
									lbSetData[1000010, 0, "error"];
								};
							} else {
								hint localize "STR_locker_already_taken";
							};
						} else {
							hint localize "STR_locker_doesntfit";
						};
					} else {
						if(_1 in getArray(configfile >> "CfgWeapons" >> _5 >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems")) then {
							if(((primaryweaponitems player) select 2) isEqualTo "") then {
								player addprimaryweaponitem _1;
								(_display displayCtrl 1000020) ctrlSetText getText(configFile >> "CfgWeapons" >> _1 >> "picture");
								["locker_dbattach",_1] call locker_fnc_removeItem;
								_return = -([_1] call life_fnc_locker_weightfetcher);
								_val = lbValue[1000010,_cur];
								if(_val > 1) then {
									_dis = lbText[1000010,_cur];
									_dis = _dis splitString "x";
									_dis set[0,_val-1];
									lbAdd[1000010,_dis joinString "x"];
									_2 = (lbSize 1000010)-1;
									lbSetData[1000010,_2,_1];
									lbSetPicture[1000010,_2,lbPicture[1000010,_cur]];
									lbSetValue[1000010,_2,_val-1];
								};
								lbDelete[1000010, _cur];
								lbSort 1000010;
								if((lbSize 1000010) isEqualTo 0) then {
									(_display displayCtrl 1000010) lbadd localize "STR_locker_noattachfound";
									lbSetData[1000010, 0, "error"];
								};
							} else {
								hint localize "STR_locker_already_taken";
							};
						} else {
							hint localize "STR_locker_doesntfit";
						};
					};
				};
				if(_2 isEqualTo 302) exitWith {
					if(_1 in getArray(configfile >> "CfgWeapons" >> _5 >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems")) then {
						if(((primaryWeaponItems player) select 3) isEqualTo "") then {
							player addprimaryweaponitem _1;
							(_display displayCtrl 1000019) ctrlSetText getText(configFile >> "CfgWeapons" >> _1 >> "picture");
							["locker_dbattach",_1] call locker_fnc_removeItem;
							_return = -([_1] call life_fnc_locker_weightfetcher);
							_val = lbValue[1000010,_cur];
							if(_val > 1) then {
								_dis = lbText[1000010,_cur];
								_dis = _dis splitString "x";
								_dis set[0,_val-1];
								lbAdd[1000010,_dis joinString "x"];
								_2 = (lbSize 1000010)-1;
								lbSetData[1000010,_2,_1];
								lbSetPicture[1000010,_2,lbPicture[1000010,_cur]];
								lbSetValue[1000010,_2,_val-1];
							};
							lbDelete[1000010, _cur];
							lbSort 1000010;
							if((lbSize 1000010) isEqualTo 0) then {
								(_display displayCtrl 1000010) lbadd localize "STR_locker_noattachfound";
								lbSetData[1000010, 0, "error"];
							};
						} else {
							hint localize "STR_locker_alrmuzzle";
						};
					} else {
						hint localize "STR_locker_doesntfit";
					};
				};
			} else {
				hint localize "STR_locker_noattachavail";
			};
		} else {
			hint localize "STR_locker_not_selected";
		};
	};
';
locker_fnc_item_in = compileFinal '
	if(locker_space >= locker_limit) exitWith {hint localize "STR_locker_full"};
	_cur = lbcursel 1000074;
	if(!(_cur isEqualTo -1)) then {
		_1 = lbData[1000074, _cur];
		if(_1 isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
		if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
		_amountinput = ctrlText 1000080;
		if(!([_amountinput] call TON_fnc_isnumber)) exitWith {hint localize "STR_NOTF_notNumberFormat"};
		_amountinput = abs parseNumber _amountinput;
		if(_amountinput isEqualto 0) exitWith {hint localize "STR_locker_notenough"};
		if((locker_space+(([_1] call life_fnc_locker_weightfetcher)*_amountinput)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
		_done = false;
		if(getNumber(configfile >> "CfgWeapons" >> _1 >> "type") isEqualTo 1) then {
			_done = true;
			_amountvar = 0;
			_val = lbValue[1000074,_cur];
			for "_i" from 1 to _amountinput do {
				if(_i > _val) exitWith {};
				player removeItem _1;
				_amountvar = _amountvar + 1;
			};
			["locker_primary",_1,_amountvar] call locker_fnc_addItem;
			_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
			if(_val > _amountvar) then {
				_val = _val - _amountvar;
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				_2 = (lbSize 1000074) -1;
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000074,_2,_val];
			};
			lbDelete[1000074, _cur];
			lbSort 1000074;
			if((lbSize 1000074) isEqualTo 0) then {
				(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
				lbSetData[1000074, 0, "error"];
			};
			hint localize "STR_locker_foundprimary";
		};
		if((getNumber(configfile >> "CfgWeapons" >> _1 >> "type") isEqualTo 2) && !_done) then {
			_done = true;
			_amountvar = 0;
			_val = lbValue[1000074,_cur];
			for "_i" from 1 to _amountinput do {
				if(_i > _val) exitWith {};
				player removeItem _1;
				_amountvar = _amountvar + 1;
			};
			["locker_dbhangun",_1,_amountvar] call locker_fnc_addItem;
			_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
			if(_val > _amountvar) then {
				_val = _val - _amountvar;
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				_2 = (lbSize 1000074) -1;
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000074,_2,_val];
			};
			lbDelete[1000074, _cur];
			lbSort 1000074;
			if((lbSize 1000074) isEqualTo 0) then {
				(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
				lbSetData[1000074, 0, "error"];
			};
			hint localize "STR_locker_foundhandgun";
		};
		if((getNumber(configFile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") isEqualTo 801) && !_done) then {
			_done = true;
			_amountvar = 0;
			_val = lbValue[1000074,_cur];
			for "_i" from 1 to _amountinput do {
				if(_i > _val) exitWith {};
				player removeItem _1;
				_amountvar = _amountvar + 1;
			};
			["locker_clothing",_1,_amountvar] call locker_fnc_addItem;
			_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
			if(_val > _amountvar) then {
				_val = _val - _amountvar;
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				_2 = (lbSize 1000074) -1;
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000074,_2,_val];
			};
			lbDelete[1000074, _cur];
			lbSort 1000074;
			if((lbSize 1000074) isEqualTo 0) then {
				(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
				lbSetData[1000074, 0, "error"];
			};
			hint localize "STR_locker_foundcloth";
		};
		if((getNumber(configFile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") isEqualTo 701) && !_done) then {
			_done = true;
			_amountvar = 0;
			_val = lbValue[1000074,_cur];
			for "_i" from 1 to _amountinput do {
				if(_i > _val) exitWith {};
				player removeItem _1;
				_amountvar = _amountvar + 1;
			};
			["locker_vest",_1,_amountvar] call locker_fnc_addItem;
			_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
			if(_val > _amountvar) then {
				_val = _val - _amountvar;
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				_2 = (lbSize 1000074) -1;
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000074,_2,_val];
			};
			lbDelete[1000074, _cur];
			lbSort 1000074;
			if((lbSize 1000074) isEqualTo 0) then {
				(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
				lbSetData[1000074, 0, "error"];
			};
			hint localize "STR_locker_foundvest";
		};
		if((getText(configfile >> "CfgVehicles" >> _1 >> "vehicleClass") isEqualTo "Backpacks") && !_done) then {
			_done = true;
			_amountvar = 0;
			_val = lbValue[1000074,_cur];
			for "_i" from 1 to _amountinput do {
				if(_i > _val) exitWith {};
				player removeItem _1;
				_amountvar = _amountvar + 1;
			};			
			["locker_backpack",_1,_amountvar] call locker_fnc_addItem;
			_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
			if(_val > _amountvar) then {
				_val = _val - _amountvar;
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgVehicles" >> _1 >> "displayName")];
				_2 = (lbSize 1000074) -1;
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgVehicles" >> _1 >> "picture"))];
				lbSetValue[1000074,_2,_val];
			};
			lbDelete[1000074, _cur];
			lbSort 1000074;
			if((lbSize 1000074) isEqualTo 0) then {
				(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
				lbSetData[1000074, 0, "error"];
			};
			hint localize "STR_locker_foundback";
		};
		if(isClass(configFile >> "CfgMagazines" >> _1) && !_done) then {
			_done = true;
			_amountvar = 0;
			_val = lbValue[1000074,_cur];
			for "_i" from 1 to _amountinput do {
				if(_i > _val) exitWith {};
				player removeItem _1;
				_amountvar = _amountvar + 1;
			};	
			["locker_items",_1,_amountvar] call locker_fnc_addItem;
			_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
			if(_val > _amountvar) then {
				_val = _val - _amountvar;
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgMagazines" >> _1 >> "displayName")];
				_2 = (lbSize 1000074) - 1;
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgMagazines" >> _1 >> "picture"))];
				lbSetValue[1000074,_2,_val];
			};
			lbDelete[1000074, _cur];
			lbSort 1000074;
			if((lbSize 1000074) isEqualTo 0) then {
				(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
				lbSetData[1000074, 0, "error"];
			};
			_2 = lbSize 1000072;
			_val = _amountvar;
			if(((lbsize 1000072) isEqualTo 1) && {lbdata[1000072, 0] isEqualTo "error"}) then {
				lbclear 1000072;
				_2 = 0;
			} else {
				for "_i" from 0 to _2 do {
					if(lbData[1000072,_i] isEqualTo _1) exitWith {
						_val = (lbValue[1000072,_i])+_amountvar;
						lbDelete[1000072,_i];
						_2 = _2 - 1;
					};
				};
			};
			(_display displayCtrl 1000072) lbadd format["%1x %2",_val,getText(configFile >> "CfgMagazines" >> _1 >> "displayName")];
			lbSetData[1000072, _2, _1];
			lbSetPicture[1000072, _2, (getText(configFile >> "CfgMagazines" >> _1 >> "picture"))];
			lbSetValue[1000072, _2, _val];
			lbSort 1000072;
		};
		if(isClass(configFile >> "CfgWeapons" >> _1) && !_done) then {
			if(getNumber(configfile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") in [101,201,302]) then {
				_done = true;
				_amountvar = 0;
				_val = lbValue[1000074,_cur];
				for "_i" from 1 to _amountinput do {
					if(_i > _val) exitWith {};
					player removeItem _1;
					_amountvar = _amountvar + 1;
				};	
				["locker_dbattach",_1,_amountvar] call locker_fnc_addItem;
				_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
				if(_val > _amountvar) then {
					_dis = lbText[1000074,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-_amountvar];
					lbAdd[1000074,_dis joinString "x"];
					_2 = (lbSize 1000074)-1;
					lbSetData[1000074,_2,_1];
					lbSetPicture[1000074,_2,lbPicture[1000074,_cur]];
					lbSetValue[1000074,_2,_val-_amountvar];
				};
				lbDelete[1000074, _cur];
				lbSort 1000074;
				if((lbSize 1000074) isEqualTo 0) then {
					(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
					lbSetData[1000074, 0, "error"];
				};
				_2 = lbSize 1000072;
				_val = _amountvar;
				if(((lbsize 1000072) isEqualTo 1) && {lbdata[1000072, 0] isEqualTo "error"}) then {
					lbclear 1000072;
					_2 = 0;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000072,_i] isEqualTo _1) exitWith {
							_val = (lbValue[1000072,_i])+_amountvar;
							lbDelete[1000072,_i];
							_2 = _2 - 1;
						};
					};
				};
				(_display displayCtrl 1000072) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000072, _2, _1];
				lbSetPicture[1000072, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000072, _2, _val];
				lbSort 1000072;
			};
			if(getNumber(configfile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") isEqualTo 605) then {
				_done = true;
				_amountvar = 0;
				_val = lbValue[1000074,_cur];
				for "_i" from 1 to _amountinput do {
					if(_i > _val) exitWith {};
					if((headgear player) isEqualTo _1) then {
						player removeWeapon _1;
					} else {
						player removeItem _1;
					};
					_amountvar = _amountvar + 1;
				};
				["locker_other",_1,_amountvar] call locker_fnc_addItem;
				_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
				if(_val > _amountvar) then {
					_dis = lbText[1000074,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-_amountvar];
					lbAdd[1000074,_dis joinString "x"];
					_2 = (lbSize 1000074)-1;
					lbSetData[1000074,_2,_1];
					lbSetPicture[1000074,_2,lbPicture[1000074,_cur]];
					lbSetValue[1000074,_2,_val-_amountvar];
				};
				lbDelete[1000074, _cur];
				lbSort 1000074;
				if((lbSize 1000074) isEqualTo 0) then {
					(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
					lbSetData[1000074, 0, "error"];
				};
				_2 = lbSize 1000072;
				_val = _amountvar;
				if(((lbsize 1000072) isEqualTo 1) && {lbdata[1000072, 0] isEqualTo "error"}) then {
					lbclear 1000072;
					_2 = 0;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000072,_i] isEqualTo _1) exitWith {
							_val = (lbValue[1000072,_i])+_amountvar;
							lbDelete[1000072,_i];
							_2 = _2 - 1;
						};
					};
				};
				(_display displayCtrl 1000072) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000072, _2, _1];
				lbSetPicture[1000072, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000072, _2, _val];
				lbSort 1000072;
			};
			if(((getNumber(configFile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") in [401,619,620]) OR {getNumber(configFile >> "CfgWeapons" >> _1 >> "type") isEqualTo 4096}) && !_done) then {
				_done = true;
				_amountvar = 0;
				_val = lbValue[1000074,_cur];
				for "_i" from 1 to _amountinput do {
					if(_i > _val) exitWith {};
					if((Binocular player) isEqualTo _1) then {
						player removeWeapon _1;
					} else {
						player removeItem _1;
					};
					_amountvar = _amountvar + 1;
				};
				if(getNumber(configFile >> "CfgWeapons" >> _1 >> "type") isEqualTo 4096) then {
					["locker_other",_1,_amountvar] call locker_fnc_addItem;
				} else {
					["locker_items",_1,_amountvar] call locker_fnc_addItem;
				};
				_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
				if(_val > _amountvar) then {
					_dis = lbText[1000074,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-_amountvar];
					lbAdd[1000074,_dis joinString "x"];
					_2 = (lbSize 1000074)-1;
					lbSetData[1000074,_2,_1];
					lbSetPicture[1000074,_2,lbPicture[1000074,_cur]];
					lbSetValue[1000074,_2,_val-_amountvar];
				};
				lbDelete[1000074, _cur];
				lbSort 1000074;
				if((lbSize 1000074) isEqualTo 0) then {
					(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
					lbSetData[1000074, 0, "error"];
				};
				_2 = lbSize 1000072;
				_val = _amountvar;
				if(((lbsize 1000072) isEqualTo 1) && {lbdata[1000072, 0] isEqualTo "error"}) then {
					lbclear 1000072;
					_2 = 0;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000072,_i] isEqualTo _1) exitWith {
							_val = (lbValue[1000072,_i])+_amountvar;
							lbDelete[1000072,_i];
							_2 = _2 - 1;
						};
					};
				};
				(_display displayCtrl 1000072) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000072, _2, _1];
				lbSetPicture[1000072, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000072, _2, _val];
				lbSort 1000072;
			};
			if((getNumber(configFile >> "CfgWeapons" >> _1 >> "type") isEqualTo 131072) && !_done) then {
				_done = true;
				_amountvar = 0;
				_val = lbValue[1000074,_cur];
				for "_i" from 1 to _amountinput do {
					if(_i > _val) exitWith {};
					player removeItem _1;
					_amountvar = _amountvar + 1;
				};	
				["locker_items",_1,_amountvar] call locker_fnc_addItem;
				_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
				if(_val > _amountvar) then {
					_val = _val - _amountvar;
					(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
					_2 = (lbSize 1000074) - 1;
					lbSetData[1000074, _2, _1];
					lbSetPicture[1000074, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
					lbSetValue[1000074,_2,_val];
				};
				lbDelete[1000074, _cur];
				lbSort 1000074;
				if((lbSize 1000074) isEqualTo 0) then {
					(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
					lbSetData[1000074, 0, "error"];
				};
				_2 = lbSize 1000072;
				_val = _amountvar;
				if(((lbsize 1000072) isEqualTo 1) && {lbdata[1000072, 0] isEqualTo "error"}) then {
					lbclear 1000072;
					_2 = 0;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000072,_i] isEqualTo _1) exitWith {
							_val = (lbValue[1000072,_i])+_amountvar;
							lbDelete[1000072,_i];
							_2 = _2 - 1;
						};
					};
				};
				(_display displayCtrl 1000072) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000072, _2, _1];
				lbSetPicture[1000072, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000072, _2, _val];
				lbSort 1000072;
			};
		};
		if(isClass (configFile >> "CfgGlasses" >> _1) && !_done) then {
			_done = true;
			_amountvar = 0;
			_val = lbValue[1000074,_cur];
			for "_i" from 1 to _amountinput do {
				if(_i > _val) exitWith {};
				if((goggles player) isEqualTo _1) then {
					player removeWeapon _1;
				} else {
					player removeItem _1;
				};
				_amountvar = _amountvar + 1;
			};
			["locker_other",_1,_amountvar] call locker_fnc_addItem;
			_return = ([_1] call life_fnc_locker_weightfetcher)*_amountvar;
			if(_val > _amountvar) then {
				_dis = lbText[1000074,_cur];
				_dis = _dis splitString "x";
				_dis set[0,_val-_amountvar];
				lbAdd[1000074,_dis joinString "x"];
				_2 = (lbSize 1000074)-1;
				lbSetData[1000074,_2,_1];
				lbSetPicture[1000074,_2,lbPicture[1000074,_cur]];
				lbSetValue[1000074,_2,_val-_amountvar];
			};
			lbDelete[1000074, _cur];
			lbSort 1000074;
			if((lbSize 1000074) isEqualTo 0) then {
				(_display displayCtrl 1000074) lbadd localize "STR_locker_noitemsfound";
				lbSetData[1000074, 0, "error"];
			};
			_2 = lbSize 1000072;
			_val = _amountvar;
			if(((lbsize 1000072) isEqualTo 1) && {lbdata[1000072, 0] isEqualTo "error"}) then {
				lbclear 1000072;
				_2 = 0;
			} else {
				for "_i" from 0 to _2 do {
					if(lbData[1000072,_i] isEqualTo _1) exitWith {
						_val = (lbValue[1000072,_i])+_amountvar;
						lbDelete[1000072,_i];
						_2 = _2 - 1;
					};
				};
			};
			(_display displayCtrl 1000072) lbadd format["%1x %2",_val,getText(configFile >> "CfgGlasses" >> _1 >> "displayName")];
			lbSetData[1000072, _2, _1];
			lbSetPicture[1000072, _2, (getText(configFile >> "CfgGlasses" >> _1 >> "picture"))];
			lbSetValue[1000072, _2, _val];
			lbSort 1000072;
		};
		if(!_done) then {hint localize "STR_locker_error"};
	} else {
		hint localize "STR_locker_not_selected";
	};
';
locker_fnc_item_out = compileFinal '
	if(locker_space <= 0) exitWith {hint "No items stored. #Bug prevention"};
	_cur = lbCurSel 1000072;
	if(!(_cur isEqualTo -1)) then {
		_1 = lbData[1000072, _cur];
		if(_1 isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
		_amountinput = ctrlText 1000081;
		if(!([_amountinput] call TON_fnc_isnumber)) exitWith {hint localize "STR_NOTF_notNumberFormat"};
		_amountinput = abs parseNumber _amountinput;
		if(_amountinput isEqualto 0) exitWith {hint localize "STR_locker_notenough"};
		_done = false;
		_exit = false;
		if((getNumber(configFile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") isEqualTo 801) || (getNumber(configFile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") isEqualTo 701) || (getText(configfile >> "CfgVehicles" >> _1 >> "vehicleClass") isEqualTo "Backpacks")) exitWith {
			_done = true;
			hint localize "STR_locker_foundcloth";
		};
		if((getNumber(configfile >> "CfgWeapons" >> _1 >> "type") isEqualTo 1) || (getNumber(configfile >> "CfgWeapons" >> _1 >> "type") isEqualTo 2)) exitWith {
			_done = true;
			hint localize "STR_locker_foundweapon";
		};
		if(isClass(configFile >> "CfgWeapons" >> _1) && !_done) then {
			if(getNumber(configfile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") in [101,201,302]) then {
				if(player canadd _1) then {
					_done = true;
					_amountvar = 0;
					_val = lbValue[1000072,_cur];
					for "_i" from 1 to _amountinput do {
						if(_i > _val) exitWith {};
						if(!(player canAdd _1)) exitWith {};
						player addItem _1;
						_amountvar = _amountvar + 1;
					};
					["locker_dbattach",_1,_amountvar] call locker_fnc_removeItem;
					_return = -(([_1] call life_fnc_locker_weightfetcher)*_amountvar);
					if(_val > _amountvar) then {
						_dis = lbText[1000072,_cur];
						_dis = _dis splitString "x";
						_dis set[0,_val-_amountvar];
						lbAdd[1000072,_dis joinString "x"];
						_2 = (lbSize 1000072)-1;
						lbSetData[1000072,_2,_1];
						lbSetPicture[1000072,_2,lbPicture[1000072,_cur]];
						lbSetValue[1000072,_2,_val-_amountvar];
					};
					lbDelete[1000072, _cur];
					lbSort 1000072;
					if((lbSize 1000072) isEqualTo 0) then {
						(_display displayCtrl 1000072) lbadd localize "STR_locker_noitemsfound";
						lbSetData[1000072, 0, "error"];
					};
					_2 = lbSize 1000074;
					_val = _amountvar;
					if(((lbSize 1000074) isEqualTo 1) && {lbData[1000074,0] isEqualTo "error"}) then {
						lbclear 1000074;
						_2 = 0;
					} else {
						for "_i" from 0 to _2 do {
							if(lbData[1000074,_i] isEqualTo _1) exitWith {
								_val = (lbValue[1000074,_i])+_amountvar;
								lbDelete[1000074,_i];
								_2 = _2 - 1;
							};
						};
					};
					(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
					lbSetData[1000074, _2, _1];
					lbSetPicture[1000074, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
					lbSetValue[1000074, _2, _val];
					lbSort 1000074;
				} else {
					hint localize "STR_locker_lessspace";
				};
			};
			if((getNumber(configFile >> "CfgWeapons" >> _1 >> "type") isEqualTo 4096) && !_done) then {
				_done = true;
				if(!((Binocular player) isEqualTo "") && !(player canAdd _1)) exitWith {hint localize "STR_locker_lessspace"};
				_amountvar = 0;
				_val = lbValue[1000072,_cur];
				for "_i" from 1 to _amountinput do {
					if(_i > _val) exitWith {};
					if((Binocular player) isEqualTo "") then {
						player addWeapon _1;
					} else {
						if(!(player canadd _1)) exitWith {_exit = true};
						player addItem _1;
					};
					if(_exit) exitWith {_exit = false};
					_amountvar = _amountvar + 1;
				};
				["locker_other",_1,_amountvar] call locker_fnc_removeItem;
				_return = -(([_1] call life_fnc_locker_weightfetcher)*_amountvar);
				if(_val > _amountvar) then {
					_dis = lbText[1000072,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-_amountvar];
					lbAdd[1000072,_dis joinString "x"];
					_2 = (lbSize 1000072)-1;
					lbSetData[1000072,_2,_1];
					lbSetPicture[1000072,_2,lbPicture[1000072,_cur]];
					lbSetValue[1000072,_2,_val-_amountvar];
				};
				lbDelete[1000072, _cur];
				lbSort 1000072;
				if((lbSize 1000072) isEqualTo 0) then {
					(_display displayCtrl 1000072) lbadd localize "STR_locker_noitemsfound";
					lbSetData[1000072, 0, "error"];
				};
				_2 = lbSize 1000074;
				_val = _amountvar;
				if(((lbSize 1000074) isEqualTo 1) && {lbData[1000074,0] isEqualTo "error"}) then {
					lbclear 1000074;
					_2 = 0;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000074,_i] isEqualTo _1) exitWith {
							_val = (lbValue[1000074,_i])+_amountvar;
							lbDelete[1000074,_i];
							_2 = _2 - 1;
						};
					};
				};
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000074, _2, _val];
				lbSort 1000074;
			};
			if(getNumber(configfile >> "CfgWeapons" >> _1 >> "ItemInfo" >> "type") isEqualTo 605 && !_done) then {
				_done = true;
				if(!((headgear player) isEqualTo "") && !(player canAdd _1)) exitWith {hint localize "STR_locker_lessspace"};
				_amountvar = 0;
				_val = lbValue[1000072,_cur];
				for "_i" from 1 to _amountinput do {
					if(_i > _val) exitWith {};
					if((headgear player) isEqualTo "") then {
						player addWeapon _1;
					} else {
						if(!(player canadd _1)) exitWith {_exit = true};
						player addItem _1;
					};
					if(_exit) exitWith {_exit = false};
					_amountvar = _amountvar + 1;
				};
				["locker_other",_1,_amountvar] call locker_fnc_removeItem;
				_return = -(([_1] call life_fnc_locker_weightfetcher)*_amountvar);
				if(_val > _amountvar) then {
					_dis = lbText[1000072,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-_amountvar];
					lbAdd[1000072,_dis joinString "x"];
					_2 = (lbSize 1000072)-1;
					lbSetData[1000072,_2,_1];
					lbSetPicture[1000072,_2,lbPicture[1000072,_cur]];
					lbSetValue[1000072,_2,_val-_amountvar];
				};
				lbDelete[1000072, _cur];
				lbSort 1000072;
				if((lbSize 1000072) isEqualTo 0) then {
					(_display displayCtrl 1000072) lbadd localize "STR_locker_noitemsfound";
					lbSetData[1000072, 0, "error"];
				};
				_2 = lbSize 1000074;
				_val = _amountvar;
				if(((lbSize 1000074) isEqualTo 1) && {lbData[1000074,0] isEqualTo "error"}) then {
					lbclear 1000074;
					_2 = 0;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000074,_i] isEqualTo _1) exitWith {
							_val = (lbValue[1000074,_i])+_amountvar;
							lbDelete[1000074,_i];
							_2 = _2 - 1;
						};
					};
				};
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000074, _2, _val];
				lbSort 1000074;
			};
			if(getNumber(configfile >> "CfgWeapons" >> _1 >> "type") isEqualTo 131072 && !_done) then {
				_done = true;
				if(!(player canAdd _1)) exitWith {hint localize "STR_locker_lessspace"};
				_amountvar = 0;
				_val = lbValue[1000072,_cur];
				for "_i" from 1 to _amountinput do {
					if(_i > _val) exitWith {};
					if(!(player canadd _1)) exitWith {};
					player addItem _1;
					_amountvar = _amountvar + 1;
				};
				["locker_items",_1,_amountvar] call locker_fnc_removeItem;
				_return = -(([_1] call life_fnc_locker_weightfetcher)*_amountvar);
				if(_val > _amountvar) then {
					_dis = lbText[1000072,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-_amountvar];
					lbAdd[1000072,_dis joinString "x"];
					_2 = (lbSize 1000072)-1;
					lbSetData[1000072,_2,_1];
					lbSetPicture[1000072,_2,lbPicture[1000072,_cur]];
					lbSetValue[1000072,_2,_val-_amountvar];
				};
				lbDelete[1000072, _cur];
				lbSort 1000072;
				if((lbSize 1000072) isEqualTo 0) then {
					(_display displayCtrl 1000072) lbadd localize "STR_locker_noitemsfound";
					lbSetData[1000072, 0, "error"];
				};
				_2 = lbSize 1000074;
				_val = _amountvar;
				if(((lbSize 1000074) isEqualTo 1) && {lbData[1000074,0] isEqualTo "error"}) then {
					lbclear 1000074;
					_2 = 0;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000074,_i] isEqualTo _1) exitWith {
							_val = (lbValue[1000074,_i])+_amountvar;
							lbDelete[1000074,_i];
							_2 = _2 - 1;
						};
					};
				};
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgWeapons" >> _1 >> "displayName")];
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgWeapons" >> _1 >> "picture"))];
				lbSetValue[1000074, _2, _val];
				lbSort 1000074;
			};
		};
		if(isClass(configFile >> "CfgGlasses" >> _1) && !_done) then {
			_done = true;
			if(!((goggles player) isEqualTo "") && !(player canAdd _1)) exitWith {hint localize "STR_locker_lessspace"};
			_amountvar = 0;
			_val = lbValue[1000072,_cur];
			for "_i" from 1 to _amountinput do {
				if(_i > _val) exitWith {};
				if((goggles player) isEqualTo "") then {
					player addWeapon _1;
				} else {
					if(!(player canadd _1)) exitWith {_exit = true};
					player addItem _1;
				};
				if(_exit) exitWith {_exit = false};
				_amountvar = _amountvar + 1;
			};
			if(_exit) exitWith {};
			["locker_other",_1,_amountvar] call locker_fnc_removeItem;
			_return = -(([_1] call life_fnc_locker_weightfetcher)*_amountvar);
			if(_val > _amountvar) then {
				_dis = lbText[1000072,_cur];
				_dis = _dis splitString "x";
				_dis set[0,_val-_amountvar];
				lbAdd[1000072,_dis joinString "x"];
				_2 = (lbSize 1000072)-1;
				lbSetData[1000072,_2,_1];
				lbSetPicture[1000072,_2,lbPicture[1000072,_cur]];
				lbSetValue[1000072,_2,_val-_amountvar];
			};
			lbDelete[1000072, _cur];
			lbSort 1000072;
			if((lbSize 1000072) isEqualTo 0) then {
				(_display displayCtrl 1000072) lbadd localize "STR_locker_noitemsfound";
				lbSetData[1000072, 0, "error"];
			};
			_2 = lbSize 1000074;
			_val = _amountvar;
			if(((lbSize 1000074) isEqualTo 1) && {lbData[1000074,0] isEqualTo "error"}) then {
				lbclear 1000074;
				_2 = 0;
			} else {
				for "_i" from 0 to _2 do {
					if(lbData[1000074,_i] isEqualTo _1) exitWith {
						_val = (lbValue[1000074,_i])+_amountvar;
						lbDelete[1000074,_i];
						_2 = _2 - 1;
					};
				};
			};
			(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgGlasses" >> _1 >> "displayName")];
			lbSetData[1000074, _2, _1];
			lbSetPicture[1000074, _2, (getText(configFile >> "CfgGlasses" >> _1 >> "picture"))];
			lbSetValue[1000074, _2, _val];
			lbSort 1000074;
		};
		if(isClass(configFile >> "CfgMagazines" >> _1) && !_done) then {
			_done = true;
			if(player canadd _1) then {
				_amountvar = 0;
				_val = lbValue[1000072,_cur];
				for "_i" from 1 to _amountinput do {
					if(_i > _val) exitWith {};
					if(!(player canAdd _1)) exitWith {};
					player addItem _1;
					_amountvar = _amountvar + 1;
				};
				if(_val > _amountvar) then {
					_dis = lbText[1000072,_cur];
					_dis = _dis splitString "x";
					_dis set[0,_val-_amountvar];
					lbAdd[1000072,_dis joinString "x"];
					_2 = (lbSize 1000072)-1;
					lbSetData[1000072,_2,_1];
					lbSetPicture[1000072,_2,lbPicture[1000072,_cur]];
					lbSetValue[1000072,_2,_val-_amountvar];
				};
				lbDelete[1000072, _cur];
				lbSort 1000072;
				if((lbSize 1000072) isEqualTo 0) then {
					(_display displayCtrl 1000072) lbadd localize "STR_locker_noitemsfound";
					lbSetData[1000072, 0, "error"];
				};
				_2 = lbSize 1000074;
				_val = _amountvar;
				if(((lbSize 1000074) isEqualTo 1) && {lbData[1000074,0] isEqualTo "error"}) then {
					lbclear 1000074;
					_2 = 0;
				} else {
					for "_i" from 0 to _2 do {
						if(lbData[1000074,_i] isEqualTo _1) exitWith {
							_val = (lbValue[1000074,_i])+_amountvar;
							lbDelete[1000074,_i];
							_2 = _2 - 1;
						};
					};
				};
				["locker_items",_1,_amountvar] call locker_fnc_removeItem;
				_return = -(([_1] call life_fnc_locker_weightfetcher)*_amountvar);
				(_display displayCtrl 1000074) lbadd format["%1x %2",_val,getText(configFile >> "CfgMagazines" >> _1 >> "displayName")];
				lbSetData[1000074, _2, _1];
				lbSetPicture[1000074, _2, (getText(configFile >> "CfgMagazines" >> _1 >> "picture"))];
				lbSetValue[1000074, _2, _val];
				lbSort 1000074;
			} else {
				hint localize "STR_locker_lessspace";
			};
		};
		if(!_done) then {
			hint localize "STR_locker_error";
		};
	} else {
		hint localize "STR_locker_not_selected";
	};
';
locker_fnc_virt_in = compileFinal '
	_cur = lbCurSel 1000074;
	if(!(_cur isEqualTo -1)) then {
		_1 = lbData[1000074, _cur];
		if(_1 isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
		if(_1 in getArray(missionConfigFile >> "locker_config" >> "antisafeitems")) exitWith {hint localize "STR_locker_not_storable"};
		_amountinput = ctrlText 1000080;
		if(!([_amountinput] call TON_fnc_isnumber)) exitWith {hint localize "STR_NOTF_notNumberFormat"};
		_amountinput = abs parseNumber _amountinput;
		if(_amountinput isEqualto 0) exitWith {hint localize "STR_locker_notenough"};
		if((locker_space+(([_1] call life_fnc_locker_weightfetcher)*_amountinput)) >= locker_limit) exitWith {hint localize "STR_locker_full"};
		if(!([false,_1,_amountinput] call life_fnc_handleInv)) exitWith {hint localize "STR_locker_notenoughitems"};
		["locker_virtitems",_1,_amountinput] call locker_fnc_addItem;
		_return = ([_1] call life_fnc_locker_weightfetcher)*_amountinput;
		_val = lbValue[1000074,_cur];
		if(_val > _amountinput) then {
			_dis = lbText[1000074,_cur];
			_dis = _dis splitString "x";
			_dis set[0,_val-_amountinput];
			lbAdd[1000074,_dis joinString "x"];
			_2 = (lbSize 1000074)-1;
			lbSetData[1000074,_2,_1];
			lbSetPicture[1000074,_2,lbPicture[1000074,_cur]];
			lbSetValue[1000074,_2,_val-_amountinput];
		};
		lbDelete[1000074, _cur];
		lbSort 1000074;
		if((lbSize 1000074) isEqualTo 0) then {
			(_display displayCtrl 1000074) lbadd localize "STR_locker_novirtsfound";
			lbSetData[1000074, 0, "error"];
		};
		_2 = lbSize 1000072;
		_val = _amountinput;
		if(((lbSize 1000072) isEqualTo 1) && {lbData[1000072,0] isEqualTo "error"}) then {
			lbclear 1000072;
			_2 = 0;
		} else {
			for "_i" from 0 to _2 do {
				if(lbData[1000072,_i] isEqualTo _1) exitWith {
					_val = (lbValue[1000072,_i])+_amountinput;
					lbDelete[1000072,_i];
					_2 = _2 - 1;
				};
			};
		};
		(_display displayCtrl 1000072) lbadd format["%1x %2",_val,(localize (getText(missionConfigFile >> "VirtualItems" >> _1 >> "displayName")))];
		lbSetData[1000072, _2, _1];
		lbSetPicture[1000072, _2, (getText(missionConfigFile >> "VirtualItems" >> _1 >> "icon"))];
		lbSetValue[1000072, _2, _val];
		lbSort 1000072;
	} else {
		hint localize "STR_locker_not_selected";
	};
';
locker_fnc_virt_out = compileFinal ' 
	_cur = lbcursel 1000072;
	if(!(_cur isEqualTo -1)) then {
		_1 = lbData[1000072, _cur];
		if(_1 isEqualTo "error") exitWith {hint localize "STR_locker_not_selected"};
		_amountinput = ctrlText 1000081;
		if(!([_amountinput] call TON_fnc_isnumber)) exitWith {hint localize "STR_NOTF_notNumberFormat"};
		_amountinput = abs parseNumber _amountinput;
		if(_amountinput isEqualto 0) exitWith {hint localize "STR_locker_notenough"};
		_val = lbValue[1000072,_cur];
		if(_amountinput > _val) then {_amountinput = +_val};
		if(!([true,_1,_amountinput] call life_fnc_handleInv)) exitWith {hint localize "STR_locker_notenoughspace"};
		["locker_virtitems",_1,_amountinput] call locker_fnc_removeItem;
		_return = -(([_1] call life_fnc_locker_weightfetcher)*_amountinput);
		if(_val > _amountinput) then {
			_dis = lbText[1000072,_cur];
			_dis = _dis splitString "x";
			_dis set[0,_val-_amountinput];
			lbAdd[1000072,_dis joinString "x"];
			_2 = (lbSize 1000072)-1;
			lbSetPicture[1000072,_2,lbPicture[1000072,_cur]];
			lbSetData[1000072,_2,_1];
			lbSetValue[1000072,_2,_val-_amountinput];
		};
		lbDelete[1000072, _cur];
		lbSort 1000072;
		if((lbSize 1000072) isEqualTo 0) then {
			(_display displayCtrl 1000072) lbadd localize "STR_locker_novirtsfound";
			lbSetData[1000072, 0, "error"];
		};
		_2 = lbSize 1000074;
		_val = _amountinput;
		if(((lbSize 1000074) isEqualTo 1) && {lbData[1000074,0] isEqualTo "error"}) then {
			lbclear 1000074;
			_2 = 0;
		} else {
			for "_i" from 0 to _2 do {
				if(lbData[1000074,_i] isEqualTo _1) exitWith {
					_val = (lbValue[1000074,_i])+_amountinput;
					lbDelete[1000074,_i];
					_2 = _2 - 1;
				};
			};
		};
		(_display displayCtrl 1000074) lbadd format["%1x %2",_val,(localize (getText(missionConfigFile >> "VirtualItems" >> _1 >> "displayName")))];
		lbSetData[1000074, _2, _1];
		lbSetPicture[1000074, _2, (getText(missionConfigFile >> "VirtualItems" >> _1 >> "icon"))];
		lbSetValue[1000074, _2, _val];
		lbSort 1000074;
	} else {
		hint localize "STR_locker_not_selected";
	};
';