/*
    File: fn_gangDisbanded.sqf
    Author: Bryan "Tonic" Boardwine
	Edit: Natic
*/
private "_group";
_group = param [0,grpNull,[grpNull]];
if (isNull _group) exitWith {}; 
if (!isNull (findDisplay 2620)) then {closeDialog 2620};

hint localize "STR_GNOTF_DisbandWarn_2";
[player] joinSilent (createGroup civilian);

if (units _group isEqualTo []) then {
    deleteGroup _group;
};
