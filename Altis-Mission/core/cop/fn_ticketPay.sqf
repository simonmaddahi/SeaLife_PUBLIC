#include "..\..\script_macros.hpp"
/*
    File: fn_ticketPay.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pays the ticket.
*/
if (isNil "life_ticket_val" || isNil "life_ticket_cop") exitWith {};
if (CASH < life_ticket_val) exitWith {
    if (BANK < life_ticket_val) exitWith {
        ["Nicht genug Geld","So viel Geld hast du nicht auf deinem Bankkonto.", true, "fast"] spawn ESG_fnc_notify;
        [1,"STR_Cop_Ticket_NotEnoughNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
        closeDialog 0;
    };

    ["Strafzettel bezahlt",format ["Du hast den Strafzettel von $%1 bezahlt",[life_ticket_val] call life_fnc_numberText], false, "fast"] spawn ESG_fnc_notify;
    BANK = BANK - life_ticket_val;
    [1] call SOCK_fnc_updatePartial;
    life_ticket_paid = true;
	if(side life_ticket_cop in [independent,east]) then {
		[0,format["%1 zahlte die Rechnung von $%2",profileName,[life_ticket_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",independent];
		[1,format["%1 hat die Rechnung bezahlt.",profileName]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
	} else {
		[0,"STR_Cop_Ticket_PaidNOTF",true,[profileName,[life_ticket_val] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];
		[1,"STR_Cop_Ticket_PaidNOTF_2",true,[profileName]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
		[[getPlayerUID player], true] remoteExecCall ["life_fnc_wantedRemove",RSERV];
	};
    [life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];
    closeDialog 0;
};

CASH = CASH - life_ticket_val;
[0] call SOCK_fnc_updatePartial;
life_ticket_paid = true;
closeDialog 0;