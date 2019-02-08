/*
    File:    fn_adminmode.sqf
    Date:   2016-08-02 18:15:42
    Author: Patrick "Lucian" Schmidt
    Edit by: Natic
    
*/
private["_display","_list","_side","_name"];
_name = name player;

if((life_adminlevel) == 0) exitWith {
    ["Diese Taste ist für dich Deaktiviert!", true, "fast"] spawn ESG_fnc_notify;
};

/*if (player getVariable ["admin",0] == 0) then {
    [player] call life_fnc_saveGear;
    life_safeGear = life_gear;
    player setVariable ["admin",(call life_adminlevel),true];
*/
    [player] call life_fnc_saveGear;
    life_safeGear = life_gear;
    sleep 1;
    player setUnitLoadout [["LMG_03_F","muzzle_snds_M","","optic_ERCO_blk_F",["200Rnd_556x45_Box_F",40000],[],""],[],["hgun_P07_F","","","",["30Rnd_9x21_Mag",40000],[],""],["U_I_HeliPilotCoveralls",[]],[],["B_Carryall_cbr",[]],"","",[],["","ItemGPS","ItemRadio","","","NVGoggles"]];

    if !(missionNamespace getVariable ["life_godmode",false]) then {    
        player removeAllEventHandlers"HandleDamage";
        player addEventHandler["HandleDamage",{false}];
    };

    ["Du bist nun im Adminstrator - Modus", true, "fast"] spawn ESG_fnc_notify;
    missionNamespace getVariable ["life_adminmode_active",true];
    if (life_HC_isActive) then {
        [format["%1(UID: %2) hat den Adminmodus aktiviert.",_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",HC_Life];
    } else {
        [format["%1(UID: %2) hat den Adminmodus deaktiviert.",_name,getPlayerUID player],"AdminLog"] remoteExec ["A3Log",2];
    };
} else {
    if !(missionNamespace getVariable ["life_godmode",false]) then {    
        player removeAllEventHandlers"HandleDamage";
        player addEventHandler["HandleDamage",{_this call life_fnc_handleDamage}];
    };
    missionNamespace getVariable ["life_adminmode_active",false];
    life_gear = life_safeGear;
    [] call life_fnc_Loadgear;
    ["Adminmodus deaktiviert",false,"fast"] call life_fnc_notification_system;
};

[] call life_fnc_updateClothing;
[] call life_fnc_playerTags;