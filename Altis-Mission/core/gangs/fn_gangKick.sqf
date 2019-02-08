#include "..\..\script_macros.hpp"
/*
    File: fn_gangKick.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Kicks a player from your gang.
*/
private ["_unit","_unitID","_members"];
disableSerialization;

if ((lbCurSel 1501) isEqualTo -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format ["%1",CONTROL_DATA(1501)];

//if (isNull _unit) exitWith {}; //Bad unit?

_unitID = _unit;
if (_unitID isEqualTo (getPlayerUID player)) exitWith {hint localize "STR_GNOTF_KickSelf"};
if (_unitID isEqualTo ((group player) getVariable "gang_owner")) exitWith {hint "Der Leader wird nicht gekickt!"};
_members = group player getVariable "gang_members";
if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

_membersIndex = [_unitID, _members] call TON_fnc_index;
_members deleteAt _membersIndex;
group player setVariable ["gang_members", _members, true];

_unit = [_unitID] call life_fnc_UIDToObj;

if (_unit isEqualTo objNull) then {
	[_unitID,playerSide,-1,10] remoteExecCall ["DB_fnc_updatePartial",2];
} else {
	_unit setvariable ["gang_rank", nil, true];
	_unit setvariable ["realname", name _unit, true];
	[_unit,group player] remoteExec ["TON_fnc_clientGangKick",_unit]; //Boot that bitch!
	[10] remoteexec ["SOCK_fnc_updatePartial", _unit];
};

[4,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.

call life_fnc_gangMenu;