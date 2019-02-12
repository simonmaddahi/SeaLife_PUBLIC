/*
    File: fn_queryPlayerGang.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
    Description:
    Queries to see if the player belongs to any companys.
*/
private ["_query","_queryResult"];

_query = format ["SELECT id, owner, name, maxmembers, bank, members FROM companys WHERE active='1' AND members LIKE '%2%1%2'",_this,"%"];

_queryResult = [_query,2] call DB_fnc_asyncCall;

if !(count _queryResult isEqualTo 0) then {
    _tmp = [_queryResult select 5] call DB_fnc_mresToArray;
    if (_tmp isEqualType "") then {_tmp = call compile format ["%1", _tmp];};
    _queryResult set[5, _tmp];
};
missionNamespace setVariable [format ["company_%1",_this],_queryResult];
