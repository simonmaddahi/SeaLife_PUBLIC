/*
	Author: Natic
	
	Description: Check it for yourself :)
*/

disableSerialization;
_display = findDisplay 39400;
_tree = _display displayCtrl 1500;
_data = _tree tvData (_this select 0);
_s = switch (playerSide) do {case west: {"cop"}; case independent: {"medic"}; case east: {"arc"};};
if((_data isEqualTo "space") || (_data isEqualTo ""))exitWith{["FMS-Fehler","In dieses Eisnatzgebiet kannst du dich nicht einloggen!", true, "fast"] spawn ESG_fnc_notify;};
if(((player getVariable ["fms",[0,"pups"]]) select 1) isEqualTo _data)exitWith{["FMS-Fehler","Du bist schon in diesem Einsatzgebiet!", true, "fast"] spawn ESG_fnc_notify;};
player setVariable ["fms",[(_this select 0),_data],true];
if(_data isEqualTo "not" || _data isEqualTo "not_medic") then {
  ["FMS ausgeloggt","Erfolgreich aus dem FMS ausgeloggt!", false, "fast"] spawn ESG_fnc_notify;
} else {
  ["FMS eingeloggt",format ["Erfolgreich in <t font='PuristaBold'>%1</t> eingeloggt!",getText(missionConfigFile >> "CfgFMS" >> _s >> _data >> "name")], false, "fast"] spawn ESG_fnc_notify;
};
closeDialog 0;
[] spawn ESG_fnc_fmsMain;
