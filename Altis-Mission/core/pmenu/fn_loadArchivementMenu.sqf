/*
  Author: Natic | Technic-Zone.de
  Modified: Skillsystem SeaLife
  Nobody is allowed to use this Script without a License or my Permissions
*/
if((findDisplay 100100) isEqualTo displayNull) then {
	createDialog "sealife_archivements";
};
disableSerialization;
private _display = findDisplay 100100;
private _classes = _display displayCtrl 100123;

_toList = [["Einknastungen", "jail"],["Einknastungen", "jail"],["Wiederbelebungen","revived"],["Reparaturen", "repair"], ["Käufe", "buy_items"]];

if (playerside != civilian) then {
	_toList pushBack ["Reparaturen", "repair"];
	if (playerSide isEqualTo west) then {
		_toList pushBack ["Einknastungen", "jail"];
	} else {
		_toList pushBack ["Wiederbelebungen", "revived"];
	};
};

{
	_classes lbAdd format ["%1", _x select 0];
	_classes lbSetData[(lbSize _classes) - 1, _x select 1];
}count _toList;
_classes lbSetCurSel 0;
