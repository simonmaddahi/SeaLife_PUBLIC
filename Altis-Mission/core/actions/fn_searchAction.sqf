/*
    File: fn_searchAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the searching process.
*/
params [
    ["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};
hint localize "STR_NOTF_Searching";
sleep 2;
if (player distance _unit > 5 || !alive player || !alive _unit) exitWith {["Aktion abgebrochen","Diese Person kann nicht durchsucht werden.", true, "fast"] spawn ESG_fnc_notify;};
[player] remoteExec ["life_fnc_searchClient",_unit];
life_action_inUse = true;