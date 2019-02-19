/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;
/*
if (hasInterface) then {
    [] execVM "briefing.sqf"; //Load Briefing
};
*/
[] execVM "KRON_Strings.sqf";
//[] execVM "Bonus.sqf";
[] execVM "core\DynWeather.sqf";

StartProgress = true;
