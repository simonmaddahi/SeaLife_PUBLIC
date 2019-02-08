#include "..\..\script_macros.hpp"
/*
    File: fn_inventoryClosed.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    1 : Used for syncing house container data but when the inventory menu
    is closed a sync request is sent off to the server.
    2 : Used for syncing vehicle inventory when save vehicle gear are activated
*/
private "_container";
_container = param [1,objNull,[objNull]];
if (isNull _container) exitWith {}; //MEH

_container setVariable ["ESG_ContUse", objNull, true];

if ((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
    [_container] remoteExecCall ["TON_fnc_updateHouseContainers",RSERV];
};

if ((_container isKindOf "Car") || (_container isKindOf "Air") || (_container isKindOf "Ship")) then {
    [_container,1] remoteExecCall ["TON_fnc_vehicleUpdate",RSERV];
};
[] call SOCK_fnc_updateRequest;
[]call life_fnc_playerSkins;