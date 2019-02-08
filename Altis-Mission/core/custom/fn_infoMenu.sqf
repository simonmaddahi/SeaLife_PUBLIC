﻿/*
	Author: Basti | John Collins
	Description:
	This Script was written for Eastside-Gaming.de
	Used for the Information Menu
*/
private _mode = param[0, 0, [-1]];
_content = [["Willkommen","0"],["Serverteam","1"],["Steuerung","2"],["Anfängertipps","3"],["Fahrzeugpreise","4"],["Lizenzpreise","5"],["Legale Farmrouten","6"],["Illegale Farmrouten","7"]];
switch(_mode) do {
	case 0: {
		disableSerialization;
		if (!(isNull (findDisplay 4354))) exitWith {systemchat "error";};
		createDialog "ESG_infoMenu";
		_display = findDisplay 4354;
		_list = _display displayCtrl 1997;
		{
			_index = _list lbadd format["%1", _x select 0];
			_list lbSetData[(lbSize _list) - 1, _x select 1];
		} foreach _content;
		_list lbSetCurSel 0;
	};
	
	case 1: {
		disableSerialization;
		_display = findDisplay 4354;
		_contentlist = _display displayCtrl 1997;
		_header = _display displayCtrl 1000;
		_ctrlgruppe = _display displayCtrl 121212;
		//_infos = _ctrlgruppe controlsGroupCtrl 6565;
		_data = _contentlist lbData (lbcursel _contentlist);
		if (_data isEqualTo "") exitWith {["Informationsmenü","Es ist ein Fehler aufgetreten!", true, "fast"] spawn ESG_fnc_notify;};

		_contenttext = switch (_data) do {
			case "0": {
				['Willkommen auf SeaLife','Herzlich Willkommen auf SeaLife-Gaming!<br/>Wir hoffen du hast dein Ziel erreicht und wir wünschen dir viel Spaß! Solltest du Probleme haben oder Bugs finden, dann besuche uns doch auf unserem Teamspeak Server. IP: ts.Sealife-Gaming.de<br/><br/>Wir haben auch ein Forum, welches du unter SeaLife-Gaming.de erreichst, in dem wir aktuelle Neuigkeiten und Ankündigungen posten. Dort kannst du dich auch für die jeweiligen Fraktionen bewerben.<br/><br/>Falls du neu bist kannst du unter dem Punkt "Anfängertipps" wissenswerte Sachen erfahren.'];
			};
			case "1": {
				['Serverteam','<br/><t font="PuristaBold" align="center">Serverteam</t><br/><t size="1.1" color="#FF0000">Projektleitung:</t><br/>    - FLAKE<br/>    - Melvin<br/><br/><t size="1.1" color="#ff0010">Core-Management:</t><br/>    - XXX <br/>    - XXX <br/><br/><t size="1.1" color="#00AB47">Supportleitung:</t><br/>    - John Parker <br/><br/><t size="1.1" color="#aa0072">Community-Management:</t><br/>    - RosaChicken <br/><br/><t size="1.1" color="#0088FF">Entwickler:</t><br/>    - XXX <br/>    - XXX <br/><br/><t font="PuristaBold" align="center">Fraktionsleitungen</t><br/><t size="1.1" color="#0015ff">Polizeidirektor:</t><br/>    - Leonardo Butters  <br/><br/><t size="1.1" color="#ff3700">Rettungsdienst:</t><br/>    - Dr. Thomas Scheider <br/>    - Dr. Max Waldschmidt'];
			};
			case "2": {
				['Steuerung','<t font="PuristaBold">Allgemeine Steuerung</t><br/><t size="0.9">Format: Taste | Beschreibung</t><br/><br/>    Windowstaste | Interaktionstaste (Interaktionsmenü, Abbauen, Items aufheben)<br/>    Shift + B | Ergeben<br/>    Shift + H | Waffe Holstern<br/>    Strg + H | Waffe ziehen (Wenn geholstert)<br/>    Shift + G | Niederschlagen<br/>    T | Fahrzeuginventar öffnen<br/>    Shift + C | Personen festnehmen (Kabelbinder benötigt)<br/>    Shift + O | Ohrstöpsel<br/>    U | Fahrzeug auf/abschließen<br/>    ^ (Zirkumflex) | Medicsystem<br/><br/><t font="PuristaBold">Behördensteuerung</t><br/>    F | Sirene 1<br/>    Shift + F | Sirene 2<br/>    C | Yelp Sirene (Polizei)<br/>    Shift + R | Festnehmen<br/>    Shift + L | Blaulicht<br/>    Shift + K | Fuelkiller Konsole<br/>    Shift + Ä | Tore öffnen<br/>    Alt + Ö | SOS-Notruf (Polizei)'];
			};
			case "3": {
				['Anfängertipps','<t font="PuristaBold">Einleitung</t><br/><br/>Lieber Spieler,<br/>ich schätze wenn du dies liest bist du neu hier auf dieser Insel.<br/>In diesem kleinen Guide erkläre ich dir ein paar Sachen die du in deinem späteren Leben gut gebrauchen kannst.<br/><br/><br/><t font ="PuristaBold">Z-Inventar:</t><br/><br/>In diesem Inventar findest du sämtliche Angaben über deinen Charakter.<br/>Oben links findest du Informationen über dein Kontostand. Direkt recht daneben findest du deine Lizenzen, welche du benötigst um z.B. ein Auto zu fahren.<br/>Rechts siehst du dein aktuelles Inventar. Hier kannst du deine Virtuellen Items verwalten, sie löschen oder benutzen.<br/>Direkt darunter findest du eine Dropdown-Liste, welche Spieler in deiner Nähe auflistet.<br/><br/>Unten im Menü siehst du alle Funktionen die du mit dem Z-Inventar ausführen kannst. Eine Funktion ist z.B. dein Telefon, mit welchem du Personen anschreiben kannst und Notrufe absetzen kannst.<br/><br/><br/><t font="PuristaBold">I-Inventar:</t><br/><br/>In diesem Inventar findest du alle Items die du z.B. im Baumarkt kaufen kannst, oder später auch deine Waffen.<br/>Im General Store kaufst du zum Start am besten ein Werkzeugkasten, ein GPS und eine Nachtsichtbrille.<br/><br/><br/><t font="PuristaBold">Wie fange ich denn nun wirklich an ?</t><br/><br/>Diese Frage werden sich wahrscheinlich die meisten von euch stellen.<br/>Nun, am besten fangt ihr damit an, indem ihr euch ein Auto beim Auto Laden kauft, nachdem ihr den Führerschein erworben habt.<br/>Nun fahrt ihr zum Apfel oder Pfirsichfeld und pflückt dort euer Obst, welches ihr am Markt verkaufen könnt.<br/>Später, wenn ihr mehr Geld habt könnt ihr auch eine Ausbildung zum Saftpresser machen. Durch diese Ausbildung könnt ihr aus dem Obst Saft herstellen.'];
			};
			case "4": {
				['Fahrzeugpreise', [2]call ESG_fnc_infoMenu];
			};
			case "5": {
				['Lizenzpreise',[3]call ESG_fnc_infoMenu];
			};
			case "6": {
                ['Legale Farmrouten','<t font="PuristaBold">Farmrouten ohne Spitzhacke</t><br/><br/><t font="PuristaBold" size="0.8">Pfirsichsaft:</t><br/>   Pfirsichbäume >> Saftpresse >> Getränkehändler<br/><br/><t font="PuristaBold" size="0.8">Apfelsaft:</t><br/>   Apfelbäume >> Saftpresse >> Getränkehändler<br/><br/><t font="PuristaBold" size="0.8">Olivenkonserven:</t><br/>   Olivenbäume >> Konservernfabrik >> Lebensmittelexport<br/><br/><t font="PuristaBold" size="0.8">Zucker:</t><br/>   Zuckerrohrplantage >> Mühle >> Bäckerei<br/><br/><t font="PuristaBold" size="0.8">Mehl:</t><br/>   Getreidefeld >> Mühle >> Bäckerei<br/><br/><t font="PuristaBold" size="0.8">Bier:</t><br/>   Hopfenfeld >> Brauerei >> Getränkehändler<br/><br/><t font="PuristaBold" size="0.8">Spargelglas:</t><br/>   Spargelfeld >> Lebensmittelverarbeitung >> Lebensmittelexport<br/><br/><t font="PuristaBold" size="0.8">Wein:</t><br/>   Weinreben >> Kelter >> Getränkehändler<br/><br/><t font="PuristaBold">Farmrouten mit Spitzhacke</t><br/><br/><t font="PuristaBold" size="0.8">Kupferbarren:</t><br/>   Kupfervorkommen >> Metallverarbeitung >> Metallhändler<br/><br/><t font="PuristaBold" size="0.8">Glas:</t><br/>   Sandmiene >> Sandverarbeitung >> Glashändler<br/><br/><t font="PuristaBold" size="0.8">Ammoniumnitrat:</t><br/>   Kuhscheisse >> Chemiefabrik >> Forschungslabor<br/><br/><t font="PuristaBold" size="0.8">Holzplatten:</t><br/>   Wald >> Sägewerk >> Baumarkt<br/><br/><t font="PuristaBold" size="0.8">Motoröl:</t><br/>   Erdölvorkommen >> Raffenerie >> Auto Industrie<br/><br/><t font="PuristaBold" size="0.8">Benzin:</t><br/>   Erdölvorkommen >> Raffenerie >> Auto Industrie<br/><br/><t font="PuristaBold" size="0.8">Eisenbarren:</t><br/>   Eisenfloetz >> Metallverarbeitung >> Metallhändler<br/><br/><t font="PuristaBold" size="0.8">Gussform:</t><br/>   Eisenfloetz >> Gießerei >> Metallhändler<br/><br/><t font="PuristaBold" size="0.8">Geschliffener Diamant:</t><br/>   Edelstallmiene >> Schleifer >> Juwelier<br/><br/><t font="PuristaBold" size="0.8">Speisesalz:</t><br/>   Salzmiene >> Lebensmittelverarbeitung >> Lebensmittelexport<br/><br/><t font="PuristaBold" size="0.8">Gold:</t><br/>   Goldmiene >> Goldreinigung >> Juwelier<br/><br/><t font="PuristaBold" size="0.8">Zementsack:</t><br/>   Steinbruch >> Zementwerk >> Baustelle<br/><br/><t font="PuristaBold" size="0.8">Cadmium:</t><br/>   Admiumablagerung >> Industriepark >> Forschungslabor<br/><br/><t font="PuristaBold" size="0.8">Aluminium:</t><br/>   Aluminiumvorkommen >> Industriepark >> Auto Industrie<br/><br/><t font="PuristaBold" size="0.8">Silizium:</t><br/>   Siliciumablagerung >> Industriepark >> Forschungslabor<br/><br/>'];
            };
            case "7": {
                ['Illegale Farmrouten','<t font="PuristaBold">Farmrouten ohne Spitzhacke</t><br/><br/><t font="PuristaBold" size="0.8">Heroin:</t><br/>   Mohnfeld >> Drogenherstellung >> Drogenumschlagplatz<br/><br/><t font="PuristaBold" size="0.8">Marihuana:</t><br/>   Cannabisplantage >> Drogenherstellung >> Drogenhändler<br/><br/><t font="PuristaBold" size="0.8">LSD:</t><br/>   Froschsumpf >> Drogenherstellung >> Drogenhändler<br/><br/><t font="PuristaBold" size="0.8">Rum:</t><br/>   Zuckerrohrplantage >> Schnapsbrenner >> Spiritosenhändler<br/><br/><t font="PuristaBold" size="0.8">Whiskey:</t><br/>   Getreidefeld >> Schnapsbrenner >> Spiritosenhändler<br/><br/><t font="PuristaBold" size="0.8">Ouzo:</t><br/>   Anispflanzen >> Schnapsbrenner >> Spiritosenhändler<br/><br/><t font="PuristaBold" size="0.8">Sake:</t><br/>   Reisähren >> Schnapsbrenner >> Spiritosenhändler<br/><br/><t font="PuristaBold" size="0.8">Kokain:</t><br/>   Kokainfeld >> Drogenherstellung >> Drogenumschlagplatz<br/><br/><t font="PuristaBold">Farmrouten mit Spitzhacke</t><br/><br/><t font="PuristaBold" size="0.8">angereichertes Uran:</t><br/>   Uranablagerung >> Urananreicherung >> Kraftwerk<br/><br/>'];
            };
		};
		
		_header ctrlSetStructuredText parseText ("<t font='PuristaBold'>" + (_contenttext select 0) + "</t>");
		_ctrlgruppe ctrlSetStructuredText parseText (_contenttext select 1);
		_h = ctrlTextHeight _ctrlgruppe;
		_w = ((ctrlPosition _ctrlgruppe) select 2);
		_ctrlgruppe ctrlSetPosition [0, 0, _w, _h];
		_ctrlgruppe ctrlCommit 0;
	};
	
	case 2: {
		_return = "<t font='PuristaBold' underline='true'>Fahrzeugshops</t><br/><br/>";
		{
			_return = _return + format["<t font='PuristaBold'>%1:</t><br/>",getText(_x >> "title")];
			{
				_return = _return + format["   - %1 (Lagerplatz: %2 | Preis: %3$)<br/>",getText(configFile >> "CfgVehicles" >> (_x select 0) >> "Displayname"),[getNumber(missionConfigFile >> "LifeCfgVehicles" >> (_x select 0) >> "vItemSpace")] call life_fnc_numberText,[getNumber(missionConfigFile >> "LifeCfgVehicles" >> (_x select 0) >> "price_civ")] call life_fnc_numberText];
			}foreach getArray(_x >> "vehicles");
			_return = _return + "<br/>";
		}foreach ("true" configClasses (missionConfigFile >> "CarShops"));
		_return;
	};
	
	case 3: {
		_return = "<t font='PuristaBold' underline='true'>Lizenzpreise</t><br/><br/>";
		{
			_return = _return + format["%1 (Preis: %2)<br/>",getText(_x >> "displayName"),[getNumber(_x >> "price")]call life_fnc_numberText];
		}foreach ("true" configClasses (missionConfigFile >> "Licenses"));
		_return;
	};
};