#include "..\..\script_macros.hpp"
/*
    File: fn_wantedMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens the Wanted menu and connects to the APD.
*/
disableSerialization;

if !(playerSide isEqualTo west) exitWith {}; // Only for cops open this menu

if (isNull findDisplay 2400) then {
  createDialog "life_wanted_menu";
};

private _display = findDisplay 2400;
private _list = _display displayCtrl 1500;
private _list2 = _display displayCtrl 1501;
private _players = _display displayCtrl 1502;
private _units = [];

lbClear _list;
lbClear _players;
lbClear _list2;

{
    if ((side _x) isEqualTo civilian) then {
      private _side = switch (side _x) do {case west: {"Polizei"}; case civilian : {"Zivilist"}; case independent: {"Rettungsdienst"}; default {"Unknown"};};
      _players lbAdd format ["%1 - %2", (_x getVariable ["realname", name _x]),_side];
      _players lbSetdata [(lbSize _players)-1,str(_x)];
    };
} forEach playableUnits;
/*
private _list2 = CONTROL(2400,2407);
lbClear _list2; //Purge the list

private _crimes = LIFE_SETTINGS(getArray,"crimes");
{
  if (isLocalized (_x select 0)) then {
    _list2 lbAdd format ["%1 - $%2 (%3)",localize (_x select 0),(_x select 1),(_x select 2)];
  } else {
    _list2 lbAdd format ["%1 - $%2 (%3)",(_x select 0),(_x select 1),(_x select 2)];
  };
    _list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} forEach _crimes;

ctrlSetText[2404,"Verbindung wird hergestellt..."];
*/
if (FETCH_CONST(life_coplevel) < 3 && {FETCH_CONST(life_adminlevel) isEqualTo 0}) then {
    ctrlShow[2400,false];
};
[player] remoteExec ["life_fnc_wantedFetch",RSERV];