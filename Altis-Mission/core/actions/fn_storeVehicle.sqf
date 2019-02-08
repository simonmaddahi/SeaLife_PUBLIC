#include "..\..\script_macros.hpp"
/*
    File: fn_storeVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Stores the vehicle in the garage.
*/
private ["_nearVehicles","_vehicle"];
if (vehicle player != player) then {
    _vehicle = vehicle player;
} else {
    _nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
    if (count _nearVehicles > 0) then {
        {
            if (!isNil "_vehicle") exitWith {}; //Kill the loop.
            _vehData = _x getVariable ["vehicle_info_owners",[]];
            if (count _vehData  > 0) then {
                _vehOwner = ((_vehData select 0) select 0);
                if ((getPlayerUID player) isEqualTo _vehOwner) exitWith {
                    _vehicle = _x;
                };
            };
        } forEach _nearVehicles;
    };
};

if (isNil "_vehicle") exitWith {["Fahrzeugfehler","Es befindet sich kein Fahrzeug in der Nähe des NPC.", true, "fast"] spawn ESG_fnc_notify;};
if (isNull _vehicle) exitWith {};
if (!alive _vehicle) exitWith {["Fahrzeugfehler","Das Fahrzeug ist zerstört!", true, "fast"] spawn ESG_fnc_notify;};
if ((damage _vehicle) isEqualTo 1) exitWith {["Fahrzeugfehler","Das Fahrzeug ist zerstört!", true, "fast"] spawn ESG_fnc_notify;};

[_vehicle,false,(_this select 1),"Dein Fahrzeug wurde in die Garage gestellt!"] remoteExec ["TON_fnc_vehicleStore",RSERV];

_log = format["%1 (%2) hat %3 eingeparkt.", player getVariable["realname", name player], getPlayerUID player, str(_vehicle)];
["VEHICLE_STORE_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];

["Fahrzeug wird eingeparkt","Der Server versucht, das Fahrzeug zu speichern...", false, "fast"] spawn ESG_fnc_notify;
life_garage_store = true;
