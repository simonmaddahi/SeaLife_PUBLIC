/*
	Autor: Basti [& Natic]
	File: fn_fmsMain.sqf
	
	This File was written for Eastside-Gaming.de you are not allowed to use this file!
*/
createDialog "fms_system";
disableSerialization;
_display = findDisplay 39400;
_tree = _display displayCtrl 1500;
_array = [];
switch (playerSide) do {
	case west: {
		_array = [
		  [[],"Zentrale - Leitstelle","ZL"],
		  [[],"Zentrale - Juliet Ost","ZJO"],
		  [[],"Zentrale - Juliet West","SDL"],
		  [[],"Schutzpolizei","space"],
		  [[],"Landesschutzdienst","space"],
		  [[],"Zivilpolizei ","space"],
		  [[],"Sondereinsatz","space"],
		  [[1],"Streife 10-01","SO_1"],
		  [[1],"Streife 10-02","SO_2"],
		  [[1],"Streife 10-03","SO_3"],
		  [[1],"Streife 20-01","GZ_1"],
		  [[1],"Streife 20-02","GZ_2"],
		  [[1],"Streife 30-01","PYR_1"],
		  [[1],"Streife 30-02","PYR_2"],
		  [[1],"Streife 40-01","HWP_1"],
		  [[1],"Streife 40-02","HWP_2"],
		  [[2],"Streife 50-01","Alpha_1"],
		  [[2],"Streife 50-02","Alpha_2"],
		  [[2],"Streife 50-03","Alpha_3"],
		  [[2],"Streife 50-04","Alpha_4"],
		  [[3],"Zivilpolizei","ZivPol_1"],	  
		  [[4],"Sondereinsatz", "SONDER_1"],
		  [[],"Nicht eingeloggt","not"]
		];
	};
	case independent: {
		_array = [
		  [[],"Einsatzleitung","el_medic"],
		  [[],"Kavala","space"],
		  [[],"Flughafen","space"],
		  [[],"Pyrgos","space"],
		  [[],"Sofia","space"],
		  [[1],"Truppe Alpha","ALPHA"],
		  [[1],"Truppe Bravo","BRAVO"],
		  [[2],"Truppe Charlie","CHARLIE"],
		  [[2],"Truppe Delta","DELTA"],
		  [[2],"Truppe Echo","ECHO"],
		  [[3],"Truppe Foxtrot","FOXTROT"],
		  [[3],"Truppe Golf","GOLF"],
		  [[4],"Truppe Hotel","HOTEL"],
		  [[4],"Truppe India","INDIA"],
		  [[],"Nicht eingeloggt","not_medic"]
		];
	};
	case east: {
		_array = [
		  [[],"Einsatzleitung","el_medic"],
		  [[],"Einsatzgebiet Kavala","space"],
		  [[],"Einsatzgebiet Athira","space"],
		  [[],"Einsatzgebiet Sofia","space"],
		  [[],"Einsatzgebiet Pyrgos","space"],
		  [[],"Einsatzgebiet Luftstreife","space"],
		  [[1],"Kavala","kavala_medic"],
		  [[2],"Athira","athira_medic"],
		  [[3],"Sofia","sofia_medic"],
		  [[4],"Pyrgos","pyrgos_medic"],
		  [[5],"Luftstreife","luft_medic"],
		  [[],"Nicht eingeloggt","not_medic"]
		];
	};
};
tvClear _tree;
{
  _index = _tree tvAdd [(_x select 0),(_x select 1)];
  _temp = (_x select 0);
  _temp pushback _index;
  _tree tvSetData [_temp,(_x select 2)];
}foreach _array;
tvExpandAll _tree;
_tree tvSetCurSel [0];
