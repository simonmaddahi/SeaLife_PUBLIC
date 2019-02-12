/* 
   Author: Kuchenplatte
   Edit by: Natic [TZ]
*/
#include "..\..\script_macros.hpp"
private _loginCount0 = 5; 
private _loginCount1 = 10; 
private _loginCount2 = 25; 
private _loginCount3 = 40; 
private _loginCount4 = 50; 
private _loginCount5 = 120; 
private _loginCount6 = 180; 
private _loginCount7 = 400; 
private _loginCount8 = 600; 
private _loginCount9 = 1000; 

private _foodArray = ["apple","boltcutter","redgull"];
private _drinkArray = ["apple","boltcutter","redgull"];
private _itemArray = ["airbag","boltcutter","redgull"];
private _weaponArray = ["srifle_EBR_MRCO_pointer_F","srifle_LRR_SOS_F","arifle_Katiba_C_F","arifle_MX_ACO_F"];


private _logins = profileNamespace getVariable ["altislife_Logins",0];
_logins = _logins + 1;
profileNamespace setVariable ["altislife_Logins",_logins];
saveProfileNamespace;
if ((time - life_session_time < 324000) && (_logins >= 3)) exitWith {
	systemChat format ["Hallo %1, da du dich innerhalb 30 Minuten mehrmals eingeloggt hast, werden deine Logins bis Restart nicht mehr gewertet!",(name player)];
};

systemChat format ["Willkommen zur¸ck %1!",(name player)];
systemChat format ["Danke das du dich zum %1x eingeloggt hast!",_logins];

if (_logins > _loginCount9) exitWith {
	systemChat "Als treuer Spieler hast du den Rang ---Veteran---. Somit bist du ein langwertiger Spieler!";
	sleep 3;
	systemChat "Viel Spaﬂ beim Spielen, wuenscht SeaLife";
};

systemChat "Du wirst gleich deine Belohnung bekommen!";
sleep 10;
systemChat "Hier ist deine Belohnung!";
systemChat "Have fun.";

_Altis_AddFoodDrink = {
 private _food = _foodArray call BIS_fnc_selectRandom; 
 private _drink = _drinkArray call BIS_fnc_selectRandom;
 [true,_food,1] call life_fnc_handleInv;
 [true,_drink,1] call life_fnc_handleInv;
};


if (_logins <= _loginCount0) then {
 [true,"waterBottle",1] call life_fnc_handleInv;
 [true,"apple",1] call life_fnc_handleInv;
};


if ((_loginCount1 <= _logins) && (_logins < _loginCount2)) then {
 [] call _Altis_AddFoodDrink;
};


if ((_loginCount2 <= _logins) && (_logins < _loginCount3)) then {
 [] call _Altis_AddFoodDrink;
};


if ((_loginCount3 <= _logins) && (_logins < _loginCount4)) then { 
 [] call _Altis_AddFoodDrink;
 private _item = _itemArray call BIS_fnc_selectRandom;
 private _weapon = _weaponArray call BIS_fnc_selectRandom;
 [true,_weapon,1] call life_fnc_handleInv;
 [true,_item,1] call life_fnc_handleInv;
 BANK = BANK + 10000;
};

if ((_loginCount4 <= _logins) && (_logins < _loginCount5)) then {
 [] call _Altis_AddFoodDrink;
 private _item = _itemArray call BIS_fnc_selectRandom;
 private _weapon = _weaponArray call BIS_fnc_selectRandom;
 [true,_weapon,1] call life_fnc_handleInv;
 [true,_item,1] call life_fnc_handleInv;
};


if ((_loginCount5 <= _logins) && (_logins < _loginCount6)) then {
 [] call _Altis_AddFoodDrink;
 private _item = ["redgull","tbacon"] call BIS_fnc_selectRandom;
  private _weapon = _weaponArray call BIS_fnc_selectRandom;
 [true,_weapon,1] call life_fnc_handleInv;
 [true,_item,1] call life_fnc_handleInv;
 BANK = BANK + 30000;
};


if ((_loginCount6 <= _logins) && (_logins < _loginCount7)) then { 
 [] call _Altis_AddFoodDrink;
 private _item = ["spikestrip","salema"] call BIS_fnc_selectRandom;
  private _weapon = _weaponArray call BIS_fnc_selectRandom;
 [true,_weapon,1] call life_fnc_handleInv;
 [true,_item,1] call life_fnc_handleInv;
};

if ((_loginCount7 <= _logins) && (_logins < _loginCount8)) then { 
 [] call _Altis_AddFoodDrink;
 [true,"defusekit",1] call life_fnc_handleInv;
 [true,"waterBottle",1] call life_fnc_handleInv;
};


if ((_loginCount8 <= _logins) && (_logins < _loginCount9)) then { 
 [] call _Altis_AddFoodDrink;
 [true,"defusekit",1] call life_fnc_handleInv;
 [true,"storagesmall",1] call life_fnc_handleInv;
};


if (_loginCount9 <= _logins) then {
 [] call _Altis_AddFoodDrink;
 [true,"waterbottle",1] call life_fnc_handleInv;
 [true,"redgull",1] call life_fnc_handleInv;
 [true,"tbacon",1] call life_fnc_handleInv;
 BANK = BANK + 50000;
};