#include "..\..\script_macros.hpp"
/*
    File: fn_medicLoadout.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads the medic out with the default gear.
*/
private ["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceaddUniform "U_I_CombatUniform";
player addItem "ToolKit";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
