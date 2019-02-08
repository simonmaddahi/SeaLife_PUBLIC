#include "..\..\..\script_macros.hpp"
/*
	Datei: fn_loadoutLaden.sqf
	Autor: Basti | John Collins
	
	Beschreibung:
	Lädt das ausgewählte Loadout.
	
	This file was written for EastSide-Gaming.de
	Diese Datei wurde für EastSide-Gaming.de geschrieben.
	©2017 by Basti | John Collins
*/
disableSerialization;
_lb = ((findDisplay 3333) displayCtrl 1500);
_gear =  _lb lbData (lbCurSel _lb);
if (_gear isEqualTo "[]") exitWith {["Loadout-System", "Diser Slot ist noch nicht belegt!", true, "fast"] spawn ESG_fnc_notify;};
_preis = ((ESG_loadout select (lbCurSel _lb)) select 2);
_action = [
			format ["Möchtest du wirklich dieses Loadout für %1$ laden ? <br/>Deine alte Ausrüstung wird gelöscht!", [_preis]call life_fnc_numberText],
			 "Loadout laden ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;
if(!_action) exitWith {closeDialog 0; ["Loadout-System", "Aktion abgebrochen!", true, "fast"] spawn ESG_fnc_notify;};		
if(life_atmbank < _preis) exitWith {["Loadout-System", "Du hast nicht genug Geld auf deinem Bankkonto!", true, "fast"] spawn ESG_fnc_notify;};
//Kein Dupen der Items
{
    _var = configName(_x);
    _val = ITEM_VALUE(_var);
    if (_val > 0) then {
        [false,_var,_val] call life_fnc_handleInv;
    };
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));
_gearL = ((ESG_loadout select (lbCurSel _lb)) select 0);
life_gear = _gearL;
[true] spawn life_fnc_loadGear;
life_atmbank = life_atmbank - _preis;
["Loadout-System", "Loadout erfolgreich geladen.", false, "fast"] spawn ESG_fnc_notify;
life_maxWeight = 74 + round(FETCH_CONFIG2(getNumber,"CfgVehicles",(backpack player),"maximumload") / 4);