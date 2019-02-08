#include "..\..\script_macros.hpp"
/*
    File: fn_questionDealer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Questions the drug dealer and sets the sellers wanted.
*/
private ["_sellers","_crimes","_names"];
_sellers = (_this select 0) getVariable ["sellers",[]];
if (count _sellers isEqualTo 0) exitWith {["Drogenumschlagplatz","Informant: ""Niemand hat hier kürzlich etwas verkauft"".", false, "fast"] spawn ESG_fnc_notify;}; //No data.
life_action_inUse = true;
_crimes = LIFE_SETTINGS(getArray,"crimes");

_names = "";
{
    [(_x select 0),(_x select 1),"Drogenverkauf"] remoteExecCall ["life_fnc_wantedAdd",RSERV];
    _names = _names + format ["%1<br/>",(_x select 1)];
} forEach _sellers;

hint parseText format [(localize "STR_Cop_DealerMSG")+ "<br/><br/>%1",_names];
["Drogenumschlagplatz",format ["Die folgenden Leute haben kürzlich an diesen Dealer verkauft:<br/><br/>%1", _names], false, ""] spawn ESG_fnc_notify;
(_this select 0) setVariable ["sellers",[],true];
life_action_inUse = false;
