#include "..\..\script_macros.hpp"
/*
	Author: Basti | John Collins
*/

params [
	["_name", "", [""]],
	["_group", grpNull, [grpNull]]
];

private _ranks = _group getVariable ["gang_ranks", []];
private _index = [_name, _ranks] call TON_fnc_index;
private _rank = player getVariable ["gang_rank", []];
if ((_rank select 0) isEqualTo _name) then {
	player setVariable ["gang_rank", (_ranks select _index), true];
};