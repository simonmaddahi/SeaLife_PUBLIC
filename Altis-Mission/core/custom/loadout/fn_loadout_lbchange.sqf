/*
	Datei: fn_loadout_lbchange.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	LB Eventhandler.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©2017 by Basti | John Collins
*/
disableSerialization;
_lb = ((findDisplay 3333) displayCtrl 1500);
private _check = ((_lb lbData (lbCurSel _lb)) isEqualTo "[]");
_name = ((findDisplay 3333) displayCtrl 1400);
_preis = ((findDisplay 3333) displayCtrl 1404);
_name ctrlsettext format ["%1",[((ESG_loadout select (lbCursel _lb)) select 1), "Kein Name"] select _check];
_preis ctrlsettext format ["Preis: %1",if(_check) then {"Nicht verfügbar"}else{((ESG_loadout select (lbCursel _lb)) select 2) + "$"}];
if (_check) then {
	ctrlEnable [2402, false];
} else {
	ctrlEnable [2402, true];
	if(life_atmbank < ((ESG_loadout select (lbCursel _lb)) select 2)) then {
		_preis ctrlSetTextColor [1,0,0,1];
	};
};