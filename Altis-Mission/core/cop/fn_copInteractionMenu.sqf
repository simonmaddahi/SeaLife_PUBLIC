#include "..\..\script_macros.hpp"
/*
    File: fn_copInteractionMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Replaces the mass addactions for various cop actions towards another player.
*/
#define Btn0 37450
#define Btn1 37451
#define Btn2 37452
#define Btn3 37453
#define Btn4 37454
#define Btn5 37455
#define Btn6 37456
#define Btn7 37457
#define Btn8 37458
#define Btn9 28547
#define Btn10 28547
#define Title 37401

private ["_display","_curTarget","_seizeRank","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];

disableSerialization;
_curTarget = param [0,objNull,[objNull]];
_seizeRank = LIFE_SETTINGS(getNumber,"seize_minimum_rank");

if (player getVariable ["Escorting", false]) then {
    if (isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
    if (!isPlayer _curTarget) exitWith {closeDialog 0;}; //Bad side check?
	if (player distance _curTarget > 4 ) exitWith {closeDialog 0;};
};

if (!dialog) then {
    createDialog "pInteraction_Menu";
};

_display = findDisplay 37400;
_Btn0 = _display displayCtrl Btn0;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
life_pInact_curTarget = _curTarget;
if (player getVariable ["isEscorting",false]) then {
    { _x ctrlShow false; } forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10];
};

if (player getVariable ["isEscorting",false]) then {
    _Btn0 ctrlSetText localize "STR_pInAct_StopEscort";
    _Btn0 buttonSetAction "[] call life_fnc_stopEscorting; closeDialog 0;";
} else {
    _Btn0 ctrlSetText "Medicmenü öffnen";
    _Btn0 buttonSetAction "closeDialog 0; [life_pInact_curTarget]spawn ESG_fnc_medicLoadMenu;";
};

//Set Check Licenses Button
_Btn1 ctrlSetText "Ausweis zeigen";
_Btn1 buttonSetAction "[ESG_ausweis,player] remoteExec [""ESG_fnc_ausweis_zeigen"",life_pInact_curTarget]; closeDialog 0;";

//Set Unrestrain Button
_Btn2 ctrlSetText localize "STR_pInAct_Unrestrain";
_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

//Set Check Licenses Button
_Btn3 ctrlSetText "Lizenzen";
_Btn3 buttonSetAction "['lizenzen'] spawn life_fnc_copInteractionMenuFlex;";

//Set Search Button
_Btn4 ctrlSetText localize "STR_pInAct_SearchPlayer";
_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";

//Set Escort Button
_Btn5 ctrlSetText localize "STR_pInAct_Escort";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";

//Set Ticket Button
_Btn6 ctrlSetText localize "STR_pInAct_TicketBtn";
_Btn6 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";

_Btn7 ctrlSetText localize "STR_pInAct_Arrest";
_Btn7 buttonSetAction "closeDialog 0; createDialog 'ESG_jailtime';";
_Btn7 ctrlEnable false;

_Btn8 ctrlSetText localize "STR_pInAct_PutInCar";
_Btn8 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;";

//SeizeWeapons Button
_Btn9 ctrlSetText "Person ausziehen";
_Btn9 buttonSetAction "[life_pInact_curTarget] spawn ESG_fnc_patdown; closeDialog 0;";

//SeizeWeapons Button
_Btn10 ctrlSetText "Haltung ändern";
_Btn10 buttonSetAction "['haltung'] call life_fnc_copInteractionMenuFlex;";

{
    if ((player distance (getMarkerPos _x) <30)) exitWith { _Btn7 ctrlEnable true;};
} forEach LIFE_SETTINGS(getArray,"sendtoJail_locations");