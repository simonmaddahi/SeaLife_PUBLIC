/*
	Author: Natic
	Date: 25.01.2019
	Disclaimer: Nobody is allowed to use/edit this Script
*/
private ["_lvl_1","_lvl_2","_lvl_3","_bonus"];
_lvl_1 = 5000;
_lvl_2 = 10000;
_lvl_3 = 20000;
_bonus = this select 0;


if (playerside == west) then {
		if (life_bonus_status || life_bonus_Astatus) then {
			
		switch (_bonus) do {
        case 1: { 
                BANK = BANK + _lvl_1;
				hint format["Du hast einen Bonus von %1 bekommen",_lvl_1];
				sleep 2;
				profileNamespace setVariable ["life_bonus_Astatus",false];
				profileNamespace setVariable ["life_bonus_status",false];
				call SOCK_fnc_updatePartial;
        };
		case 2: { 
                BANK = BANK + _lvl_2;
				hint format["Du hast einen Bonus von %1 bekommen",_lvl_2];
				sleep 2;
				profileNamespace setVariable ["life_bonus_Astatus",false];
				profileNamespace setVariable ["life_bonus_status",false];
				call SOCK_fnc_updatePartial;
        };
		case 3: { 
                BANK = BANK + _lvl_3;
				hint format["Du hast einen Bonus von %1 bekommen",_lvl_3];
				sleep 2;
				profileNamespace setVariable ["life_bonus_Astatus",false];
				profileNamespace setVariable ["life_bonus_status",false];
				call SOCK_fnc_updatePartial;
        };
    };
};	

	if (playerside == independent) then {
		if (life_bonus_status || life_bonus_Astatus) then {
		
		switch (_bonus) do {
        case 1: { 
                BANK = BANK + _lvl_1;
				hint format["Du hast einen Bonus von %1 bekommen",_lvl_1];
				sleep 2;
				profileNamespace setVariable ["life_bonus_Astatus",false];
				profileNamespace setVariable ["life_bonus_status",false];
				call SOCK_fnc_updatePartial;
        };
		case 2: { 
                BANK = BANK + _lvl_2;
				hint format["Du hast einen Bonus von %1 bekommen",_lvl_2];
				sleep 2;
				profileNamespace setVariable ["life_bonus_Astatus",false];
				profileNamespace setVariable ["life_bonus_status",false];
				call SOCK_fnc_updatePartial;
        };
		case 3: { 
                BANK = BANK + _lvl_3;
				hint format["Du hast einen Bonus von %1 bekommen",_lvl_3];
				sleep 2;
				profileNamespace setVariable ["life_bonus_Astatus",false];
				profileNamespace setVariable ["life_bonus_status",false];
				call SOCK_fnc_updatePartial;
        };
    };
};
	
	if (playerside == civilian) then {
		if (life_bonus_status || life_bonus_Astatus) then {
		
		switch (_bonus) do {
        case 1: { 
                BANK = BANK + _lvl_1;
				hint format["Du hast einen Bonus von %1 bekommen",_lvl_1];
				sleep 2;
				profileNamespace setVariable ["life_bonus_Astatus",false];
				profileNamespace setVariable ["life_bonus_status",false];
				call SOCK_fnc_updatePartial;
        };
		case 2: { 
                BANK = BANK + _lvl_2;
				hint format["Du hast einen Bonus von %1 bekommen",_lvl_2];
				sleep 2;
				profileNamespace setVariable ["life_bonus_Astatus",false];
				profileNamespace setVariable ["life_bonus_status",false];
				call SOCK_fnc_updatePartial;
        };
		case 3: { 
                BANK = BANK + _lvl_3;
				hint format["Du hast einen Bonus von %1 bekommen",_lvl_3];
				sleep 2;
				profileNamespace setVariable ["life_bonus_Astatus",false];
				profileNamespace setVariable ["life_bonus_status",false];
				call SOCK_fnc_updatePartial;
        };
    };
};