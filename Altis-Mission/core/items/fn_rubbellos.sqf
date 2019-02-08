#include "..\..\script_macros.hpp"
/*
    File: fn_rubbellos.sqf
    Author: Natic
*/
private["_winner"];

//Close inventory
closeDialog 0;
if(!([false,"rubbellos",1] call life_fnc_handleInv)) exitWith {};

titleText["Ich versuche das Los zu endziffern...","PLAIN"];
sleep 3;
_winner = floor(random(50));
if(_winner < 45) exitWith {
	["Leider ist es eine Niete", false, "fast"] spawn ESG_fnc_notify;
};
if(_winner == 45) exitWith {
	["Glückwunsch, Du hast 150$ gewonnen", false, "fast"] spawn ESG_fnc_notify;
	CASH = CASH + 150;
};
if(_winner == 46) exitWith {
	["Glückwunsch, Du hast 350$ gewonnen", false, "fast"] spawn ESG_fnc_notify;
	CASH = CASH + 350;
};
if(_winner == 47) exitWith {
	["Glückwunsch, Du hast 750$ gewonnen", false, "fast"] spawn ESG_fnc_notify;
	CASH = CASH + 750;
};
if(_winner == 48) exitWith {
	["Glückwunsch, Du hast 2000$ gewonnen", false, "fast"] spawn ESG_fnc_notify;
	CASH = CASH + 2000;
};
if(_winner == 49) exitWith {
	["Glückwunsch, Du hast 5000$ gewonnen", false, "fast"] spawn ESG_fnc_notify;
	CASH = CASH + 5000;
};
if(_winner == 50) exitWith {
	["Glückwunsch, Du hast 7500$ gewonnen", false, "fast"] spawn ESG_fnc_notify;
	CASH = CASH + 7500;
};

	


