#include "..\..\script_macros.hpp"
/*
    File: fn_serviceChopper.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for the chopper service paid, to be replaced in later version.
*/
private ["_serviceCost"];
disableSerialization;
private ["_search","_ui","_progress","_cP","_pgText"];
if (life_action_inUse) exitWith {["Aktion abgebrochen","Du kannst das nicht tun, während du in einem Fahrzeug sitzt!", true, "fast"] spawn ESG_fnc_notify;};

_serviceCost = LIFE_SETTINGS(getNumber,"service_chopper");
_search = nearestObjects[getPos air_sp, ["Air"],10];

if (count _search isEqualTo 0) exitWith {["Aktion abgebrochen","Es ist kein Helikopter auf dem Landeplatz.", true, "fast"] spawn ESG_fnc_notify;};
if (CASH < _serviceCost) exitWith {["Zu wenig Geld","Du benötigst $1,000, um deinen Helikopter zu warten.", true, "fast"] spawn ESG_fnc_notify;};

life_action_inUse = true;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format [localize "STR_Service_Chopper_Servicing","waiting..."];
_progress progressSetPosition 0.01;
_cP = 0.01;
_t2 = "Fertig";
for "_i" from 0 to 1 step 0 do {
    sleep  0.2;
    _cP = _cP + 0.01;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format [localize "STR_Service_Chopper_Servicing",round(_cP * 100)];
    if (_cP >= 1) exitWith {};
	if(player getVariable["esg_bewusstlos",false])exitWith {_t2 = "Abgebrochen";};
};

if (!alive (_search select 0) || (_search select 0) distance air_sp > 15) exitWith {life_action_inUse = false; ["Aktion abgebrochen","Das Fahrzeug wurde zerstört oder befindet sich nicht mehr auf dem Helikopterlandeplatz!", true, "fast"] spawn ESG_fnc_notify; _t2 = "Abgebrochen";};
if(player getVariable["esg_bewusstlos",false])exitWith {life_action_inUse = false;};

CASH = CASH - _serviceCost;
if (!local (_search select 0)) then {
    [(_search select 0),1] remoteExecCall ["life_fnc_setFuel",(_search select 0)];
} else {
    (_search select 0) setFuel 1;
};

(_search select 0) setDamage 0;

for "_i" from 0 to 1 step 0 do {
	sleep .0006;
	_cP = _cP - .01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format ["%1 (%2)",_title,_t2];
	if (_cP <= 0 || !alive player) exitWith {};
};
"progressBar" cutFadeOut 1;
titleText [localize "STR_Service_Chopper_Done","PLAIN"];
life_action_inUse = false;
