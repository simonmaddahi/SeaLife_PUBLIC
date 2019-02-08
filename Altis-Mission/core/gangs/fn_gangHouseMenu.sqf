#include "..\..\script_macros.hpp"
/*
	Author: Basti | John Collins
*/

params [
	["_mode", 0, [0]]
];

if (alive player) exitWith {hint "Dieses Feature wird noch implementiert!";};

private _display = findDisplay 262022;
if (isNull _display) then {
	createDialog "ZB_Ganghaus";
	_display = findDisplay 262022;
};

private _group = group player;

private _rights = player getVariable ["gang_rank", []];
private _house = _group getVariable ["gang_house", []];

if (_rights isEqualTo [] && !((_group getVariable ["gang_owner", ""]) isEqualTo (getPlayerUID player))) exitWith {hint "Du hast nicht die benötigten Rechte"; closeDialog 0;};

private _struc = _display displayCtrl 2402;

if (_house isEqualTo []) exitWith {
	(CONTROL(262026,2403)) ctrlEnable false; //Haus verkaufen
	(CONTROL(262026,2401)) ctrlEnable false; //Schlüssel wegnehmen
	(CONTROL(262026,2404)) ctrlEnable false; //Sicherheitssystem
	_struc ctrlSetStructuredText "Kein Ganghaus vorhanden.";
};

if !((_group getVariable ["gang_owner", ""]) isEqualTo (getPlayerUID player)) then {
	(CONTROL(262026,2403)) ctrlEnable false; //Haus verkaufen
	(CONTROL(262026,2401)) ctrlEnable false; //Schlüssel wegnehmen
	(CONTROL(262026,2404)) ctrlEnable false; //Sicherheitssystem
	if (_rights select 6) then {
		(CONTROL(262026,2403)) ctrlEnable true;
		(CONTROL(262026,2401)) ctrlEnable true;
		(CONTROL(262026,2404)) ctrlEnable true;
	};
};

[((findDisplay 262022) displayCtrl 2400),1,0.1,_house] call life_fnc_setMapPosition;

_house = nearestObject [_house, "House"];
private _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
private _grid = mapGridPosition _house;

_struc ctrlSetStructuredText parseText format ["<t font='PuristaBold'>%1</t><br/>Position: %2", _houseName, _grid];

switch (_mode) do { 
	case 0 : {
		//[_house] remoteExecCall
	};
};