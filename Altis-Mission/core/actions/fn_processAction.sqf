#include "..\..\script_macros.hpp"
/*
    File: fn_processAction.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Master handling for processing an item.
    NiiRoZz : Added multiprocess
*/
private ["_vendor","_type","_itemInfo","_oldItem","_newItemWeight","_license","_newItem","_oldItemWeight","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_materialsRequired","_materialsGiven","_noLicenseCost","_text","_filter","_totalConversions","_minimumConversions","_licenseNeed"];
_vendor = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if (isNull _vendor || _type isEqualTo "" || (player distance _vendor > 10)) exitWith {};
life_action_inUse = true;//Lock out other actions during processing.

if (isClass (missionConfigFile >> "ProcessAction" >> _type)) then {
    _filter = false;
    _materialsRequired = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsReq");
    _materialsGiven = M_CONFIG(getArray,"ProcessAction",_type,"MaterialsGive");
    _noLicenseCost = M_CONFIG(getNumber,"ProcessAction",_type,"NoLicenseCost");
    _text = M_CONFIG(getText,"ProcessAction",_type,"Text");
    _licenseNeed = M_CONFIG(getText,"ProcessAction",_type,"license");
} else {_filter = true;};

if (_filter) exitWith {life_action_inUse = false;};

_itemInfo = [_materialsRequired,_materialsGiven,_noLicenseCost,(localize format ["%1",_text]),_licenseNeed];
if (count _itemInfo isEqualTo 0) exitWith {life_action_inUse = false;};

//Setup vars.
_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_license = _itemInfo select 4;
_exit = false;
if (count _oldItem isEqualTo 0) exitWith {life_action_inUse = false;};

_totalConversions = [];
{
    _var = ITEM_VALUE(_x select 0);
    if (_var isEqualTo 0) exitWith {_exit = true;};
    if (_var < (_x select 1)) exitWith {_exit = true;};
    _totalConversions pushBack (floor (_var/(_x select 1)));
} forEach _oldItem;

if (_exit) exitWith {life_is_processing = false; ["Aktion abgebrochen","Du hast nicht genug Materialien!", true, "fast"] spawn ESG_fnc_notify; life_action_inUse = false;};

_hasLicense = LICENSE_VALUE(_license,"civ");

_cost = _cost * (count _oldItem);

_minimumConversions = _totalConversions call BIS_fnc_lowestNum;
_oldItemWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _oldItemWeight = _oldItemWeight + _weight;
} count _oldItem;

_newItemWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _newItemWeight = _newItemWeight + _weight;
} count _newItem;

_exit = false;

if (_newItemWeight > _oldItemWeight) then {
    _netChange = _newItemWeight - _oldItemWeight;
    _freeSpace = life_maxWeight - life_carryWeight;
    if (_freeSpace < _netChange) exitWith {_exit = true;};
    private _estConversions = floor(_freeSpace / _netChange);
    if (_estConversions < _minimumConversions) then {
        _minimumConversions = _estConversions;
    };
};

if (_exit) exitWith {["Inventar","Du hast nicht genug Platz im Inventar!", true, "fast"] spawn ESG_fnc_notify; life_is_processing = false; life_action_inUse = false;};

_time = [((_newItem select 0) select 0)] call ESG_fnc_skilltime;

life_is_processing = true;

if (_hasLicense) then {
    disableSerialization;
    "progressBar" cutRsc ["life_progress","PLAIN"];
    _ui = uiNamespace getVariable "life_progress";
    _progress = _ui displayCtrl 38201;
    _pgText = _ui displayCtrl 38202;
    _pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
    _progress progressSetPosition 0.01;
    _cP = 0.01;
	_t2 = "Fertig";
    for "_i" from 0 to 1 step 0 do {
        sleep 0.5;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {_t2 = "Abgebrochen";};
        if (player distance _vendor > 10) exitWith {_t2 = "Abgebrochen";};
    };
    if (player distance _vendor > 10) exitWith {["Verarbeiten abgebrochen","Das Verarbeiten wurde abgebrochen, da du dich zu weit vom Verarbeiter entfernt hast!", true, "fast"] spawn ESG_fnc_notify; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};

    {
        [false,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _oldItem;

    {
        [true,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _newItem;

    for "_i" from 0 to 1 step 0 do {
		sleep .0006;
		_cP = _cP - .01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format ["%1 (%2)",_upp,_t2];
		if (_cP <= 0 || !alive player) exitWith {};
	};
	"progressBar" cutFadeOut 1;
    if (_minimumConversions isEqualTo (_totalConversions call BIS_fnc_lowestNum)) then {["Verarbeiten beendet","Du hast deine Materialien verarbeitet!", false, "fast"] spawn ESG_fnc_notify;};
    life_is_processing = false; life_action_inUse = false;
    [((_newItem select 0) select 0), 1]call ESG_fnc_skilladd;
} else {
    if (CASH < _cost) exitWith {["Zu wenig Geld",format ["Du brauchst %1$, damit du deine Materialien, ohne Lizenz, verarbeiten kannst.",[_cost] call life_fnc_numberText], true, "fast"] spawn ESG_fnc_notify; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
	//Setup our progress bar.
    disableSerialization;
    "progressBar" cutRsc ["life_progress","PLAIN"];
    _ui = uiNamespace getVariable "life_progress";
    _progress = _ui displayCtrl 38201;
    _pgText = _ui displayCtrl 38202;
    _pgText ctrlSetText format ["%2 (1%1)...","%",_upp];
    _progress progressSetPosition 0.01;
    _cP = 0.01;
    _t2 = "Fertig";
    for "_i" from 0 to 1 step 0 do {
        sleep  (_time * 1.5);
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if (_cP >= 1) exitWith {};
        if (player distance _vendor > 10) exitWith {_t2 = "Abgebrochen";};
    };

    if (player distance _vendor > 10) exitWith {["Verarbeiten abgebrochen","Das Verarbeiten wurde abgebrochen, da du dich zu weit vom Verarbeiter entfernt hast!", true, "fast"] spawn ESG_fnc_notify; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
    if (CASH < _cost) exitWith {["Zu wenig Geld",format ["Du brauchst %1$, damit du deine Materialien, ohne Lizenz, verarbeiten kannst.",[_cost] call life_fnc_numberText], true, "fast"] spawn ESG_fnc_notify; "progressBar" cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};

    {
        [false,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _oldItem;

    {
        [true,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
    } count _newItem;

    for "_i" from 0 to 1 step 0 do {
		sleep .0006;
		_cP = _cP - .01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format ["%1 (%2)",_upp,_t2];
		if (_cP <= 0 || !alive player) exitWith {};
	};
	"progressBar" cutFadeOut 1;
    if (_minimumConversions isEqualTo (_totalConversions call BIS_fnc_lowestNum)) then {["Verarbeiten beendet","Du hast deine Materialien verarbeitet!", false, "fast"] spawn ESG_fnc_notify;};
    CASH = CASH - _cost;
    [0] call SOCK_fnc_updatePartial;
    life_is_processing = false;
    life_action_inUse = false;
	[((_newItem select 0) select 0), 1]call ESG_fnc_skilladd;
};
