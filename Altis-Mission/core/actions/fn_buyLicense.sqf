#include "..\..\script_macros.hpp"
/*
    File: fn_buyLicense.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when purchasing a license. May need to be revised.
*/
private ["_type","_varName","_displayName","_sideFlag","_price"];
_type = _this select 3;

if (!isClass (missionConfigFile >> "Licenses" >> _type)) exitWith {}; //Bad entry?
_displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
_price = M_CONFIG(getNumber,"Licenses",_type,"price");
_sideFlag = M_CONFIG(getText,"Licenses",_type,"side");
_varName = LICENSE_VARNAME(_type,_sideFlag);

if (CASH < _price) exitWith {["Nicht genug Geld",format ["Du hast keine $%1 für einen %2", [_price] call life_fnc_numberText,_displayName], true, "fast"] spawn ESG_fnc_notify;};
CASH = CASH - _price;

[0] call SOCK_fnc_updatePartial;

titleText[format [localize "STR_NOTF_B_1", _displayName,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable [_varName,true];

[2] call SOCK_fnc_updatePartial;

_log = format["%1 (%2) hat die Lizenz %3 für %4$ gekauft.", player getVariable["realname", name player], getPlayerUID player, _displayName, [_price]call life_fnc_numberText];
["LIZENZEN_LOG", _log] remoteExecCall ["ESG_fnc_logging", 2];