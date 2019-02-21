#include "..\..\script_macros.hpp"
/*
    File: fn_ticketGive.sqf
    Author: Bryan "Tonic" Boardwine
    Modified by: Natic

    Description:
    Gives a ticket to the targeted player.
*/
private ["_val","_ticketcount"];
if (isNil "life_ticket_unit") exitWith {["Keine Person","Person für das Ticket ist nil!", true, "fast"] spawn ESG_fnc_notify;};
if (isNull life_ticket_unit) exitWith {["Keine Person","Die Person für das Ticket gibt es nicht!", true, "fast"] spawn ESG_fnc_notify;};

_val = ctrlText 2652;
_ticketcount = 0;

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

	_ticketcount = _ticketcount + 1;
	
	private ["_lvl_1","_lvl_2","_lvl_3","_lvl_4","_lvl_5"];
	
	_lvl_1 = getText(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_1","archiv");
	_lvl_2 = getText(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_2","archiv");
	_lvl_3 = getText(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_3","archiv");
	_lvl_4 = getText(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_4","archiv");
	_lvl_5 = getText(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_5","archiv");
	
	if (_ticketcount == 100) then {
	if (getNumber(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_1","needed")) then {
				lbAdd [100100, "%1",_lvl_1];
	};
	};
	if (_ticketcount == 300) then {
	if (getNumber(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_1","needed")) then {
		lbAdd [100100, "%1",_lvl_2];
	};
	};
	if (_ticketcount == 800) then {
	if (getNumber(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_1","needed")) then {
		lbAdd [100100, "%1",_lvl_3];
	};
	};
	if (_ticketcount == 2500) then {
	if (getNumber(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_1","needed")) then {
		lbAdd [100100, "%1",_lvl_4];
	};
	};
	if (_ticketcount == 5000) then {
	if (getNumber(missionConfigFile >>"cfgArchives" >> "tickets" >> "level_1","needed")) then {
		lbAdd [100100, "%1",_lvl_5];
	};
	};
