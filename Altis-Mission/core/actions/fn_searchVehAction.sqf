#include "..\..\script_macros.hpp"
/*
    File: fn_searchVehAction.sqf
    Author:

    Description:

*/
private ["_vehicle","_data"];
_vehicle = cursorObject;
if ((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then {
    _owners = _vehicle getVariable "vehicle_info_owners";
    if (isNil "_owners") exitWith {["Lösche Fahrzeug","Über das Fahrzeug gibt es keine Informationen, es wurde vermutlich durch Cheats gespawnt. <br/><br/>Lösche Fahrzeuge.", true, "fast"] spawn ESG_fnc_notify; deleteVehicle _vehicle;};

    life_action_inUse = true;
    ["Suche...","Fahrzeug wird durchsucht", false, "fast"] spawn ESG_fnc_notify;

    sleep 3;
    life_action_inUse = false;

    if (player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {["Durchsuchung fehlgeschlagen","Das Fahrzeug konnte nicht durchsucht werden", true, "fast"] spawn ESG_fnc_notify;};
    //_inventory = [(_vehicle getVariable "vehicle_info_inv")] call fnc_veh_inv;
    //if (isNil {_inventory}) then {_inventory = "Nothing in storage."};
    _owners = [_owners] call life_fnc_vehicleOwners;

    if (_owners isEqualTo "any<br/>") then {
        _owners = "No owners, impound it";
    };
    ["Durchsuchung erfolgreich",format ["<t align='center' font='PuristaBold' underline='true'>Fahrzeughalter</t><br/><br/><t align='center'>%1</t>",_owners], false] spawn ESG_fnc_notify;
};