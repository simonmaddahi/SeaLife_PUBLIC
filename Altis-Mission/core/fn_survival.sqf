#include "..\script_macros.hpp"
/*
    File: fn_survival.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    All survival? things merged into one thread.
*/
private ["_fnc_food","_fnc_water","_foodTime","_waterTime","_bp","_walkDis","_lastPos","_curPos"];

_fnc_setinjure = {
    player setVariable ["esg_bewusstlos", true, true];
    _time = ["survive"] call ESG_fnc_skilltime;
    if(_time isEqualTo 0) then {
        _time = 500;
    };
    _delay = time + _time;
    player setVariable ["esg_bewusstlos_delay", _delay,true];
    [player] spawn life_fnc_injured;
};

_fnc_food =  {
    if (life_hunger < 2) then {call _fnc_setinjure; ["Gesundheitsstatus", "Du bist verhungert!", false, "fast"] spawn ESG_fnc_notify;}
    else
    {
        life_hunger = life_hunger - 10;
        call life_fnc_hudUpdate;
        if (life_hunger < 2) then {call _fnc_setinjure; ["Gesundheitsstatus", "Du bist verhungert!", false, "fast"] spawn ESG_fnc_notify;};
        switch (life_hunger) do {
            case 30: {["Gesundheitsstatus", "Du hast schon eine Weile nichts mehr gegessen, du solltest schnell etwas zum Essen suchen!", false, "fast"] spawn ESG_fnc_notify;};
            case 20: {["Gesundheitsstatus", "Du hast Hunger, du solltest schnell etwas essen oder du wirst verhungern!", false, "fast"] spawn ESG_fnc_notify;};
            case 10: {["Gesundheitsstatus", "Du bist am Verhungern, du wirst sterben, wenn du nichts zum Essen findest!", false, "fast"] spawn ESG_fnc_notify;};
        };
    };
};

_fnc_water = {
    if (life_thirst < 2) then {call _fnc_setinjure; ["Gesundheitsstatus", "Du bist verdurstet!", false, "fast"] spawn ESG_fnc_notify;}
    else
    {
        life_thirst = life_thirst - 10;
        call life_fnc_hudUpdate;
        if (life_thirst < 2) then {call _fnc_setinjure; ["Gesundheitsstatus", "Du bist verdurstet!", false, "fast"] spawn ESG_fnc_notify;};
        switch (life_thirst) do  {
            case 30: {["Gesundheitsstatus", "Du hast schon eine Weile nichts mehr getrunken! Du solltest schnell etwas zum Trinken suchen!", false, "fast"] spawn ESG_fnc_notify;};
            case 20: {["Gesundheitsstatus", "Du hast Durst! Du solltest schnell etwas trinken oder du wirst verdursten!", false, "fast"] spawn ESG_fnc_notify;};
            case 10: {["Gesundheitsstatus", "Du bist am Verdursten. Du wirst sterben, wenn du nichts zum Trinken findest!", false, "fast"] spawn ESG_fnc_notify;};
        };
    };
};

//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_walkDis = 0;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = (_lastPos select 0) + (_lastPos select 1);
_lastState = vehicle player;

for "_i" from 0 to 1 step 0 do {
    if ((time - _waterTime) > 600) then {[] call _fnc_water; _waterTime = time;};
    if ((time - _foodTime) > 850) then {[] call _fnc_food; _foodTime = time;};

    if (backpack player isEqualTo "") then {
        life_maxWeight = 74;
        _bp = backpack player;
    } else {
        if (!(backpack player isEqualTo "") && {!(backpack player isEqualTo _bp)}) then {
            _bp = backpack player;
            life_maxWeight = 74 + round(FETCH_CONFIG2(getNumber,"CfgVehicles",_bp,"maximumload") / 4);
        };
    };

    if (vehicle player != _lastState || {!alive player}) then {
        [] call life_fnc_updateViewDistance;
        _lastState = vehicle player;
    };

    if (life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
        player forceWalk true;
    } else {
        if (isForcedWalk player) then {
            player forceWalk false;
        };
    };

    if (!alive player) then {_walkDis = 0;} else {
        _curPos = visiblePosition player;
        _curPos = (_curPos select 0) + (_curPos select 1);
        if (!(_curPos isEqualTo _lastPos) && {(isNull objectParent player)}) then {
            _walkDis = _walkDis + 1;
            if (_walkDis isEqualTo 650) then {
                _walkDis = 0;
                life_thirst = life_thirst - 5;
                life_hunger = life_hunger - 5;
                call life_fnc_hudUpdate;
            };
        };
        _lastPos = visiblePosition player;
        _lastPos = (_lastPos select 0) + (_lastPos select 1);
    };
	
	{
		if(agent _x isKindOf "Snake_random_F" || agent _x isKindOf "Rabbit_F" || agent _x isKindOf "Bird") then {agent _x setpos [0,0,0];};
	} forEach agents;
	
    call life_fnc_hudUpdate;
	
    uiSleep 10;
};