#include "..\..\script_macros.hpp"
/*
    File: fn_gangMenu.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
*/
private ["_ownerID","_companyBank","_companyMax","_companyName","_members","_allUnits","_ctrl"];
disableSerialization;
if (isNull (findDisplay 2620)) then {
    if (!(createDialog "Life_My_Company_Diag")) exitWith {}; 
};

_ownerID = group player getVariable ["company_owner",""];
if (_ownerID isEqualTo "") exitWith {closeDialog 0;}; 

_companyName = group player getVariable "companyName";
_companyBank = GANG_FUNDS;
_companyMax = group player getVariable "max_employers";

if !(_ownerID isEqualTo getPlayerUID player) then {
    (CONTROL(2620,2622)) ctrlEnable false; //Upgrade
    (CONTROL(2620,2624)) ctrlEnable false; // Kick
    (CONTROL(2620,2625)) ctrlEnable false; //Set New Leader
    (CONTROL(2620,2630)) ctrlEnable false; //Invite Player
    (CONTROL(2620,2631)) ctrlEnable false; //Disband Gang
};

(CONTROL(2620,2629)) ctrlSetText _companyName;
(CONTROL(2620,601)) ctrlSetText format [(localize "STR_GNOTF_Funds")+ " $%1",[_companyBank] call life_fnc_numberText];

//Loop through the players.
_members = CONTROL(2620,2621);
lbClear _members;
{
    if ((getPlayerUID _x) == _ownerID) then {
        _members lbAdd format ["%1 " +(localize "STR_GNOTF_GangLeader"),(_x getVariable ["realname",name _x])];
        _members lbSetData [(lbSize _members)-1,str(_x)];
    } else {
        _members lbAdd format ["%1",(_x getVariable ["realname",name _x])];
        _members lbSetData [(lbSize _members)-1,str(_x)];
    };
} forEach (units group player);

_grpMembers = units group player;
_allUnits = playableUnits;

//Clear out the list..
{
    if (_x in _grpMembers || !(side _x isEqualTo civilian) && isNil {(group _x) getVariable "company_id"}) then {
        _allUnits deleteAt _forEachIndex;
    };
} forEach _allUnits;

_ctrl = CONTROL(2620,2632);
lbClear _ctrl; //Purge the list
{
    _ctrl lbAdd format ["%1",_x getVariable ["realname",name _x]];
    _ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} forEach _allUnits;
