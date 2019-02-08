#include "..\..\script_macros.hpp"
/*
    File: fn_repairDoor.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Re-locks the door mainly for the federal reserve structures.
*/
private ["_building","_doors","_door","_cP","_cpRate","_ui","_title","_titleText","_locked"];
_building = param [0,objNull,[objNull]];
if (isNull _building) exitWith {};
if (!(_building isKindOf "House_F")) exitWith {["Keine Haustür","Du musst eine Haustür angucken!", true, "fast"] spawn ESG_fnc_notify;};

_doors = 1;
_doors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _building),"NumberOfDoors");
_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
    _selPos = _building selectionPosition format ["Door_%1_trigger",_i];
    _worldSpace = _building modelToWorld _selPos;
        if (player distance _worldSpace < 5) exitWith {_door = _i;};
};

if (_door isEqualTo 0) exitWith {["Keine Haustür","Du bist nicht in der Nähe einer Tür!", true, "fast"] spawn ESG_fnc_notify;}; //Not near a door to be broken into.
_doorN = _building getVariable [format ["bis_disabled_Door_%1",_door],0];
if (_doorN isEqualTo 1) exitWith {["Haustür verriegelt","Die Tür ist bereits verriegelt!", true, "fast"] spawn ESG_fnc_notify;};
life_action_inUse = true;

closeDialog 0;
//Setup the progress bar
disableSerialization;
_title = localize "STR_Cop_RepairingDoor";
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_t2 = "Fertig";
switch (typeOf _building) do {
    case "Land_Dome_Big_F": {_cpRate = 0.008;};
    case "Land_Medevac_house_V1_F";
    case "Land_Research_house_V1_F": {_cpRate = 0.005;};
    default {_cpRate = 0.08;}
};

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    sleep 0.26;
    if (isNull _ui) then {
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive player) exitWith {_t2 = "Abgebrochen";};
    if (life_interrupted) exitWith {_t2 = "Abgebrochen";};
	if(player getVariable["esg_bewusstlos",false])exitWith {_t2 = "Abgebrochen";};
};

//Kill the UI display and check for various states
for "_i" from 0 to 1 step 0 do {
	sleep .0006;
	_cP = _cP - .01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format ["%1 (%2)",_title,_t2];
	if (_cP <= 0 || !alive player) exitWith {};
};
"progressBar" cutFadeOut 1;
player playActionNow "stop";
if (!alive player) exitWith {life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player getVariable["esg_bewusstlos",false])exitWith {life_action_inUse = false;};
life_action_inUse = false;

_building animateSource [format ["Door_%1_source", _door], 0];
_building setVariable [format ["bis_disabled_Door_%1",_door],1,true]; //Lock the door.

_locked = true;
for "_i" from 1 to _doors do {
    if ((_building getVariable [format ["bis_disabled_Door_%1",_i],0]) isEqualTo 0) exitWith {_locked = false};
};

if (_locked) then {
    _building setVariable ["locked",true,true];
};