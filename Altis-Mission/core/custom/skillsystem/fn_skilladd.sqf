_mode = [_this, 0] call BIS_fnc_param;
_skilladd = [_this, 1, 1] call BIS_fnc_param;
switch(true)do {
	case (_mode isEqualTo "repair"): {
		_config = "(ESG_skill select 0) >= (getNumber (_x >> 'from')) && (ESG_skill select 0) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "reparieren");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 0) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Reparieren</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[0,(ESG_skill select 0)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Reparieren</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 0)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "stab"): {
		_config = "(ESG_skill select 2) >= (getNumber (_x >> 'from')) && (ESG_skill select 2) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 2) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Stabilisierung</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[2,(ESG_skill select 2)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Stabilisierung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 2)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["kupfer","eisen","diamant","goldnugget","cadmierz","aluerz","silierz","uran","stein"]): {
		_config = "(ESG_skill select 9) >= (getNumber (_x >> 'from')) && (ESG_skill select 9) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_erze");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 9) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Erzabbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[9,(ESG_skill select 9)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Erzabbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 9)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["pfirsich","apfel","olive"]): {
		_config = "(ESG_skill select 3) >= (getNumber (_x >> 'from')) && (ESG_skill select 3) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_frucht");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 3) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Fruchtabbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[3,(ESG_skill select 3)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Fruchtabbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 3)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["mohn","cannabispflanze","frosch","kokainpflanze"]): {
		_config = "(ESG_skill select 5) >= (getNumber (_x >> 'from')) && (ESG_skill select 5) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_drogen");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 5) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Drogenabbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[5,(ESG_skill select 5)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Drogenabbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 5)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	/*
	case (_mode in [""]): {
		_config = "(ESG_skill select 7) >= (getNumber (_x >> 'from')) && (ESG_skill select 7) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_schwarz");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 0) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Schwarzarbeit Abbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[7,(ESG_skill select 7)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Schwarzarbeit Abbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 7)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	*/
	case (_mode in ["zuckerrohr","getreide","anis","reis","hopfen","spargel","trauben", "sand", "kuhkacke", "holz", "oel", "salz"]): {
		_config = "(ESG_skill select 17) >= (getNumber (_x >> 'from')) && (ESG_skill select 17) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_div");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 17) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Diverse Abbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[17,(ESG_skill select 17)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Diverse Abbau</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 17)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["kupferbarren","eisenbarren","geschliffenerdiamant","gold","cadmi","alu","sili","uranang","zementsack"]): {
		_config = "(ESG_skill select 10) >= (getNumber (_x >> 'from')) && (ESG_skill select 10) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_erze");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 10) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Erzverarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[10,(ESG_skill select 10)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Erzverarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 10)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["apfelsaft","pfirsichsaft","olivekon"]): {
		_config = "(ESG_skill select 4) >= (getNumber (_x >> 'from')) && (ESG_skill select 4) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_frucht");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 4) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Fruchtverarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[4,(ESG_skill select 4)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Fruchtverarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 4)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode in ["heroinpulver","hanf","kokainpulver","pilzpulver"]): {
		_config = "(ESG_skill select 6) >= (getNumber (_x >> 'from')) && (ESG_skill select 6) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_drogen");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 6) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Drogenverarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[6,(ESG_skill select 6)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Drogenverarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 6)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	/*
	case (_mode in [""]): {
		_config = "(ESG_skill select 8) >= (getNumber (_x >> 'from')) && (ESG_skill select 8) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_schwarz");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 0) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Schwarzarbeit Verarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[8,(ESG_skill select 8)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Schwarzarbeit Verarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 8)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	*/
	case (_mode in ["zucker","rum","mehl","whiskey","ouzo","sake","bier","spargelglas","wein","glas","ammoniumnitrat","holzplatten","speisalz","motoroil","benzin"]): {
		_config = "(ESG_skill select 18) >= (getNumber (_x >> 'from')) && (ESG_skill select 18) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_div");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 18) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Diverse Verarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[18,(ESG_skill select 18)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Diverse Verarbeitung</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 18)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "lockpick"): {
		_config = "(ESG_skill select 11) >= (getNumber (_x >> 'from')) && (ESG_skill select 11) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "lockpick");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 11) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Dietrich</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[11,(ESG_skill select 11)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Dietrich</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 11)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "boltcutter"): {
		_config = "(ESG_skill select 12) >= (getNumber (_x >> 'from')) && (ESG_skill select 12) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "boltcutter");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 12) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Bolzenschneider</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[12,(ESG_skill select 12)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Bolzenschneider</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 12)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "impound"): {
		_config = "(ESG_skill select 13) >= (getNumber (_x >> 'from')) && (ESG_skill select 13) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "impound");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 13) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Beschlagnahmen</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[13,(ESG_skill select 13)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Beschlagnahmen</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 13)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "revive"): {
		_config = "(ESG_skill select 14) >= (getNumber (_x >> 'from')) && (ESG_skill select 14) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "revive");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 14) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Wiederbeleben</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[14,(ESG_skill select 14)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Wiederbeleben</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 14)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "survive"): {
		_config = "(ESG_skill select 15) >= (getNumber (_x >> 'from')) && (ESG_skill select 15) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "survive");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 15) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Überlebenschance</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[15,(ESG_skill select 15)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Überlebenschance</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 15)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
	
	case (_mode isEqualTo "abtasten"): {
		_config = "(ESG_skill select 16) >= (getNumber (_x >> 'from')) && (ESG_skill select 16) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "abtasten");
		_max = getNumber((_config select (count _config-1)) >> "to");
		if ((ESG_skill select 16) >= _max)exitWith{[format["<t color='#1d3559'>Skillfortschritt Abtasten</t><br /><t color='#ffffff'>%1 - %2/%3</t>","Max. Level","Max.","Max."],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;};
		ESG_skill set[16,(ESG_skill select 16)+_skilladd];
		_configto = getNumber((_config select 0) >> "to");
		_configstr = getText((_config select 0) >> "levelstr");
		[format["<t color='#1d3559'>Skillfortschritt Abtasten</t><br /><t color='#ffffff'>%1 - %2/%3</t>",_configstr,[(ESG_skill select 16)]call life_fnc_numberText,_configto],0.8,0.6,3,1,0,789] spawn BIS_fnc_dynamicText;
	};
};