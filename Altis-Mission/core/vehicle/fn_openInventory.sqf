#include "..\..\script_macros.hpp"
/*
    File: fn_openInventory.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the initialization of vehicle virtual inventory menu.
*/
private ["_vehicle","_veh_data"];
if (dialog) exitWith {};
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _vehicle || !(_vehicle isKindOf "Car" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship" || _vehicle isKindOf "Box_IND_Grenades_F" || _vehicle isKindOf "B_supplyCrate_F")) exitWith {}; //Either a null or invalid vehicle type.
if ((_vehicle getVariable ["trunk_in_use",false])) exitWith {closeDialog 0; hint localize "STR_MISC_VehInvUse"};
if !((_vehicle getVariable ["trunk_in_use_by", objNull]) isEqualTo objNull) exitWith {closeDialog 0; hint format ["%1 greift bereits auf das Inventar zu.", (_vehicle getVariable["trunk_in_use_by", objNull]) getVariable ["realname","ERROR: NO UNIT"]];};
_vehicle setVariable ["trunk_in_use",true,true];
_vehicle setVariable ["trunk_in_use_by",player,true];
if (!createDialog "TrunkMenu") exitWith {hint localize "STR_MISC_DialogError";}; //Couldn't create the menu?
disableSerialization;

_veh_data = [_vehicle] call life_fnc_vehicleWeight;

if (_veh_data select 0 isEqualTo -1) exitWith {closeDialog 0; _vehicle setVariable ["trunk_in_use",false,true]; hint localize "STR_MISC_NoStorageVeh";};

if (_vehicle isKindOf "Box_IND_Grenades_F" || _vehicle isKindOf "B_supplyCrate_F") then {
    ctrlSetText[3501,format [(localize "STR_MISC_HouseStorage")+ " - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
    ctrlSetText[3501,format ["%1 - %2/%3",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"),_veh_data select 1,_veh_data select 0]];
};
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn {
    waitUntil {isNull (findDisplay 3500)};
    _this setVariable ["trunk_in_use",false,true];
    _this setVariable ["trunk_in_use_by",objNull,true];
    if (_this isKindOf "Box_IND_Grenades_F" || _this isKindOf "B_supplyCrate_F") then {
		[_this] remoteExecCall ["TON_fnc_updateHouseTrunk",2];
    };
};

_vehicle spawn {
    waitUntil {isNull (findDisplay 3500)};
    _this setVariable ["trunk_in_use",false,true];
    _this setVariable ["trunk_in_use_by",objNull,true];
    if ((_this isKindOf "Car") || (_this isKindOf "Air") || (_this isKindOf "Ship")) then {
        [] call SOCK_fnc_updateRequest;
        [_this,2] remoteExecCall ["TON_fnc_vehicleUpdate",2];
    };
};
