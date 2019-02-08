/*
	Datei: fn_getLoadout.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Füllt die Listbox für die Loadouts.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©2017 by Basti | John Collins
*/
disableSerialization;
_lb = ((findDisplay 3333) displayCtrl 1500);

private _lo1 = ESG_loadout select 0;

private _lO2 = ESG_loadout select 1;

private _lO3 = ESG_loadout select 2;


_lb lbAdd format ["%1 - Slot 1",[_lo1 select 1, "Nicht belegt"] select (_lo1 isEqualTo [])];
_lb lbSetData[(lbSize _lb) - 1, str(_lO1)];

_lb lbAdd format ["%1 - Slot 2", [_lo2 select 1, "Nicht belegt"] select (_lo2 isEqualTo [])];
_lb lbSetData[(lbSize _lb) - 1, str(_lO2)];

_lb lbAdd format ["%1 - Slot 3", [_lo3 select 1, "Nicht belegt"] select (_lo3 isEqualTo [])];
_lb lbSetData[(lbSize _lb) - 1, str(_lO3)];

_lb lbsetCurSel 0;