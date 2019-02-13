/*
  Author: Natic | Technic-Zone
  Date: 13.02.2019
  Reclaimer: Nobody is allowed to use this Script without any License form Technic-Zone or (and) natic!
*/
private ["_type","_player","_heal_1","_heal_2","_heal","_chance"];

_player = name player;
_heal_1= (1 - damage player) * 20;
_heal_2= (1 - damage player) * 40;
_heal= (1 - damage player) * 100;
_chance = floor(random(50));

if ((damage player) == 100)) exitWith {
  ["Du hast bereits 100% Leben!", true, "fast"] spawn ESG_fnc_notify;
};

["Ich versuche mich zu heilen", true, "fast"] spawn ESG_fnc_notify;

if (_chance < 25) exitWith {
  ["Mist, ich habe die Spritze verloren", true, "fast"] spawn ESG_fnc_notify;
};

if ((_chance > 30) && (_chance <= 40)) then {
  ["Kacke, ich habe nicht richtig getroffen", true, "fast"] spawn ESG_fnc_notify;
  sleep 1.5;
  set playerDamage _heal_1; //Need a Correction!
  sleep 1;
    ["Du wurdest zu 20% geheilt", true, "fast"] spawn ESG_fnc_notify;
};


if (_chance > 40) then {
  ["Kacke, ich habe nicht richtig getroffen", true, "fast"] spawn ESG_fnc_notify;
  sleep 1.5;
  set playerDamage _heal_2; //Need a Correction!
  sleep 1;
    ["Du wurdest zu 40% geheilt", true, "fast"] spawn ESG_fnc_notify;
} else {
    set playerDamage _heal; //Need a Correction!
    sleep 1;
    ["Du wurdest zu 100% geheilt", true, "fast"] spawn ESG_fnc_notify;
};


