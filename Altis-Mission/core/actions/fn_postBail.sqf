#include "..\..\script_macros.hpp"
/*
    File: fn_postBail.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when the player attempts to post bail.
    Needs to be revised.
*/
private ["_unit"];
_unit = param [1,objNull,[objNull]];
if (life_bail_paid) exitWith {};
if (isNil "life_bail_amount") then {life_bail_amount = 3500;};
if (!life_canpay_bail) exitWith {["Aktion abgebrochen","Du musst mindestens 3 Minuten lang im Gefängnis bleiben, bevor du die Kaution beantragen kannst.", true, "fast"] spawn ESG_fnc_notify;};
if (BANK < life_bail_amount) exitWith {["Nicht genug Geld",format ["Du hast keine $%1 auf deinem Bankkonto, um die Kaution zu bezahlen.",life_bail_amount], true, "fast"] spawn ESG_fnc_notify;};

BANK = BANK - life_bail_amount;
life_bail_paid = true;
[1] call SOCK_fnc_updatePartial;
[0,"STR_NOTF_Bail_Bailed",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];