#include "..\..\script_macros.hpp"
/*
    File: fn_pardon.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pardons the selected player.
*/
private ["_display","_list"];
disableSerialization;
if (playerSide != west) exitWith {};

_display = findDisplay 2400;
_list = _display displayCtrl 1501;
_data = lbData[1501,(lbCurSel 1501)];
_data = call compile format ["%1", _data];
if (isNil "_data") exitWith {};
//if (!(_data isEqualType [])) exitWith {};
//if (_data isEqualTo []) exitWith {};
[_data] remoteExecCall ["life_fnc_wantedRemove",RSERV];