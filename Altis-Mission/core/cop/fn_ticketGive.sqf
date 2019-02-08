#include "..\..\script_macros.hpp"
/*
    File: fn_ticketGive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gives a ticket to the targeted player.
*/
private ["_val"];
if (isNil "life_ticket_unit") exitWith {["Keine Person","Person für das Ticket ist nil!", true, "fast"] spawn ESG_fnc_notify;};
if (isNull life_ticket_unit) exitWith {["Keine Person","Die Person für das Ticket gibt es nicht!", true, "fast"] spawn ESG_fnc_notify;};

_val = ctrlText 2652;

if (!([_val] call TON_fnc_isnumber)) exitWith {["Keine Zahl","Du hast keine echte Zahl eingegeben!", true, "fast"] spawn ESG_fnc_notify;};
if ((parseNumber _val) > 500000) exitWith {["Zu hohes Bußgeld","Strafzettel können nicht mehr als $500.000 betragen!", true, "fast"] spawn ESG_fnc_notify;};
if (playerside isEqualTo west)then {
	[0,"STR_Cop_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable ["realname",name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
}
else
{
	[0,"STR_Med_TicketGive",true,[profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable ["realname",name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
};
[player,(parseNumber _val)] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];
closeDialog 0;
