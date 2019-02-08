#include "..\..\script_macros.hpp"
/*
    File: fn_gangInvitePlayer.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
*/
private "_unit";
disableSerialization;

if ((lbCurSel 2632) isEqualTo -1) exitWith {hint localize "STR_GNOTF_SelectPerson"};
_unit = call compile format ["%1",CONTROL_DATA(2632)];

if (isNull _unit) exitWith {}; //Bad unit?
if (_unit == player) exitWith {hint localize "STR_GNOTF_InviteSelf"};
if (!isNil {(group _unit) getVariable "company_name"}) exitWith {hint localize "STR_GNOTF_playerAlreadyInGang";}; //Added

if (count(group player getVariable ["company_employers",8]) == (group player getVariable ["max_employers",8])) exitWith {hint localize "STR_GNOTF_MaxSlot"};

_action = [
    format [localize "STR_GNOTF_InvitePlayerMSG",_unit getVariable ["realname",name _unit]],
    localize "STR_Gang_Invitation",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [profileName,group player] remoteExec ["life_fnc_companyInvite",_unit];
    _members = group player getVariable "company_employers";
    _members pushBack getPlayerUID _unit;
    group player setVariable ["company_employers",_members,true];
    hint format [localize "STR_GNOTF_InviteSent",_unit getVariable ["realname",name _unit]];
} else {
    hint localize "STR_GNOTF_InviteCancel";
};
