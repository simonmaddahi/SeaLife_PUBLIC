#include "..\..\script_macros.hpp"
/*
    File: fn_s_onCheckedChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Switching it up and making it prettier..
*/
private ["_option","_state"];
_option = _this select 0;
_state = _this select 1;

switch (_option) do {
    case "tags": {
        if (_state isEqualTo 1) then {
            life_settings_tagson = true;
            profileNamespace setVariable ["life_settings_tagson",true];
            LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
        } else {
            life_settings_tagson = false;
            profileNamespace setVariable ["life_settings_tagson",false];
            [LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
        };
    };

    case "objects": {
        if (_state isEqualTo 1) then {
            life_settings_revealObjects = true;
            profileNamespace setVariable ["life_settings_revealObjects",true];
            LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
        } else {
            life_settings_revealObjects = false;
            profileNamespace setVariable ["life_settings_revealObjects",false];
            [LIFE_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
        };
    };

    case "sidechat": {
        if (_state isEqualTo 1) then {
            life_enableSidechannel = true;
            profileNamespace setVariable ["life_enableSidechannel",true];
            life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
        } else {
            life_enableSidechannel = false;
            profileNamespace setVariable ["life_enableSidechannel",false];
            life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",false];
        };
        [player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC",RSERV];
    };

    case "broadcast": {
        if (_state isEqualTo 1) then {
            zbg_settings_Logo = true;
            profileNamespace setVariable ["zbg_settings_Logo",true];
            life_settings_enableNewsBroadcast = profileNamespace getVariable ["zbg_settings_Logo",true];
            LIFEctrl(8888) ctrlSetFade 0.5;
            LIFEctrl(8888) ctrlCommit 0;
        } else {
            zbg_settings_Logo = false;
            profileNamespace setVariable ["zbg_settings_Logo",false];
            life_settings_enableNewsBroadcast = profileNamespace getVariable ["zbg_settings_Logo",false];
            LIFEctrl(8888) ctrlSetFade 1;
            LIFEctrl(8888) ctrlCommit 0;
        };
    };
    
    case "gras": {
        if (_state isEqualTo 1) then {
            zbg_settings_gras = true;
            profileNamespace setVariable ["zbg_settings_gras", true];
            life_settings_enableNewsBroadcast = profileNamespace getVariable ["zbg_settings_gras", true];
            setTerrainGrid 25;
        } else {
            zbg_settings_gras = false;
            profileNamespace setVariable ["zbg_settings_gras", false];
            life_settings_enableNewsBroadcast = profileNamespace getVariable ["zbg_settings_gras", false];
            setTerrainGrid 50;
        };
    };
};
