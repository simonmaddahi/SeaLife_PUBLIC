/*
    File: fn_updateGang.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
    Description:
    Updates the gang information?
*/
private ["_groupID","_bank","_max_employers","_members","_membersFinal","_query","_owner"];
params [
    ["_mode",0,[0]],
    ["_group",grpNull,[grpNull]]
];

if (isNull _group) exitWith {}; //FAIL

_groupID = _group getVariable ["company_id",-1];
if (_groupID isEqualTo -1) exitWith {};

switch (_mode) do {
    case 0: {
        _bank = [(_group getVariable ["company_bank",0])] call DB_fnc_numberSafe;
        _maxMembers = _group getVariable ["max_employers",8];
        _members = [(_group getVariable "company_employers")] call DB_fnc_mresArray;
        _owner = _group getVariable ["company_owner",""];
        if (_owner isEqualTo "") exitWith {};

        _query = format ["UPDATE companys SET bank='%1', max_employers='%2', owner='%3' WHERE id='%4'",_bank,_max_employers,_owner,_groupID];
    };

    case 1: {
        _query = format ["UPDATE companys SET bank='%1' WHERE id='%2'",([(_group getVariable ["company_bank",0])] call DB_fnc_numberSafe),_groupID];
    };

    case 2: {
        _query = format ["UPDATE companys SET maxm_employers='%1' WHERE id='%2'",(_group getVariable ["max_employers",8]),_groupID];
    };

    case 3: {
        _owner = _group getVariable ["company_owner",""];
        if (_owner isEqualTo "") exitWith {};
        _query = format ["UPDATE companys SET owner='%1' WHERE id='%2'",_owner,_groupID];
    };

    case 4: {
        _members = _group getVariable "company_employers";
        if (count _members > (_group getVariable ["max_employers",8])) then {
            _membersFinal = [];
            for "_i" from 0 to _max_employers -1 do {
                _membersFinal pushBack (_members select _i);
            };
        } else {
            _membersFinal = _group getVariable "company_employers";
        };
        _membersFinal = [_membersFinal] call DB_fnc_mresArray;
        _query = format ["UPDATE companys SET members='%1' WHERE id='%2'",_membersFinal,_groupID];
    };
};

if (!isNil "_query") then {
    [_query,1] call DB_fnc_asyncCall;
};
