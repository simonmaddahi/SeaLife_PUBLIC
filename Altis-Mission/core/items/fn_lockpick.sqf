#include "..\..\script_macros.hpp"
/*
    File: fn_lockpick.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for lock-picking.
*/
private ["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorObject;
life_interrupted = false;

if (life_action_inUse) exitWith {};
if (isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if (player distance _curTarget > _distance) exitWith {}; //Too far

_isVehicle = if ((_curTarget isKindOf "LandVehicle") || (_curTarget isKindOf "Ship") || (_curTarget isKindOf "Air")) then {true} else {false};
if (_isVehicle && _curTarget in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if (!_isVehicle && !isPlayer _curTarget) exitWith {};
if (!_isVehicle && !(_curTarget getVariable ["restrained",false])) exitWith {};
if (_curTarget getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};

_title = format [localize "STR_ISTR_Lock_Process",if (!_isVehicle) then {"Handschellen"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions
_skillconfig = ["lockpick"]call ESG_fnc_skilltime;
//Setup the progress bar
disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_t2 = "Fertig";
_time = (_skillconfig select 0);
for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    sleep _time;

    if (isNull _ui) then {
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];

    if (_cP >= 1 || !alive player) exitWith {};
    if (player getVariable ["istazed",false]) exitWith {_t2 = "Abgebrochen";}; //Tazed
    if (life_isknocked) exitWith {_t2 = "Abgebrochen";}; //Knocked
    if (life_interrupted) exitWith {_t2 = "Abgebrochen";};
    if (player getVariable ["restrained",false]) exitWith {_t2 = "Abgebrochen";};
    if (player distance _curTarget > _distance) exitWith {_t2 = "Abgebrochen"; _badDistance = true;};
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

if (!alive player || (player getVariable ["istazed",false]) || life_isknocked) exitWith {life_action_inUse = false;};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;};
if (!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if (!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};
if(player getVariable["esg_bewusstlos",false])exitWith {life_action_inUse = false;};

life_action_inUse = false;
_chance = (_skillconfig select 1);
if (!_isVehicle) then {
    _curTarget setVariable ["restrained",false,true];
    _curTarget setVariable ["Escorting",false,true];
    _curTarget setVariable ["transporting",false,true];
} else {
    _dice = random(100);
    if (_dice < _chance) then {
        titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
        life_vehicles pushBack _curTarget;

        if ((random(100)) < 50) then {
            [getPlayerUID player, (player getVariable ["realname", name player]), "Aufbrechen eines Fahrzeugs"] remoteExecCall ["life_fnc_wantedAdd", 2];
        };
    } else {
        if ((random(100)) < 50) then {
            [getPlayerUID player, (player getVariable ["realname", name player]), "Versuchtes Aufbrechen eines Fahrzeugs"] remoteExecCall ["life_fnc_wantedAdd", 2];
        };

        [0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west];
        titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
    };
};
