/*
	Author: Natic
	
	Description: Check it for yourself :)
*/


_unit = param[0, objNull, [objNull]];
if ((isNull _unit) || !(isPlayer _unit) || (_unit getVariable ["esg_bewusstlos",false]) || !(alive _unit)) exitWith {}; //Gegen Bugs!
if((player distance _unit) > 4)exitWith{}; //Kein bugusing :)
ESG_medicInteract = _unit;
if((findDisplay 39494) isEqualTo displayNull) then {
	createDialog "esg_medicsystem";
};
disableSerialization;
private _display = findDisplay 39494;
private _btnSchmerz = _display displayCtrl 2403;
private _picHead = _display displayCtrl 1205;
private _picTorso = _display displayCtrl 1202;
private _picArms = _display displayCtrl 1204;
private _picLegs = _display displayCtrl 1203;
private _txtName = _display displayCtrl 1005;
private _title = _display displayCtrl 5004;
private _selected = _display displayCtrl 1001;
private _verletzungen = _display displayCtrl 1002;
private _txtBandage = _display displayCtrl 1003;
private _countMed = _display displayCtrl 1004;
//_btnBandage = _display displayCtrl 2402;
//Deaktiviert den Schmerzmittel Button oder aktiviert ihn
if(playerside != independent) then {
	_btnSchmerz ctrlEnable false;
} else {
	if(({(ESG_medicInteract getHit _x > 0)} count ["face_hub","neck","head","pelvis","spine1","spine2","spine3","body","arms","hands","legs"]) > 0) then {
		_btnSchmerz ctrlEnable false;
	} else {
		if(damage ESG_medicInteract > 0) then {
			_btnSchmerz ctrlEnable true;
		}else {
			_btnSchmerz ctrlEnable false;
		};
	};
};

{
	_tmp = 0;
	switch (_x select 1) do {
		case "arme": {
			_tmp = (((ESG_medicInteract getHit "arms") + (ESG_medicInteract getHit "hands")) / 2);
		};
		case "kopf": {
			_tmp = (((ESG_medicInteract getHit "face_hub") + (ESG_medicInteract getHit "neck") + (ESG_medicInteract getHit "head")) / 3);
		};
		case "beine": {
			_tmp = (ESG_medicInteract getHit "legs");
		};
		case "torso": {
			_tmp = (((ESG_medicInteract getHit "pelvis") + (ESG_medicInteract getHit "spine1") + (ESG_medicInteract getHit "spine3") + (ESG_medicInteract getHit "spine2") + (ESG_medicInteract getHit "body")) / 5);
		};
	};
	if(_tmp <= 0.2) then {
		(_x select 0) ctrlSetTextColor [0,0.7,0,1];
	}else {
		if(_tmp > 0.2 && _tmp < 0.5) then {
			(_x select 0) ctrlSetTextColor [1,0.549,0,1];
		} else {
			(_x select 0) ctrlSetTextColor [0.7,0,0,1];
		};
	};
}foreach ([[_picArms, "arme"],[_picHead, "kopf"],[_picLegs,"beine"],[_picTorso, "torso"]]);

_txtName ctrlSetText format ["Name der Person: %1", ESG_medicInteract getVariable ["realname", name ESG_medicInteract]];
_title ctrlSetStructuredText parsetext format ["<t font='PuristaBold' size='1.5' align='right'>Medicsystem | %1</t>", ESG_medicInteract getVariable ["realname", name ESG_medicInteract]];
_selected ctrlSetText format ["Ausgewählter Bereich: %1", ESG_medicSelected select 0];
_dmg = 0;
{_dmg = _dmg + (ESG_medicInteract getHit _x);}foreach (ESG_medicSelected select 1);
if (_dmg > 1) then {
	_dmg = (_dmg/(count (ESG_medicSelected select 1)));
};
_verletzungen ctrlSetText format ["Verletzungen des Bereichs: %1%2", round (_dmg * 100),"%"];
_txtBandage ctrlSetText format ["Verfügbare Bandagen: %1 Stück", life_inv_bandage];
_countMed ctrlSetText format ["Rettungsdienst-Mitarbeiter im Dienst: %1", independent countSide playableUnits];
