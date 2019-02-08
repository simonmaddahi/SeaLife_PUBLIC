#include "..\..\script_macros.hpp"
/*
    File: fn_createGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls up the menu and creates the gang with the name the user enters in.
*/
disableSerialization;

private _gangName = ctrlText (CONTROL(2520,2522));
private _gangTag = ctrlText (CONTROL(2520,1401));
private _lengthName = count (toArray(_gangName));
private _lengthTag = count (toArray(_gangTag));
_chrByte = toArray (_gangTag);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ");
if (_lengthName > 32) exitWith {hint localize "STR_GNOTF_Over32"};
if (_lengthTag > 6) exitWith {hint "Dein Gangtag darf maximal 6 Buchstaben enthalten!"};
_badChar = false;
{if (!(_x in _allowed)) exitWith {_badChar = true;};} forEach _chrByte;
if (_badChar) exitWith {hint localize "STR_GNOTF_IncorrectChar";};
if (BANK < 150000) exitWith {hint format [localize "STR_GNOTF_NotEnoughMoney",[(150000 - BANK)] call life_fnc_numberText];};

[player,getPlayerUID player,_gangName,_gangTag] remoteExec ["TON_fnc_insertGang",RSERV];

hint localize "STR_NOTF_SendingData";
closeDialog 0;
life_action_gangInUse = true;
