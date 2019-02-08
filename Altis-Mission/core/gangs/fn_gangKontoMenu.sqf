#include "..\..\script_macros.hpp"
/*
	Author: Basti | John Collins
*/

params [
	["_mode", 0, [0]],
	["_recall", false, [false]]
];


private _group = group player;
if ((_group getVariable ["gang_bankInUse", false]) && !_recall) exitWith {hint "Das Gangkonto wird bereits genutzt"; closeDialog 0;};
_group setVariable ["gang_bankInUse", true, true];

disableSerialization;

private _display = findDisplay 262026;

if (isNull _display) then {
	createDialog "ZB_Gangkonto";
	_display = findDisplay 262026;
};

private _rights = player getVariable ["gang_rank", []];
private _bank = _group getVariable ["gang_bank", 0];

if (_rights isEqualTo [] && !((_group getVariable ["gang_owner", ""]) isEqualTo (getPlayerUID player))) exitWith {hint "Du hast nicht die benötigten Rechte"; closeDialog 0;};

if !((_group getVariable ["gang_owner", ""]) isEqualTo (getPlayerUID player)) then {
	(CONTROL(262026,2400)) ctrlEnable false; //Aufs Konto
	(CONTROL(262026,2401)) ctrlEnable false; //Vom Konto
	(CONTROL(262026,2402)) ctrlEnable false; //Zum Mitglied überweisen

	if (_rights select 4) then {
		(CONTROL(262026,2400)) ctrlEnable true;
	};

	if (_rights select 5) then {
		(CONTROL(262026,2401)) ctrlEnable true;
		(CONTROL(262026,2402)) ctrlEnable true;
	};
};
private _bankCtrl = _display displayCtrl 1101;
private _ownCtrl = _display displayCtrl 1102;
_bankCtrl ctrlSetStructuredText parseText format ["<t font='PuristaBold' size='1.5' align='center'>%1$</t>", [_bank]call life_fnc_numberText];
_ownCtrl ctrlSetStructuredText parseText format ["<img size='1.3' image='icons\ico_bank.paa'/> <t size='0.8px'>$%1</t><br/><img size='1.2' image='icons\ico_money.paa'/> <t size='0.8'>$%2</t>",[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText];

private _mmbrs = _display displayCtrl 1500;

lbClear _mmbrs;
{
	_mmbrs lbAdd format ["%1", name _x];
	_mmbrs lbSetData [(lbSize _mmbrs)-1, str(_x)];
}count (units group player);

private _bankField = _display displayCtrl 3425;
_bankField = parseNumber(ctrlText _bankField);

switch (_mode) do {
	case 0: {
		if (BANK < _bankField) exitWith {hint "So viel Geld hast du nicht auf dem Konto!"; closeDialog 0;};
		BANK = BANK - _bankField;
		[1] call SOCK_fnc_updatePartial;
		_group setVariable ["gang_bank", _bank + _bankField];
		[1,group player] remoteExec ["TON_fnc_updateGang", 2];
		[-1, true] call  life_fnc_gangKontoMenu;
	};	

	case 1: {
		if (_bank < _bankField) exitWith {hint "So viel Geld hat die Gang nicht auf dem Konto!"; closeDialog 0;};
		BANK = BANK + _bankField;
		[1] call SOCK_fnc_updatePartial;
		_group setVariable ["gang_bank", _bank - _bankField];
		[1,group player] remoteExec ["TON_fnc_updateGang", 2];
		[-1, true] call  life_fnc_gangKontoMenu;
	};

	case 2: {
		if ((lbCurSel 1500) isEqualTo -1) exitWith {hint "Niemand wurde ausgewählt."};
		if (_bank < _bankField) exitWith {hint "So viel Geld hat die Gang nicht auf dem Konto!"; closeDialog 0;};
		private _unit = call compile format ["%1",CONTROL_DATA(1500)];
		if (isNull _unit) exitWith {};
		[_bankField] remoteExecCall ["life_fnc_gangTransferMoney", _unit];
		_group setVariable ["gang_bank", _bank - _bankField];
		[1,group player] remoteExec ["TON_fnc_updateGang", 2];
		[-1, true] call  life_fnc_gangKontoMenu;
	};
};