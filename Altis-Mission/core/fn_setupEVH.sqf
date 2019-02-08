/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/
player addEventHandler["Killed", {_this call life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take",{_this call life_fnc_onTakeItem}]; //Prevent people from taking stuff they shouldn't...
player addEventHandler["Fired",{_this call life_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
player addEventHandler["GetInMan", {[0,_this] call ESG_fnc_handleAutoSteig}];
player addEventHandler["GetOutMan", {[1,_this] call ESG_fnc_handleAutoSteig}];
inGameUISetEventHandler ["Action"," if((count _this) isEqualTo 0) exitWith {true}; if([""moveto"",(_this select 3)]call bis_fnc_instring) then {[""Fahrzeugplatz wechseln"", ""Bitte steig aus, um den Fahrzeugplatz zu wechseln!"", true, ""fast""] spawn ESG_fnc_notify; true; };"];