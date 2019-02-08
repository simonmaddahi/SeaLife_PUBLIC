#include "..\..\script_macros.hpp"
/*
    File: fn_initGang.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
*/
private ["_exitLoop","_group","_wait"];
if !(playerSide isEqualTo civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if (count life_companyData isEqualTo 0) exitWith {}; 

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
    _companyName = _x getVariable "company_name";
    if (!isNil "_companyName") then {
        _companyOwner = _x getVariable ["company_owner",""];
        _groupID = _x getVariable "company_id";
        if (_companyOwner isEqualTo "" || isNil "_companyID") exitWith {}; //Seriously?
        if ((life_companyData select 0) isEqualTo _companyID && {(life_companyData select 1) isEqualTo _companyOwner}) exitWith {_group = _x; _exitLoop = true;};
    };
} forEach allGroups;

if (!isNil "_group") then {
    [player] join _group;
    if ((life_companyData select 1) isEqualTo getPlayerUID player) then {
        _group selectLeader player;
        [player,_group] remoteExecCall ["TON_fnc_clientCompanyLeader",(units _group)];
    };
} else {
    _group = group player;
    _group setVariable ["company_id",(life_gangData select 0),true];
    _group setVariable ["company_owner",(life_gangData select 1),true];
    _group setVariable ["company_name",(life_gangData select 2),true];
    _group setVariable ["max_employers",(life_gangData select 3),true];
    _group setVariable ["company_bank",(life_gangData select 4),true];
    _group setVariable ["company_employers",(life_gangData select 5),true];
};
