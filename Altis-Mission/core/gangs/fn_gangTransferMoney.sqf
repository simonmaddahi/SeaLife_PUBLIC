#include "..\..\script_macros.hpp"
/*
	Author: Basti | John Collins
*/

params [
	["_money", 0, [0]]
];

hint "Dir wurde Geld aus der Gangkasse überwiesen.";

BANK = BANK + _money;
[1] call SOCK_fnc_updatePartial;