//call compile (data von der lb)
disableSerialization;
private _display = findDisplay 39472;
private _listKlassen = _display displayCtrl 1500;
private _titleSelected = _display displayCtrl 1004;
private _strucInfo = _display displayCtrl 1103;
private _strucNextInfo = _display displayCtrl 1104;
private _stufeTxt = _display displayCtrl 1102;
private _needed = _display displayCtrl 1101;
private _hat = _display displayCtrl 1100;
switch(_listKlassen lbData (lbCurSel _listKlassen)) do {
	case "repair": {
		_tmp2 = [];
		_config = "(ESG_skill select 0) >= (getNumber (_x >> 'from')) && (ESG_skill select 0) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "reparieren");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "reparieren");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Reparieren";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit für das Reparieren:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit für das Reparieren:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 0)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "stabilise": {
		_tmp2 = [];
		_config = "(ESG_skill select 2) >= (getNumber (_x >> 'from')) && (ESG_skill select 2) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "stabilisierung");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Stabilisieren";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit für das Stabilisieren:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit für das Stabilisieren:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 2)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "sammeln_frucht": {
		_tmp2 = [];
		_config = "(ESG_skill select 3) >= (getNumber (_x >> 'from')) && (ESG_skill select 3) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_frucht");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_frucht");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = [["Maximum","Maximum", "Maximum"],["Maximum","Maximum"]];
		} else {
			_tmp2 = [[(getNumber((_config select 0) >> "count")),(getNumber((_config select 0) >> "menge")), ([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText)],[(getNumber((_config2 select 0) >> "count")),(getNumber((_config select 0) >> "menge"))]];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Sammeln (Früchte)";
		_strucInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 0) select 0), ((_tmp2 select 0) select 1)];
		_strucNextInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 1) select 0), ((_tmp2 select 1) select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 3)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", ((_tmp2 select 0) select 2)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "sammeln_erz": {
		_tmp2 = [];
		_config = "(ESG_skill select 9) >= (getNumber (_x >> 'from')) && (ESG_skill select 9) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_erze");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_erze");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = [["Maximum","Maximum", "Maximum"],["Maximum","Maximum"]];
		} else {
			_tmp2 = [[(getNumber((_config select 0) >> "count")),(getNumber((_config select 0) >> "menge")), ([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText)],[(getNumber((_config2 select 0) >> "count")),(getNumber((_config select 0) >> "menge"))]];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Sammeln (Erze)";
		_strucInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 0) select 0), ((_tmp2 select 0) select 1)];
		_strucNextInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 1) select 0), ((_tmp2 select 1) select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 9)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", ((_tmp2 select 0) select 2)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "sammeln_droge": {
		_tmp2 = [];
		_config = "(ESG_skill select 5) >= (getNumber (_x >> 'from')) && (ESG_skill select 5) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_drogen");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_drogen");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = [["Maximum","Maximum", "Maximum"],["Maximum","Maximum"]];
		} else {
			_tmp2 = [[(getNumber((_config select 0) >> "count")),(getNumber((_config select 0) >> "menge")), ([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText)],[(getNumber((_config2 select 0) >> "count")),(getNumber((_config select 0) >> "menge"))]];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Sammeln (Drogen)";
		_strucInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 0) select 0), ((_tmp2 select 0) select 1)];
		_strucNextInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 1) select 0), ((_tmp2 select 1) select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 5)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", ((_tmp2 select 0) select 2)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "sammeln_div": {
		_tmp2 = [];
		_config = "(ESG_skill select 17) >= (getNumber (_x >> 'from')) && (ESG_skill select 17) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_div");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_div");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = [["Maximum","Maximum", "Maximum"],["Maximum","Maximum"]];
		} else {
			_tmp2 = [[(getNumber((_config select 0) >> "count")),(getNumber((_config select 0) >> "menge")), ([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText)],[(getNumber((_config2 select 0) >> "count")),(getNumber((_config select 0) >> "menge"))]];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Sammeln (Diverse)";
		_strucInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 0) select 0), ((_tmp2 select 0) select 1)];
		_strucNextInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 1) select 0), ((_tmp2 select 1) select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 17)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", ((_tmp2 select 0) select 2)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "sammeln_schwarz": {
		_tmp2 = [];
		_config = "(ESG_skill select 7) >= (getNumber (_x >> 'from')) && (ESG_skill select 7) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_schwarz");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "sammeln_schwarz");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = [["Maximum","Maximum", "Maximum"],["Maximum","Maximum"]];
		} else {
			_tmp2 = [[(getNumber((_config select 0) >> "count")),(getNumber((_config select 0) >> "menge")), ([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText)],[(getNumber((_config2 select 0) >> "count")),(getNumber((_config select 0) >> "menge"))]];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Sammeln (Schwarzarbeit)";
		_strucInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 0) select 0), ((_tmp2 select 0) select 1)];
		_strucNextInfo ctrlSetStructuredText parseText format ["Anzahl der Animation:<br/>    -> %1<br/><br/>Menge (Zufällig generiert):<br/>    -> %2", ((_tmp2 select 1) select 0), ((_tmp2 select 1) select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 7)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", ((_tmp2 select 0) select 2)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "ver_frucht": {
		_tmp2 = [];
		_config = "(ESG_skill select 4) >= (getNumber (_x >> 'from')) && (ESG_skill select 4) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_frucht");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_frucht");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Verarbeitung (Früchte)";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 4)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "ver_erz": {
		_tmp2 = [];
		_config = "(ESG_skill select 10) >= (getNumber (_x >> 'from')) && (ESG_skill select 10) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_erze");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_erze");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Verarbeitung (Erze)";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 10)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "ver_droge": {
		_tmp2 = [];
		_config = "(ESG_skill select 6) >= (getNumber (_x >> 'from')) && (ESG_skill select 6) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_drogen");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_drogen");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Verarbeitung (Drogen)";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 6)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "ver_div": {
		_tmp2 = [];
		_config = "(ESG_skill select 18) >= (getNumber (_x >> 'from')) && (ESG_skill select 18) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_div");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_div");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Verarbeitung (Diverse)";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 18)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "ver_schwarz": {
		_tmp2 = [];
		_config = "(ESG_skill select 8) >= (getNumber (_x >> 'from')) && (ESG_skill select 8) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_schwarz");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "verarbeitung_schwarz");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Verarbeitung (Schwarzarbeit)";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit für das Verarbeiten:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 8)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "lockpick": {
		_tmp2 = [];
		_config = "(ESG_skill select 11) >= (getNumber (_x >> 'from')) && (ESG_skill select 11) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "lockpick");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "lockpick");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString),(getNumber((_config2 select 0) >> "chance"))];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Aufknacken (Dietrich)";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit für das Aufknacken:<br/>    -> %1<br/><br/>Chance beim Aufnacken:<br/>    -> %2%3", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString, (getNumber((_config select 0) >> "chance")),"%"];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit für das Aufknacken:<br/>    -> %1<br/><br/>Chance beim Aufnacken:<br/>    -> %2%3", (_tmp2 select 1), (_tmp2 select 2), "%"];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 11)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "boltcutter": {
		_tmp2 = [];
		_config = "(ESG_skill select 12) >= (getNumber (_x >> 'from')) && (ESG_skill select 12) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "boltcutter");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "boltcutter");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Aufbrechen (Bolzenschneider)";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit für das Aufbrechen:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit für das Aufbrechen:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 12)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "survive": {
		_tmp2 = [];
		_config = "(ESG_skill select 15) >= (getNumber (_x >> 'from')) && (ESG_skill select 15) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "survive");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "survive");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([(getNumber((_config2 select 0) >> "time")),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Überleben";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit um zu Überleben:<br/>    -> %1", [(getNumber((_config select 0) >> "time")),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit um zu Überleben:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 15)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "impound": {
		_tmp2 = [];
		_config = "(ESG_skill select 13) >= (getNumber (_x >> 'from')) && (ESG_skill select 13) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "impound");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "impound");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Beschlagnahmen";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit zum Beschlagnahmen:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit zum Beschlagnahmen:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 13)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "abtasten": {
		_tmp2 = [];
		_config = "(ESG_skill select 16) >= (getNumber (_x >> 'from')) && (ESG_skill select 16) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "abtasten");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "abtasten");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Abtasten";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit zum Abtasten:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit zum Abtasten:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 16)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
	case "revive": {
		_tmp2 = [];
		_config = "(ESG_skill select 14) >= (getNumber (_x >> 'from')) && (ESG_skill select 14) <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "revive");
		_tmp = (getNumber((_config select 0) >> "to")) + 1;
		_config2 = "_tmp >= (getNumber (_x >> 'from')) && _tmp <= (getNumber (_x >> 'to'))" configClasses (missionConfigFile >> "CfgSkill" >> "revive");
		if((count _config2) isEqualTo 0) then {
			_tmp2 = ["Maximum","Maximum"];
		} else {
			_tmp2 = [([(getNumber((_config2 select 0) >> "from"))]call life_fnc_numberText),([((getNumber((_config2 select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString)];
		};
		_titleSelected ctrlSetText "Skillfortschritt Kategorie: Wiederbeleben";
		_strucInfo ctrlSetStructuredText parseText format ["Zeit zum Wiederbeleben:<br/>    -> %1", [((getNumber((_config select 0) >> "time")) * 100),"MM:SS"] call BIS_fnc_secondsToString];
		_strucNextInfo ctrlSetStructuredText parseText format ["Zeit zum Wiederbeleben:<br/>    -> %1", (_tmp2 select 1)];
		_hat ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", [(ESG_skill select 14)]call life_fnc_numberText];
		_needed ctrlSetStructuredText parseText format ["<t font='PuristaBold' align='center'>%1</t>", (_tmp2 select 0)];
		_stufeTxt ctrlSetStructuredText parseText format ["<t align='center' font='PuristaBold'>%1</t>", (getText((_config select 0) >> "levelstr"))];
	};
};