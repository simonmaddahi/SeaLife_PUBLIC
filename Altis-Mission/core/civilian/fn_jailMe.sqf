#include "..\..\script_macros.hpp"
/*
 Author Bryan "Tonic" Boardwine
 Description:
 Once word is received by the server the rest of the jail execution is completed.
*/
private["_time","_bail","_esc","_countDown"];
params [
 ["_ret",[],[[]]],
 ["_bad",false,[false]],
 ["_time",15,[0]]
];
_time = time + (_time * 60);
if (count _ret > 0) then { life_bail_amount = (_ret select 2); } else { life_bail_amount = 1500; };
_esc = false;
_bail = false;
if(_time <= 0) then { _time = time + (15 * 60);};
[_bad,_time] spawn {
 life_canpay_bail = false;
 life_bail_amount = life_bail_amount * 5;
 if(_this select 0) then {
 sleep ( (_this select 1) * 0.5 );
 } else {
 sleep ( (_this select 1) * 0.2 );
 };
 life_canpay_bail = nil;
};
[]spawn {
	for "_i" from 0 to 1 step 0 do {
		if(!life_is_arrested) exitWith{};
		[player, getPlayerUID player]remoteExec["life_fnc_jailTimer",2];
		sleep 60;
	};
};
for "_i" from 0 to 1 step 0 do {
    if ((round(_time - time)) > 0) then {
        _countDown = [(_time - time),"MM:SS"] call BIS_fnc_secondsToString;
        hintSilent parseText format [(localize "STR_Jail_Time")+ "<br/> <t size='2'><t color='#FF0000'>%1</t></t><br/><br/>" +(localize "STR_Jail_Price")+ " $%2",_countDown,[life_bail_amount] call life_fnc_numberText];
    };

    player forceWalk true;

    private _escDist = [[["Altis", 60], ["Tanoa", 145]]] call TON_fnc_terrainSort;
    
    if ((player distance2D (getMarkerPos "jail_marker")) > 60) exitWith {
        _esc = true;
    };

    if (life_bail_paid) exitWith {
        _bail = true;
    };

    if ((round(_time - time)) < 1) exitWith {};
    if (!alive player && ((round(_time - time)) > 0)) exitWith {};
    sleep 0.1;
};
switch (true) do {
    case (_bail): {
        life_is_arrested = false;
        life_bail_paid = false;
        ["Freigelassen","Du hast deine Kaution bezahlt und bist nun frei.", false, "fast"] spawn ESG_fnc_notify;
        serv_wanted_remove = [player];
        player setPos (getMarkerPos "jail_release");
        [[getPlayerUID player], true] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        [5] call SOCK_fnc_updatePartial;
    };
    case (_esc): {
        life_is_arrested = false;
        ["Aus dem Gefängnis geflohen","Du bist aus dem Gefängnis ausgebrochen, die Polizei sucht bereits wegen deiner früheren Verbrechen und deinem Gefängnisausbruch nach dir.", false, "fast"] spawn ESG_fnc_notify;
        [0,"STR_Jail_EscapeNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        if ((random(100)) < 50) then {
            [getPlayerUID player, (player getVariable ["realname", name player]), "Gefängnisausbruch"] remoteExecCall ["life_fnc_wantedAdd",2];
        };
        [5] call SOCK_fnc_updatePartial;
    };
    case (alive player && !_esc && !_bail): {
        life_is_arrested = false;
        ["Gefängniszeit abgesessen","Du hast deine Zeit im Gefängnis abgesessen.", false, "fast"] spawn ESG_fnc_notify;
        [[getPlayerUID player], true] remoteExecCall ["life_fnc_wantedRemove",RSERV];
        player setPos (getMarkerPos "jail_release");
        [5] call SOCK_fnc_updatePartial;
    };
};
player forceWalk false; // Enable running & jumping