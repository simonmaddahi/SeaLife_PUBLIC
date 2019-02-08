#include "..\..\script_macros.hpp"
/*
	Author: Basti | John Collins
*/

params [
	["_mode", 0, [1]]
];

disableSerialization;

private _display = findDisplay 2620;
if (isNull _display) exitWith {call life_fnc_gangMenu};

private _group = group player;

switch (_mode) do { 
	//Rang für Mitglied setzen
	case 0 : {
		if ((lbCurSel 1500) isEqualTo -1 || {(lbCurSel 1501) isEqualTo -1}) exitWith {hint "Entweder kein Rang, oder kein Mitglied ausgewählt!"};
		private _rank = CONTROL_DATA(1500);
		private _unit = call compile format ["%1",CONTROL_DATA(1501)];
		private _unitObj = [_unit] call life_fnc_UIDToObj;
		private _index = [_rank, _group getVariable ["gang_ranks", []]] call TON_fnc_index;
		if (_index isEqualTo -1) exitWith {hint "Den Rang gibt es nicht mehr!"};
		private _rights = (_group getVariable ["gang_ranks", []]) select _index;
		if !(_unitObj isEqualTo objNull) then {
			_unitObj setVariable ["gang_rank", _rights, true];
		};
		private _mbrs = _group getVariable ["gang_members",[]];
		private _mbrIndex = [_unit, _mbrs]call TON_fnc_index;
		private _unitArr = _mbrs select _mbrIndex;
		_unitArr set [1, _rank];
		_mbrs set [_mbrIndex, _unitArr];
		_group setVariable ["gang_members", _mbrs, true];
		[4, group player] remoteExec ["TON_fnc_updateGang",RSERV];
		hint "Der Rang wurde erfolgreich geändert!";
		call life_fnc_gangMenu;
	};

	case 1: {
		if ((lbCurSel 1500) isEqualTo -1) exitWith {hint "Du hast keinen Rang ausgewählt!"};
		private _rights = player getVariable ["gang_rank", []];
		private _ranks = _group getVariable ["gang_ranks", []];
		if (!((_group getVariable ["gang_owner", ""]) isEqualTo (getPlayerUID player)) && ((_rights isEqualTo []) || {!((_rights select 1) select 1)})) exitWith {hint "Keine Berechtigung für diese Aktion!"};
		private _rank = CONTROL_DATA(1500);
		private _index = [_rank, _ranks] call TON_fnc_index;
		if (_index isEqualTo -1) exitWith {hint "Den Rang gibt es nicht mehr!"};
		_ranks deleteAt _index;
		diag_log format ["DAS IST SEHR WICHTIG!!!!! %1", _ranks];
		_group setVariable ["gang_ranks", _ranks, true];
		private _mbrs = _group getVariable ["gang_members", []];
		{
			if ((_x select 1) isEqualTo _rank) then {
				(_mbrs select _forEachIndex) set [1, ""];
				private _obj = [_x select 0]call life_fnc_UIDToObj;
				if !(_obj isEqualTo objNull) then {
					_obj setVariable ["gang_rank", [], true];
				};
			};
		} foreach _mbrs;
		_group setVariable ["gang_members", _mbrs, true];
		[5, group player] remoteExec ["TON_fnc_updateGang", 2];
		hint "Der Rang wurde erfolgreich geändert!";
		call life_fnc_gangMenu;
	};
};