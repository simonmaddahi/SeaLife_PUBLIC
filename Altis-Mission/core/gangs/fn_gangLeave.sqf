#include "..\..\script_macros.hpp"
/*
    File: fn_gangLeave.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    32 hours later...
*/
private ["_unitID ","_members"];
if (getPlayerUID player isEqualTo (group player getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_unitID = getPlayerUID player;
_members = group player getVariable "gang_members";
if (isNil "_members") exitWith {};
if (!(_members isEqualType [])) exitWith {};

_membersIndex = [_unitID, _members] call TON_fnc_index;
_members deleteAt _membersIndex;
group player setVariable ["gang_members", _members, true];

[player,group player] remoteExec ["TON_fnc_clientGangLeft",player];
[4,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
player setVariable["gang_rank", nil, true];
player setVariable ["realname", profileName, true];
[10, -1] call SOCK_fnc_updatePartial;

closeDialog 0;
