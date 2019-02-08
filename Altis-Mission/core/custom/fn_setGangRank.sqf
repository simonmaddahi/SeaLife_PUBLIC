#include "..\..\script_macros.hpp"
/*
	Written by Basti | John Collins
*/
disableSerialization;

if ((lbCurSel 2621) isEqualTo -1) exitWith {hint "Kein Mitglied ausgesucht!"};
if ((lbCurSel 1556) isEqualTo -1) exitWith {hint "Keinen Rang ausgesucht!"};
if((lbCurSel 1556) >= (player getVariable["gangRank",0]))exitWith{hint "Du kannst den Rang nicht höher als dein eigenen Rang setzen!"};
if((lbCurSel 1556) isEqualTo 4)exitWith{hint "Es kann nur einen Anführer geben!"};
_unit = call compile format ["%1",CONTROL_DATA(2621)];
if(((lbCurSel 1556) isEqualTo 4) && ((_unit getVariable["gangRank",0]) isEqualTo 4))exitWith{hint "Der Anführer wird nicht degradiert!"};

_unit setvariable ["gangrank", (lbCurSel 1556), true];
[10] remoteexec ["SOCK_fnc_updatePartial", _unit];
hint format["Du hast erfolgreich %1 auf den Rang %2 beförder/degradiert!", _unit getVariable ["realname", name _unit], (lbCurSel 1556)];