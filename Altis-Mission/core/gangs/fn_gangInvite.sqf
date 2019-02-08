#include "..\..\script_macros.hpp"
/*
    File: fn_gangInvite.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Prompts the player about an invite.
*/
private ["_action","_grpMembers"];
params [
    ["_name","",[""]],
    ["_group",grpNull,[grpNull]],
    ["_id", -1, [1]]
];

if (_name isEqualTo "" || isNull _group) exitWith {}; //Fail horn anyone?
if (!isNil {(group player) getVariable "gang_name"}) exitWith {hint localize "STR_GNOTF_AlreadyInGang";};

_gangName = _group getVariable "gang_name";
_action = [
    format [localize "STR_GNOTF_InviteMSG",_name,_gangName],
    localize "STR_Gang_Invitation",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
    [player] join _group;

    [4, _group] remoteExecCall ["TON_fnc_updateGang",RSERV];
    player setVariable ["gang_rank",[],true];
    player setVariable ["realname", format ["[%1] %2", _group getVariable ["gang_tag", ""], profileName], true];
    [10, _id] call SOCK_fnc_updatePartial;
} else {
    _grpMembers = group player getVariable "gang_members";
    _index = [getPlayerUID player, _grpMembers]call TON_fnc_Index;
    _grpMembers deleteAt _index;
    group player setVariable ["gang_members",_grpMembers,true];
    [4, _grpMembers] remoteExecCall ["TON_fnc_updateGang",RSERV];
};