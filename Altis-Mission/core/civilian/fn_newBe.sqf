/*
    Author: Natic 
    Description: Take Care and watch !
    Reclaimer: nobody is allowed to/edit this Script
*/
if (playerside != civilian) then {

if (!(life_firstSpawn)) then {
        systemChat "Du bist im Anfängerschutz, weitere Informationen findest du im Informationsmenu";
        player setVariable ["life_newbe", true];
        sleep 1;

    }; 
    
    if ((life_newbe)) then {
        player setVariable ["life_newbe", false];
    };
    
    if (!(life_newbe)) then {
            //Code for Knockout missing
            
            //Aggressive Handlung vom Spieler
            if ((isPlayer _source) && (vehicle _source != _source)) then {
            if(_part == "body" && (player getVariable["limit",true]) && playerSide in [west,independent,civilian,east]) then {
            player setVariable ["limit",false];
            [_source] spawn {
            _driver = _this select 0;
           ["Da du aggressiv gehandelt hast, hast du deinen Anfängerschutz verloren", false, "fast"] spawn ESG_fnc_notify;
            player setVariable ["life_newbe",false];
            sleep 10;
            player setVariable ["limit",true];
        };
    };
    
        0 spawn
        {
        while {true} do 
        {
            if (weapons player isEqualTo []) then 
                {
                    
                } else {
                    ["Da du aggressiv gehandelt hast, hast du deinen Anfängerschutz verloren", false, "fast"] spawn ESG_fnc_notify;
                    player setVariable ["life_newbe",false];
                };
            };
        };
    };
};