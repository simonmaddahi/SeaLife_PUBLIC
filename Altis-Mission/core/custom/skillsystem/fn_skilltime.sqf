/*
	Author: Natic
	
	Description: Check it for yourself :)
*/

_mode = [_this, 0] call BIS_fnc_param;
_return = 0.1;
switch(true) do {
	case (_mode isEqualTo "repair"): {
		_config = "(ESG_skill select 0) >= (getNumber (_x >> 'from')) && (ESG_skill select 0) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "reparieren");
		_return = getNumber((_config select 0) >> "time");
	};
	case (_mode isEqualTo "stab"): {
		_config = "(ESG_skill select 2) >= (getNumber (_x >> 'from')) && (ESG_skill select 2) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode in ["kupfer","eisen","diamant","goldnugget","cadmierz","aluerz","silierz","uran","stein"]): {
		_config = "(ESG_skill select 9) >= (getNumber (_x >> 'from')) && (ESG_skill select 9) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_erze");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};
	
	case (_mode in ["pfirsich","apfel","olive"]): {
		_config = "(ESG_skill select 3) >= (getNumber (_x >> 'from')) && (ESG_skill select 3) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_frucht");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};
	
	case (_mode in ["mohn","cannabispflanze","frosch","kokainpflanze"]): {
		_config = "(ESG_skill select 5) >= (getNumber (_x >> 'from')) && (ESG_skill select 5) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_drogen");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};
	/*
	case (_mode in [""]): {
		_config = "(ESG_skill select 7) >= (getNumber (_x >> 'from')) && (ESG_skill select 7) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_schwarz");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};
	*/
	case (_mode in ["zuckerrohr","getreide","anis","reis","hopfen","spargel","trauben", "sand", "kuhkacke", "holz", "oel", "salz"]): {
		_config = "(ESG_skill select 17) >= (getNumber (_x >> 'from')) && (ESG_skill select 17) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_div");
		_return = [(getNumber((_config select 0) >> "menge")),(getNumber((_config select 0) >> "count"))];
	};

	case (_mode in ["kupferbarren","eisenbarren","geschliffenerdiamant","gold","cadmi","alu","sili","uranang","zementsack"]): {
		_config = "(ESG_skill select 10) >= (getNumber (_x >> 'from')) && (ESG_skill select 10) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_erze");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode in ["apfelsaft","pfirsichsaft","olivekon"]): {
		_config = "(ESG_skill select 4) >= (getNumber (_x >> 'from')) && (ESG_skill select 4) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_frucht");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode in ["heroinpulver","hanf","kokainpulver","pilzpulver"]): {
		_config = "(ESG_skill select 6) >= (getNumber (_x >> 'from')) && (ESG_skill select 6) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_drogen");
		_return = getNumber((_config select 0) >> "time");
	};
	/*
	case (_mode in [""]): {
		_config = "(ESG_skill select 8) >= (getNumber (_x >> 'from')) && (ESG_skill select 8) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_schwarz");
		_return = getNumber((_config select 0) >> "time");
	};
	*/
	case (_mode in ["zucker","rum","mehl","whiskey","ouzo","sake","bier","spargelglas","wein","glas","ammoniumnitrat","holzplatten","speisalz","motoroil","benzin"]): {
		_config = "(ESG_skill select 18) >= (getNumber (_x >> 'from')) && (ESG_skill select 18) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_div");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "lockpick"): {
		_config = "(ESG_skill select 11) >= (getNumber (_x >> 'from')) && (ESG_skill select 11) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "lockpick");
		_return = [(getNumber((_config select 0) >> "time")),(getNumber((_config select 0) >> "chance"))];
	};
	
	case (_mode isEqualTo "boltcutter"): {
		_config = "(ESG_skill select 12) >= (getNumber (_x >> 'from')) && (ESG_skill select 12) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "boltcutter");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "impound"): {
		_config = "(ESG_skill select 13) >= (getNumber (_x >> 'from')) && (ESG_skill select 13) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "impound");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "revive"): {
		_config = "(ESG_skill select 14) >= (getNumber (_x >> 'from')) && (ESG_skill select 14) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "revive");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "survive"): {
		_config = "(ESG_skill select 15) >= (getNumber (_x >> 'from')) && (ESG_skill select 15) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "survive");
		_return = getNumber((_config select 0) >> "time");
	};
	
	case (_mode isEqualTo "abtasten"): {
		_config = "(ESG_skill select 16) >= (getNumber (_x >> 'from')) && (ESG_skill select 16) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "abtasten");
		_return = getNumber((_config select 0) >> "time");
	};
};
_return;
