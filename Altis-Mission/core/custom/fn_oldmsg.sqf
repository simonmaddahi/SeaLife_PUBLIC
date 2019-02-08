/*
	Datei: fn_oldmsg.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Wird benutzt für die alten Nachrichten.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	Copyright © 2016 by Basti | John Collins
*/
_mode = _this select 0;
disableSerialization;
_display = findDisplay 3000;
_listbox = _display displayCtrl 1501;
_struc = _display displayCtrl 1100;
_msg = profileNamespace getVariable ["ZBG_Oldmsgs", []];
switch(_mode) do 
{
	case 0: {
		if (_msg isEqualTo []) exitWith {};
		_data = _listbox lbData (lbCurSel _listbox);
		_struc ctrlSetStructuredText parsetext format ["%1",_data];
		_h = ctrlTextHeight _struc;
		_w = (ctrlPosition _struc) select 2;
		_struc ctrlSetPosition [0,0,_w,_h];
		_struc ctrlCommit 0;
	};
	
	case 1: {
		if (_msg isEqualTo []) exitWith {["Nachrichten Fehler","Diesen Eintrag kannst du nicht löschen!", true, "fast"] spawn ESG_fnc_notify;};
		_msg deleteAt (lbCurSel _listbox);
		profileNamespace setVariable ["ZBG_Oldmsgs", _msg];
		[2] call ESG_fnc_oldmsg;
	};
	
	case 2: {
		lbClear _listbox;
		if (_msg isEqualTo []) exitWith 
		{
			_listbox lbadd "Keine älteren Nachrichten.";
			_listbox lbSetData [(lbSize _listbox)-1,"NULL"];
			_struc ctrlsetstructuredtext parsetext format ["Keine Nachricht vorhanden."];
		};
		{
			_msg = _x;
			_typ = _msg select 0;
			_time = _msg select 1;
			_nachricht = _msg select 2;
			_from = _msg select 3;
			_pos = _msg select 4;
			_listbox lbadd format["[%1 | %3] %2 - Pos: %4",_typ,_time,_from,_pos];
			_nachricht = format ["<t font='PuristaBold'>%1</t><br/>Von: %2<br/>Position: %3<br/><br/>", _typ, _from, _pos] + _nachricht;
			_listbox lbSetData [(lbSize _listbox)-1,_nachricht];
		}foreach _msg;
		_listbox lbSetCurSel 0;
	};
};