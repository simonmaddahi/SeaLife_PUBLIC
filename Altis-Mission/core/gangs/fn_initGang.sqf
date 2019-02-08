#include "..\..\script_macros.hpp"
/*
    File: fn_initGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main initialization for gangs.
*/
private ["_exitLoop","_group","_wait"];
if (playerSide != civilian) exitWith {}; //What in the hell?
[player] join (createGroup civilian);
if (count life_gangData isEqualTo 0) exitWith {}; //Dafuq?

_wait = round(random(8));
sleep _wait;

//Loop through to make sure there is not a group already created with the gang.
_exitLoop = false;
{
    _groupName = _x getVariable "gang_name";
    if (!isNil "_groupName") then {
        _groupOwner = _x getVariable ["gang_owner",""];
        _groupID = _x getVariable "gang_id";
        if (_groupOwner isEqualTo "" || isNil "_groupID") exitWith {}; //Seriously?
        if ((life_gangData select 0) isEqualTo _groupID && {(life_gangData select 1) isEqualTo _groupOwner}) exitWith {_group = _x; _exitLoop = true;};
    };
} forEach allGroups;

if (!isNil "_group") then {
    [player] join _group;
    if ((life_gangData select 1) isEqualTo getPlayerUID player) then {
        _group selectLeader player;
        [player,_group] remoteExecCall ["TON_fnc_clientGangLeader",(units _group)];
        player setVariable ["realname", format ["[%1] %2", (life_gangData select 3), profileName], true];
        //Rang für Leader setzen
        //player setVariable["gangrank", 4, true];
        //[10] call SOCK_fnc_updatePartial;
    };
} else {
    _group = group player;
    _group setVariable ["gang_id",(life_gangData select 0),true];
    _group setVariable ["gang_owner",(life_gangData select 1),true];
    _group setVariable ["gang_name",(life_gangData select 2),true];
    _group setVariable ["gang_tag",(life_gangData select 3),true];
    _group setVariable ["gang_maxMembers",(life_gangData select 4),true];
    _group setVariable ["gang_bank",(life_gangData select 5),true];
    _group setVariable ["gang_members",(life_gangData select 6),true];
    _group setVariable ["gang_ranks",(life_gangData select 7),true];
    _group setVariable ["gang_house",(life_gangData select 8),true];
    _group setGroupIdGlobal [format ["%1", (life_gangData select 3)]];
    player setVariable ["realname", format ["[%1] %2", (life_gangData select 3), profileName], true];
};

private _playerIn = [getPlayerUID player, _group getVariable ["gang_members",[]]]call TON_fnc_Index;
_playerIn = (_group getVariable ["gang_members",[]]) select _playerIn;
private _rightIn = [_playerIn select 1, _group getVariable ["gang_ranks", []]]call TON_fnc_Index;
if !(_rightIn isEqualTo -1) then {
    _rightIn = (_group getVariable ["gang_ranks",[]]) select _rightIn;
    player setVariable ["gang_rank", _rightIn, true];
} else {
    player setVariable ["gang_rank", [], true];
};

[10, _group getVariable ["gang_id", -1]] call SOCK_fnc_updatePartial;