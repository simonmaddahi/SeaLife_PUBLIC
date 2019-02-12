#include "\life_server\script_macros.hpp"
/*
    File: fn_removeGang.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
    Description:
    Removes gang from database
*/
private ["_group","_groupID"];
_group = param [0,grpNull,[grpNull]];
if (isNull _group) exitWith {};

_groupID = _group getVariable ["company_id",-1];
if (_groupID isEqualTo -1) exitWith {};

[format ["UPDATE companys SET active='0' WHERE id='%1'",_groupID],1] call DB_fnc_asyncCall;

_result = [format ["SELECT id FROM companys WHERE active='1' AND id='%1'",_groupID],2] call DB_fnc_asyncCall;
if (count _result isEqualTo 0) then {
    [_group] remoteExecCall ["life_fnc_companyDisbanded",(units _group)];
    uiSleep 5;
    deleteGroup _group;
};
["CALL deleteOldCompanys",1] call DB_fnc_asyncCall;
