#include "..\..\script_macros.hpp"
/*
	Author: Basti | John Collins
*/

params [
	["_mode", 0, [0]]
];

disableSerialization;

private _display = findDisplay 262025;

if (isNull _display) then {
	createDialog "ZB_Gangranks";
	_display = findDisplay 262025;
};

private _group = group player;

private _rights = player getVariable ["gang_rank", []];

if (_rights isEqualTo [] && !((_group getVariable ["gang_owner", ""]) isEqualTo (getPlayerUID player))) exitWith {hint "Du hast nicht die benötigten Rechte"; closeDialog 0;};

private _gangRanks = _group getVariable ["gang_ranks", []];

private _cbs = [CONTROL(262025,2800),CONTROL(262025,2801),CONTROL(262025,2802),CONTROL(262025,2803),CONTROL(262025,2804),CONTROL(262025,2805),CONTROL(262025,2806),CONTROL(262025,2807),CONTROL(262025,2808),CONTROL(262025,2809),CONTROL(262025,2810),CONTROL(262025,2811)];
if !(_mode in [2,4]) then {
	{_x cbSetChecked false;} count _cbs;
};

private _listbox = _display displayCtrl 1500;

switch(_mode) do {
	case 0: {
		lbClear _listbox;
		if (count _gangRanks > 0) then {
			{_listbox lbAdd (_x select 0); _listbox lbSetData [(lbSize _listbox)-1, (_x select 0)];} count _gangRanks;
		};
		_listbox lbSetCurSel -1;
		CONTROL(262025,1500) ctrlEnable true;
		CONTROL(262025,1400) ctrlSetText "";
		CONTROL(262025,2400) ctrlSetText "Rang hinzufügen";
		CONTROL(262025,2400) buttonSetAction "[3] call life_fnc_gangRanksMenu;";
		CONTROL(262025,2401) ctrlSetText "Veränderungen speichern";
		CONTROL(262025,2401) buttonSetAction "[2] call life_fnc_gangRanksMenu;";
	};

	case 1: {
		if ((lbCurSel _listbox) isEqualTo -1) exitWith{}; //WTF
		private _data = CONTROL_DATA(1500);
		if (_data isEqualTo "Temp") exitWith {}; //Rang wird erstellt
		private _index = [_data, _gangRanks] call TON_fnc_index;
		if (_index isEqualTo -1) exitWith {[0] call life_gangRanksMenu};
		private _selRank = _gangRanks select _index;
		CONTROL(262025,1400) ctrlSetText format ["%1", _selRank select 0];
		_selRank = _selRank select 1;
		{
			_x cbSetChecked (_selRank select _forEachIndex);
		} foreach _cbs;
	};

	case 2: {
		if ((lbCurSel _listbox) isEqualTo -1) exitWith{};
		private _data = CONTROL_DATA(1500);
		private _index = [_data, _gangRanks] call TON_fnc_index;
		if (_index isEqualTo -1) exitWith {hint "Der bearbeitete Rang existiert nicht mehr!"; [0] call life_fnc_gangRanksMenu;};
		private _selRank = _gangRanks select _index;
		private _name = _selRank select 0;
		private _newRank = [];
		private _newName = ctrlText CONTROL(262025,1400);
		if (_newName isEqualTo "Temp" || _newName isEqualTo "") then {_newName = _name;};
		private _newRank = [_newName];
		private _newArr = [];
		{
			_newArr pushBack ([false, true] select (cbChecked _x));
			nil;
		} count _cbs;
		_newRank pushBack _newArr;
		diag_log format ["AUCH WICHTIG!!! %1", _newRank, _newArr];
		_gangRanks set [_index, _newRank];
		private _newIndex = [_newName, _gangRanks] call TON_fnc_index;
		if (!(_newIndex isEqualTo -1) && !(_data isEqualTo _newName)) exitWith {hint "Der Name ist schon vergeben!";};

		_group setVariable ["gang_ranks", _gangRanks, true];
		[6, group player, _name] remoteExec ["TON_fnc_updateGang", 2];
		[0] call life_fnc_gangRanksMenu;
	};

	case 3: {
		if (count _gangRanks >= 10) exitWith {hint "Du kannst nicht mehr als 10 Ränge erstellen!"};
		CONTROL(262025,1500) ctrlEnable false;
		CONTROL(262025,2400) ctrlSetText "Abbrechen";
		CONTROL(262025,2400) buttonSetAction "[0] call life_fnc_gangRanksMenu;";
		CONTROL(262025,2401) ctrlSetText "Rang erstellen";
		CONTROL(262025,2401) buttonSetAction "[4] call life_fnc_gangRanksMenu;";
		private _index = _listbox lbAdd "Neu erstellen";
		_listbox lbSetData [_index, "Temp"];
		_listbox lbSetCurSel _index;
		CONTROL(262025,1400) ctrlSetText "Temp";
		{_x cbSetChecked false;} count _cbs;
	};

	case 4: {
		if (((ctrlText CONTROL(262025,1400)) isEqualTo "") || ((ctrlText CONTROL(262025,1400)) isEqualTo "Temp")) exitWith {hint "Name für den Rang ist falsch!"};
		private _index = [(ctrlText CONTROL(262025,1400)), _gangRanks] call TON_fnc_index;
		if !(_index isEqualTo -1) exitWith {hint "Ein Rang mit diesem Namen ist schon vorhanden!"};
		private _temp = [(ctrlText CONTROL(262025,1400))];
		private _temp2 = [];
		{_checked = [false, true] select (cbChecked _x); _temp2 pushback (_checked); nil;} count _cbs;
		_temp pushBack _temp2;
		_gangRanks pushBack _temp;
		_group setVariable ["gang_ranks", _gangRanks, true];
		[6, group player, (ctrlText CONTROL(262025,1400))] remoteExec ["TON_fnc_updateGang", 2];
		[0] call life_fnc_gangRanksMenu;
	};
};