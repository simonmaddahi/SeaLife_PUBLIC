#include "..\..\script_macros.hpp"
/*
    File: fn_companyCreated.sqf
    Author: Bryan "Tonic" Boardwine //Copied from GangSystem
	Edit by: Natic
*/
private "_group";
life_action_gangInUse = nil;

if (BANK < (LIFE_SETTINGS(getNumber,"company_price"))) exitWith {
    hint format [localize "STR_GNOTF_NotEnoughMoney",[((LIFE_SETTINGS(getNumber,"company_price"))-BANK)] call life_fnc_numberText];
    {group player setVariable [_x,nil,true];} forEach ["company_id","company_owner","company_name","company_employers","max_employers","company_bank"];
};

BANK = BANK - LIFE_SETTINGS(getNumber,"company_price");
[1] call SOCK_fnc_updatePartial;

hint format [localize "STR_GNOTF_CreateSuccess",(group player) getVariable "company_name",[(LIFE_SETTINGS(getNumber,"company_price"))] call life_fnc_numberText];