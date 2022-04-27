/*
	Author: Natic
	
	Description: Check it for yourself :)
*/

if ((independent countSide playableUnits) isEqualTo 0) exitWith {["Notruf absenden", "Es sind leider keine Rettungsdienstmitarbeiter im Dienst! Du kannst probieren, die Polizei anzuschreiben!", true, "fast"] spawn ESG_fnc_notify;};
_action = [
			format ["Möchtest du wirklich einen Notruf an den Rettungsdienst absetzen ?"],
			 "Notruf absetzen ?",
			 "Ja",
			 "Nein"
		] call BIS_fnc_guiMessage;
if(!_action)exitWith{hint "Keinen Rettungsdienst gerufen!"};
[format["%1 benötigt den Rettungsdienst, um einen Patienten zu behandeln! Der Patient heißt %2! Er befindet sich in der Nähe von %3.", player getvariable ["realname",name player], ESG_medicInteract getvariable ["realname",name ESG_medicInteract],text ((nearestLocations [ESG_medicInteract,["NameCityCapital","NameCity","NameVillage"],10000]) select 0)],name player,5,mapGridPosition player,player] remoteExecCall ["TON_fnc_clientMessage",-2];
hint "Der Rettungsdienst wurde benachrichtigt und macht sich auf den Weg, um dir zu helfen!";
