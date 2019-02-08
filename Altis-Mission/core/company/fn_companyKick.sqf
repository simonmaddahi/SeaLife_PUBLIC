#include "..\..\script_macros.hpp"
/*
    File: fn_gangKick.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
*/
private ["_unit","_unitID","_members"];
disableSerialization;

if ((lbCurSel 2621) isEqualTo -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format ["%1",CONTROL_DATA(2621)];

if (isNull _unit) exitWith {}; //Bad unit?
if (_unit == player) exitWith {hint localize "STR_GNOTF_KickSelf"};

_unitID = getPlayerUID _unit;
_members = group player getVariable "company_employers";
if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

_members = _members - [_unitID];
group player setVariable ["company_employers",_members,true];

[_unit,group player] remoteExec ["TON_fnc_clientGangKick",_unit]; 

if (life_HC_isActive) then {
    [4,group player] remoteExec ["HC_fnc_updateCompany",HC_Life]; 
} else {
    [4,group player] remoteExec ["TON_fnc_updateCompany",RSERV]; 
};

[] call life_fnc_companyMenu;
