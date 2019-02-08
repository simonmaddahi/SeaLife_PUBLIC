#include "..\..\script_macros.hpp"
/*
 File: fn_arrestAction.sqf
 Author:
 Description:
 Arrests the targeted person.
*/
private["_unit","_id","_time"]; // Hier ist ,"_time" hinzugekommen
_unit = param [0,objNull,[objNull]];
_time = param [1,30]; //das ist auch neu!
if (isNull _unit) exitWith {}; //Not valid
if (isNil "_unit") exitWith {}; //Not Valid
if (!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if (!isPlayer _unit) exitWith {}; //Not a human
if (!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if (!((side _unit) isEqualTo civilian)) exitWith {}; // Hier habe ich die Fraktion East hinzugefügt, dies ist nur für mein Projekt wichtig
if (isNull _unit) exitWith {}; //Not valid

if(_time < 1) exitwith {}; //so wie diese Abfrage.
//[getPlayerUID _unit,_unit,player,false] remoteExecCall ["life_fnc_wantedBounty",RSERV];
if (isNull _unit) exitWith {}; //Not valid
detach _unit;
/*
[_unit,false] remoteExecCall ["life_fnc_jail",_unit];
[0,"STR_NOTF_Arrested_1",true, [_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
*/ 
[_unit,false,_time] remoteExecCall ["life_fnc_jail",_unit]; //Dafür kam dies hinzu
[0,"STR_NOTF_Arrested_1",true, [_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT]; // Das ist zwar das gleiche wie oben das auskommentierte. Wieso Warum es hier ist kA. :D