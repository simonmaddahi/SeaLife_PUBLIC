/*
	Author: Basti | John Collins
*/

params [
	["_displayIDD", -1, [1]],
	["_listboxIDC", -1, [1]],
	["_editText", "", [""]],
	["_conditions", "", [""]]
];

if (_displayIDD isEqualTo -1 || {_listboxIDC isEqualTo -1} || {_editText isEqualTo ""}) exitWith {};

disableSerialization;
private _display = findDisplay _displayIDD;
if (isNull _display) exitWith {};

private _listbox = _display displayCtrl _listboxIDC;

private _gesuchtespieler = [];
private _sortiert = [];
private _check = if (_conditions isEqualTo "") then {true} else {call compile _conditions;};

{
	if([_editText,_x getVariable ["realname",name _x]]call bis_fnc_instring) then
	{
		if (alive _x && _x != player) then {
			if (_check) then {
				_gesuchtespieler pushback _x;
			};
		};
	};
}foreach playableUnits;

_sortiert = [_gesuchtespieler,[],{_x},"ASCEND"] call BIS_fnc_sortBy;


lbClear _listbox;
{
	private _side = switch (side _x) do {case west: {"Polizei"}; case civilian : {"Zivilist"}; case independent: {"Rettungsdienst"}; default {"Unknown"};};
	_listbox lbAdd format ["%1 - %2", (_x getVariable ["realname", name _x]),_side];
    _listbox lbSetdata [(lbSize _listbox)-1,str(_x)];
} forEach _sortiert;

if ((lbSize _listbox) < 1) then {
	_listbox lbAdd format ["Keine Personen gefunden."];
};