/*
	Author: Natic
	
	Description: Check it for yourself :)
*/

if((findDisplay 39472) isEqualTo displayNull) then {
	createDialog "esg_skillsystem_dialog";
};
disableSerialization;
private _display = findDisplay 39472;
private _listKlassen = _display displayCtrl 1500;

_toList = [["Reparieren", "repair"],["Stabilisieren","stabilise"],["Sammeln (Früchte)","sammeln_frucht"],["Sammeln (Erze)", "sammeln_erz"], ["Sammeln (Drogen)", "sammeln_droge"], ["Sammeln (Diverse)", "sammeln_div"],["Sammeln (Schwarzarbeit)", "sammeln_schwarz"], ["Verarbeiten (Früchte)", "ver_frucht"], ["Verarbeiten (Erze)", "ver_erz"], ["Verarbeiten (Drogen)", "ver_droge"], ["Verarbeiten (Diverse)", "ver_div"], ["Verarbeiten (Schwarzarbeit)", "ver_schwarz"], ["Aufknacken (Dietrich)", "lockpick"], ["Aufbrechen (Bolzenschneider)", "boltcutter"], ["Überleben", "survive"]];

if (playerside != civilian) then {
	_toList pushBack ["Beschlagnahmen", "impound"];
	if (playerSide isEqualTo west) then {
		_toList pushBack ["Abtasten", "abtasten"];
	} else {
		_toList pushBack ["Wiederbeleben", "revive"];
	};
};

{
	_listKlassen lbAdd format ["%1", _x select 0];
	_listKlassen lbSetData[(lbSize _listKlassen) - 1, _x select 1];
}count _toList;
_listKlassen lbSetCurSel 0;
