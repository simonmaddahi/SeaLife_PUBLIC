#include "..\..\script_macros.hpp"
/*
    File: fn_gangNewLeader.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Something about being a quitter.
*/
private ["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if ((lbCurSel 1501) isEqualTo -1) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format ["%1",CONTROL_DATA(1501)];

//if (isNull _unit) exitWith {}; //Bad unit?

_unitID = _unit;
if (_unitID isEqualTo (getPlayerUID player)) exitWith {hint localize "STR_GNOTF_TransferSelf"};

_unit = [_unitID] call life_fnc_UIDToObj;

if (_unit isEqualTo objNull) then {
    _action = [
        format ["Möchtest du den Spieler %1, als neuen Gruppierungschef bestimmen?", _unitID],
        localize "STR_Gang_Transfer",
        localize "STR_Global_Yes",
        localize "STR_Global_No"
    ] call BIS_fnc_guiMessage;

    if (_action) then {
        if (_unitID isEqualTo "") exitWith {hint localize "STR_GNOTF_badUID";}; //Unlikely?
        group player setVariable ["gang_owner",_unitID,true];
        //group player selectLeader _unit;
        //[_unit,group player] remoteExec ["TON_fnc_clientGangLeader",_unit]; //Boot that bitch!
        [3, group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
    } else {
        hint localize "STR_GNOTF_TransferCancel";
    };
} else {
    _action = [
        format [localize "STR_GNOTF_TransferMSG",name _unit],
        localize "STR_Gang_Transfer",
        localize "STR_Global_Yes",
        localize "STR_Global_No"
    ] call BIS_fnc_guiMessage;

    if (_action) then {
        if (_unitID isEqualTo "") exitWith {hint localize "STR_GNOTF_badUID";}; //Unlikely?
        group player setVariable ["gang_owner",_unitID,true];
        group player selectLeader _unit;
        [_unit,group player] remoteExec ["TON_fnc_clientGangLeader",_unit]; //Boot that bitch!
        [3,group player] remoteExec ["TON_fnc_updateGang",RSERV]; //Update the database.
    } else {
        hint localize "STR_GNOTF_TransferCancel";
    };
};

call life_fnc_gangMenu;