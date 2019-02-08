/*
    File: fn_ticketAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the ticketing process.
*/
params [
    ["_unit",objNull,[objNull]]
];
disableSerialization;
if (!(createDialog "life_ticket_give")) exitWith {["Strafzettel Fehlerr","Es ist ein unbekannter Fehler aufgetreten.", true, "fast"] spawn ESG_fnc_notify;};
if (isNull _unit || !isPlayer _unit) exitWith {};
life_ticket_unit = _unit;