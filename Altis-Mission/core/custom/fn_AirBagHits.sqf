/*
Author : Natic 
Created : 03.01.2019
File : fn_AirBagHits.sqf
Description : handle the Damage with the AirBag Item
*/
private ["_vel","_dir","_hit"];
_vehicle = vehicle player;

if (_vehicle == player) exitWith {};
if (driver _vehicle != player) exitWith {};

if ((_vehicle getVariable ["airbag",0]) < 1) exitWith {
		["Du hast keinen AirBag", true, "fast"] spawn ESG_fnc_notify;
};

if ((speed _vehicle) < 40) exitWith {
	natic_airbag = false;
};

else {
	natic_airbag = true;

if ((vehicle _unit) isKindOf "Car" && (isNull _source || _source isEqualTo _unit)) then
{
 _damage = if (natic_airbag) then { _damage / 2 } else { _damage};
	
	};
};
