#include "..\..\script_macros.hpp"
/*
    File: fn_gangMenu.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    31 hours of no sleep screw your description.
*/
private ["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl"];
disableSerialization;
if (isNull (findDisplay 2620)) then {
    if (!(createDialog "Life_My_Gang_Diag")) exitWith {}; //NOOOOOOOOOOOOOOOOOOOOOOOoooooooooooooOOOOOOOOOOOOOOOOOOOOOOOOOOO00000000000000oooooo
};

_ownerID = group player getVariable ["gang_owner",""];
if (_ownerID isEqualTo "") exitWith {closeDialog 0;}; //Bad juju

_gangName = group player getVariable "gang_name";
_gangTag = group player getVariable "gang_tag";
//_gangBank = GANG_FUNDS;
//_gangMax = group player getVariable "gang_maxMembers";


if !(getPlayerUID player isEqualTo _ownerID) then {
	(CONTROL(2620,2400)) ctrlEnable false; //Neuen Rang erstellen
	(CONTROL(2620,2402)) ctrlEnable false; //Rang löschen
	(CONTROL(2620,2404)) ctrlEnable false; //Gang erweitern
	(CONTROL(2620,2405)) ctrlEnable false; //Gangkonto
	(CONTROL(2620,2406)) ctrlEnable false; //Ganghaus
	(CONTROL(2620,2407)) ctrlEnable false; //Gang auflösen
	(CONTROL(2620,2408)) ctrlEnable false; //Einladen
	(CONTROL(2620,2409)) ctrlEnable false; //Kicken
	(CONTROL(2620,2410)) ctrlEnable false; //Rang zuweisen
	(CONTROL(2620,2411)) ctrlEnable false; //Neuer leader

	private _rights = player getVariable ["gang_rank", []];

	if !(_rights isEqualTo []) then {
		_rights = _rights select 1;
		private _count = 0;
		{
			if (_x isEqualType []) then {
				{
					if (_x isEqualTo controlNull) exitWith {_count = _count + 1;};
					_x ctrlEnable (_rights select _count);
					_count = _count + 1;
				} foreach _x;
			} else {
				if (_x isEqualTo controlNull) exitWith {_count = _count + 1;};
				_x ctrlEnable (_rights select _count);
				_count = _count + 1;
			};
		} foreach [CONTROL(2620,2400), CONTROL(2620,2402), CONTROL(2620,2404), CONTROL(2620,2405), controlNull, controlNull, CONTROL(2620,2406), controlNull, controlNull, CONTROL(2620,2408), CONTROL(2620,2409), CONTROL(2620,2410)];
	};
};
//(CONTROL(2620,1002)) ctrlSetText format["Gangname: %1",_gangName];
//(CONTROL(2620,1001)) ctrlSetText format["Max. Mitglieder: %1",_gangMax];
//(CONTROL(2620,601)) ctrlSetText format ["Gangkonto: $%1",[_gangBank] call life_fnc_numberText];

//Loop through the players.
_members = CONTROL(2620,1501);
private _mmbrs = [];
private _ranks = group player getVariable ["gang_ranks", []];
{
	private _index = [_x select 1, _ranks] call TON_fnc_index;
	private _rank = if (_index isEqualTo -1) then {"Kein Rang"} else {_x select 1};
	if ([_x select 0] call life_fnc_isUIDActive) then {
		_obj = [_x select 0] call life_fnc_UIDToObj;
		_mmbrs pushBack [_x select 2, _x select 0, _rank, "ONLINE", str(_obj)];
	} else {
		_mmbrs pushBack [_x select 2, _x select 0, _rank, "OFFLINE", str(objNull)];
	};
} forEach (group player getVariable ["gang_members", []]);

_sortedMmbrs = [_mmbrs, [], {_x select 3}, "DESCEND"] call BIS_fnc_sortBy;

lbClear _members;
{
    _members lbAdd format ["[%1 | %2] %3 (%4)", _x select 3,  _x select 2, _x select 0, _x select 1];
    _members lbSetData [(lbSize _members)-1,str(_x select 1)];
    if ((_x select 3) isEqualTo "ONLINE") then {
    	_members lbSetColor [(lbSize _members)-1, [0, 1, 0, 0.7]];
    } else {
    	_members lbSetColor [(lbSize _members)-1, [1, 0, 0, 0.7]];
	};
} foreach _sortedMmbrs;
_grpMembers = units group player;
/*
_allUnits = playableUnits;

//Clear out the list..
{
    if () then {
        _allUnits deleteAt _forEachIndex;
    };
} forEach _allUnits;
*/
_ctrl = CONTROL(2620,1502);
lbClear _ctrl; //Purge the list
{
	if(!(_x in _grpMembers) && (side _x isEqualTo civilian) && isNil {(group _x) getVariable "gang_id"}) then {
		_ctrl lbAdd format ["%1",_x getVariable ["realname",name _x]];
		_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
	};
} forEach playableUnits;

_ranksCtrl = CONTROL(2620,1500);

lbClear _ranksCtrl;
if (_ranks isEqualTo []) then {
	_ranksCtrl lbAdd "Aktuell keine Ränge vorhanden";
	_ranksCtrl lbSetData [(lbSize _ranksCtrl)-1,""];
} else {
	{
		_ranksCtrl lbAdd (_x select 0);
		_ranksCtrl lbSetData [(lbSize _ranksCtrl)-1,(_x select 0)];
	}foreach _ranks;
};