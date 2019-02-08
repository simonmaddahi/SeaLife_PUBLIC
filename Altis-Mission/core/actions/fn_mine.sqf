#include "..\..\script_macros.hpp"
    /*
        File: fn_mine.sqf
        Author: Devilfloh
        Editor: Dardo

        Description:
        Same as fn_gather,but it allows use of probabilities for mining.
    */
private ["_maxGather", "_resource", "_amount", "_requiredItem", "_mined"];
if (life_action_inUse) exitWith {};
if ((vehicle player) != player) exitWith {};
if (player getVariable "restrained") exitWith {
    ["Aktion abgebrochen","Du kannst nichts abbauen, während du gefesselt bist!", true, "fast"] spawn ESG_fnc_notify;
};
_exit = false;
if (player getVariable "playerSurrender") exitWith {
    ["Aktion abgebrochen","Du kannst nichts abbauen, während du dich ergibtst!", true, "fast"] spawn ESG_fnc_notify;
};
life_action_inUse = true;
_zone = "";
_requiredItem = "";

_resourceCfg = missionConfigFile >> "CfgGather" >> "Minerals";
_percent = (floor random 100) + 1; //Make sure it's not 0

for "_i" from 0 to count(_resourceCfg)-1 do {
    _curConfig = _resourceCfg select _i;
    _resources = getArray(_curConfig >> "mined");
    _maxGather = getNumber(_curConfig >> "amount");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
    _resourceZones = getArray(_curConfig >> "zones");
    _requiredItem = getText(_curConfig >> "item");
    _mined = "";

    if (_resources isEqualTo []) exitWith {}; //Smart guy :O
    for "_i" from 0 to count (_resources) do {
        if (count _resources isEqualTo 1) exitWith {
            if (!((_resources select 0) isEqualType [])) then {
                _mined = _resources select 0;
            } else {
                _mined = (_resources select 0) select 0;
            };
        };
        _resource = (_resources select _i) select 0;
        _prob = (_resources select _i) select 1;
        _probdiff = (_resources select _i) select 2;
        if ((_percent >= _prob) && (_percent <= _probdiff)) exitWith {
            _mined = _resource;
        };
    };

    {
        if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith {
            _zone = _x;
        };
    } forEach _resourceZones;

    if (_zone != "") exitWith {};
};

if (_zone isEqualTo "") exitWith {
    life_action_inUse = false;
};

if (_requiredItem != "") then {
    _valItem = missionNamespace getVariable "life_inv_" + _requiredItem;

    if (_valItem < 1) exitWith {
        switch (_requiredItem) do {
            case "pickaxe": {
                titleText[(localize "STR_NOTF_Pickaxe"), "PLAIN"];
            };
        };
        life_action_inUse = false;
        _exit = true;
  };
};

if (_exit) exitWith {
    life_action_inUse = false;
};

_skillt = [_mined]call ESG_fnc_skilltime;
_amount = round(random(_skillt select 0)) + 1;
_diff = [_mined, _amount, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;
if (_diff isEqualTo 0) exitWith {
    ["Inventar","Dein Inventar ist voll!", true, "fast"] spawn ESG_fnc_notify;
    life_action_inUse = false;
};
[player, "mining"] remoteExec ["life_fnc_globalSound",0];

_count = (_skillt select 1);

for "_i" from 0 to _count do {
    player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    waitUntil {
        animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    };
    sleep 0.5;
};

if (([true, _mined, _diff] call life_fnc_handleInv)) then {
    _itemName = M_CONFIG(getText, "VirtualItems", _mined, "displayName");
    titleText[format [localize "STR_NOTF_Mine_Success", (localize _itemName), _diff], "PLAIN"];
	[_mined,_amount]call ESG_fnc_skilladd;
};

sleep 2.5;
life_action_inUse = false;
