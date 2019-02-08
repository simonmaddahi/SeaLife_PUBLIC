#include "..\..\script_macros.hpp"
/*
	Auhtor: Natic
	Paychecks via level for Company Employers
	
	Info: Geld muss noch vom Firmenkonto abgebucht werden!
*/
getNumber(missionConfigFile >> "CFGcompany" >> "employers" >> "max_employers");
if (life_SETTINGS(getNumber(missionConfigFile >>"CFGcompany" >> "ranks" >> "rank_1","paycheck") isEqualTo 1) then {

				
            };




switch (playerSide) do
{
	case civilian:
	{
		switch(FETCH_CONST(life_companylevel)) do
		{
			case 0: {
				life_company_paycheck = life_paycheck + 0;
			}; 
			
			case 1: {
				//if (life_SETTINGS(getNumber(missionConfigFile >>"CFGcompany" >> "ranks" >> "rank_1","paycheck") isEqualTo 1) then {
				life_company_paycheck = life_paycheck + 2000;
				life_company_bank = life_company_bank - 2000;
			};
			//};
			
			case 2: {
				//if (life_SETTINGS(getNumber(missionConfigFile >>"CFGcompany" >> "ranks" >> "rank_2","paycheck") isEqualTo 1) then {
				life_company_paycheck = life_paycheck + 2500;
				life_company_bank = life_company_bank - 2500;
			}; 
			//};
			
			case 3: {
				//if (life_SETTINGS(getNumber(missionConfigFile >>"CFGcompany" >> "ranks" >> "rank_2","paycheck") isEqualTo 1) then {
				life_company_paycheck = life_paycheck + 3000;
				life_company_bank = life_company_bank - 3000;
			}; 
			//};
		};
	};
};