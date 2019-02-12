#include "\life_server\script_macros.hpp"
/*
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
*/
private ["_query","_queryResult","_companyMembers","_group"];
params [
    ["_ownerID",objNull,[objNull]],
    ["_uid","",[""]],
    ["_companyName","",[""]]
];
_group = group _ownerID;

if (isNull _ownerID || _uid isEqualTo "" || _companyName isEqualTo "") exitWith {}; //Fail

_ownerID = owner _ownerID;
_companyName = [_gangName] call DB_fnc_mresString;
_query = format ["SELECT id FROM companys WHERE name='%1' AND active='1'",_companyName];

_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if (!(count _queryResult isEqualTo 0)) exitWith {
    [1,"There is already a company created with that name please pick another name."] remoteExecCall ["life_fnc_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

_query = format ["SELECT id FROM companys WHERE members LIKE '%2%1%2' AND active='1'",_uid,"%"];

_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if (!(count _queryResult isEqualTo 0)) exitWith {
    [1,"You are currently already active in a company, please leave the company first."] remoteExecCall ["life_fnc_broadcast",_ownerID];
    life_action_gangInUse = nil;
    _ownerID publicVariableClient "life_action_gangInUse";
};

//Check to see if a gang with that name already exists but is inactive.
_query = format ["SELECT id, active FROM companys WHERE name='%1' AND active='0'",_companyName];

_queryResult = [_query,2] call DB_fnc_asyncCall;
_companyMembers = [[_uid]] call DB_fnc_mresArray;

if (!(count _queryResult isEqualTo 0)) then {
    _query = format ["UPDATE companys SET active='1', owner='%1',members='%2' WHERE id='%3'",_uid,_companyMembers,(_queryResult select 0)];
} else {
    _query = format ["INSERT INTO company (owner, name, members) VALUES('%1','%2','%3')",_uid,_companyName,_companyMembers];
};

_queryResult = [_query,1] call DB_fnc_asyncCall;

_group setVariable ["company_name",_companyName,true];
_group setVariable ["company_owner",_uid,true];
_group setVariable ["company_bank",0,true];
_group setVariable ["max_employers",8,true];
_group setVariable ["company_employers",[_uid],true];
[_group] remoteExecCall ["life_fnc_companyCreated",_ownerID];

uiSleep 0.35;
_query = format ["SELECT id FROM companys WHERE owner='%1' AND active='1'",_uid];

_queryResult = [_query,2] call DB_fnc_asyncCall;

_group setVariable ["company_id",(_queryResult select 0),true];
