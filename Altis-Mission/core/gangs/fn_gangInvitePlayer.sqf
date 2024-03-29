#include "..\..\script_macros.hpp"
/*
    File: fn_gangInvitePlayer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Invites the player into the gang.
*/
private "_unit";
disableSerialization;

if ((lbCurSel 1502) isEqualTo -1) exitWith {hint localize "STR_GNOTF_SelectPerson"};
_unit = call compile format ["%1",CONTROL_DATA(1502)];

if (isNull _unit) exitWith {}; //Bad unit?
if (_unit isEqualTo player) exitWith {hint localize "STR_GNOTF_InviteSelf"};
if (!isNil {(group _unit) getVariable "gang_name"}) exitWith {hint localize "STR_GNOTF_playerAlreadyInGang";}; //Added

if (count(group player getVariable ["gang_members",8]) isEqualTo (group player getVariable ["gang_maxMembers",8])) exitWith {hint localize "STR_GNOTF_MaxSlot"};

_action = [
    format [localize "STR_GNOTF_InvitePlayerMSG",_unit getVariable ["realname",name _unit]],
    localize "STR_Gang_Invitation",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [profileName,group player, (group player getVariable ["gang_id", -1])] remoteExec ["life_fnc_gangInvite",_unit];
    _members = group player getVariable "gang_members";
    _members pushBack [getPlayerUID _unit, "", name _unit];
    group player setVariable ["gang_members",_members,true];
    hint format [localize "STR_GNOTF_InviteSent",_unit getVariable ["realname",name _unit]];
} else {
    hint localize "STR_GNOTF_InviteCancel";
};
