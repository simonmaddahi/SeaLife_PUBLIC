#include "..\..\script_macros.hpp"
/*
    File: fn_wantedAddP.sqf
    Author:

    Description:

*/
if !(playerSide isEqualTo west) exitWith {hint localize "STR_Cop_wantedList_notCop";};
if ((lbCurSel 1502) isEqualTo -1) exitWith {hint localize "STR_Cop_wantedList_noPlayerSelected";};
if ((ctrlText 1401) isEqualTo "") exitWith {hint localize "STR_Cop_wantedList_noCrimeSelected";};
private _unit = lbData [1502,lbCurSel 1502];
_unit = call compile format ["%1", _unit];
private _text = ctrlText 1401;
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

if !((_text find ":") isEqualTo -1) exitWith {["Fehler", "Das Zeichen "":"" ist nicht erlaubt!", true, "fast"]spawn ESG_fnc_notify;};
	
["Fahndungsliste", format ["<t size='1.5' align='center' font='TahomaB'>Fahndung</t><br/><br/><t align='center' font='PuristaBold'>Gefahndete Person:</t><br/><t align='left'>%1</t><br/><br/><t align='center' font='PuristaBold'>Verbrechen:</t><br/><t align='left'>%2</t><br/><br/><t align='center' font='PuristaBold'>Ausgeschrieben von:</t><br/><t align='left'>%3</t>",_unit getVariable ["realname",name _unit],_text,player getVariable ["realname",name player]], false] remoteExecCall ["ESG_fnc_notify", west];
[getPlayerUID _unit,_unit getVariable ["realname",name _unit],format ["%1 (%2)",_text, (player getVariable ["realname", name player])]] remoteExecCall ["life_fnc_wantedAdd",RSERV];